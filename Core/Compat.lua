local _, T = ...

local Compat = {}
T.Compat = Compat

-- Everything the retail and Classic clients disagree about lives here, so the
-- rest of the addon can stay flavour-blind. Same rules as in Tallymaster:
--
--  * Probe the function, never the namespace. A namespace can exist in a flavour
--    where the function you need does not.
--  * Retail (11.0+) hands faction data back as a table from C_Reputation.
--    Classic keeps the old globals, which return a long tuple.

local function apiFunction(namespace, name)
    local ns = _G[namespace]
    local f = ns and ns[name]
    if type(f) == "function" then return f end
    return nil
end

local function globalFunction(name)
    local f = _G[name]
    if type(f) == "function" then return f end
    return nil
end

--------------------------------------------------------------------------------
-- Faction list
--------------------------------------------------------------------------------

local getNumFactions    = apiFunction("C_Reputation", "GetNumFactions")
local getDataByIndex    = apiFunction("C_Reputation", "GetFactionDataByIndex")
local getDataByID       = apiFunction("C_Reputation", "GetFactionDataByID")
local expandHeader      = apiFunction("C_Reputation", "ExpandFactionHeader")
local collapseHeader    = apiFunction("C_Reputation", "CollapseFactionHeader")

-- The table API and the tuple API never mix within one client, so the list
-- functions are chosen as a set.
local tableAPI = getNumFactions ~= nil and getDataByIndex ~= nil

if not tableAPI then
    getNumFactions = globalFunction("GetNumFactions")
    expandHeader   = globalFunction("ExpandFactionHeader")
    collapseHeader = globalFunction("CollapseFactionHeader")
end

local getFactionInfo       = globalFunction("GetFactionInfo")
local getFactionInfoByID   = globalFunction("GetFactionInfoByID")

-- One shape for both APIs. Values are absolute (bottom <= value <= top), the
-- same way both clients report them; progress within the standing is derived
-- later in Factions.
local function fromTable(d)
    if not d or not d.name or d.name == "" then return nil end
    return {
        factionID    = d.factionID,
        name         = d.name,
        description  = d.description,
        reaction     = d.reaction or 0,
        bottom       = d.currentReactionThreshold or 0,
        top          = d.nextReactionThreshold or 0,
        value        = d.currentStanding or 0,
        isHeader     = d.isHeader and true or false,
        isChild      = d.isChild and true or false,
        hasRep       = (not d.isHeader) or (d.isHeaderWithRep and true or false),
        isCollapsed  = d.isCollapsed and true or false,
        atWarWith    = d.atWarWith and true or false,
        isAccountWide = d.isAccountWide and true or false,
    }
end

local function fromTuple(name, description, standingID, barMin, barMax, barValue, atWarWith,
                         _, isHeader, isCollapsed, hasRep, _, isChild, factionID)
    if not name or name == "" then return nil end
    return {
        factionID    = factionID,
        name         = name,
        description  = description,
        reaction     = standingID or 0,
        bottom       = barMin or 0,
        top          = barMax or 0,
        value        = barValue or 0,
        isHeader     = isHeader and true or false,
        isChild      = isChild and true or false,
        hasRep       = (not isHeader) or (hasRep and true or false),
        isCollapsed  = isCollapsed and true or false,
        atWarWith    = atWarWith and true or false,
        isAccountWide = false,
    }
end

function Compat.NumFactions()
    if not getNumFactions then return 0 end
    return getNumFactions() or 0
end

function Compat.FactionByIndex(index)
    if tableAPI then return fromTable(getDataByIndex(index)) end
    if not getFactionInfo then return nil end
    return fromTuple(getFactionInfo(index))
end

-- nil when the client cannot look a faction up by ID; Factions then falls back
-- to the list index it remembered from the last scan.
function Compat.FactionByID(factionID)
    if not factionID or factionID == 0 then return nil end
    if tableAPI then
        if not getDataByID then return nil end
        return fromTable(getDataByID(factionID))
    end
    if not getFactionInfoByID then return nil end
    return fromTuple(getFactionInfoByID(factionID))
end

Compat.canLookUpByID = (tableAPI and getDataByID ~= nil) or (not tableAPI and getFactionInfoByID ~= nil)

function Compat.ExpandHeader(index)
    if expandHeader then expandHeader(index) end
end

function Compat.CollapseHeader(index)
    if collapseHeader then collapseHeader(index) end
end

--------------------------------------------------------------------------------
-- Friendships (retail, and Mists: the Tillers and friends)
--------------------------------------------------------------------------------

local friendshipTable     = apiFunction("C_GossipInfo", "GetFriendshipReputation")
local friendshipRanksTable = apiFunction("C_GossipInfo", "GetFriendshipReputationRanks")
local friendshipTuple     = globalFunction("GetFriendshipReputation")
local friendshipRanksTuple = globalFunction("GetFriendshipReputationRanks")

-- Returns { standing, bottom, top, label, rank, maxRank } or nil when the
-- faction is not a friendship. top is nil at the highest rank.
function Compat.Friendship(factionID)
    local info
    if friendshipTable then
        local d = friendshipTable(factionID)
        if d and d.friendshipFactionID and d.friendshipFactionID > 0 then
            info = {
                friendID = d.friendshipFactionID,
                standing = d.standing or 0,
                bottom   = d.reactionThreshold or 0,
                top      = d.nextThreshold,
                label    = d.reaction,
            }
        end
    elseif friendshipTuple then
        local friendID, standing, _, _, _, _, label, bottom, top = friendshipTuple(factionID)
        if friendID and friendID > 0 then
            info = {
                friendID = friendID,
                standing = standing or 0,
                bottom   = bottom or 0,
                top      = top,
                label    = label,
            }
        end
    end
    if not info then return nil end

    if friendshipRanksTable then
        local ranks = friendshipRanksTable(info.friendID)
        if ranks then info.rank, info.maxRank = ranks.currentLevel, ranks.maxLevel end
    elseif friendshipRanksTuple then
        info.rank, info.maxRank = friendshipRanksTuple(info.friendID)
    end
    return info
end

--------------------------------------------------------------------------------
-- Renown (Dragonflight and later)
--------------------------------------------------------------------------------

local isMajorFaction   = apiFunction("C_Reputation", "IsMajorFaction")
local majorFactionData = apiFunction("C_MajorFactions", "GetMajorFactionData")
local hasMaxRenown     = apiFunction("C_MajorFactions", "HasMaximumRenown")
local renownLevels     = apiFunction("C_MajorFactions", "GetRenownLevels")

-- Returns { level, maxLevel, earned, threshold, isMax } or nil when the faction
-- is not a renown faction.
function Compat.Renown(factionID)
    if not (isMajorFaction and majorFactionData) then return nil end
    if not isMajorFaction(factionID) then return nil end
    local d = majorFactionData(factionID)
    if not d then return nil end

    local level = d.renownLevel or 0
    local maxLevel
    if renownLevels then
        local levels = renownLevels(factionID)
        local last = levels and levels[#levels]
        maxLevel = last and last.level
    end
    local isMax
    if hasMaxRenown then
        isMax = hasMaxRenown(factionID) and true or false
    else
        isMax = maxLevel ~= nil and level >= maxLevel
    end
    return {
        level     = level,
        maxLevel  = maxLevel,
        earned    = d.renownReputationEarned or 0,
        threshold = d.renownLevelThreshold or 0,
        isMax     = isMax,
    }
end

--------------------------------------------------------------------------------
-- Paragon (Legion and later)
--------------------------------------------------------------------------------

local isParagonForPlayer = apiFunction("C_Reputation", "IsFactionParagonForCurrentPlayer")
local isParagon          = apiFunction("C_Reputation", "IsFactionParagon")
local paragonInfo        = apiFunction("C_Reputation", "GetFactionParagonInfo")

-- Returns { value, threshold, rewardPending } for the running paragon cycle,
-- or nil when the faction has none (or the player is too low for it).
function Compat.Paragon(factionID)
    local check = isParagonForPlayer or isParagon
    if not (check and paragonInfo) then return nil end
    if not check(factionID) then return nil end
    local value, threshold, _, rewardPending, tooLow = paragonInfo(factionID)
    if tooLow or not value or not threshold or threshold <= 0 then return nil end
    local cycle = value % threshold
    -- A pending reward means one full cycle is banked; Blizzard's watch bar
    -- shows it full until the cache is opened, and so do we.
    if rewardPending then cycle = threshold end
    return { value = cycle, threshold = threshold, rewardPending = rewardPending and true or false }
end

--------------------------------------------------------------------------------
-- World quests (retail only)
--------------------------------------------------------------------------------

local questsOnMap        = apiFunction("C_TaskQuest", "GetQuestsOnMap")
local taskQuestInfo      = apiFunction("C_TaskQuest", "GetQuestInfoByQuestID")
local questTitleByID     = apiFunction("C_QuestLog", "GetTitleForQuestID")
local majorFactionReward = apiFunction("C_QuestLog", "GetQuestLogMajorFactionReputationRewards")
local selectQuest        = apiFunction("C_QuestLog", "SetSelectedQuest")
local selectedQuest      = apiFunction("C_QuestLog", "GetSelectedQuest")
local numRewardFactions  = globalFunction("GetNumQuestLogRewardFactions")
local rewardFactionInfo  = globalFunction("GetQuestLogRewardFactionInfo")
local mapChildren        = apiFunction("C_Map", "GetMapChildrenInfo")
local bestMapForUnit     = apiFunction("C_Map", "GetBestMapForUnit")
local mapInfo            = apiFunction("C_Map", "GetMapInfo")

Compat.hasWorldQuests = questsOnMap ~= nil and bestMapForUnit ~= nil

function Compat.WorldQuestsOnMap(uiMapID)
    if not questsOnMap then return nil end
    local ok, quests = pcall(questsOnMap, uiMapID)
    if not ok then return nil end
    return quests
end

function Compat.QuestTitle(questID)
    if questTitleByID then
        local title = questTitleByID(questID)
        if title and title ~= "" then return title end
    end
    if taskQuestInfo then
        local title = taskQuestInfo(questID)
        if type(title) == "string" and title ~= "" then return title end
    end
    return nil
end

-- factionID -> reputation the quest pays, for as much as the client will say.
-- Renown factions answer by quest ID; everything else only answers about the
-- selected quest, so the selection is put back where it was.
function Compat.QuestReputation(questID)
    local rewards

    if majorFactionReward then
        local ok, list = pcall(majorFactionReward, questID)
        if ok and type(list) == "table" then
            for _, reward in ipairs(list) do
                local id = reward.factionID or reward.majorFactionID
                if id then
                    rewards = rewards or {}
                    rewards[id] = reward.rewardAmount or reward.renownLevelsGained or 0
                end
            end
        end
    end

    if not (selectQuest and numRewardFactions and rewardFactionInfo) then return rewards end

    local previous = selectedQuest and selectedQuest()
    local ok = pcall(selectQuest, questID)
    if ok then
        local count = numRewardFactions() or 0
        for i = 1, count do
            local id, amount = rewardFactionInfo(i)
            if type(id) == "number" and id ~= 0 then
                rewards = rewards or {}
                rewards[id] = type(amount) == "number" and amount or rewards[id] or 0
            end
        end
    end
    if previous and selectQuest then pcall(selectQuest, previous) end
    return rewards
end

-- The zones world quests could be sitting in right now: the map the player is
-- on and its continent's zones.
function Compat.NearbyMaps()
    if not bestMapForUnit then return {} end
    local current = bestMapForUnit("player")
    if not current then return {} end

    local maps, seen = { { uiMapID = current, name = Compat.MapName(current) } }, { [current] = true }

    local continent, info = current, mapInfo and mapInfo(current)
    while info and info.parentMapID and info.parentMapID ~= 0 and info.mapType
        and Enum and Enum.UIMapType and info.mapType > Enum.UIMapType.Continent do
        continent = info.parentMapID
        info = mapInfo(continent)
    end

    if mapChildren and Enum and Enum.UIMapType then
        local children = mapChildren(continent, Enum.UIMapType.Zone, true)
        for _, child in ipairs(children or {}) do
            if child.mapID and not seen[child.mapID] then
                seen[child.mapID] = true
                maps[#maps + 1] = { uiMapID = child.mapID, name = child.name }
            end
        end
    end
    return maps
end

function Compat.MapName(uiMapID)
    local info = mapInfo and mapInfo(uiMapID)
    return (info and info.name) or ""
end

--------------------------------------------------------------------------------
-- Misc
--------------------------------------------------------------------------------

Compat.MAX_REACTION = _G.MAX_REPUTATION_REACTION or 8

function Compat.StandingLabel(reaction)
    local key = "FACTION_STANDING_LABEL" .. tostring(reaction)
    if GetText then
        local text = GetText(key, UnitSex("player"))
        if text and text ~= "" then return text end
    end
    return _G[key] or "?"
end

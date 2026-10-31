local _, T = ...
local Compat = T.Compat

-- Which world quests are paying into a faction right now. Retail only: a client
-- without task quests simply has nothing to answer, and every caller treats a
-- nil answer as "nothing to show".
local WorldQuests = {}
T.WorldQuests = WorldQuests

-- One sweep covers every zone of the player's continent, so it is done once and
-- kept for half a minute rather than on every tooltip.
local CACHE_SECONDS = 30
local MAX_SCANNED = 150
local MAX_PER_FACTION = 6

local byFaction, scannedAt = nil, 0

local function now()
    return (GetTime and GetTime()) or 0
end

local function scan()
    local found, seen, scanned = {}, {}, 0

    for _, map in ipairs(Compat.NearbyMaps()) do
        for _, quest in ipairs(Compat.WorldQuestsOnMap(map.uiMapID) or {}) do
            local questID = quest.questID or quest.questId
            if questID and not seen[questID] and scanned < MAX_SCANNED then
                seen[questID] = true
                scanned = scanned + 1
                for factionID, amount in pairs(Compat.QuestReputation(questID) or {}) do
                    local list = found[factionID]
                    if not list then
                        list = {}
                        found[factionID] = list
                    end
                    if #list < MAX_PER_FACTION then
                        list[#list + 1] = {
                            title  = Compat.QuestTitle(questID) or tostring(questID),
                            zone   = map.name,
                            amount = amount,
                        }
                    end
                end
            end
        end
    end
    return found
end

-- The world quests up right now that reward this faction, or nil when the
-- client has none to offer.
function WorldQuests.For(factionID)
    if not Compat.hasWorldQuests then return nil end
    if not byFaction or now() - scannedAt > CACHE_SECONDS then
        byFaction, scannedAt = scan(), now()
    end
    local list = byFaction[factionID]
    if list and #list > 0 then return list end
    return nil
end

-- A new zone means new world quests; the next question re-scans.
function WorldQuests.Invalidate()
    byFaction = nil
end

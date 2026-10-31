local _, T = ...
local DB = T.DB

-- What this account has actually seen pay out. Every reputation gain the client
-- announces in chat is filed under what the player was doing at that moment: a
-- quest turn-in names the quest, anything else names the zone. It is a log of
-- where the reputation came from, not a guide - the compendium in Data/ is the
-- guide, and this is what the warband can add to it.
local Learned = {}
T.Learned = Learned

local SEP = "\031"
-- Enough to remember a zone's worth of quests without letting SavedVariables
-- grow without end; the least useful entry makes room for a new one.
local MAX_PER_FACTION = 24

local lastQuest = { title = nil, at = 0 }
-- A turn-in and its reputation line arrive in the same frame, but the client
-- does not promise an order, so a short window counts as "because of it".
local QUEST_WINDOW = 2

local function now()
    return (GetTime and GetTime()) or 0
end

function Learned.NoteQuestTurnIn(title)
    lastQuest.title, lastQuest.at = title, now()
end

local function store(factionID)
    local learned = DB.Learned()
    local entries = learned[factionID]
    if not entries then
        entries = {}
        learned[factionID] = entries
    end
    return entries
end

-- Drops the entry seen least often, and the oldest of those, so a one-off kill
-- never pushes out a daily quest.
local function makeRoom(entries)
    local count = 0
    for _ in pairs(entries) do count = count + 1 end
    if count < MAX_PER_FACTION then return end

    local worstKey, worst
    for key, entry in pairs(entries) do
        if not worst or entry.count < worst.count
            or (entry.count == worst.count and (entry.last or 0) < (worst.last or 0)) then
            worstKey, worst = key, entry
        end
    end
    if worstKey then entries[worstKey] = nil end
end

-- The zone is the fallback label: for a kill, a treasure or a turn-in the
-- client does not announce, it is all we can honestly say.
local function context()
    if lastQuest.title and now() - lastQuest.at <= QUEST_WINDOW then
        return "quest", lastQuest.title
    end
    local zone = (GetZoneText and GetZoneText()) or ""
    if zone == "" then zone = (GetRealZoneText and GetRealZoneText()) or "" end
    if zone == "" then return nil end
    return "kill", zone
end

-- Called for every reputation gain the chat announces. amount may be nil when
-- the client's message does not carry one.
function Learned.Note(factionID, amount)
    if not factionID or factionID == 0 then return end
    if not DB.Profile().learnSources then return end

    local kind, label = context()
    if not label then return end

    local entries = store(factionID)
    local key = kind .. SEP .. label
    local entry = entries[key]
    if not entry then
        makeRoom(entries)
        entry = { kind = kind, label = label, count = 0 }
        entries[key] = entry
    end
    entry.count = entry.count + 1
    entry.last = time()
    if amount and amount > (entry.amount or 0) then entry.amount = amount end
end

-- Most seen first, so the daily a character actually runs is at the top.
function Learned.For(factionID)
    local entries = DB.Learned()[factionID]
    if not entries then return nil end

    local list = {}
    for _, entry in pairs(entries) do list[#list + 1] = entry end
    if #list == 0 then return nil end
    table.sort(list, function(a, b)
        if a.count ~= b.count then return a.count > b.count end
        if (a.amount or 0) ~= (b.amount or 0) then return (a.amount or 0) > (b.amount or 0) end
        return a.label < b.label
    end)
    return list
end

function Learned.Forget(factionID)
    local learned = DB.Learned()
    if factionID then
        learned[factionID] = nil
    else
        wipe(learned)
    end
end

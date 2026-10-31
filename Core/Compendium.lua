local _, T = ...
local L = T.L

-- Where reputation with a faction actually comes from: a handful of short lines
-- per faction, each tagged with how often that source can be used. The lines
-- themselves live in Data/, one file per language. This module is only the
-- registry and the tag both the tooltip and the compendium window put in front
-- of a line.
local Compendium = {}
T.Compendium = Compendium

-- Gold for content that runs out (quest lines, unlocks), blue for anything on a
-- timer, green for what can be repeated at will, purple for group content.
local KINDS = {
    unlock  = { label = "Unlock",       hex = "ffa335ee" },
    quest   = { label = "Quests",       hex = "ffffd100" },
    daily   = { label = "Daily",        hex = "ff3fc7eb" },
    weekly  = { label = "Weekly",       hex = "ff3fc7eb" },
    world   = { label = "World quests", hex = "ff3fc7eb" },
    turnin  = { label = "Turn-ins",     hex = "ff4ade80" },
    kill    = { label = "Kills",        hex = "ff4ade80" },
    dungeon = { label = "Dungeons",     hex = "ffc586e0" },
    raid    = { label = "Raids",        hex = "ffc586e0" },
    event   = { label = "Event",        hex = "ffff7ac6" },
    craft   = { label = "Professions",  hex = "ffe0c060" },
}

-- factionID -> { lines = { { kind, text } ... }, note }
local entries = {}
local count = 0

-- Called once per faction by Data/Compendium.lua. Later calls for the same
-- faction replace what an earlier one said, so a flavour-specific file could
-- override an entry by loading after it.
function Compendium.Add(factionID, lines, note)
    if not entries[factionID] then count = count + 1 end
    local entry = { lines = {}, note = note }
    for i = 1, #lines do
        entry.lines[i] = { kind = lines[i][1], text = lines[i][2] }
    end
    entries[factionID] = entry
end

-- A language file replaces the texts in place, line for line. A line it leaves
-- out keeps its English wording instead of disappearing.
function Compendium.Translate(factionID, texts, note)
    local entry = entries[factionID]
    if not entry then return end
    for i = 1, #texts do
        if entry.lines[i] then entry.lines[i].text = texts[i] end
    end
    if note then entry.note = note end
end

function Compendium.Get(factionID)
    local entry = entries[factionID]
    if entry and #entry.lines > 0 then return entry end
    return nil
end

-- How many factions the compendium covers; the options panel says so, because
-- an empty compendium for a faction is a gap in the data, not a bug.
function Compendium.Count() return count end

function Compendium.Kinds() return KINDS end

-- "Daily" in the tag colour, ready to be put in front of a line.
function Compendium.Tag(kind)
    local k = KINDS[kind]
    if not k then return "" end
    return "|c" .. k.hex .. L[k.label] .. "|r"
end

local _, T = ...
local L = T.L
local DB = T.DB
local Compat = T.Compat

local Factions = {}
T.Factions = Factions

-- The reputation list is one flat, index-addressed sequence in every client:
-- top-level headers (expansions, "Guild", "Other" ...), sub-headers marked
-- isChild, and factions. A faction with isChild belongs to the last sub-header,
-- one without it directly to the top-level header. Collapsed headers hide their
-- children from the list, so a scan expands them, reads, and collapses them
-- again, leaving the reputation panel the way the player left it.

local SEP = "\031"

-- The last scan, in Blizzard's order: header nodes { header = true, key, name,
-- depth } and faction nodes { id, name, depth, groupKey }.
Factions.nodes = {}

local indexByID = {}
local idByName = {}
local scanning = false
local scannedFor = {}

local function headerKey(f)
    if f.factionID and f.factionID ~= 0 then return "id:" .. f.factionID end
    return "name:" .. f.name
end

function Factions.GroupKey(top, sub)
    if sub then return top .. SEP .. sub end
    return top
end

function Factions.IsScanning() return scanning end

function Factions.Scan()
    if scanning then return end
    scanning = true

    local expanded = {}
    local i = 1
    while i <= Compat.NumFactions() do
        local f = Compat.FactionByIndex(i)
        if f and f.isHeader and f.isCollapsed then
            expanded[headerKey(f)] = true
            Compat.ExpandHeader(i)
        end
        i = i + 1
    end

    local nodes, groups = {}, DB.Char().groups
    wipe(indexByID)
    wipe(idByName)

    local top, sub
    local function addFaction(f, index, depth)
        local id = f.factionID
        if not id or id == 0 then return end
        nodes[#nodes + 1] = { id = id, name = f.name, depth = depth, groupKey = Factions.GroupKey(top, sub) }
        groups[id] = { name = f.name, top = top, sub = sub, order = index }
        indexByID[id] = index
        idByName[f.name] = id
    end

    for index = 1, Compat.NumFactions() do
        local f = Compat.FactionByIndex(index)
        if f then
            if f.isHeader and (not f.isChild or not top) then
                top, sub = f.name, nil
                nodes[#nodes + 1] = { header = true, key = Factions.GroupKey(top), name = top, depth = 0 }
                if f.hasRep then addFaction(f, index, 1) end
            elseif f.isHeader then
                sub = f.name
                nodes[#nodes + 1] = { header = true, key = Factions.GroupKey(top, sub), name = sub, depth = 1 }
                if f.hasRep then addFaction(f, index, 2) end
            else
                -- Factions listed before any header (none in practice) get a
                -- group of their own rather than being dropped.
                if not top then
                    top = L["Other"]
                    nodes[#nodes + 1] = { header = true, key = Factions.GroupKey(top), name = top, depth = 0 }
                end
                if not f.isChild then sub = nil end
                addFaction(f, index, sub and 2 or 1)
            end
        end
    end

    for index = Compat.NumFactions(), 1, -1 do
        local f = Compat.FactionByIndex(index)
        if f and f.isHeader and not f.isCollapsed and expanded[headerKey(f)] then
            Compat.CollapseHeader(index)
        end
    end

    Factions.nodes = nodes
    scanning = false
end

-- Scan at most once per faction per session for tracked factions the last scan
-- did not place, e.g. one added by chat message before the first scan.
function Factions.EnsureGroups()
    local missing = false
    for id in pairs(DB.Char().tracked) do
        if not DB.Group(id) and not scannedFor[id] then
            scannedFor[id] = true
            missing = true
        end
    end
    if missing then Factions.Scan() end
end

function Factions.IDByName(name)
    if idByName[name] then return idByName[name] end
    for id, g in pairs(DB.Char().groups) do
        if g.name == name then return id end
    end
    return nil
end

--------------------------------------------------------------------------------
-- Bar values
--------------------------------------------------------------------------------

local FALLBACK_COLOR = { r = 0.5, g = 0.5, b = 0.5 }
local RENOWN_COLOR = _G.BLUE_FONT_COLOR or { r = 0, g = 0.6, b = 1 }

local function reactionColor(reaction)
    local colors = _G.FACTION_BAR_COLORS
    return (colors and colors[reaction]) or FALLBACK_COLOR
end

local function lookUp(id)
    local f = Compat.FactionByID(id)
    if f then return f end
    -- Clients without a by-ID lookup: trust the index from the last scan only
    -- if it still points at the same faction.
    local index = indexByID[id]
    f = index and Compat.FactionByIndex(index)
    if f and f.factionID == id then return f end
    return nil
end

-- Everything a bar and its tooltip need, or nil when the client does not know
-- the faction (anymore).
--   kind      "standard" | "friendship" | "renown"
--   level     current step (standing 1..8, friendship rank, renown level)
--   maxLevel  highest step, nil when the client does not say
--   standing  the step's name ("Honored", "Renown 12", "Good Friend")
--   cur, max  progress within the step; both 1 once capped
--   paragon   { value, threshold, rewardPending } once capped with paragon
function Factions.Get(id)
    local f = lookUp(id)
    if not f then return nil end

    local rec = {
        id          = id,
        name        = f.name,
        description = f.description,
        atWar       = f.atWarWith,
        accountWide = f.isAccountWide,
    }

    local cur, max, capped
    local friend = Compat.Friendship(id)
    local renown = not friend and Compat.Renown(id)

    if friend then
        rec.kind     = "friendship"
        rec.level    = friend.rank
        rec.maxLevel = friend.maxRank
        rec.standing = friend.label or ""
        rec.color    = reactionColor(5)
        capped = friend.top == nil
        if not capped then
            cur, max = friend.standing - friend.bottom, friend.top - friend.bottom
        end
    elseif renown then
        rec.kind     = "renown"
        rec.level    = renown.level
        rec.maxLevel = renown.maxLevel
        rec.standing = (_G.RENOWN_LEVEL_LABEL or L["Renown %d"]):format(renown.level)
        rec.color    = RENOWN_COLOR
        capped = renown.isMax
        cur, max = renown.earned, renown.threshold
    else
        rec.kind     = "standard"
        rec.level    = f.reaction
        rec.maxLevel = Compat.MAX_REACTION
        rec.standing = Compat.StandingLabel(f.reaction)
        rec.color    = reactionColor(f.reaction)
        capped = f.reaction >= Compat.MAX_REACTION
        cur, max = f.value - f.bottom, f.top - f.bottom
    end

    if capped then
        cur, max = 1, 1
        rec.capped = true
        local paragon = Compat.Paragon(id)
        if paragon then
            rec.paragon = paragon
            cur, max = paragon.value, paragon.threshold
        end
    end

    cur, max = cur or 0, max or 0
    rec.cur, rec.max = cur, max
    if max > 0 then
        rec.fraction = math.min(math.max(cur / max, 0), 1)
    else
        rec.fraction = capped and 1 or 0
    end
    return rec
end

--------------------------------------------------------------------------------
-- Tracker layout
--------------------------------------------------------------------------------

local LAST = math.huge

local function nameOf(id)
    local g = DB.Group(id)
    local f = Compat.FactionByID(id)
    return (f and f.name) or (g and g.name) or tostring(id)
end

-- The rows the tracker shows, in order:
--   { header = true, key, name, depth }   (grouped mode only)
--   { id, depth }
-- Grouped mode mirrors the reputation panel: top-level groups in Blizzard's
-- order, and inside each group its factions and sub-groups interleaved the way
-- the panel lists them. The flat list is alphabetical.
function Factions.Layout(grouped)
    local ids = DB.TrackedIDs()
    local rows = {}

    if not grouped then
        local names = {}
        for _, id in ipairs(ids) do names[id] = nameOf(id) end
        table.sort(ids, function(a, b) return names[a] < names[b] end)
        for _, id in ipairs(ids) do rows[#rows + 1] = { id = id, depth = 0 } end
        return rows
    end

    local tops, topList = {}, {}
    local function orderOf(id)
        local g = DB.Group(id)
        return (g and g.order) or LAST
    end

    for _, id in ipairs(ids) do
        local g = DB.Group(id)
        local topName = (g and g.top) or L["Other"]
        local order = orderOf(id)
        local top = tops[topName]
        if not top then
            top = { name = topName, order = order, items = {}, subs = {} }
            tops[topName] = top
            topList[#topList + 1] = top
        end
        top.order = math.min(top.order, order)

        local subName = g and g.sub
        if subName then
            local sub = top.subs[subName]
            if not sub then
                sub = { name = subName, order = order, ids = {} }
                top.subs[subName] = sub
                top.items[#top.items + 1] = sub
            end
            sub.order = math.min(sub.order, order)
            sub.ids[#sub.ids + 1] = id
        else
            top.items[#top.items + 1] = { id = id, order = order }
        end
    end

    local function byOrder(a, b)
        if a.order ~= b.order then return a.order < b.order end
        return (a.name or nameOf(a.id)) < (b.name or nameOf(b.id))
    end
    local function idsByOrder(a, b)
        local oa, ob = orderOf(a), orderOf(b)
        if oa ~= ob then return oa < ob end
        return nameOf(a) < nameOf(b)
    end

    table.sort(topList, byOrder)
    for _, top in ipairs(topList) do
        rows[#rows + 1] = { header = true, key = Factions.GroupKey(top.name), name = top.name, depth = 0 }
        table.sort(top.items, byOrder)
        for _, item in ipairs(top.items) do
            if item.ids then
                rows[#rows + 1] = { header = true, key = Factions.GroupKey(top.name, item.name),
                                    name = item.name, depth = 1, parent = Factions.GroupKey(top.name) }
                table.sort(item.ids, idsByOrder)
                for _, id in ipairs(item.ids) do
                    rows[#rows + 1] = { id = id, depth = 2, parent = Factions.GroupKey(top.name, item.name) }
                end
            else
                rows[#rows + 1] = { id = item.id, depth = 1, parent = Factions.GroupKey(top.name) }
            end
        end
    end
    return rows
end

--------------------------------------------------------------------------------
-- Automatic tracking
--------------------------------------------------------------------------------

-- The chat line is the one signal every flavour has for "reputation went up".
-- Its formats are global strings; turn each into a Lua pattern capturing the
-- faction name.
local GAIN_FORMATS = {
    "FACTION_STANDING_INCREASED",
    "FACTION_STANDING_INCREASED_GENERIC",
    "FACTION_STANDING_INCREASED_BONUS",
    "FACTION_STANDING_INCREASED_DOUBLE_BONUS",
    "FACTION_STANDING_INCREASED_ACH_BONUS",
    "FACTION_STANDING_INCREASED_ACCOUNT_WIDE",
    "FACTION_STANDING_INCREASED_ACCOUNT_WIDE_GENERIC",
}

local function toPattern(fmt)
    local s = fmt:gsub("%%%d*%$?s", "\001")
    s = s:gsub("%%%d*%$?[%.%d]*[df]", "\002")
    s = s:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0")
    s = s:gsub("\001", "(.-)"):gsub("\002", "([%%d%%.,]+)")
    return "^" .. s .. "$"
end

local gainPatterns
local function patterns()
    if gainPatterns then return gainPatterns end
    gainPatterns = {}
    for _, name in ipairs(GAIN_FORMATS) do
        local fmt = _G[name]
        if type(fmt) == "string" and fmt:find("%%%d*%$?s") then
            gainPatterns[#gainPatterns + 1] = toPattern(fmt)
        end
    end
    return gainPatterns
end

-- A capture is either the faction's name or one of the numbers in the message;
-- the first number is the reputation gained, any later one is a bonus note.
local function classify(name, amount, capture)
    if not capture then return name, amount end
    if capture:match("^[%d%.,]+$") then
        return name, amount or tonumber((capture:gsub("[%.,]", "")))
    end
    return name or capture, amount
end

-- The faction's name and, when the message carries one, the amount gained.
function Factions.NameFromChat(message)
    for _, pattern in ipairs(patterns()) do
        local first, second, third = message:match(pattern)
        if first then
            local name, amount = classify(nil, nil, first)
            name, amount = classify(name, amount, second)
            name, amount = classify(name, amount, third)
            if name and name ~= "" then return name, amount end
        end
    end
    return nil
end

function Factions.AutoTrack(id)
    if not id or id == 0 or DB.IsTracked(id) then return end
    if not DB.Profile().autoTrack then return end
    DB.SetTracked(id, true)
    if not DB.Group(id) then Factions.Scan() end
    T.Addon.Refresh()
end

function Factions.AutoTrackByName(name)
    if not DB.Profile().autoTrack then return end
    local id = Factions.IDByName(name)
    if not id then
        -- A faction met for the first time is not in the last scan yet.
        Factions.Scan()
        id = Factions.IDByName(name)
    end
    Factions.AutoTrack(id)
end

-- Checks the compendium data the way the client cannot: that every line carries
-- a tag the addon knows, that the texts are short enough to read in a tooltip,
-- and that the German file says the same things in the same order as the
-- English one. Run by `make lint`; any complaint fails the build.
--
--   lua5.1 tools/check-compendium.lua [addon root]

local root = (...) or "."
local problems = 0

local function fail(fmt, ...)
    problems = problems + 1
    io.stderr:write("  " .. fmt:format(...) .. "\n")
end

local T = { L = setmetatable({}, { __index = function(_, key) return key end }) }

local function run(path)
    local chunk, err = loadfile(root .. "/" .. path)
    if not chunk then
        fail("%s", tostring(err))
        return false
    end
    chunk("Favorkeeper", T)
    return true
end

if not run("Core/Compendium.lua") then os.exit(1) end

local MAX_TEXT = 110
local MAX_LINES = 5

-- The real Add and Translate keep the data; these wrappers keep the order the
-- files declare it in, which is what the two files have to agree on.
local english, germanOrder, german = {}, {}, {}
local order = {}

local realAdd, realTranslate = T.Compendium.Add, T.Compendium.Translate

T.Compendium.Add = function(factionID, lines, note)
    if english[factionID] then fail("Data/Compendium.lua lists %d twice", factionID) end
    english[factionID] = { lines = lines, note = note }
    order[#order + 1] = factionID
    realAdd(factionID, lines, note)
end

T.Compendium.Translate = function(factionID, texts, note)
    if german[factionID] then fail("Data/Compendium_deDE.lua lists %d twice", factionID) end
    german[factionID] = { texts = texts, note = note }
    germanOrder[#germanOrder + 1] = factionID
    realTranslate(factionID, texts, note)
end

if not run("Data/Compendium.lua") then os.exit(1) end

_G.GetLocale = function() return "deDE" end
if not run("Data/Compendium_deDE.lua") then os.exit(1) end

local kinds = T.Compendium.Kinds()

local function checkText(where, factionID, text)
    if type(text) ~= "string" or text == "" then
        fail("%s %d: empty line", where, factionID)
        return
    end
    if #text > MAX_TEXT then
        fail("%s %d: line of %d characters, %d is the limit", where, factionID, #text, MAX_TEXT)
    end
    if text:match("^%s") or text:match("%s$") then
        fail("%s %d: line with a stray space at one end", where, factionID)
    end
end

for _, factionID in ipairs(order) do
    local entry = english[factionID]
    if #entry.lines == 0 or #entry.lines > MAX_LINES then
        fail("Data/Compendium.lua %d: %d lines, 1 to %d is the range", factionID, #entry.lines, MAX_LINES)
    end
    for _, line in ipairs(entry.lines) do
        if not kinds[line[1]] then
            fail("Data/Compendium.lua %d: unknown tag %q", factionID, tostring(line[1]))
        end
        checkText("Data/Compendium.lua", factionID, line[2])
    end
    if entry.note then checkText("Data/Compendium.lua", factionID, entry.note) end
end

for index, factionID in ipairs(germanOrder) do
    local entry, source = german[factionID], english[factionID]
    if not source then
        fail("Data/Compendium_deDE.lua translates %d, which Data/Compendium.lua does not list", factionID)
    else
        if order[index] ~= factionID then
            fail("Data/Compendium_deDE.lua has %d where Data/Compendium.lua has %d",
                factionID, tostring(order[index]))
        end
        if #entry.texts ~= #source.lines then
            fail("%d: %d German lines against %d English ones", factionID, #entry.texts, #source.lines)
        end
        if (entry.note ~= nil) ~= (source.note ~= nil) then
            fail("%d: the note is missing on one side", factionID)
        end
        for _, text in ipairs(entry.texts) do checkText("Data/Compendium_deDE.lua", factionID, text) end
        if entry.note then checkText("Data/Compendium_deDE.lua", factionID, entry.note) end
    end
end

for _, factionID in ipairs(order) do
    if not german[factionID] then
        fail("Data/Compendium_deDE.lua does not translate %d", factionID)
    end
end

if problems > 0 then
    io.stderr:write(("compendium: %d problem(s)\n"):format(problems))
    os.exit(1)
end

print(("compendium: %d factions, both languages agree"):format(#order))

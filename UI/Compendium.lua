local _, T = ...
local L = T.L

-- The compendium window: one faction at a time, with the places its reputation
-- comes from. Opened with Ctrl-click on any bar, in the tracker or in the
-- faction list.
local Compendium = {}
T.CompendiumWindow = Compendium

local FRAME_W, FRAME_H = 400, 430
local PAD = 14
local SCROLLBAR_W = 22
local CONTENT_W = FRAME_W - PAD * 2 - SCROLLBAR_W
local TAG_W = 88
local TEXT_W = CONTENT_W - TAG_W - 8
local ROW_GAP = 8
local MAX_LEARNED = 6

local frame
local rows, used = {}, 0
local factionID

local function createRow()
    local row = CreateFrame("Frame", nil, frame.content)
    row:SetWidth(CONTENT_W)

    row.tag = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    row.tag:SetPoint("TOPLEFT", 0, 0)
    row.tag:SetWidth(TAG_W)
    row.tag:SetJustifyH("LEFT")
    row.tag:SetJustifyV("TOP")

    row.text = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    row.text:SetPoint("TOPLEFT", TAG_W + 8, 0)
    row.text:SetWidth(TEXT_W)
    row.text:SetJustifyH("LEFT")
    row.text:SetJustifyV("TOP")
    row.text:SetSpacing(2)
    return row
end

local function acquireRow()
    used = used + 1
    local row = rows[used]
    if not row then
        row = createRow()
        rows[used] = row
    end
    row:ClearAllPoints()
    return row
end

-- The line the standing under the faction name reads, in the bar's colour.
local function standingLine(rec)
    if not rec then return nil end
    local text = rec.standing
    local level = T.Bars.LevelText(rec)
    if level ~= rec.standing then text = text .. " \194\183 " .. level end
    if rec.paragon then
        text = text .. " \194\183 " .. L["Paragon"]
    elseif rec.capped then
        text = text .. " \194\183 " .. L["Maximum reached"]
    end
    return text .. " \194\183 " .. T.Bars.Percent(rec)
end

-- One row per line, laid out under the last one. Returns the new bottom.
local function addLine(y, tag, text)
    local row = acquireRow()
    row.tag:SetText(tag or "")
    row.text:SetText(text)
    local height = math.max(row.text:GetStringHeight(), row.tag:GetStringHeight())
    row:SetHeight(height)
    row:SetPoint("TOPLEFT", 0, -y)
    row:Show()
    return y + height + ROW_GAP
end

local function addHeading(y, text)
    return addLine(y + ROW_GAP, "", "|cffffd100" .. text .. "|r")
end

-- The world quests up right now, on the clients that have them.
local function addWorldQuests(y)
    local quests = T.WorldQuests.For(factionID)
    if not quests then return y end

    y = addHeading(y, L["Open right now"])
    for _, quest in ipairs(quests) do
        local text = quest.title
        if quest.zone and quest.zone ~= "" then text = text .. " \194\183 " .. quest.zone end
        if quest.amount and quest.amount > 0 then text = text .. " \194\183 +" .. quest.amount end
        y = addLine(y, T.Compendium.Tag("world"), text)
    end
    return y
end

-- What this account has seen pay out, most often seen first.
local function addLearned(y)
    local seen = T.Learned.For(factionID)
    if not seen then return y end

    y = addHeading(y, L["Seen while playing"])
    for i = 1, math.min(#seen, MAX_LEARNED) do
        local entry = seen[i]
        local text = entry.label
        if entry.amount then text = text .. " \194\183 +" .. entry.amount end
        if entry.count > 1 then text = text .. " \194\183 " .. L["%d times"]:format(entry.count) end
        y = addLine(y, T.Compendium.Tag(entry.kind), text)
    end
    return y
end

function Compendium.Refresh()
    if not frame or not frame:IsShown() or not factionID then return end
    for i = 1, #rows do rows[i]:Hide() end
    used = 0

    local rec = T.Factions.Get(factionID)
    local group = T.DB.Group(factionID)
    frame.faction:SetText((rec and rec.name) or (group and group.name) or tostring(factionID))

    local standing = standingLine(rec)
    if standing then
        local c = rec.color
        frame.standing:SetText(standing)
        frame.standing:SetTextColor(c.r, c.g, c.b)
    else
        frame.standing:SetText(L["This character has not met this faction yet."])
        frame.standing:SetTextColor(0.6, 0.6, 0.6)
    end

    local entry = T.Compendium.Get(factionID)
    local y = 0
    if entry then
        for _, line in ipairs(entry.lines) do
            y = addLine(y, T.Compendium.Tag(line.kind), line.text)
        end
        if entry.note then
            y = addLine(y + ROW_GAP, "", "|cffa0a0a0" .. entry.note .. "|r")
        end
    end

    y = addWorldQuests(y)
    y = addLearned(y)

    -- Nothing at all to say: only then is the window empty.
    frame.empty:SetShown(used == 0)
    frame.content:SetSize(CONTENT_W, math.max(y, 1))
end

function Compendium.Create()
    if frame then return end

    frame = CreateFrame("Frame", "FavorkeeperCompendiumFrame", UIParent, "BackdropTemplate")
    frame:SetSize(FRAME_W, FRAME_H)
    frame:SetPoint("CENTER", 140, 0)
    frame:SetFrameStrata("HIGH")
    frame:SetToplevel(true)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:SetClampedToScreen(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })

    frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    frame.title:SetPoint("TOP", 0, -14)
    frame.title:SetText(L["Compendium"])

    frame.close = CreateFrame("Button", "FavorkeeperCompendiumCloseButton", frame, "UIPanelCloseButton")
    frame.close:SetPoint("TOPRIGHT", 2, 2)

    tinsert(UISpecialFrames, "FavorkeeperCompendiumFrame")

    frame.faction = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.faction:SetPoint("TOPLEFT", PAD + 6, -44)
    frame.faction:SetPoint("TOPRIGHT", -PAD - 6, -44)
    frame.faction:SetJustifyH("LEFT")
    frame.faction:SetWordWrap(false)

    frame.standing = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.standing:SetPoint("TOPLEFT", PAD + 6, -62)
    frame.standing:SetPoint("TOPRIGHT", -PAD - 6, -62)
    frame.standing:SetJustifyH("LEFT")
    frame.standing:SetWordWrap(false)

    local divider = frame:CreateTexture(nil, "ARTWORK")
    divider:SetColorTexture(1, 1, 1, 0.15)
    divider:SetHeight(1)
    divider:SetPoint("TOPLEFT", PAD, -82)
    divider:SetPoint("TOPRIGHT", -PAD, -82)

    local scroll = CreateFrame("ScrollFrame", "FavorkeeperCompendiumScrollFrame", frame,
        "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", PAD, -90)
    scroll:SetPoint("BOTTOMRIGHT", -PAD - SCROLLBAR_W, PAD)

    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(CONTENT_W, 1)
    scroll:SetScrollChild(content)
    frame.scroll, frame.content = scroll, content

    frame.empty = frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    frame.empty:SetPoint("TOPLEFT", scroll, "TOPLEFT", 0, -20)
    frame.empty:SetPoint("TOPRIGHT", scroll, "TOPRIGHT", 0, -20)
    frame.empty:SetJustifyH("LEFT")
    frame.empty:SetSpacing(3)
    frame.empty:SetText(L["No sources recorded for this faction yet."] .. "\n\n"
        .. L["The compendium is part of the addon, so it grows with every update."])
    frame.empty:Hide()

    frame:Hide()

    if T.SkinElvUI then T.SkinElvUI() end
end

function Compendium.Open(id)
    if not id then return end
    Compendium.Create()
    factionID = id
    frame:Show()
    frame.scroll:SetVerticalScroll(0)
    Compendium.Refresh()
end

function Compendium.Toggle(id)
    Compendium.Create()
    if frame:IsShown() and factionID == id then
        frame:Hide()
    else
        Compendium.Open(id)
    end
end

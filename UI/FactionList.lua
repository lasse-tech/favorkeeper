local _, T = ...
local L = T.L
local DB = T.DB

-- Every faction the character knows, grouped exactly like the reputation
-- panel. Ticking a faction puts its bar into the tracker.
local FactionList = {}
T.FactionList = FactionList

local FRAME_W, FRAME_H = 420, 500
local PAD = 14
local ROW_H = 20
local BAR_H = 16
local CHECK = 20
local INDENT = 12
local SCROLLBAR_W = 22
local CONTENT_W = FRAME_W - PAD * 2 - SCROLLBAR_W

local frame
local rows, used = {}, 0
local searchText = ""

local function foldMarkup(folded)
    if folded then return "|TInterface\\Buttons\\UI-PlusButton-Up:12|t " end
    return "|TInterface\\Buttons\\UI-MinusButton-Up:12|t "
end

local function toggleTracked(id)
    DB.SetTracked(id, not DB.IsTracked(id))
    T.Addon.Refresh()
end

-- Ctrl-click asks about the faction instead of tracking it.
local function clickFaction(id)
    T.Addon.ReportClick("list", "LeftButton")
    if T.Addon.ControlDown() then
        T.CompendiumWindow.Toggle(id)
    else
        toggleTracked(id)
    end
end

local function createRow()
    local row = CreateFrame("Frame", nil, frame.content)
    row:SetHeight(ROW_H)

    local header = CreateFrame("Button", nil, row)
    header:SetAllPoints()
    header.label = header:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    header.label:SetPoint("LEFT", 0, 0)
    header.label:SetPoint("RIGHT", 0, 0)
    header.label:SetJustifyH("LEFT")
    header.label:SetWordWrap(false)
    local hl = header:CreateTexture(nil, "HIGHLIGHT")
    hl:SetAllPoints()
    hl:SetColorTexture(1, 1, 1, 0.08)
    header:SetScript("OnClick", function()
        DB.ToggleListFold(row.key)
        FactionList.Refresh()
    end)
    row.header = header

    local check = CreateFrame("CheckButton", nil, row, "UICheckButtonTemplate")
    check:SetSize(CHECK, CHECK)
    check:SetPoint("LEFT", 0, 0)
    check:SetScript("OnClick", function() toggleTracked(row.factionID) end)
    row.check = check

    local bar = T.Bars.Create(row, BAR_H)
    bar:SetPoint("LEFT", check, "RIGHT", 2, 0)
    bar:SetPoint("RIGHT", 0, 0)
    bar:SetScript("OnClick", function() clickFaction(row.factionID) end)
    bar:SetScript("OnEnter", function(self)
        T.Bars.ShowTooltip(self, T.Factions.Get(row.factionID), L["Click to track or untrack."])
    end)
    bar:SetScript("OnLeave", function() GameTooltip:Hide() end)
    row.bar = bar

    -- A faction the client lists but cannot report on (no data yet).
    row.plain = row:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    row.plain:SetPoint("LEFT", check, "RIGHT", 6, 0)
    row.plain:SetPoint("RIGHT", 0, 0)
    row.plain:SetJustifyH("LEFT")
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

local function matches(node)
    return searchText == "" or node.name:lower():find(searchText, 1, true) ~= nil
end

-- With a search running, only matching factions and the headers above them are
-- listed and folding is ignored; otherwise folded groups hide their contents.
local function visibleNodes()
    local nodes = T.Factions.nodes
    local out = {}
    if searchText ~= "" then
        local pendingTop, pendingSub
        for _, node in ipairs(nodes) do
            if node.header and node.depth == 0 then
                pendingTop, pendingSub = node, nil
            elseif node.header then
                pendingSub = node
            elseif matches(node) then
                if pendingTop then out[#out + 1] = pendingTop; pendingTop = nil end
                if pendingSub and node.depth == 2 then out[#out + 1] = pendingSub; pendingSub = nil end
                out[#out + 1] = node
            end
        end
        return out
    end

    local foldedTop, foldedSub = false, false
    for _, node in ipairs(nodes) do
        if node.header and node.depth == 0 then
            foldedTop, foldedSub = DB.IsListFolded(node.key), false
            out[#out + 1] = node
        elseif node.header then
            foldedSub = DB.IsListFolded(node.key)
            if not foldedTop then out[#out + 1] = node end
        elseif not foldedTop and not (node.depth == 2 and foldedSub) then
            out[#out + 1] = node
        end
    end
    return out
end

function FactionList.Refresh()
    if not frame or not frame:IsShown() then return end
    for i = 1, #rows do rows[i]:Hide() end
    used = 0

    local y = 0
    for _, node in ipairs(visibleNodes()) do
        local row = acquireRow()
        row:SetPoint("TOPLEFT", node.depth * INDENT, -y)
        row:SetWidth(CONTENT_W - node.depth * INDENT)
        if node.header then
            row.key = node.key
            local folded = searchText == "" and DB.IsListFolded(node.key)
            row.header.label:SetFontObject(node.depth == 0 and "GameFontNormal" or "GameFontNormalSmall")
            row.header.label:SetText(foldMarkup(folded) .. node.name)
            row.header:Show()
            row.check:Hide()
            row.bar:Hide()
            row.plain:Hide()
        else
            row.factionID = node.id
            row.header:Hide()
            row.check:Show()
            row.check:SetChecked(DB.IsTracked(node.id))
            local rec = T.Factions.Get(node.id)
            if rec then
                T.Bars.Set(row.bar, rec)
                row.bar:Show()
                row.plain:Hide()
            else
                row.plain:SetText(node.name)
                row.plain:Show()
                row.bar:Hide()
            end
        end
        row:Show()
        y = y + ROW_H + 2
    end

    frame.empty:SetShown(used == 0)
    frame.content:SetSize(CONTENT_W, math.max(y, 1))
end

function FactionList.Create()
    if frame then return end

    frame = CreateFrame("Frame", "FavorkeeperFactionListFrame", UIParent, "BackdropTemplate")
    frame:SetSize(FRAME_W, FRAME_H)
    frame:SetPoint("CENTER")
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
    frame.title:SetText(L["Choose factions"])

    frame.close = CreateFrame("Button", "FavorkeeperFactionListCloseButton", frame, "UIPanelCloseButton")
    frame.close:SetPoint("TOPRIGHT", 2, 2)

    tinsert(UISpecialFrames, "FavorkeeperFactionListFrame")

    local searchLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    searchLabel:SetPoint("TOPLEFT", PAD + 6, -42)
    searchLabel:SetText(L["Search"])

    local search = CreateFrame("EditBox", "FavorkeeperFactionListSearchBox", frame, "InputBoxTemplate")
    search:SetHeight(22)
    search:SetPoint("TOPLEFT", PAD + 6, -58)
    search:SetWidth(200)
    search:SetFontObject("GameFontHighlightSmall")
    search:SetAutoFocus(false)
    search:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    search:SetScript("OnTextChanged", function(self)
        searchText = (self:GetText() or ""):lower()
        FactionList.Refresh()
    end)

    local hint = frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    hint:SetPoint("LEFT", search, "RIGHT", 12, 0)
    hint:SetPoint("RIGHT", -PAD, 0)
    hint:SetJustifyH("RIGHT")
    hint:SetText(L["Tick a faction to show its bar."])

    local divider = frame:CreateTexture(nil, "ARTWORK")
    divider:SetColorTexture(1, 1, 1, 0.15)
    divider:SetHeight(1)
    divider:SetPoint("TOPLEFT", PAD, -88)
    divider:SetPoint("TOPRIGHT", -PAD, -88)

    local scroll = CreateFrame("ScrollFrame", "FavorkeeperFactionListScrollFrame", frame,
        "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", PAD, -94)
    scroll:SetPoint("BOTTOMRIGHT", -PAD - SCROLLBAR_W, PAD)

    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(CONTENT_W, 1)
    scroll:SetScrollChild(content)
    frame.scroll, frame.content = scroll, content

    frame.empty = frame:CreateFontString(nil, "OVERLAY", "GameFontDisable")
    frame.empty:SetPoint("TOP", scroll, "TOP", 0, -20)
    frame.empty:SetText(L["No factions found."])
    frame.empty:Hide()

    frame:Hide()

    if T.SkinElvUI then T.SkinElvUI() end
end

function FactionList.Toggle()
    FactionList.Create()
    if frame:IsShown() then
        frame:Hide()
    else
        -- The list can have grown since login (new factions, legacy filter).
        T.Factions.Scan()
        frame:Show()
        FactionList.Refresh()
    end
end

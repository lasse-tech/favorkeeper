local _, T = ...
local L = T.L
local DB = T.DB

-- The small on-screen window with one bar per tracked faction.
local Tracker = {}
T.Tracker = Tracker

local WIDTH, PAD, TITLE_H = 280, 8, 18
local HEADER_H, GAP = 16, 2
-- The fold icon sits in its own column so the header text starts at a known
-- offset; one level of nesting indents by exactly that much, which lines the
-- bars and sub-headers up with the text of the header above them.
local FOLD_W, FOLD_GAP = 12, 4
local INDENT = FOLD_W + FOLD_GAP

local frame, content, barPool, headerPool

local function styleHeader(h)
    h:SetHeight(HEADER_H)
    h.label = h:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    h.icon = h:CreateTexture(nil, "ARTWORK")
    h.icon:SetSize(FOLD_W, FOLD_W)
    h.icon:SetPoint("LEFT", 0, 0)
    h.label:SetPoint("LEFT", INDENT, 0)
    h.label:SetPoint("RIGHT", 0, 0)
    h.label:SetJustifyH("LEFT")
    h.label:SetWordWrap(false)
    h:RegisterForClicks("AnyUp")
    h:SetScript("OnClick", function(self)
        DB.ToggleFold(self.key)
        Tracker.Refresh()
    end)
end

local function onBarClick(self, button)
    T.Addon.ReportClick("bar", button)
    if button == "LeftButton" and T.Addon.ControlDown() then
        T.CompendiumWindow.Toggle(self.factionID)
    elseif button == "LeftButton" and T.Addon.ShiftDown() then
        DB.SetTracked(self.factionID, false)
        T.Addon.Refresh()
    elseif button == "RightButton" then
        T.Addon.OpenOptions()
    end
end

local function onBarEnter(self)
    T.Bars.ShowTooltip(self, T.Factions.Get(self.factionID), L["Shift-click to stop tracking."])
end

local function onBarLeave() GameTooltip:Hide() end

local function foldIcon(folded)
    if folded then return "Interface\\Buttons\\UI-PlusButton-Up" end
    return "Interface\\Buttons\\UI-MinusButton-Up"
end

-- Plain reuse lists: rows are only ever released all at once.
local function pool(create)
    local items, used = {}, 0
    return {
        acquire = function()
            used = used + 1
            local item = items[used]
            if not item then
                item = create()
                items[used] = item
            end
            item:ClearAllPoints()
            return item
        end,
        releaseAll = function()
            for i = 1, #items do items[i]:Hide() end
            used = 0
        end,
    }
end

local function createBar()
    local b = T.Bars.Create(content, DB.Profile().barHeight)
    b:SetScript("OnClick", onBarClick)
    b:SetScript("OnEnter", onBarEnter)
    b:SetScript("OnLeave", onBarLeave)
    return b
end

local function createHeader()
    local h = CreateFrame("Button", nil, content)
    styleHeader(h)
    return h
end

function Tracker.Initialize()
    if frame then return end
    frame = CreateFrame("Frame", "FavorkeeperTrackerFrame", UIParent, "BackdropTemplate")
    frame:SetSize(WIDTH, 60)
    local pos = DB.TrackerPos()
    frame:SetPoint(pos.point or "TOPLEFT", UIParent, pos.relPoint or pos.point or "TOPLEFT",
        pos.x or 16, pos.y or -220)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetClampedToScreen(true)
    frame:SetScript("OnDragStart", function(self)
        if DB.Profile().locked then return end
        self.didDrag = true
        self:StartMoving()
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local left, top = self:GetLeft(), self:GetTop()
        if left and top then
            self:ClearAllPoints()
            self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left, top)
            DB.SaveTrackerPos("TOPLEFT", "BOTTOMLEFT", left, top)
        end
    end)
    frame:SetScript("OnMouseUp", function(self, button)
        if self.didDrag then self.didDrag = false; return end
        if button == "RightButton" then
            T.Addon.OpenOptions()
        elseif T.Addon.ShiftDown() then
            Tracker.SetShown(false)
        else
            T.FactionList.Toggle()
        end
    end)
    frame:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(L["Favorkeeper"], 1, 1, 1)
        GameTooltip:AddLine("|cffffff00" .. L["Click"] .. "|r " .. L["Choose factions"], 1, 1, 1)
        GameTooltip:AddLine("|cffffff00" .. L["Shift-Click"] .. "|r " .. L["Hide window"], 1, 1, 1)
        GameTooltip:AddLine("|cffffff00" .. L["Right-Click"] .. "|r " .. L["Options"], 1, 1, 1)
        GameTooltip:Show()
    end)
    frame:SetScript("OnLeave", function() GameTooltip:Hide() end)

    frame:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        edgeSize = 1,
    })
    frame:SetBackdropColor(0, 0, 0, 0.6)
    frame:SetBackdropBorderColor(0, 0, 0, 1)

    frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.title:SetPoint("TOPLEFT", PAD, -4)
    frame.title:SetText(L["Favorkeeper"])

    content = CreateFrame("Frame", nil, frame)
    content:SetPoint("TOPLEFT", PAD, -TITLE_H - 4)
    content:SetPoint("TOPRIGHT", -PAD, -TITLE_H - 4)
    content:SetHeight(1)

    frame.empty = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    frame.empty:SetPoint("TOPLEFT", PAD, -TITLE_H - 6)
    frame.empty:SetPoint("TOPRIGHT", -PAD, -TITLE_H - 6)
    frame.empty:SetJustifyH("LEFT")
    frame.empty:SetSpacing(3)
    frame.empty:SetText(L["No factions tracked yet."] .. "\n\n"
        .. L["Click this window, type /favor or click the minimap button to choose factions."])
    frame.empty:Hide()

    barPool = pool(createBar)
    headerPool = pool(createHeader)

    frame:SetShown(DB.TrackerShown())
    Tracker.Refresh()
end

-- Only explicit user actions go through here; UIParent hiding the frame must
-- not be persisted.
function Tracker.SetShown(shown)
    if not frame then Tracker.Initialize() end
    DB.SetTrackerShown(shown)
    frame:SetShown(shown)
    if shown then Tracker.Refresh() end
end

function Tracker.Toggle()
    if not frame then Tracker.Initialize() end
    Tracker.SetShown(not frame:IsShown())
end

function Tracker.Refresh()
    if not frame or not frame:IsShown() then return end
    barPool.releaseAll()
    headerPool.releaseAll()

    local grouped = DB.Profile().grouped
    local barH = DB.Profile().barHeight
    local rows = T.Factions.Layout(grouped)

    local y = 0
    local foldedTop, foldedSub = false, false
    for _, row in ipairs(rows) do
        if row.header then
            local folded = DB.IsFolded(row.key)
            if row.depth == 0 then
                foldedTop, foldedSub = folded, false
            else
                foldedSub = folded
            end
            if row.depth == 0 or not foldedTop then
                local h = headerPool.acquire()
                h.key = row.key
                h:SetPoint("TOPLEFT", row.depth * INDENT, -y)
                h:SetPoint("RIGHT", content, "RIGHT", 0, 0)
                h.icon:SetTexture(foldIcon(folded))
                h.label:SetText(row.name)
                h:Show()
                y = y + HEADER_H
            end
        elseif not (grouped and (foldedTop or (row.depth == 2 and foldedSub))) then
            local rec = T.Factions.Get(row.id)
            if rec then
                local b = barPool.acquire()
                b.factionID = row.id
                T.Bars.Set(b, rec, barH)
                b:SetPoint("TOPLEFT", row.depth * INDENT, -y)
                b:SetPoint("RIGHT", content, "RIGHT", 0, 0)
                b:Show()
                y = y + barH + GAP
            end
        end
    end

    if #rows == 0 then
        frame.empty:Show()
        local textH = frame.empty:GetStringHeight()
        if not textH or textH <= 0 then textH = 40 end
        frame:SetHeight(TITLE_H + textH + PAD * 2 + 6)
        return
    end
    frame.empty:Hide()
    content:SetHeight(math.max(y, 1))
    frame:SetHeight(math.max(TITLE_H + y + PAD + 4, 40))
end

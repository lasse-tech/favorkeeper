local _, T = ...
local L = T.L
local DB = T.DB

-- The reputation bar both windows draw, its text and its tooltip.
local Bars = {}
T.Bars = Bars

-- Bar looks the player can pick. All of them ship with every client flavor.
Bars.TEXTURES = {
    { key = "blizzard",   path = "Interface\\TargetingFrame\\UI-StatusBar",               label = "Blizzard" },
    { key = "reputation", path = "Interface\\PaperDollInfoFrame\\UI-Character-Skills-Bar", label = "Classic" },
    { key = "smooth",     path = "Interface\\RaidFrame\\Raid-Bar-Hp-Fill",                label = "Smooth" },
    { key = "flat",       path = "Interface\\Buttons\\WHITE8X8",                          label = "Flat" },
}

-- Bar heights in the bar window; the font grows with the bar.
Bars.HEIGHTS = {
    { value = 12, label = "Small" },
    { value = 16, label = "Normal" },
    { value = 20, label = "Large" },
    { value = 24, label = "Extra large" },
}

local texturePaths = {}
for _, t in ipairs(Bars.TEXTURES) do texturePaths[t.key] = t.path end

local function texturePath()
    return texturePaths[DB.Profile().barTexture] or texturePaths.blizzard
end

local function atlas(name, size)
    if CreateAtlasMarkup and C_Texture and C_Texture.GetAtlasInfo and C_Texture.GetAtlasInfo(name) then
        return CreateAtlasMarkup(name, size, size)
    end
    return nil
end

local function paragonMarkup(paragon)
    if paragon.rewardPending then
        return atlas("ParagonReputation_Checkmark", 12) or "|cff00ff00!|r"
    end
    return atlas("ParagonReputation_Bag", 12) or "+"
end

function Bars.Percent(rec)
    return L["%d%%"]:format(math.floor(rec.fraction * 100 + 0.0001))
end

function Bars.LevelText(rec)
    if rec.level and rec.maxLevel then
        return L["Level %d/%d"]:format(rec.level, rec.maxLevel)
    elseif rec.level then
        return L["Level %d"]:format(rec.level)
    end
    return rec.standing
end

-- The text on the right of a bar, in the style chosen in the options.
function Bars.Text(rec, mode)
    local first
    if mode == "standing" then
        first = rec.standing
    elseif mode == "values" and (not rec.capped or rec.paragon) then
        first = BreakUpLargeNumbers(rec.cur) .. " / " .. BreakUpLargeNumbers(rec.max)
    elseif mode == "values" then
        first = rec.standing
    else
        first = Bars.LevelText(rec)
    end
    local text = first .. " \194\183 " .. Bars.Percent(rec)
    if rec.paragon then text = paragonMarkup(rec.paragon) .. " " .. text end
    return text
end

function Bars.Create(parent, height)
    local button = CreateFrame("Button", nil, parent)
    button:SetHeight(height)

    local bar = CreateFrame("StatusBar", nil, button)
    bar:SetAllPoints()
    bar:SetMinMaxValues(0, 1)
    button.bar = bar

    local bg = bar:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bar.bg = bg

    local hl = button:CreateTexture(nil, "HIGHLIGHT")
    hl:SetAllPoints()
    hl:SetColorTexture(1, 1, 1, 0.12)

    button.text = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    button.text:SetPoint("RIGHT", -4, 0)
    button.text:SetJustifyH("RIGHT")
    button.text:SetWordWrap(false)

    button.name = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    button.name:SetPoint("LEFT", 4, 0)
    button.name:SetPoint("RIGHT", button.text, "LEFT", -6, 0)
    button.name:SetJustifyH("LEFT")
    button.name:SetWordWrap(false)

    button:RegisterForClicks("AnyUp")
    return button
end

-- Applies the chosen texture, and the height when one is given (the faction
-- list keeps its own fixed row height).
function Bars.Style(button, height)
    local path = texturePath()
    if button.texturePath ~= path then
        button.bar:SetStatusBarTexture(path)
        button.bar.bg:SetTexture(path)
        button.texturePath = path
    end
    if height and button.styledHeight ~= height then
        button:SetHeight(height)
        local font = height >= 20 and "GameFontHighlight" or "GameFontHighlightSmall"
        button.name:SetFontObject(font)
        button.text:SetFontObject(font)
        button.styledHeight = height
    end
end

function Bars.Set(button, rec, height)
    Bars.Style(button, height)
    local c = rec.color
    button.bar:SetStatusBarColor(c.r, c.g, c.b, 0.85)
    button.bar.bg:SetVertexColor(c.r * 0.25, c.g * 0.25, c.b * 0.25, 0.7)
    button.bar:SetValue(rec.fraction)
    button.name:SetText(rec.name)
    button.text:SetText(Bars.Text(rec, DB.Profile().barText))
end

-- The tooltip only teases the compendium; the window has the whole entry.
local MAX_TOOLTIP_SOURCES = 3

local function addSources(rec)
    if not DB.Profile().showSources then return end
    local entry = T.Compendium.Get(rec.id)
    if not entry then return end

    GameTooltip:AddLine(" ")
    GameTooltip:AddLine(L["Where the reputation comes from"], 1, 0.82, 0)
    local shown = math.min(#entry.lines, MAX_TOOLTIP_SOURCES)
    for i = 1, shown do
        local line = entry.lines[i]
        GameTooltip:AddLine(T.Compendium.Tag(line.kind) .. "  " .. line.text, 1, 1, 1, true)
    end
    local rest = #entry.lines - shown
    if rest > 0 then
        GameTooltip:AddLine(L["%d more in the compendium"]:format(rest), 0.6, 0.6, 0.6)
    end
end

function Bars.ShowTooltip(owner, rec, hint)
    if not rec or not DB.Profile().showTooltip then return end
    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
    GameTooltip:SetText(rec.name, 1, 1, 1)

    local c = rec.color
    GameTooltip:AddDoubleLine(rec.standing, Bars.LevelText(rec) ~= rec.standing and Bars.LevelText(rec) or " ",
        c.r, c.g, c.b, 1, 1, 1)

    if rec.paragon then
        GameTooltip:AddDoubleLine(L["Paragon"],
            BreakUpLargeNumbers(rec.cur) .. " / " .. BreakUpLargeNumbers(rec.max) .. "  (" .. Bars.Percent(rec) .. ")",
            1, 0.82, 0, 1, 1, 1)
        if rec.paragon.rewardPending then
            GameTooltip:AddLine(L["Reward ready to collect"], 0, 1, 0)
        end
    elseif rec.capped then
        GameTooltip:AddLine(L["Maximum reached"], 0.6, 0.6, 0.6)
    else
        GameTooltip:AddDoubleLine(L["Progress"],
            BreakUpLargeNumbers(rec.cur) .. " / " .. BreakUpLargeNumbers(rec.max) .. "  (" .. Bars.Percent(rec) .. ")",
            1, 0.82, 0, 1, 1, 1)
        GameTooltip:AddDoubleLine(L["To next level"], BreakUpLargeNumbers(rec.max - rec.cur),
            1, 0.82, 0, 1, 1, 1)
    end

    if rec.accountWide then GameTooltip:AddLine(L["Account-wide reputation"], 0, 0.8, 1) end
    if rec.atWar then GameTooltip:AddLine(L["At war"], 1, 0.2, 0.2) end
    if rec.description and rec.description ~= "" then
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine(rec.description, 0.8, 0.8, 0.8, true)
    end
    addSources(rec)

    GameTooltip:AddLine(" ")
    if hint then GameTooltip:AddLine(hint, 0.5, 0.5, 0.5, true) end
    GameTooltip:AddLine(L["Ctrl-click for the compendium."], 0.5, 0.5, 0.5, true)
    GameTooltip:Show()
end

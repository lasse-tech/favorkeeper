local ADDON, T = ...
local L = T.L
local DB = T.DB

local category, layout

-- Blizzard's SettingsListMixin lays the list out with a ScrollBox: an element's
-- height is initializer:GetExtent(), or the template's own height when that is
-- nil. We measure the text and report its exact height.
local ABOUT_TEMPLATE = "FavorkeeperAboutTemplate"
local ABOUT_FONT = "GameFontHighlight"
local ABOUT_BOTTOM_PAD = 8

-- Not localized: the chip reads the same in every locale. Plain ASCII, since the
-- game font has no heart glyph.
local CHIP_TEXT = "Made with <3 in Europe"
local CHIP_GAP = 6
local CHIP_HEIGHT = 18
local CHIP_PAD_X = 8

FavorkeeperAboutMixin = {}

function FavorkeeperAboutMixin:Init(initializer)
    self.Text:SetText(initializer:GetData().text)

    local chip = self.Chip
    chip.Label:SetText(CHIP_TEXT)
    chip:ClearAllPoints()
    chip:SetPoint("TOPLEFT", self.Text, "BOTTOMLEFT", 0, -CHIP_GAP)
    chip:SetSize(math.ceil(chip.Label:GetStringWidth()) + 2 * CHIP_PAD_X, CHIP_HEIGHT)
end

local function metadata(field)
    local get = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
    local value = get and get(ADDON, field)
    if value == "" then return nil end
    return value
end

local function aboutText()
    local lines = {}

    local author = metadata("Author")
    if author then lines[#lines + 1] = L["Author: %s"]:format(author) end

    local website = metadata("X-Website")
    if website then lines[#lines + 1] = L["More: %s"]:format((website:gsub("^%a+://", ""))) end

    local version = metadata("Version")
    if version then lines[#lines + 1] = L["Version: %s"]:format(version) end

    -- Kept in the TOC rather than here so the three flavor TOCs stay the single
    -- source and check-tocs catches any drift between them.
    local copyright = metadata("X-Copyright")
    if copyright then lines[#lines + 1] = "\194\169 " .. copyright end

    return table.concat(lines, "\n")
end

local measure

local function textHeight(text)
    if not measure then
        measure = UIParent:CreateFontString(nil, "ARTWORK", ABOUT_FONT)
        measure:SetJustifyH("LEFT")
        measure:Hide()
    end
    measure:SetText(text)
    return measure:GetStringHeight()
end

local function addAbout()
    if not Settings.CreateElementInitializer then return end

    local text = aboutText()
    if text == "" then return end

    local initializer = Settings.CreateElementInitializer(ABOUT_TEMPLATE, { text = text })
    local extent = math.ceil(textHeight(text)) + CHIP_GAP + CHIP_HEIGHT + ABOUT_BOTTOM_PAD
    initializer.GetExtent = function() return extent end
    layout:AddInitializer(initializer)
end

local function refresh()
    T.Addon.Refresh()
end

local function profileSetting(variableKey, variableType, name, default)
    return Settings.RegisterAddOnSetting(category, ADDON .. "_" .. variableKey, variableKey,
        DB.Profile(), variableType, name, default)
end

function T.SetupOptions()
    if not Settings or not Settings.RegisterVerticalLayoutCategory then return end
    if category then return end

    category, layout = Settings.RegisterVerticalLayoutCategory(L["Favorkeeper"])

    addAbout()

    do
        local setting = profileSetting("grouped", Settings.VarType.Boolean,
            L["Group like the reputation panel"], true)
        setting:SetValueChangedCallback(refresh)
        Settings.CreateCheckbox(category, setting,
            L["Sort the bars under the same headers as Blizzard's reputation panel (expansion, then sub-group). "
                .. "When off, the bars form one alphabetical list."])
    end

    do
        local setting = profileSetting("barText", Settings.VarType.String, L["Bar text"], "level")
        setting:SetValueChangedCallback(refresh)
        Settings.CreateDropdown(category, setting, function()
            local container = Settings.CreateControlTextContainer()
            container:Add("level", L["Level and percent"])
            container:Add("standing", L["Standing and percent"])
            container:Add("values", L["Values and percent"])
            return container:GetData()
        end, L["What the right-hand side of each bar shows. Level is the standing (1 to 8), the renown level "
            .. "or the friendship rank."])
    end

    do
        local setting = profileSetting("barTexture", Settings.VarType.String, L["Bar texture"], "blizzard")
        setting:SetValueChangedCallback(refresh)
        Settings.CreateDropdown(category, setting, function()
            local container = Settings.CreateControlTextContainer()
            for _, t in ipairs(T.Bars.TEXTURES) do container:Add(t.key, L[t.label]) end
            return container:GetData()
        end, L["How the bars are filled, in the bar window and in the faction list."])
    end

    do
        local setting = profileSetting("barHeight", Settings.VarType.Number, L["Bar height"], 16)
        setting:SetValueChangedCallback(refresh)
        Settings.CreateDropdown(category, setting, function()
            local container = Settings.CreateControlTextContainer()
            for _, h in ipairs(T.Bars.HEIGHTS) do
                container:Add(h.value, L["%s (%d px)"]:format(L[h.label], h.value))
            end
            return container:GetData()
        end, L["Height of the bars in the bar window."])
    end

    local toggles = {
        { "showTooltip", L["Show tooltips"], true,
          L["Show standing, progress and paragon details when hovering a bar."] },
        { "showSources", L["Show reputation sources"], true,
          L["Put the first compendium lines into a bar's tooltip. Ctrl-click a bar for the whole entry."] },
        { "learnSources", L["Remember where reputation came from"], true,
          L["Log every reputation gain under the quest or zone it came from, and list it in the compendium."] },
        { "autoTrack", L["Track factions automatically"], false,
          L["Add a faction to the bars as soon as you gain reputation with it."] },
        { "locked", L["Lock window"], false,
          L["Keep the bar window from being dragged."] },
    }
    for _, t in ipairs(toggles) do
        local setting = profileSetting(t[1], Settings.VarType.Boolean, t[2], t[3])
        setting:SetValueChangedCallback(refresh)
        Settings.CreateCheckbox(category, setting, t[4])
    end

    do
        local proxy = { showMinimap = not DB.Profile().minimap.hide }
        local setting = Settings.RegisterAddOnSetting(category, ADDON .. "_showMinimap", "showMinimap",
            proxy, Settings.VarType.Boolean, L["Show minimap button"], true)
        setting:SetValueChangedCallback(function(_, value)
            DB.Profile().minimap.hide = not value
            local LDBIcon = LibStub("LibDBIcon-1.0", true)
            if not LDBIcon then return end
            if value then LDBIcon:Show(ADDON) else LDBIcon:Hide(ADDON) end
        end)
        Settings.CreateCheckbox(category, setting)
    end

    do
        local setting = profileSetting("elvuiSkin", Settings.VarType.Boolean,
            L["Allow ElvUI to skin this addon"], true)
        Settings.CreateCheckbox(category, setting, L["Requires a /reload to take effect."])
    end

    Settings.RegisterAddOnCategory(category)
end

function T.OpenOptions()
    if not category then return end
    Settings.OpenToCategory(category:GetID())
end

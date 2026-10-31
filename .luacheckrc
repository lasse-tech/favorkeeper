-- luacheck configuration. `make lint` fails on any warning.
-- The WoW client runs Lua 5.1; everything below only names the environment the
-- addon runs in, it does not switch any check off.
std = "lua51"
max_line_length = 120
exclude_files = { "Libs/", "dist/", "tests/" }

-- Written by the addon.
globals = {
    "FavorkeeperDB",
    "Favorkeeper_Binding",
    "FavorkeeperAboutMixin",
    "BINDING_CATEGORY_FAVORKEEPER",
    "BINDING_NAME_FAVORKEEPER_TOGGLE_TRACKER",
    "BINDING_NAME_FAVORKEEPER_TOGGLE_FACTIONS",
    "SlashCmdList",
    "UISpecialFrames",
    -- Named frames, created by the addon and looked up again by the ElvUI skin.
    "FavorkeeperTrackerFrame",
    "FavorkeeperFactionListFrame",
    "FavorkeeperCompendiumFrame",
}

-- Provided by the client.
read_globals = {
    "BLUE_FONT_COLOR", "BreakUpLargeNumbers", "C_AddOns", "C_Map", "C_QuestLog", "C_TaskQuest",
    "C_Texture", "C_Timer", "CreateAtlasMarkup", "CreateFrame", "ElvUI", "Enum", "GameTooltip",
    "GetAddOnMetadata", "GetLocale", "GetRealZoneText", "GetRealmName", "GetText", "GetTime",
    "GetZoneText", "IsControlKeyDown", "IsLoggedIn", "IsShiftKeyDown", "LibStub", "Settings",
    "UIParent", "UnitName", "UnitSex", "strjoin", "time", "tinsert", "tostringall", "wipe",
}

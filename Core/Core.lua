local ADDON, T = ...

local L = T.L
local DB = T.DB

_G.BINDING_CATEGORY_FAVORKEEPER            = L["Favorkeeper"]
_G.BINDING_NAME_FAVORKEEPER_TOGGLE_TRACKER  = L["Toggle reputation bars"]
_G.BINDING_NAME_FAVORKEEPER_TOGGLE_FACTIONS = L["Toggle faction list"]

local Favorkeeper = T.Addon

local ICON = "Interface\\AddOns\\Favorkeeper\\Media\\Favorkeeper"

function Favorkeeper.OnInitialize()
    DB.Initialize()

    if T.SetupOptions then T.SetupOptions() end

    local LDB = LibStub("LibDataBroker-1.1", true)
    local LDBIcon = LibStub("LibDBIcon-1.0", true)
    if LDB then
        Favorkeeper.launcher = LDB:NewDataObject(ADDON, {
            type = "launcher",
            text = L["Favorkeeper"],
            icon = ICON,
            OnClick = function(_, button)
                if button == "RightButton" then
                    Favorkeeper.OpenOptions()
                elseif Favorkeeper.ShiftDown() then
                    T.Tracker.Toggle()
                else
                    T.FactionList.Toggle()
                end
            end,
            OnTooltipShow = function(tt)
                tt:AddLine(L["Favorkeeper"])
                tt:AddLine("|cffffff00" .. L["Click"] .. "|r " .. L["Choose factions"], 1, 1, 1)
                tt:AddLine("|cffffff00" .. L["Shift-Click"] .. "|r " .. L["Toggle reputation bars"], 1, 1, 1)
                tt:AddLine("|cffffff00" .. L["Right-Click"] .. "|r " .. L["Options"], 1, 1, 1)
            end,
        })
        if LDBIcon then
            LDBIcon:Register(ADDON, Favorkeeper.launcher, DB.Profile().minimap)
        end
    end

    Favorkeeper.RegisterChatCommand("favor", "HandleSlash")
    Favorkeeper.RegisterChatCommand("favorkeeper", "HandleSlash")
end

function Favorkeeper.OnEnable()
    T.Factions.Scan()
    T.Tracker.Initialize()
    if T.SkinElvUI then T.SkinElvUI() end

    local refresh = function() Favorkeeper.Refresh() end
    Favorkeeper.RegisterEvent("UPDATE_FACTION", refresh)
    Favorkeeper.RegisterEvent("MAJOR_FACTION_RENOWN_LEVEL_CHANGED", refresh)
    Favorkeeper.RegisterEvent("MAJOR_FACTION_UNLOCKED", refresh)
    Favorkeeper.RegisterEvent("QUEST_TURNED_IN", refresh)
    Favorkeeper.RegisterEvent("QUEST_TURNED_IN", function(_, questID)
        if questID then T.Learned.NoteQuestTurnIn(T.Compat.QuestTitle(questID)) end
    end)
    Favorkeeper.RegisterEvent("ZONE_CHANGED_NEW_AREA", function()
        T.WorldQuests.Invalidate()
    end)

    -- Retail names the faction; every flavour prints the chat line.
    Favorkeeper.RegisterEvent("FACTION_STANDING_CHANGED", function(_, factionID)
        T.Factions.AutoTrack(factionID)
    end)
    -- The chat line is the only place every flavour states how much was gained,
    -- so it both tracks the faction and files the gain in the learned log.
    Favorkeeper.RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE", function(_, message)
        if not message then return end
        local name, amount = T.Factions.NameFromChat(message)
        if not name then return end
        T.Factions.AutoTrackByName(name)
        T.Learned.Note(T.Factions.IDByName(name), amount)
    end)

    Favorkeeper.Refresh()
end

function Favorkeeper.HandleSlash(input)
    input = (input or ""):lower():gsub("^%s+", ""):gsub("%s+$", "")
    if input == "config" or input == "options" then
        Favorkeeper.OpenOptions()
    elseif input == "clicks" then
        Favorkeeper.debugClicks = not Favorkeeper.debugClicks
        Favorkeeper.Print("click report: " .. (Favorkeeper.debugClicks and "on" or "off"))
    elseif input == "show" or input == "bars" then
        T.Tracker.Toggle()
    else
        T.FactionList.Toggle()
    end
end

function Favorkeeper.OpenOptions()
    if T.OpenOptions then T.OpenOptions() end
end

-- Expanding headers during a scan fires UPDATE_FACTION for every header, so
-- refreshes are coalesced; a refresh itself never scans except for a tracked
-- faction the last scan did not place.
local refreshPending = false
function Favorkeeper.Refresh()
    if refreshPending then return end
    refreshPending = true
    C_Timer.After(0.1, function()
        refreshPending = false
        Favorkeeper.RefreshNow()
    end)
end

function Favorkeeper.RefreshNow()
    T.Factions.EnsureGroups()
    T.Tracker.Refresh()
    T.FactionList.Refresh()
    T.CompendiumWindow.Refresh()
end

function Favorkeeper_Binding(which)
    if which == "tracker" then
        T.Tracker.Toggle()
    elseif which == "factions" then
        T.FactionList.Toggle()
    end
end

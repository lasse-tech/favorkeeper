local ADDON, T = ...

local function skinFactionList(S)
    local list = _G.FavorkeeperFactionListFrame
    if not list or list.__elvuiSkinned then return end
    list:StripTextures()
    list:SetTemplate("Transparent")
    if _G.FavorkeeperFactionListCloseButton then
        S:HandleCloseButton(_G.FavorkeeperFactionListCloseButton)
    end
    if _G.FavorkeeperFactionListSearchBox then
        S:HandleEditBox(_G.FavorkeeperFactionListSearchBox)
    end
    local bar = _G.FavorkeeperFactionListScrollFrameScrollBar
    if bar and S.HandleScrollBar then
        S:HandleScrollBar(bar)
    end
    list.__elvuiSkinned = true
end

local function skinTracker()
    local tracker = _G.FavorkeeperTrackerFrame
    if not tracker or tracker.__elvuiSkinned then return end
    tracker:StripTextures()
    tracker:SetTemplate("Transparent")
    tracker.__elvuiSkinned = true
end

-- The faction list is created on first use, so this runs again from there;
-- each frame is skinned once.
function T.SkinElvUI()
    if T.ApplyElvUISkin then return T.ApplyElvUISkin() end
    if not _G.ElvUI then return end
    if not T.DB.Profile().elvuiSkin then return end

    local ok, E = pcall(function() return unpack(_G.ElvUI) end)
    if not ok or not E then return end
    local S = E:GetModule("Skins", true)
    if not S then return end

    local function skin()
        if not E.private or not E.private.skins or not E.private.skins.misc
           or not E.private.skins.misc.enable then
            return
        end
        skinTracker()
        skinFactionList(S)
    end

    T.ApplyElvUISkin = skin

    local EP = LibStub("LibElvUIPlugin-1.0", true)
    if EP then
        EP:RegisterPlugin(ADDON, skin)
    else
        skin()
    end
end

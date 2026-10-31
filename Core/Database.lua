local _, T = ...

T.dbDefaults = {
    profile = {
        grouped     = true,
        barText     = "level",
        barTexture  = "blizzard",
        barHeight   = 16,
        showTooltip = true,
        showSources = true,
        autoTrack   = false,
        learnSources = true,
        locked      = false,
        elvuiSkin   = true,
        minimap     = { hide = false },
        tracker     = { point = "TOPLEFT", relPoint = "TOPLEFT", x = 16, y = -220, shown = true },
    },
    char = {
        -- factionID -> true
        tracked  = {},
        -- group key -> true, for the tracker and the faction list separately
        fold     = {},
        listFold = {},
        -- factionID -> { name, top, sub, order }, from the last full scan. It
        -- keeps a tracked faction in its group while Blizzard hides it from the
        -- list (legacy reputations, account/character filter).
        groups   = {},
    },
}

local DB = {}
T.DB = DB

local function copyDefaults(target, defaults)
    for key, value in pairs(defaults) do
        if type(value) == "table" then
            if type(target[key]) ~= "table" then target[key] = {} end
            copyDefaults(target[key], value)
        elseif target[key] == nil then
            target[key] = value
        end
    end
end

function DB.Initialize()
    local sv = _G.FavorkeeperDB
    if type(sv) ~= "table" then
        sv = {}
        _G.FavorkeeperDB = sv
    end

    local charKey = (UnitName("player") or "?") .. " - " .. (GetRealmName() or "?")

    sv.profileKeys = sv.profileKeys or {}
    local profileKey = sv.profileKeys[charKey] or "Default"
    sv.profileKeys[charKey] = profileKey

    sv.profiles = sv.profiles or {}
    sv.profiles[profileKey] = sv.profiles[profileKey] or {}
    sv.char = sv.char or {}
    -- factionID -> key -> { kind, label, amount, count, last }, shared by every
    -- character on the account: reputation sources do not differ per character.
    sv.learned = sv.learned or {}
    sv.char[charKey] = sv.char[charKey] or {}

    local db = {
        profile = sv.profiles[profileKey],
        char    = sv.char[charKey],
        learned = sv.learned,
    }
    copyDefaults(db.profile, T.dbDefaults.profile)
    copyDefaults(db.char, T.dbDefaults.char)

    T.Addon.db = db
    return db
end

function DB.Profile() return T.Addon.db.profile end
function DB.Learned() return T.Addon.db.learned end
function DB.Char()    return T.Addon.db.char end

function DB.IsTracked(factionID) return DB.Char().tracked[factionID] == true end

function DB.SetTracked(factionID, tracked)
    DB.Char().tracked[factionID] = tracked and true or nil
end

function DB.TrackedIDs()
    local ids = {}
    for id in pairs(DB.Char().tracked) do ids[#ids + 1] = id end
    return ids
end

function DB.Group(factionID) return DB.Char().groups[factionID] end

function DB.IsFolded(key)      return DB.Char().fold[key] == true end
function DB.IsListFolded(key)  return DB.Char().listFold[key] == true end

function DB.ToggleFold(key)
    local fold = DB.Char().fold
    fold[key] = (not fold[key]) or nil
end

function DB.ToggleListFold(key)
    local fold = DB.Char().listFold
    fold[key] = (not fold[key]) or nil
end

function DB.TrackerPos() return DB.Profile().tracker end
function DB.TrackerShown() return DB.Profile().tracker.shown ~= false end
function DB.SetTrackerShown(shown)
    DB.Profile().tracker.shown = shown and true or false
end
function DB.SaveTrackerPos(point, relPoint, x, y)
    local t = DB.Profile().tracker
    t.point, t.relPoint, t.x, t.y = point, relPoint, x, y
end

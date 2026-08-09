--[[
    misaki - loader
    https://github.com/hahaahahahhahahahah/misaki-hub

    Usage:
    loadstring(game:HttpGet("https://github.com/hahaahahahhahahahah/misaki-hub/raw/main/loader.lua", true))()
]]

local BASE_URL = "https://github.com/hahaahahahhahahahah/misaki-hub/raw/main"

-- ---------------------------------------------------------------------------
-- 1. Assets
-- ---------------------------------------------------------------------------
local Folders = {
    "assets",
    "assets/images",
    "assets/sounds",
}

local Assets = {
    ["assets/images/logo.png"]          = "assets/images/logo.png",
    ["assets/sounds/12.mp3"]            = "assets/sounds/12.mp3",
    ["assets/sounds/agpa2.mp3"]         = "assets/sounds/agpa2.mp3",
    ["assets/sounds/basshit.mp3"]       = "assets/sounds/basshit.mp3",
    ["assets/sounds/bell.mp3"]          = "assets/sounds/bell.mp3",
    ["assets/sounds/blizzard.mp3"]      = "assets/sounds/blizzard.mp3",
    ["assets/sounds/bubble.mp3"]        = "assets/sounds/bubble.mp3",
    ["assets/sounds/chockpro.mp3"]      = "assets/sounds/chockpro.mp3",
    ["assets/sounds/cod.mp3"]           = "assets/sounds/cod.mp3",
    ["assets/sounds/copperbell.mp3"]    = "assets/sounds/copperbell.mp3",
    ["assets/sounds/crowbar.mp3"]       = "assets/sounds/crowbar.mp3",
    ["assets/sounds/headshot.mp3"]      = "assets/sounds/headshot.mp3",
    ["assets/sounds/knob.mp3"]          = "assets/sounds/knob.mp3",
    ["assets/sounds/minecraft orb.mp3"] = "assets/sounds/minecraft%20orb.mp3",
    ["assets/sounds/neverlose.mp3"]     = "assets/sounds/neverlose.mp3",
    ["assets/sounds/rust.mp3"]          = "assets/sounds/rust.mp3",
    ["assets/sounds/skeet.mp3"]         = "assets/sounds/skeet.mp3",
    ["assets/skyboxes.json"]            = "assets/skyboxes.json",
}

-- ---------------------------------------------------------------------------
-- 2. Create folders
-- ---------------------------------------------------------------------------
for _, folder in Folders do
    if not isfolder(folder) then
        makefolder(folder)
    end
end

-- ---------------------------------------------------------------------------
-- 3. Load library
-- ---------------------------------------------------------------------------
local Library = loadstring(game:HttpGet(BASE_URL .. "/library/Library.lua", true))()

local logoPath = "assets/images/logo.png"
local logoImage = isfile(logoPath) and getcustomasset(logoPath) or ""

local Popup = Library:LoadingPopup({
    Logo = logoImage,
    Status = "Initializing...",
})

-- ---------------------------------------------------------------------------
-- 4. Download missing assets
-- ---------------------------------------------------------------------------
local AssetKeys = {}
for key in Assets do
    table.insert(AssetKeys, key)
end

local TotalAssets = #AssetKeys
local FailedAssets = {}

for index, localPath in AssetKeys do
    if not isfile(localPath) then
        local shortName = string.match(localPath, "[^/]+$") or localPath
        Popup:SetStatus("Downloading " .. shortName)
        Popup:SetProgress(index / TotalAssets)

        local ok, data = pcall(game.HttpGet, game, BASE_URL .. "/" .. Assets[localPath], true)
        if ok and type(data) == "string" then
            writefile(localPath, data)
        else
            table.insert(FailedAssets, localPath)
        end
    else
        Popup:SetProgress(index / TotalAssets)
    end
end

Popup:SetProgress(1)

if #FailedAssets > 0 then
    Library:Notification("Download Failed", "Could not download: " .. table.concat(FailedAssets, ", "), 8)
end

-- ---------------------------------------------------------------------------
-- 5. Executor capability check
-- ---------------------------------------------------------------------------
Popup:SetStatus("Checking compatibility...")

local RequiredFunctions = {
    "hookfunction",
    "newcclosure",
    "mouse1click",
    "Drawing",
}

local MissingFunctions = {}
local Environment = getgenv and getgenv() or getfenv()
for _, name in RequiredFunctions do
    local Value = Environment[name] or getfenv()[name]
    local valueType = typeof(Value)
    if valueType ~= "function" and valueType ~= "table" then
        table.insert(MissingFunctions, name)
    end
end

if #MissingFunctions > 0 then
    Popup:Dismiss()
    Library:Notification("Incompatible Executor", "Missing: " .. table.concat(MissingFunctions, ", "), 10)
    warn("[misaki] Executor is missing critical functions: " .. table.concat(MissingFunctions, ", "))
    return
end

-- ---------------------------------------------------------------------------
-- 6. Load game script
-- ---------------------------------------------------------------------------
Popup:SetStatus("Loading game script...")

local success, result = pcall(function()
    return loadstring(game:HttpGet(string.format("%s/games/%s.lua", BASE_URL, game.PlaceId), true))
end)

if success and type(result) == "function" then
    Popup:SetStatus("Starting...")
    task.wait(0.3)
    Popup:Dismiss()
    result()
else
    Popup:Dismiss()
    Library:Notification("Failed to load", "Game may not be supported, check the GitHub for supported games!", 5)
end

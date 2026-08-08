--[[
    misaki - LOCAL loader (auto-installation)
    -------------------------------------------------------------
    Installe tout automatiquement dans le workspace de ton executor :
      - telecharge library/Library.lua + games/<placeid>.lua depuis le repo
      - telecharge les assets (sons, images, skybox) si absents
      - puis lance le script

    UTILISATION :
      1) Copie ce fichier dans le workspace de ton executor (une seule fois)
      2) Execute dans ton executor :  loadstring(readfile("local_loader.lua"))()
      (Tu peux aussi copier-coller directement le contenu de ce fichier dans l'executor.)
]]

-- 1) Quartz : polyfill de compatibilite executor (optionnel, ignore si HS)
local QuartzOk, Quartz = pcall(function()
    return loadstring(game:HttpGet("https://github.com/notpoiu/Quartz/releases/latest/download/Quartz.luau"))()
end)
if QuartzOk and Quartz then
    local Tester = Quartz.new({ Timeout = 5, AllowFFlagPolyfills = true })
    Tester:TestAll()
    Tester:PatchEnvironment()
end

local BASE_URL = "https://github.com/hahaahahahhahahahah/misaki-hub/raw/main"

-- Dossiers requis
local Folders = { "library", "games", "assets", "assets/images", "assets/txts", "assets/sounds" }
for _, folder in ipairs(Folders) do
    if not isfolder(folder) then
        pcall(makefolder, folder)
    end
end

-- Telecharge un fichier du repo si absent du workspace
local function downloadFile(remotePath, localPath)
    if isfile(localPath) then
        return true
    end
    local ok, data = pcall(game.HttpGet, game, BASE_URL .. "/" .. remotePath, true)
    if ok and type(data) == "string" then
        pcall(writefile, localPath, data)
        return true
    end
    return false
end

-- 2) Library
downloadFile("library/Library.lua", "library/Library.lua")

-- 3) Script du jeu
local GameFile = "games/" .. game.PlaceId .. ".lua"
if not isfile(GameFile) then
    downloadFile("games/" .. game.PlaceId .. ".lua", GameFile)
end

if not isfile(GameFile) then
    warn("[misaki] Impossible de telecharger " .. GameFile .. " - verifie ta connexion.")
    return
end

-- 4) Assets (sons, images, skybox) : telecharges si absents
local Assets = {
    ["assets/images/paw.png"]           = "assets/images/paw.png",
    ["assets/images/welcome.png"]       = "assets/images/welcome.png",
    ["assets/txts/welcome.txt"]         = "assets/txts/welcome.txt",
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

local MissingAssets = {}
for localPath, remotePath in pairs(Assets) do
    if not isfile(localPath) then
        local ok, data = pcall(game.HttpGet, game, BASE_URL .. "/" .. remotePath, true)
        if ok and type(data) == "string" then
            pcall(writefile, localPath, data)
        else
            table.insert(MissingAssets, localPath)
        end
    end
end
if #MissingAssets > 0 then
    warn("[misaki] Assets introuvables (logo/sons manquants) : " .. table.concat(MissingAssets, ", "))
end

-- 5) Pre-charge la Library locale et l'expose au script de jeu
if isfile("library/Library.lua") then
    local Library = loadstring(readfile("library/Library.lua"))()
    if getgenv then
        getgenv().MisakiLibrary = Library
    end
else
    warn("[misaki] library/Library.lua introuvable apres installation.")
    return
end

-- 6) Lance le script de jeu
local success, result = pcall(function()
    return loadstring(readfile(GameFile))
end)
if success and type(result) == "function" then
    result()
else
    warn("[misaki] Echec du chargement de " .. GameFile .. " (place non supportee localement ?)")
end

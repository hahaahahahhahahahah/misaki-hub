--[[
    misaki - LOCAL loader v2 (auto-installation)
    -------------------------------------------------------------
    Installe TOUT automatiquement dans le workspace de ton executor :
      - telecharge library/Library.lua + games/<placeid>.lua depuis le repo original
      - applique le rebranding misaki (watermark, noms de dossiers, Library locale)
      - telecharge les assets (sons, images, skybox) si absents
      - puis lance le script modifie

    UTILISATION :
      1) Copie ce fichier dans le workspace de ton executor (une seule fois)
      2) Execute dans ton executor :  loadstring(readfile("local_loader.lua"))()
      (Tu peux aussi copier-coller directement le contenu de ce fichier dans l'executor.)

    NB : le fichier games/<placeid>.lua du workspace est re-patche a chaque
    lancement (operation idempotente) : meme un original devient misaki.
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
local Folders = { "library", "games", "catnip", "catnip/images", "catnip/txts", "catnip/sounds" }
for _, folder in ipairs(Folders) do
    if not isfolder(folder) then
        pcall(makefolder, folder)
    end
end

-- Telecharge un fichier du repo original si absent du workspace
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

-- Remplacement de texte simple (recherche litterale, pas de motif regex)
local function plainReplace(s, old, new)
    local idx = s:find(old, 1, true)
    if idx then
        return s:sub(1, idx - 1) .. new .. s:sub(idx + #old), true
    end
    return s, false
end

-- 2) Library (pas de branding visible dans son code -> version originale OK)
downloadFile("library/Library.lua", "library/Library.lua")

-- 3) Script du jeu : telechargement si absent, puis patch misaki (idempotent)
local GameFile = "games/" .. game.PlaceId .. ".lua"
if not isfile(GameFile) then
    downloadFile("games/" .. game.PlaceId .. ".lua", GameFile)
end

if not isfile(GameFile) then
    warn("[misaki] Impossible de telecharger " .. GameFile .. " - verifie ta connexion.")
    return
end

local changed = false
local function apply(source, old, new)
    local s, c = plainReplace(source, old, new)
    if c then
        changed = true
    end
    return s
end

local patched = readfile(GameFile)
patched = apply(patched,
    'Watermark:SetText(string.format("catnip | Prison Life | %d FPS | %dms | gg/DPBtncwaEm"',
    'Watermark:SetText(string.format("misaki | Prison Life | %d FPS | %dms"')
patched = apply(patched, '"catnipItemChams"', '"misakiItemChams"')
patched = apply(patched, '"catnipChams"', '"misakiChams"')
patched = apply(patched, '"catnipC4ESP"', '"misakiC4ESP"')
patched = apply(patched, '"catnipDoorStorage"', '"misakiDoorStorage"')
patched = apply(patched, '"catnipSky"', '"misakiSky"')
patched = apply(patched,
    'local Library = loadstring(game:HttpGet("https://github.com/hahaahahahhahahahah/misaki-hub/raw/main/library/Library.lua"))()',
    'local Library = (getgenv and getgenv().MisakiLibrary) or loadstring(game:HttpGet("https://github.com/hahaahahahhahahahah/misaki-hub/raw/main/library/Library.lua"))()')

if changed then
    pcall(writefile, GameFile, patched)
end

-- 4) Assets (sons, images, skybox) : telecharges si absents
local Assets = {
    ["catnip/images/paw.png"]          = "catnip/images/paw.png",
    ["catnip/images/W AZULA.png"]      = "catnip/images/W%20AZULA.png",
    ["catnip/txts/W AZULA.txt"]        = "catnip/txts/W%20AZULA.txt",
    ["catnip/sounds/12.mp3"]           = "catnip/sounds/12.mp3",
    ["catnip/sounds/agpa2.mp3"]        = "catnip/sounds/agpa2.mp3",
    ["catnip/sounds/basshit.mp3"]      = "catnip/sounds/basshit.mp3",
    ["catnip/sounds/bell.mp3"]         = "catnip/sounds/bell.mp3",
    ["catnip/sounds/blizzard.mp3"]     = "catnip/sounds/blizzard.mp3",
    ["catnip/sounds/bubble.mp3"]       = "catnip/sounds/bubble.mp3",
    ["catnip/sounds/chockpro.mp3"]     = "catnip/sounds/chockpro.mp3",
    ["catnip/sounds/cod.mp3"]          = "catnip/sounds/cod.mp3",
    ["catnip/sounds/copperbell.mp3"]   = "catnip/sounds/copperbell.mp3",
    ["catnip/sounds/crowbar.mp3"]      = "catnip/sounds/crowbar.mp3",
    ["catnip/sounds/headshot.mp3"]     = "catnip/sounds/headshot.mp3",
    ["catnip/sounds/knob.mp3"]         = "catnip/sounds/knob.mp3",
    ["catnip/sounds/minecraft orb.mp3"] = "catnip/sounds/minecraft%20orb.mp3",
    ["catnip/sounds/neverlose.mp3"]    = "catnip/sounds/neverlose.mp3",
    ["catnip/sounds/rust.mp3"]         = "catnip/sounds/rust.mp3",
    ["catnip/sounds/skeet.mp3"]        = "catnip/sounds/skeet.mp3",
    ["catnip/skyboxes.json"]           = "catnip/skyboxes.json",
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

-- 6) Lance le script de jeu patche
local success, result = pcall(function()
    return loadstring(readfile(GameFile))
end)
if success and type(result) == "function" then
    result()
else
    warn("[misaki] Echec du chargement de " .. GameFile .. " (place non supportee localement ?)")
end

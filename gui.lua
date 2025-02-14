local repo = 'https://raw.githubusercontent.com/goatgamer99/library/refs/heads/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = '',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.4
})

local function animateTitle()
    local animatedText = "snowfall.victim"
    local staticText = " - Tha Bronx 2 / Semi Universal"
    for i = 1, #animatedText do
        Window:SetTitle(animatedText:sub(1, i) .. staticText)
        wait(1)
    end
end

spawn(function()
    animateTitle()
end)

getgenv().LegitTab = Window:AddTab('Legit')
getgenv().SemiLegitTab = Window:AddTab('Semi Legit')
getgenv().RageTab = Window:AddTab('Rage')
getgenv().VisualTab = Window:AddTab('Visuals')
getgenv().ExploitsTab = Window:AddTab('Game Hacks')
getgenv().MiscTab = Window:AddTab('Misc')

local MiscellaneousGroup = getgenv().MiscTab:AddRightGroupbox('Miscellaneous')

MiscellaneousGroup:AddButton("Unload", function()
    Library:Unload()
end)

MiscellaneousGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
    Default = "End",
    NoUI = true,
    Text = "Menu keybind"
})
Library.ToggleKeybind = Options.MenuKeybind

Library:OnUnload(function()
    Library.Unloaded = true
end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('snowfall')
SaveManager:SetFolder('snowfall/thabronx')
SaveManager:BuildConfigSection(getgenv().MiscTab)
ThemeManager:ApplyToTab(getgenv().MiscTab)
SaveManager:LoadAutoloadConfig()

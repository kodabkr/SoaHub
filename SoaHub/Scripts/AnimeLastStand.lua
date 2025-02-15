local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Soa Hub | Anime Last Stand",
   Icon = "fan",
   LoadingTitle = "Soa Hub",
   LoadingSubtitle = "Credits: Koda (Scripting)",
   Theme = "Default", -- https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SoaHubConfigs",
      FileName = "AnimeLastStand"
   },

   Discord = {
      Enabled = true,
      Invite = "rdpjRDNDHU",
      RememberJoins = true
   },

   KeySystem = false,

   KeySettings = {
      Title = nil,
      Subtitle = nil,
      Note = nil,
      FileName = nil,
      SaveKey = nil,
      GrabKeyFromSite = nil,
      Key = nil
   }
})

-- All functionality below this comment

local automationTab = Window:CreateTab("Automation", "braces")
local automationDivider = automationTab:CreateDivider()

function placeTowers()
    local towerArgs = {
        { "Goku_BlackEvo", CFrame.new(-33.796119689941406, 58.517337799072266, -177.6112060546875, 1, 0, 0, 0, 1, 0, 0, 0, 1) },
        { "Giorno_GER", CFrame.new(-48.266937255859375, 55.35637664794922, -169.7427978515625, 1, 0, 0, 0, 1, 0, 0, 0, 1) },
        { "JinMoriGodly", CFrame.new(-41.741661071777344, 55.35637664794922, -169.35519409179688, 1, 0, 0, 0, 1, 0, 0, 0, 1) },
        { "Yoo Jinho", CFrame.new(-39.055198669433594, 55.706390380859375, -158.9326934814453, 1, 0, 0, 0, 1, 0, 0, 0, 1) },
        { "AiHoshinoEvo", CFrame.new(-47.070289611816406, 55.37251281738281, -154.1069793701172, 1, 0, 0, 0, 1, 0, 0, 0, 1) },
        { "Makima", CFrame.new(-47.190277099609375, 55.35637664794922, -175.9259796142578, 1, 0, 0, 0, 1, 0, 0, 0, 1) },
    }

    for _, args in ipairs(towerArgs) do
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceTower"):FireServer(unpack(args))
    end

    local upgradeArgs = {
        "AiHoshinoEvo",
        "Goku_BlackEvo",
        "Giorno_GER",
        "JinMoriGodly",
        "Yoo Jinho",
        "Makima"
    }

    local args = {
        [1] = "Makima",
        [2] = CFrame.new(-47.190277099609375, 55.35637664794922, -175.9259796142578, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceTower"):FireServer(unpack(args))
        
    for _, towerName in ipairs(upgradeArgs) do
        local tower = workspace:FindFirstChild("Towers") and workspace.Towers:FindFirstChild(towerName)
        if tower then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UnitManager"):WaitForChild("SetAutoUpgrade"):FireServer(tower, true)
        end
    end
end

function autoDoRifts()
    local riftPath = workspace.Map.Rifts
    while isAutoRiftRunning and task.wait(.1) do
        for _, v in pairs(riftPath:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                fireproximityprompt(v)
            end
        end
    end
end

function autoCollectEnergy()
    local energyPath = workspace.Collectibles.ClientModels
    while isAutoEnergyRunning and task.wait(.2) do
        for _, v in pairs(energyPath:GetChildren()) do
            if v.Name == "Energy" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Position = v.Position 
            end
        end
    end
end

local autoPlaceToggle = automationTab:CreateToggle({
    Name = "Auto Place",
    CurrentValue = false,
    Flag = "AutoPlaceUnits",
    Callback = function(Value)
        isAutoRunning = Value
        if isAutoRunning then
            coroutine.wrap(function()
                while isAutoRunning and task.wait(2) do
                    placeTowers()
                end
            end)()
        end
    end,
})

local autoRiftToggle = automationTab:CreateToggle({
    Name = "Auto Do Rifts",
    CurrentValue = false,
    Flag = "AutoDoRifts",
    Callback = function(Value)
        isAutoRiftRunning = Value
        if isAutoRiftRunning then
            coroutine.wrap(autoDoRifts)()
        end
    end,
})

local autoEnergyToggle = automationTab:CreateToggle({
    Name = "Auto Collect Energy",
    CurrentValue = false,
    Flag = "AutoCollectEnergy",
    Callback = function(Value)
        isAutoEnergyRunning = Value
        if isAutoEnergyRunning then
            coroutine.wrap(autoCollectEnergy)()
        end
    end,
})

Rayfield:LoadConfiguration()
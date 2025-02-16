local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Soa Hub | Anime Last Stand",
    Icon = "fan",
    LoadingTitle = "Soa Hub",
    LoadingSubtitle = "Credits: Koda (Scripting)",
    Theme = "Default",
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

--[[
    Version Rules: major, minor, patch
    Major: Major changes, breaking changes
        Example: Changing the entire UI system, changing the entire script, etc.
    Minor: New features, improvements
        Example: Adding a new tab, adding a new feature, etc.
    Patch: Bug fixes, small changes
        Example: Fixing a bug, changing a small feature, etc.
]]--

Rayfield:Notify({
    Title = "Welcome to Soa Hub",
    Content = "Version: 1.0.1",
    Duration = 3,
    Image = 4483362458,
})

-- UI Tab Creation
local automationTab = Window:CreateTab("Automation", "braces")
local automationDivider = automationTab:CreateDivider()
local configTab = Window:CreateTab("Configuration", "cog")
local configDivider = configTab:CreateDivider()
local eventTab = Window:CreateTab("Event", "clock")
local eventDivider = eventTab:CreateDivider()
local extrasTab = Window:CreateTab("Extras", "star")
local extrasDivider = extrasTab:CreateDivider()
local units = {}

-- Persistent Data
local persistentData = {
    unitPositions = {},
    autoPlaceUnit1 = false,
    autoPlaceUnit2 = false,
    autoPlaceUnit3 = false,
    autoPlaceUnit4 = false,
    autoPlaceUnit5 = false,
    autoPlaceUnit6 = false
}

local configFolderName = "SoaHubConfigs"
local configFileName = "AnimeLastStand_Data"
local configExtension = ".json"

local HttpService = game:GetService("HttpService")

-- Functions
local function saveData()
    local serializableData = {
        unitPositions = {},
        autoPlaceUnit1 = persistentData.autoPlaceUnit1,
        autoPlaceUnit2 = persistentData.autoPlaceUnit2,
        autoPlaceUnit3 = persistentData.autoPlaceUnit3,
        autoPlaceUnit4 = persistentData.autoPlaceUnit4,
        autoPlaceUnit5 = persistentData.autoPlaceUnit5,
        autoPlaceUnit6 = persistentData.autoPlaceUnit6
    }
    for i, pos in ipairs(persistentData.unitPositions) do
        if pos then
            serializableData.unitPositions[i] = {X = pos.X, Y = pos.Y, Z = pos.Z}
        else
            serializableData.unitPositions[i] = nil
        end
    end

    local success, encodedData = pcall(function()
        return HttpService:JSONEncode(serializableData)
    end)

    if success then
        if writefile then
            local folderPath = configFolderName
            local filePath = folderPath .. "/" .. configFileName .. configExtension

            if not isfolder(folderPath) then
                makefolder(folderPath)
            end

            local writeSuccess, writeError = pcall(function()
                writefile(filePath, encodedData)
            end)

            if not writeSuccess then
                Rayfield:Notify({Title = "Save Error", Content = "Failed to save configuration data.", Image = 4400704299})
            else
                Rayfield:Notify({Title = "Saved Data", Content = "Configuration data was saved properly.", Image = 4400704299})
            end
        else
            Rayfield:Notify({Title = "Save Error", Content = "File saving not supported in this environment.", Image = 4400704299})
        end
    else
        Rayfield:Notify({Title = "Save Error", Content = "Failed to prepare configuration data for saving.", Image = 4400704299})
    end
end

local waitForMouseClick = function()
    local userInputService = game:GetService("UserInputService")
    local mouse = game.Players.LocalPlayer:GetMouse()
    local input = userInputService.InputBegan:Wait()
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local clickedPosition = mouse.Hit.Position
        clickedPosition = Vector3.new(clickedPosition.X, clickedPosition.Y + 1, clickedPosition.Z)
        return clickedPosition
    end
end

local unitLabel1 = configTab:CreateLabel("Unit 1: Not Set", 4483362458, Color3.fromRGB(255, 255, 255), false)

local unitPosButton1 = configTab:CreateButton({
    Name = "Set Unit 1 Position",
    Callback = function()
        local position = waitForMouseClick()
        if position then
            persistentData.unitPositions[1] = position
            unitLabel1:Set("Unit 1: " .. tostring(position), 4483362458, Color3.fromRGB(255, 255, 255), false)
            saveData()
            Rayfield:Notify({
                Title = "Position Indicator",
                Content = "Unit 1 Position Set to: " .. tostring(position),
                Duration = 3,
                Image = 4483362458,
            })
        end
    end,
})

local unit1Toggle = configTab:CreateToggle({
    Name = "Auto Place Unit 1",
    CurrentValue = persistentData.autoPlaceUnit1,
    Flag = "AutoPlaceUnit1",
    Callback = function(Value)
        persistentData.autoPlaceUnit1 = Value
        saveData()
    end,
})

local unitsDivider1 = configTab:CreateDivider()

local unitLabel2 = configTab:CreateLabel("Unit 2: Not Set", 4483362458, Color3.fromRGB(255, 255, 255), false)
local unitPosButton2 = configTab:CreateButton({
    Name = "Set Unit 2 Position",
    Callback = function()
        local position = waitForMouseClick()
        if position then
            persistentData.unitPositions[2] = position
            unitLabel2:Set("Unit 2: " .. tostring(position), 4483362458, Color3.fromRGB(255, 255, 255), false)
            saveData()
            Rayfield:Notify({
                Title = "Position Indicator",
                Content = "Unit 2 Position Set to: " .. tostring(position),
                Duration = 3,
                Image = 4483362458,
            })
        end
    end,
})

local unit2Toggle = configTab:CreateToggle({
    Name = "Auto Place Unit 2",
    CurrentValue = persistentData.autoPlaceUnit2,
    Flag = "AutoPlaceUnit2",
    Callback = function(Value)
        persistentData.autoPlaceUnit2 = Value
        saveData()
    end,
})

local unitsDivider2 = configTab:CreateDivider()

local unitLabel3 = configTab:CreateLabel("Unit 3: Not Set", 4483362458, Color3.fromRGB(255, 255, 255), false)
local unitPosButton3 = configTab:CreateButton({
    Name = "Set Unit 3 Position",
    Callback = function()
        local position = waitForMouseClick()
        if position then
            persistentData.unitPositions[3] = position
            unitLabel3:Set("Unit 3: " .. tostring(position), 4483362458, Color3.fromRGB(255, 255, 255), false)
            saveData()
            Rayfield:Notify({
                Title = "Position Indicator",
                Content = "Unit 3 Position Set to: " .. tostring(position),
                Duration = 3,
                Image = 4483362458,
            })
        end
    end,
})

local unit3Toggle = configTab:CreateToggle({
    Name = "Auto Place Unit 3",
    CurrentValue = persistentData.autoPlaceUnit3,
    Flag = "AutoPlaceUnit3",
    Callback = function(Value)
        persistentData.autoPlaceUnit3 = Value
        saveData()
    end,
})

local unitsDivider3 = configTab:CreateDivider()

local unitLabel4 = configTab:CreateLabel("Unit 4: Not Set", 4483362458, Color3.fromRGB(255, 255, 255), false)
local unitPosButton4 = configTab:CreateButton({
    Name = "Set Unit 4 Position",
    Callback = function()
        local position = waitForMouseClick()
        if position then
            persistentData.unitPositions[4] = position
            unitLabel4:Set("Unit 4: " .. tostring(position), 4483362458, Color3.fromRGB(255, 255, 255), false)
            saveData()
            Rayfield:Notify({
                Title = "Position Indicator",
                Content = "Unit 4 Position Set to: " .. tostring(position),
                Duration = 3,
                Image = 4483362458,
            })
        end
    end,
})

local unit4Toggle = configTab:CreateToggle({
    Name = "Auto Place Unit 4",
    CurrentValue = persistentData.autoPlaceUnit4,
    Flag = "AutoPlaceUnit4",
    Callback = function(Value)
        persistentData.autoPlaceUnit4 = Value
        saveData()
    end,
})

local unitsDivider4 = configTab:CreateDivider()

local unitLabel5 = configTab:CreateLabel("Unit 5: Not Set", 4483362458, Color3.fromRGB(255, 255, 255), false)
local unitPosButton5 = configTab:CreateButton({
    Name = "Set Unit 5 Position",
    Callback = function()
        local position = waitForMouseClick()
        if position then
            persistentData.unitPositions[5] = position
            unitLabel5:Set("Unit 5: " .. tostring(position), 4483362458, Color3.fromRGB(255, 255, 255), false)
            saveData()
            Rayfield:Notify({
                Title = "Position Indicator",
                Content = "Unit 5 Position Set to: " .. tostring(position),
                Duration = 3,
                Image = 4483362458,
            })
        end
    end,
})

local unit5Toggle = configTab:CreateToggle({
    Name = "Auto Place Unit 5",
    CurrentValue = persistentData.autoPlaceUnit5,
    Flag = "AutoPlaceUnit5",
    Callback = function(Value)
        persistentData.autoPlaceUnit5 = Value
        saveData()
    end,
})

local unitsDivider5 = configTab:CreateDivider()

local unitLabel6 = configTab:CreateLabel("Unit 6: Not Set", 4483362458, Color3.fromRGB(255, 255, 255), false)
local unitPosButton6 = configTab:CreateButton({
    Name = "Set Unit 6 Position",
    Callback = function()
        local position = waitForMouseClick()
        if position then
            persistentData.unitPositions[6] = position
            unitLabel6:Set("Unit 6: " .. tostring(position), 4483362458, Color3.fromRGB(255, 255, 255), false)
            saveData()
            Rayfield:Notify({
                Title = "Position Indicator",
                Content = "Unit 6 Position Set to: " .. tostring(position),
                Duration = 3,
                Image = 4483362458,
            })
        end
    end,
})

local unit6Toggle = configTab:CreateToggle({
    Name = "Auto Place Unit 6",
    CurrentValue = persistentData.autoPlaceUnit6,
    Flag = "AutoPlaceUnit6",
    Callback = function(Value)
        persistentData.autoPlaceUnit6 = Value
        saveData()
    end,
})

local unitsDivider6 = configTab:CreateDivider()

local function updateUnitLabels()
    unitLabel1:Set("Unit 1: " .. tostring(persistentData.unitPositions[1] or "Not Set"), 4483362458, Color3.fromRGB(255, 255, 255), false)
    unitLabel2:Set("Unit 2: " .. tostring(persistentData.unitPositions[2] or "Not Set"), 4483362458, Color3.fromRGB(255, 255, 255), false)
    unitLabel3:Set("Unit 3: " .. tostring(persistentData.unitPositions[3] or "Not Set"), 4483362458, Color3.fromRGB(255, 255, 255), false)
    unitLabel4:Set("Unit 4: " .. tostring(persistentData.unitPositions[4] or "Not Set"), 4483362458, Color3.fromRGB(255, 255, 255), false)
    unitLabel5:Set("Unit 5: " .. tostring(persistentData.unitPositions[5] or "Not Set"), 4483362458, Color3.fromRGB(255, 255, 255), false)
    unitLabel6:Set("Unit 6: " .. tostring(persistentData.unitPositions[6] or "Not Set"), 4483362458, Color3.fromRGB(255, 255, 255), false)
end

local function loadData()
    if not isfile then
        warn("isfile function is not available. Cannot load configuration.")
        Rayfield:Notify({Title = "Load Error", Content = "File loading not supported in this environment.", Image = 4400704299})
        return
    end

    local folderPath = configFolderName
    local filePath = folderPath .. "/" .. configFileName .. configExtension

    if isfile(filePath) then
        local success, fileContent = pcall(function()
            return readfile(filePath)
        end)

        if success then
            local decodeSuccess, decodedData = pcall(function()
                return HttpService:JSONDecode(fileContent)
            end)

            if decodeSuccess then
                if decodedData then
                    if decodedData.unitPositions then
                        persistentData.unitPositions = {}
                        for i, posTable in ipairs(decodedData.unitPositions) do
                            if posTable then
                                persistentData.unitPositions[i] = Vector3.new(posTable.X, posTable.Y, posTable.Z)
                            else
                                persistentData.unitPositions[i] = nil
                            end
                        end
                    end
                    persistentData.autoPlaceUnit1 = decodedData.autoPlaceUnit1 or false
                    persistentData.autoPlaceUnit2 = decodedData.autoPlaceUnit2 or false
                    persistentData.autoPlaceUnit3 = decodedData.autoPlaceUnit3 or false
                    persistentData.autoPlaceUnit4 = decodedData.autoPlaceUnit4 or false
                    persistentData.autoPlaceUnit5 = decodedData.autoPlaceUnit5 or false
                    persistentData.autoPlaceUnit6 = decodedData.autoPlaceUnit6 or false
                    updateUnitLabels()
                end
            else
                Rayfield:Notify({Title = "Load Error", Content = "Configuration file is corrupted or invalid.", Image = 4400704299})
            end
        else
            Rayfield:Notify({Title = "Load Error", Content = "Failed to read configuration file.", Image = 4400704299})
        end
    end
end

-- Automation Functions
local function placeTowers()
    if not isAutoRunning then return end
    for i, unitName in ipairs(units) do
        local unitPosition = persistentData.unitPositions[i]
        if unitPosition and persistentData["autoPlaceUnit" .. i] then
            local unitCFrame = CFrame.new(unitPosition)
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceTower"):FireServer(tostring(unitName), unitCFrame)
        end
    end
end

local isAutoUpgradeRunning = false
local function upgradeTowers()
    if not isAutoUpgradeRunning then return end
    for _, towerName in ipairs(units) do
        local tower = workspace:FindFirstChild("Towers") and workspace.Towers:FindFirstChild(towerName)
        if tower then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UnitManager"):WaitForChild("SetAutoUpgrade"):FireServer(tower, true)
        end
    end
end

local function getPlayersTowers()
    for _, v in pairs(game:GetService("Players").LocalPlayer.Slots:GetChildren()) do
        table.insert(units, v.Value)
    end
end

-- Event Functions
local isAutoRiftRunning = false
local function rifts()
    local riftPath = workspace.Map.Rifts
    while isAutoRiftRunning and task.wait(.1) do
        for _, v in pairs(riftPath:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                fireproximityprompt(v)
            end
        end
    end
end

local isAutoEnergyRunning = false
local function collectEnergy()
    local energyPath = workspace.Collectibles.ClientModels
    while isAutoEnergyRunning and task.wait(.2) do
        for _, v in pairs(energyPath:GetChildren()) do
            if v.Name == "Energy" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Position = v.Position
            end
        end
    end
end

-- Extras Functions
function copyDiscordLink()
    local link = "https://discord.gg/rdpjRDNDHU"
    setclipboard(link)
end

-- UI Elements
-- Automation UI Elements
local autoPlaceToggle = automationTab:CreateToggle({
    Name = "Auto Place Units",
    CurrentValue = false,
    Flag = "AutoPlaceUnits",
    Callback = function(Value)
        isAutoRunning = Value
        if isAutoRunning then
            coroutine.wrap(function()
                while isAutoRunning and task.wait(1) do
                    placeTowers()
                end
            end)()
        end
    end,
})

local autoUpgradeTowers = automationTab:CreateToggle({
    Name = "Auto Upgrade Units",
    CurrentValue = false,
    Flag = "AutoUpgradeUnits",
    Callback = function(Value)
        isAutoUpgradeRunning = Value
        if isAutoUpgradeRunning then
            coroutine.wrap(function()
                while isAutoUpgradeRunning and task.wait(1) do
                    upgradeTowers()
                end
            end)()
        end
    end,
})

-- Event UI Elements
local autoRiftToggle = eventTab:CreateToggle({
    Name = "Auto Handle Rifts",
    CurrentValue = false,
    Flag = "AutoHandleRifts",
    Callback = function(Value)
        isAutoRiftRunning = Value
        if isAutoRiftRunning then
            coroutine.wrap(rifts)()
        end
    end,
})

local autoEnergyToggle = eventTab:CreateToggle({
    Name = "Auto Collect Energy",
    CurrentValue = false,
    Flag = "AutoCollectEnergy",
    Callback = function(Value)
        isAutoEnergyRunning = Value
        if isAutoEnergyRunning then
            coroutine.wrap(collectEnergy)()
        end
    end,
})

-- Extras UI Elements
local discordButton = extrasTab:CreateButton({
    Name = "Copy Discord Link",
    Callback = function()
        copyDiscordLink()
        Rayfield:Notify({
            Title = "Discord Link Copied!",
            Content = "",
            Duration = 5,
            Image = 4483362458,
        })
    end,
})

-- Loading Configuration
loadData()
Rayfield:LoadConfiguration()

-- Loop Get Players Towers
while task.wait(1) do
    getPlayersTowers()
end
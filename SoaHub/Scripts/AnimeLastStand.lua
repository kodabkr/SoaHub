-- HEAVILY WORK IN PROGRESS. DO NOT USE THIS SCRIPT YET.

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

-- UI Tab Creation
local automationTab = Window:CreateTab("Automation", "braces")
local automationDivider = automationTab:CreateDivider()
local eventTab = Window:CreateTab("Event", "braces")
local eventDivider = eventTab:CreateDivider()
local configTab = Window:CreateTab("Configuration", "cog")
local configDivider = configTab:CreateDivider()
local units = {}

-- Variables to Persist (only unitPositions now)
local persistentData = {
    unitPositions = {}
}

local configFolderName = "SoaHubConfigs"
local configFileName = "AnimeLastStand_Data"
local configExtension = ".json"

local HttpService = game:GetService("HttpService")

-- Functions
local function saveData()
    local serializableData = {
        unitPositions = {}
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
                warn("Error writing configuration file: ", writeError)
                Rayfield:Notify({Title = "Save Error", Content = "Failed to save configuration data.", Image = 4400704299})
            else
                print("Configuration saved successfully to: " .. filePath)
            end
        else
            warn("writefile function is not available. Cannot save configuration.")
            Rayfield:Notify({Title = "Save Error", Content = "File saving not supported in this environment.", Image = 4400704299})
        end
    else
        warn("Error encoding configuration data to JSON: ", encodedData)
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
                if decodedData and decodedData.unitPositions then
                    persistentData.unitPositions = {}
                    for i, posTable in ipairs(decodedData.unitPositions) do
                        if posTable then
                            persistentData.unitPositions[i] = Vector3.new(posTable.X, posTable.Y, posTable.Z)
                        else
                            persistentData.unitPositions[i] = nil
                        end
                    end
                    updateUnitLabels()
                end
                print("Configuration loaded successfully from: " .. filePath)
                return
            else
                warn("Error decoding configuration JSON: ", decodedData)
                Rayfield:Notify({Title = "Load Error", Content = "Configuration file is corrupted or invalid.", Image = 4400704299})
            end
        else
            warn("Error reading configuration file: ", fileContent)
            Rayfield:Notify({Title = "Load Error", Content = "Failed to read configuration file.", Image = 4400704299})
        end
    else
        print("Configuration file not found. Using default settings.")
    end
end

-- Automation Functions
local isAutoRunning = false
local function placeTowers()
    if not isAutoRunning then return end
    for i, unitName in ipairs(units) do
        local unitPosition = persistentData.unitPositions[i]
        if unitPosition then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceTower"):FireServer(unitName, unitPosition)
        end
    end
end

local isAutoUpgradeRunning = false
local function upgradeTowers()
    if not isAutoUpgradeRunning then return end
    for _, towerName in ipairs(units) do
        local tower = workspace:FindFirstChild("Towers") and workspace.Towers:FindFirstChild(towerName)
        if tower then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Upgrade"):InvokeServer(tower)
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

-- UI Elements
-- Automation UI Elements
local autoPlaceToggle = automationTab:CreateToggle({
    Name = "Auto Place Units",
    CurrentValue = false, -- Default value, not persisted
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
    CurrentValue = false, -- Default value, not persisted
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
    CurrentValue = false, -- Default value, not persisted
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
    CurrentValue = false, -- Default value, not persisted
    Flag = "AutoCollectEnergy",
    Callback = function(Value)
        isAutoEnergyRunning = Value
        if isAutoEnergyRunning then
            coroutine.wrap(collectEnergy)()
        end
    end,
})

-- Loop Get Players Towers
while task.wait(3) do
    getPlayersTowers()
end

-- Loading Configuration
loadData()
Rayfield:LoadConfiguration()
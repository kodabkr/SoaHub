local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Soa Hub | Dream Game",
   Icon = "fan",
   LoadingTitle = "Soa Hub",
   LoadingSubtitle = "Credits: Koda (Scripting)",
   Theme = "Default", -- https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = nil
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

-- Variables
local expectedPartCount = 92844
local currentPartCount = 0
local isAutoRunning = false

local sleepRemote = workspace:WaitForChild("MainSleep"):WaitForChild("SleepEvent")

-- Gets the QuickTravel ClickDetector from the Bunny statue
local function getBunnyClickDetector()
    local badgeExistence = workspace:FindFirstChild("Map") 
        and workspace.Map:FindFirstChild("Map") 
        and workspace.Map.Map:FindFirstChild("BadgeExistence")

    if badgeExistence then
        local bunny = badgeExistence:FindFirstChild("Bunny Lady Saint")
        if bunny and bunny:FindFirstChild("Handle") then
            return bunny.Handle:FindFirstChild("ClickDetector")
        end
    end
    return nil
end

local bunnyClickDetector = getBunnyClickDetector()

-- Fires the sleep event
local function sleep()
    sleepRemote:FireServer()
end

-- Clicks the Bunny statue to travel to Infinite Silver
local function clickBunny()
    bunnyClickDetector = bunnyClickDetector or getBunnyClickDetector()

    if bunnyClickDetector then
        fireclickdetector(bunnyClickDetector)
    end
end

-- Counts all BaseParts in the given directory - mappy
local function countParts(directory)
    currentPartCount = 0

    for _, obj in pairs(directory:GetDescendants()) do
        if obj:IsA("BasePart") then
            currentPartCount = currentPartCount + 1
        end
    end
end

-- Finds and returns the main components of the map
local function findMapComponents()
    local mappy = workspace:FindFirstChild("Mappy")
    local map = mappy and mappy:FindFirstChild("Map")
    local birdDayInf = map and map:FindFirstChild("BirdDayInf")
    local entitySave = mappy and mappy:FindFirstChild("EntitySave")
    return mappy, map, birdDayInf, entitySave
end

-- Removes the BirdDayInf object if it exists
local function removeBirdDayInf(birdDayInf)
    if birdDayInf then
        birdDayInf:Destroy()
        print("Removed Birds from BirdDayInf")
    end
end

-- Removes all blacklisted entities in the entitySave object
local function removeEntities(entitySave)
    local entityBlacklist = {
        "Big Bunny",
    }

    if entitySave then
        local entitiesFound = false

        for _, obj in pairs(entitySave:GetChildren()) do
            if obj:IsA("Model") and table.find(entityBlacklist, obj.Name) then
                obj:Destroy()
                entitiesFound = true
            end
        end

        if entitiesFound then
            print("Removed entities")
        end
    end
end

local infSilverToggle = automationTab:CreateToggle({
   Name = "Inf Silver Bunny Gap Detector",
   CurrentValue = false,
   Flag = "InfSilverBunnyGapDetector",
   Callback = function(Value)
       isAutoRunning = Value
       if isAutoRunning then
           coroutine.wrap(function()
               while isAutoRunning and task.wait(1) do
                   local mappy, map, birdDayInf, entitySave = findMapComponents()

                   removeBirdDayInf(birdDayInf)
                   removeEntities(entitySave)

                   if not mappy then
                       sleep()
                       clickBunny()
                   else
                       countParts(mappy)
                       
                       if currentPartCount == expectedPartCount then
                           clickBunny()
                           sleep()
                       elseif currentPartCount > expectedPartCount then
                           print("Unexpected part count. Stopping.")
                           break
                       end
                   end
               end
           end)()
       end
   end,
})

local Paragraph = automationTab:CreateParagraph({Title = "Bunny Gap", Content = "This toggle will automatically search for and detect a Bunny Gap in Infinite Silver, a 1/6000+ event."})
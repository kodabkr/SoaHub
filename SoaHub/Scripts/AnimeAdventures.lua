local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Soa Hub | Anime Adventures",
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

-- Tables
local merchants = {
    "Holiday Shop",
    "Gold Shop",
    "Travelling Merchant"
}

local traits = {
    "Unique",
    "Golden",
    "Divine",
    "Celestial",
    "Reaper",
    "Godspeed",
    "Sniper",
    "Culling",
    "Nimble 3",
    "Range 3",
    "Superior 3",
    "Adept", 
    "Range 2",
    "Nimble 2",
    "Superior 2",
    "Nimble 1"
    "Range 1",
    "Superior 1",
}

local unitPositionStores = {
    [1] = "",
    [2] = "",
    [3] = "",
    [4] = "",
    [5] = "",
    [6] = ""
}

local teleportZones = {
    ["Summon"] = CFrame(255, 198, -821),
    ["Traits & Evolve"] = CFrame(429, 196, -524),
    ["Infinity Mansion"] = CFrame(12423, 155, 3198),
    ["Play Area"] = CFrame(-69, 195, -527),
    ["Challenges"] = CFrame(66, 186, -351),
    ["Raids"] = CFrame(112, 196, -672),
    ["Guilds"] = CFrame(373, 195, -408),
    ["Gold Shop"] = CFrame(328, 187, -585),
    ["Holiday Shop"] = CFrame(160, 187, -508),
    ["Travelling Merchant"] = CFrame(229, 197, -741),
    ["Daily Missions"] = CFrame(189, 187, -458),
    ["Relics"] = CFrame(313, 187, -609),
    ["Presents"] = CFrame(),
    ["Codes"] = CFrame(185, 187, -597),
    ["Afk"] = CFrame(102, 196, -576),
    ["Tournament"] = CFrame(159, 187, -547),
    ["Leaderboards"] = CFrame(391, 196, -666),
}

-- Whitelists
local bannerWhitelist = {}
local traitWhitelist = {}
local relicWhitelist = {}
local merchantsWhitelist = {}
local letterStatWhitelist = {}
local evolveWhitelist = {}

-- needs to be the exact workspace match, not just name matching other instances, exact instance.
local args = {[1] = workspace:WaitForChild("_UNITS"):WaitForChild("ghostkun")}
game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("upgrade_unit_ingame"):InvokeServer(unpack(args))

-- if IsA("ImageButton") and Name == "CollectionUnitFrame" then (all unit info)
local pathToUnits = game:GetService("ReplicatedStorage")._FX_CACHE

function getBannerInfo(bannerWhitelist, bannerName)

end

function claimAllCodes()

end

function claimBattlepassRewards()

end

function claimQuestRewards()

end

function craftRelic(relicWhitelist)

end

function merchantPurchase(merchant, merchantsWhitelist)

end

function evolveUnit(evolveWhitelist)
    for _, unitID in ipairs(evolveWhitelist) do
        local evolveArgs = {[1] = tostring(unitID)}
        game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("evolve_unit"):InvokeServer(unpack(evolveArgs))
    end
end

function rerollTraits(traitWhitelist, tokenType, unitID)
    local remnantArgs = {[1] = "star_remnant", [2] = {["unituuid"] = tostring(unitID)}}
    local tokenArgs = {[1] = tostring(unitID)}
    local unit = path_to_units_on_client:WaitForChild("uniqueIdentifier"):WaitForChild("traitValue")

    for _, trait in ipairs(traitWhitelist) do
        if tokenType == "token" then
            local tokenReroll = game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("request_token_trait_reroll"):InvokeServer(unpack(tokenArgs))
        elseif tokenType == "remnant" then
            local remnantReroll = game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("use_item"):InvokeServer(unpack(remnantArgs))
        end
    end
end

function rerollStats(letterStatWhitelist)

end

function teleport(zone)

end

function donatePresents()
    game:GetService("ReplicatedStorage"):WaitForChild("endpoints"):WaitForChild("client_to_server"):WaitForChild("feed_easter_meter"):InvokeServer()
end

function acceptDailyMissions()
    
end

-- utility functions

-- gets the mouse position for unit placement
function getMouseTarget()
    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
    return mouse.Hit
end
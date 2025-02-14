-- Themeing for the scripts
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Soa Hub | Game Name",
   Icon = "fan",
   LoadingTitle = "Soa Hub",
   LoadingSubtitle = "Credits: Koda (Scripting) | ParteyLover (Motivational Speeches!)",
   Theme = "Serenity", -- https://docs.sirius.menu/rayfield/configuration/themes

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

   KeySystem = false

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
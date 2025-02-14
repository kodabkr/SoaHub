repeat task.wait() until game:IsLoaded()
local gamesList = loadstring(game:HttpGet("https://raw.githubusercontent.com/kodabkr/SoaHub/refs/heads/main/SoaHub/SupportedGames/Games.lua"))()

for i, v in pairs(Games) do
    if i == game.PlaceId then
        loadstring(game:HttpGet(v))()
    end
end
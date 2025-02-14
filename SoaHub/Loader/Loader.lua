repeat task.wait() until game:IsLoaded()
local gamesList = loadstring(game:HttpGet("https://raw.githubusercontent.com/kodabkr/gamesList/main/supportedGames"))()

for i, v in pairs(Games) do
    if i == game.PlaceId then
        loadstring(game:HttpGet(v))()
    end
end
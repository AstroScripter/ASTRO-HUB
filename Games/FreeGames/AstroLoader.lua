if game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
    loadstring(game:HttpGet'https://raw.githubusercontent.com/AstroScripter/ASTRO-HUB/main/Games/FreeGames/Scripts/BloxFruits.lua')()
elseif game.PlaceId == 2716845201 then
    loadstring(game:HttpGet'https://raw.githubusercontent.com/AstroScripter/ASTRO-HUB/main/Games/FreeGames/Scripts/WarrierSim.lua')()
else
    game.Players.LocalPlayer:Kick('\n[ Astro Hub - Pre ]\nGame Not Support!')
end
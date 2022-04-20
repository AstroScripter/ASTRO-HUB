if game.PlaceId == nil then
    getfenv()['loadstring'](game:HttpGet('https://raw.githubusercontent.com/AstroScripter/ASTRO-HUB/main/Games/FreeGames/Scripts/.lua'))()
elseif game.PlaceId == 205224386 then
    getfenv()['loadstring'](game:HttpGet('https://raw.githubusercontent.com/AstroScripter/ASTRO-HUB/main/Games/FreeGames/Scripts/H&S.lua'))()
else
    game.Players.LocalPlayer:Kick('\n[ Astro Hub ]\nGame Not Support!')
end

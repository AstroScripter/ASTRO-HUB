local goodServer
local DataTable
local maxPlayers = math.huge
local gameLink = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"

local function Search()
    DataTable = game:GetService"HttpService":JSONDecode(game:HttpGetAsync(gameLink))
    for i, v in pairs(DataTable.data) do
        pcall(function ()
            if type(v) == 'table' and v.id and v.playing and tonumber(maxPlayers) > v.maxplayers then
                maxPlayers = v.playing
                goodServer = v.id
            end
        end)
    end
end

function FindServer()
    pcall(Search)
    for i, v in pairs(DataTable) do
        if i == 'nextPageCursor' then
            if gameLink:find'&cursor=' then
                gameLink = gameLink:gsub(gameLink:sub(gameLink:find'&cursor='), '')
            end
            gameLink = gameLink..'&cursor='..v
            pcall(FindServer)
        end
    end
end

wait()
pcall(FindServer)
game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId, goodServer)

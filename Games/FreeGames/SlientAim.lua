---@diagnostic disable: undefined-global

local LocalPlayer = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera
local resume = coroutine.resume
local create = coroutine.create

-- Main Codes
local function CheckAlly(plrCheck)
    local Allied = false
    if LocalPlayer.PlayerGui.Main.Allies.Container.Allies.ScrollingFrame.Frame:FindFirstChild(plrCheck) then
        Allied = true
    end
    return Allied
end

local function CheckMarine(plrCheck)
    local Checked = false
    if LocalPlayer.Team.Name == 'Marines' and game:GetService'Players':FindFirstChild(plrCheck).Team == LocalPlayer.Team then
        Checked = true
    end
    return Checked
end

local function getMousePosition()
    return Vector2.new(LocalPlayer:GetMouse().X, LocalPlayer:GetMouse().Y)
end

local function getClosestName()
    local Closest
    local Distance = {math.huge}
    local localPos = LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.Position

    for _, Player in pairs(game.Players:GetPlayers()) do
        if Player ~= LocalPlayer and CheckAlly(Player.Name) == false and CheckMarine(Player.Name) == false and not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
            local plrCharacter = Player.Character
            if not plrCharacter then return end

            local plrPart, plrHum = plrCharacter:FindFirstChild'HumanoidRootPart', plrCharacter:FindFirstChild'Humanoid'
            if not plrPart or not plrHum or plrHum.Health <= 0 then return end

            local _, OnScreen = Camera:WorldToScreenPoint(plrPart.Position)
            if OnScreen then
                local curPos = (plrPart.Position - localPos).Magnitude
                if Distance[#Distance] > curPos then
                    Closest = Player.Name
                    table.insert(Distance, curPos)
                end
            end
        end
    end
    return Closest
end

local function getClosestPlayer()
    local Closest
    local Distance = {math.huge}
    local localPos = LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.Position

    for _, Player in pairs(game.Players:GetPlayers()) do
        if Player ~= LocalPlayer and CheckAlly(Player.Name) == false and CheckMarine(Player.Name) == false and not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
            local plrCharacter = Player.Character
            if not plrCharacter then return end

            local plrPart, plrHum = plrCharacter:FindFirstChild'HumanoidRootPart', plrCharacter:FindFirstChild'Humanoid'
            if not plrPart or not plrHum or plrHum.Health <= 0 then return end

            local _, OnScreen = Camera:WorldToScreenPoint(plrPart.Position)
            if OnScreen then
                local curPos = (plrPart.Position - localPos).Magnitude
                if Distance[#Distance] > curPos then
                    Closest = plrPart
                    plrPart.Size = Vector3.new(60, 60, 60)
                    table.insert(Distance, curPos)
                end
            end
        end
    end
    return Closest
end

Number = math.random(1, 1000000)
function ESP(plr)
    local function isnil(thing)
        return (thing == nil)
    end

    local function round(n)
        return math.floor(tonumber(n) + 0.5)
    end

    if game:GetService'Players':FindFirstChild(plr) then
        for i, v in pairs(game:GetService'Players':GetChildren()) do
            pcall(function()
                if v.Name == plr then
                    if not isnil(v.Character) then
                        if not isnil(v.Character.HumanoidRootPart) and not v.Character.HumanoidRootPart:FindFirstChild('NameEsp'..Number) then

                            local bill = Instance.new('BillboardGui', v.Character.HumanoidRootPart)
                            bill.Name = 'NameEsp'..Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1, 200, 1, 30)
                            bill.Adornee = v.Character.HumanoidRootPart
                            bill.AlwaysOnTop = true

                            local name = Instance.new('TextLabel', bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude/3) ..' M')
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(0, 255, 51)
                        else
                            v.Character.HumanoidRootPart['NameEsp'..Number].TextLabel.Text = (v.Name..' | '..round((game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude/3)..' M\nHealth : '..round(v.Character.Humanoid.Health * 100 / v.Character.Humanoid.MaxHealth)..'%')
                        end
                    end
                elseif v.Character.HumanoidRootPart:FindFirstChild('NameEsp'..Number) then
                    v.Character.HumanoidRootPart:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end)
        end
    end
end

game:GetService("Players").LocalPlayer:GetMouse().Button1Down:Connect(function ()
    if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
    if not game:GetService("Players").LocalPlayer:GetMouse().Target then return end
    game.Players.LocalPlayer.Character:MoveTo(game:GetService("Players").LocalPlayer:GetMouse().Hit.p)
end)

function ClearHitbox()
    for i, v in pairs(game.Players:GetChildren()) do
        if v.Character ~= nil and v.Name ~= getClosestName() then
            local vPart, vHum = v.Character:FindFirstChild'HumanoidRootPart', v.Character:FindFirstChild'Humanoid'
            if not vPart or not vHum or vHum.Health <= 0 then return end

            if vPart.Size == Vector3.new(60, 60, 60) then
                vPart.Size = Vector3.new(2, 2, 1)
            end
        end
    end
end

resume(create(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        ClearHitbox()
        if getClosestName() then
            ESP(getClosestName())
        end
    end)
end))

local oldIndex = nil
oldIndex = hookmetamethod(game, "__index", function(self, Index)
    if self == LocalPlayer:GetMouse() and (Index == "Hit" or Index == "Target") then
        if getClosestPlayer() then
            local HitPart = getClosestPlayer()
            return ((Index == 'Hit' and (HitPart.CFrame + (HitPart.Velocity * 0.165))) or (Index == "Target" and HitPart))
        end
    end
    return oldIndex(self, Index)
end)

-- By NHAT#3660 (Astro Hub)
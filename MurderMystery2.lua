repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui

game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
	if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
		game:GetService("TeleportService"):Teleport(game.PlaceId)
	end
end)

game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local function toTarget(...)
	local RealtargetPos = {...}
	local targetPos = RealtargetPos[1]
	local RealTarget
	if type(targetPos) == "vector" then
		RealTarget = CFrame.new(targetPos)
	elseif type(targetPos) == "userdata" then
		RealTarget = targetPos
	elseif type(targetPos) == "number" then
		RealTarget = CFrame.new(unpack(RealtargetPos))
	end

	if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then if tween then tween:Cancel() end repeat wait() until game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0; wait(0.2) end

	local tweenfunc = {}
	local Distance = (RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude

	Speed =30

	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude/Speed, Enum.EasingStyle.Linear)
	local tweenw, err = pcall(function()
		tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = RealTarget})
		tween:Play()
	end)

	function tweenfunc:Stop()
		tween:Cancel()
	end 

	function tweenfunc:Wait()
		tween.Completed:Wait()
	end 

	return tweenfunc
end



function TeleportToLobby()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-107.90824127197266, 138.34988403320312, -10.622464179992676)
end


function GodMode()
    if game.Players.LocalPlayer.Character then
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            for _, accessory in pairs(game.Players.LocalPlayer.Character.Humanoid:GetAccessories()) do
                table.insert(accessories, accessory:Clone())
            end
            game.Players.LocalPlayer.Character.Humanoid.Name = "boop"
        end
        local v = game.Players.LocalPlayer.Character["boop"]:Clone()
        v.Parent = game.Players.LocalPlayer.Character
        v.Name = "Humanoid"
        wait(0.1)
        game.Players.LocalPlayer.Character["boop"]:Destroy()
        workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        for _, accessory in pairs(accessories) do
            game.Players.LocalPlayer.Character.Humanoid:AddAccessory(accessory)
        end
        game.Players.LocalPlayer.Character.Animate.Disabled = true
        wait(0.1)
        game.Players.LocalPlayer.Character.Animate.Disabled = false
    end
end


function FpsBoost()
	local decalsyeeted = true
	local g = game
	local w = g.Workspace
	local l = g.Lighting
	local t = w.Terrain
	t.WaterWaveSize = 0
	t.WaterWaveSpeed = 0
	t.WaterReflectance = 0
	t.WaterTransparency = 0
	l.GlobalShadows = false
	l.FogEnd = 9e9
	l.Brightness = 0
	settings().Rendering.QualityLevel = "Level01"
	for i, v in pairs(g:GetDescendants()) do
		if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
		elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
			v.Transparency = 1
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		elseif v:IsA("Explosion") then
			v.BlastPressure = 1
			v.BlastRadius = 1
		elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
			v.Enabled = false
		elseif v:IsA("MeshPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
			v.TextureID = 10385902758728957
		end
	end	
end



spawn(function()
	while wait() do
		pcall(function()
            if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MainGUI").Lobby.Dock.CoinBag.Full.Visible == true then
                toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                wait()
                game.Players.LocalPlayer.Character.Humanoid.Health = 0
            else
                wait(.5)
                toTarget(game:GetService("Workspace").Normal.CoinContainer.Coin_Server.Coin.MainCoin.CFrame)
            end
		end)
	end
end)

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                    end
                    local BodyVelocity = Instance.new("BodyVelocity")
                    BodyVelocity.Name = "BodyVelocity1"
                    BodyVelocity.Parent =  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
                    BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
            end
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false    
                end
            end
        end)
	end)
end)

spawn(function()
    game.Players.PlayerAdded:Connect(function(Player)
        Player.CharacterAdded:Connect(function(char)
            wait(5)
            GodMode()
        end)
    end)
end)


spawn(function()
    game.Players.PlayerAdded:Connect(function(Player)
        Player.CharacterAdded:Connect(function(char)
            FpsBoost()
        end)
    end)
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Buat GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoAimGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local countdownLabel = Instance.new("TextLabel")
countdownLabel.Name = "CountdownLabel"
countdownLabel.Size = UDim2.new(0, 160, 0, 30)
countdownLabel.Position = UDim2.new(0, 10, 0, 0)
countdownLabel.BackgroundTransparency = 1
countdownLabel.TextColor3 = Color3.new(1, 1, 1)
countdownLabel.Text = "Time Left: 10:00"
countdownLabel.TextSize = 18
countdownLabel.Font = Enum.Font.SourceSansBold
countdownLabel.Parent = screenGui

local button = Instance.new("TextButton")
button.Name = "ToggleButton"
button.Size = UDim2.new(0, 160, 0, 40)
button.Position = UDim2.new(0, 10, 0, 30)
button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
button.TextColor3 = Color3.new(1, 1, 1)
button.Text = "Auto Aim: OFF"
button.TextSize = 18
button.Font = Enum.Font.SourceSansBold
button.Parent = screenGui

-- Variabel utama
local aimEnabled = false
local timeLeft = 600  -- 10 menit

button.MouseButton1Click:Connect(function()
	-- Tombol tetap aktif meskipun waktu sudah habis,
	-- jadi fitur masih bisa di-toggle
	aimEnabled = not aimEnabled
	button.Text = aimEnabled and "Auto Aim: ON" or "Auto Aim: OFF"
	button.BackgroundColor3 = aimEnabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 40)
end)

function getClosestEnemy()
	local closest = nil
	local shortestDist = math.huge

	for _, other in pairs(Players:GetPlayers()) do
		if other ~= player and other.Character and other.Character:FindFirstChild("Head") then
			local head = other.Character.Head
			local screenPos, onScreen = camera:WorldToViewportPoint(head.Position)
			if onScreen then
				local dist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
				if dist < shortestDist and (head.Position - camera.CFrame.Position).Magnitude <= 100 then
					shortestDist = dist
					closest = head
				end
			end
		end
	end

	return closest
end

RunService.RenderStepped:Connect(function()
	if aimEnabled then
		local target = getClosestEnemy()
		if target then
			camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
		end
	end
end)

-- Countdown timer
task.spawn(function()
	while timeLeft > 0 do
		timeLeft = timeLeft - 1
		local minutes = math.floor(timeLeft / 60)
		local seconds = timeLeft % 60
		countdownLabel.Text = string.format("Time Left: %02d:%02d", minutes, seconds)
		task.wait(1)
	end
	
	-- Setelah waktu habis, tampilkan pesan dan biarkan tombol tetap aktif
	countdownLabel.Text = "Waktu Habis!"
end)

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- Popup Icon
local popup = Instance.new("ImageButton")
popup.Size = UDim2.new(0, 80, 0, 80)
popup.Position = UDim2.new(0, 0, 0, 0)
popup.Image = "rbxassetid://YOUR_IMAGE_ID"
popup.BackgroundTransparency = 1
popup.Parent = gui

-- Frame Utama (Disembunyikan Awal)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 250)
frame.Position = UDim2.new(0, 0, 0, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = gui

-- Tombol Close
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.2, 0, 0.15, 0)
closeButton.Position = UDim2.new(0.8, 0, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.Parent = frame

-- Fungsi Draggable untuk Popup
local dragging
local offset
popup.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        offset = popup.Position - UDim2.new(0, input.Position.X, 0, input.Position.Y)
    end
end)

popup.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        popup.Position = UDim2.new(0, input.Position.X, 0, input.Position.Y) + offset
    end
end)

popup.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

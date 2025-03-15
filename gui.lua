local function createGUI()
    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = "CookieHubDevGUI"
    gui.Parent = player:WaitForChild("PlayerGui")

    -- Main Frame (draggable)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 300)
    frame.Position = UDim2.new(0.5, -200, 0.5, -150) -- Centered
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui

    -- Title Label
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.15, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "Cookie Hub Dev"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.Parent = frame

    -- Buttons Container
    local buttonContainer = Instance.new("Frame")
    buttonContainer.Size = UDim2.new(1, 0, 0.8, 0)
    buttonContainer.Position = UDim2.new(0, 0, 0.2, 0)
    buttonContainer.BackgroundTransparency = 1
    buttonContainer.Parent = frame

    -- Grid Layout for Buttons
    local grid = Instance.new("UIGridLayout")
    grid.CellSize = UDim2.new(0.9, 0, 0.15, 0) -- 90% width, 15% height per cell
    grid.CellPadding = UDim2.new(0, 0, 0.02, 0) -- 2% vertical spacing
    grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
    grid.VerticalAlignment = Enum.VerticalAlignment.Top
    grid.Parent = buttonContainer

    -- Button Names and Functions
    local buttonNames = {"Main", "Server", "Fun", "Players", "Information", "Blacklist"}

    for _, name in ipairs(buttonNames) do
        local button = Instance.new("TextButton")
        button.Text = name
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Font = Enum.Font.Gotham
        button.Parent = buttonContainer

        button.MouseButton1Click:Connect(function()
            print("Clicked:", name)
            if name == "Main" then
                -- Add Main functionality here
            elseif name == "Server" then
                -- Add Server functionality here
            elseif name == "Fun" then
                -- Add Fun functionality here
            elseif name == "Players" then
                -- Add Players functionality here
            elseif name == "Information" then
                -- Add Information functionality here
            elseif name == "Blacklist" then
                -- Add Blacklist functionality here
            end
        end)
    end

    -- Credits Label at the Bottom
    local creditsLabel = Instance.new("TextLabel")
    creditsLabel.Size = UDim2.new(1, 0, 0.1, 0)
    creditsLabel.Position = UDim2.new(0, 0, 0.9, 0)
    creditsLabel.Text = "Credits"
    creditsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    creditsLabel.BackgroundTransparency = 1
    creditsLabel.TextScaled = true
    creditsLabel.Font = Enum.Font.Gotham
    creditsLabel.Parent = frame

    -- Close Button (Using the provided image)
    local closeButton = Instance.new("ImageButton")
    closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    closeButton.Position = UDim2.new(0.9, -5, 0, 5)
    closeButton.Image = "https://i.postimg.cc/Yq8Tfrxp/IMG-4431.png" -- Replace with your image link
    closeButton.BackgroundTransparency = 1
    closeButton.Parent = frame

    closeButton.MouseButton1Click:Connect(function()
        gui.Enabled = false
    end)

    -- Toggle Button (Using the same image)
    local toggleButton = Instance.new("ImageButton")
    toggleButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    toggleButton.Position = UDim2.new(0, 5, 0.9, -5) -- Bottom left corner
    toggleButton.Image = "https://i.postimg.cc/Yq8Tfrxp/IMG-4431.png" -- Same image as close button
    toggleButton.BackgroundTransparency = 1
    toggleButton.Parent = gui

    toggleButton.MouseButton1Click:Connect(function()
        gui.Enabled = not gui.Enabled
    end)
end

-- Automatically create the GUI when the player joins
createGUI()

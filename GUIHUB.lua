

local placeId = game.PlaceId
local player = game.Players.LocalPlayer

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CookieHubGUI"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame (draggable)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 420, 0, 280) -- 420x280 px
mainFrame.Position = UDim2.new(0.05, 0, 0.05, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

-- Title Label (Top Left)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 200, 0, 30)
titleLabel.Position = UDim2.new(0, 10, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Cookie Hub Dev Fisch"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Parent = mainFrame

-- Welcome Label (Top Right)
local welcomeLabel = Instance.new("TextLabel")
welcomeLabel.Size = UDim2.new(0, 120, 0, 30)
welcomeLabel.Position = UDim2.new(1, -130, 0, 10)
welcomeLabel.BackgroundTransparency = 1
welcomeLabel.Text = "Welcome,\nXelb"
welcomeLabel.TextWrapped = true
welcomeLabel.Font = Enum.Font.Gotham
welcomeLabel.TextSize = 14
welcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeLabel.Parent = mainFrame

-- Avatar Circle (Placeholder) in Top Right
local avatarCircle = Instance.new("Frame")
avatarCircle.Size = UDim2.new(0, 20, 0, 20)
avatarCircle.Position = UDim2.new(1, -30, 0, 10)
avatarCircle.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
avatarCircle.BorderSizePixel = 0
avatarCircle.Parent = mainFrame

local avatarCorner = Instance.new("UICorner")
avatarCorner.CornerRadius = UDim.new(1, 0)
avatarCorner.Parent = avatarCircle

--------------------------------------------------
-- Menu Container (Left Side) for grid menu
local menuContainer = Instance.new("Frame")
menuContainer.Size = UDim2.new(0, 180, 0, 180)
menuContainer.Position = UDim2.new(0, 10, 0, 50)
menuContainer.BackgroundTransparency = 1
menuContainer.Parent = mainFrame

local function createMenuItem(parent, icon, text, order)
    local itemFrame = Instance.new("Frame")
    itemFrame.Size = UDim2.new(1, 0, 0, 20)
    itemFrame.Position = UDim2.new(0, 0, 0, (order - 1) * 25)
    itemFrame.BackgroundTransparency = 1
    itemFrame.Parent = parent

    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 20, 1, 0)
    iconLabel.Position = UDim2.new(0, 0, 0, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    iconLabel.Font = Enum.Font.Gotham
    iconLabel.TextSize = 14
    iconLabel.Parent = itemFrame

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -25, 1, 0)
    textLabel.Position = UDim2.new(0, 25, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 14
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.Parent = itemFrame
end

-- Create menu items
createMenuItem(menuContainer, "🔧", "Main", 1)
createMenuItem(menuContainer, "📢", "Updates", 2)
createMenuItem(menuContainer, "🎉", "Fun", 3)
createMenuItem(menuContainer, "👥", "Players", 4)
createMenuItem(menuContainer, "ℹ️", "Dev Info", 5)
createMenuItem(menuContainer, "🚫", "Blacklist", 6)
createMenuItem(menuContainer, "📜", "Credits", 7)

-- Players Label in menu container (displaying player count)
local playersLabel = Instance.new("TextLabel")
playersLabel.Size = UDim2.new(0, 140, 0, 20)
playersLabel.Position = UDim2.new(0, 25, 0, (7 * 25) + 5)
playersLabel.BackgroundTransparency = 1
playersLabel.Text = "Players: " .. tostring(#game.Players:GetPlayers())
playersLabel.Font = Enum.Font.Gotham
playersLabel.TextSize = 14
playersLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
playersLabel.TextXAlignment = Enum.TextXAlignment.Left
playersLabel.Parent = menuContainer

--------------------------------------------------
-- Right Frame for linkBox, Copy, and Close
local rightFrame = Instance.new("Frame")
rightFrame.Size = UDim2.new(0, 200, 0, 180)
rightFrame.Position = UDim2.new(0, 200, 0, 50)
rightFrame.BackgroundTransparency = 1
rightFrame.Parent = mainFrame

local linkBox = Instance.new("TextBox")
linkBox.Size = UDim2.new(0, 180, 0, 40)
linkBox.Position = UDim2.new(0, 10, 0, 10)
linkBox.BackgroundTransparency = 0.2
linkBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
linkBox.TextScaled = true
linkBox.TextColor3 = Color3.fromRGB(0, 255, 0)
linkBox.Text = "Loading..."
linkBox.ClearTextOnFocus = false
linkBox.Font = Enum.Font.Gotham
linkBox.Parent = rightFrame

local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0, 80, 0, 30)
copyButton.Position = UDim2.new(0, 10, 0, 60)
copyButton.Text = "Copy"
copyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.Font = Enum.Font.GothamBold
copyButton.Parent = rightFrame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 80, 0, 30)
closeButton.Position = UDim2.new(0, 110, 0, 60)
closeButton.Text = "Close"
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = rightFrame

local copyCorner = Instance.new("UICorner")
copyCorner.CornerRadius = UDim.new(0, 5)
copyCorner.Parent = copyButton

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closeButton

--------------------------------------------------
-- Mapping Place IDs to raw GitHub links
local repoUrl = "https://raw.githubusercontent.com/yourusername/yourrepo/main/"
local placeHubMapping = {
    [123456789] = {
        name = "16732694052",
        link = "https://raw.githubusercontent.com/Nakhun12310/CookieHub/refs/heads/main/Fisch.lua",
        file = "map1.lua"
    },
    [987654321] = {
        name = "Hub for Map 2",
        link = "https://github.com/yourrepo2",
        file = "map2.lua"
    },
    [112233445] = {
        name = "Hub for Map 3",
        link = "https://github.com/yourrepo3",
        file = "map3.lua"
    }
}

local function loadPlaceConfig()
    if placeHubMapping[placeId] then
        titleLabel.Text = "Cookie Hub Dev Fisch" .. "\n" .. placeHubMapping[placeId].name
        linkBox.Text = placeHubMapping[placeId].link

        local fileUrl = repoUrl .. placeHubMapping[placeId].file
        local success, response = pcall(function()
            return game:HttpGet(fileUrl, true)
        end)

        if success then
            loadstring(response)()
        else
            warn("Failed to load script from GitHub: " .. fileUrl)
        end
    else
        titleLabel.Text = "Cookie Hub Dev Fisch"
        linkBox.Text = "No specific hub found."
    end
end

loadPlaceConfig()

-- Copy button functionality
copyButton.MouseButton1Click:Connect(function()
    setclipboard(linkBox.Text)
    copyButton.Text = "Copied!"
    wait(1)
    copyButton.Text = "Copy"
end)

-- Close button functionality
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

--------------------------------------------------
-- Toggle Button (Bottom Left) to show/hide the GUI
local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0, 40, 0, 40)
toggleButton.Position = UDim2.new(0, 5, 1, -45)
toggleButton.Image = "https://i.postimg.cc/nhFRcCDF/IMG-4431.png" -- gunakan image yang sama
toggleButton.BackgroundTransparency = 1
toggleButton.Parent = screenGui

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

--------------------------------------------------
-- Admin Command (module AdminCommands)
local AdminCommands = require(1163352238)
local commandName = "/admin"
local commandDescription = "Admin command"
local commandPermission = 1

AdminCommands:BindCommand({"admin"}, function(commandData)
    print("Admin command executed!")
end, commandPermission, commandDescription)

--------------------------------------------------
-- Load external GUI script from raw link
local rawLink = "https://raw.githubusercontent.com/Nakhun12310/Cookie-Hub-D.E.V/refs/heads/main/Gui.lua"
local success, response = pcall(function()
    return game:HttpGet(rawLink, true)
end)
if success then
    loadstring(response)()
else
    warn("Failed to load external GUI script from: " .. rawLink)
end

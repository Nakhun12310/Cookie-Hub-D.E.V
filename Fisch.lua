-- Dev Cookie Hub Loader
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- Main Window Configuration
local Window = Rayfield:CreateWindow({
    Name = "🍪 Cookie Hub DEV",
    Icon = 10888384525, -- Replace with your icon ID
    LoadingTitle = "Loading Fisch Event System...",
    LoadingSubtitle = "Cookie Hub Developer Edition",
    Theme = "PureDark",
    
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "CookieHubDEV",
        FileName = "DEV_Settings"
    },
    
    Discord = {
        Enabled = true,
        Invite = "cookiehub", -- Replace with your Discord server code
        RememberJoins = true
    }
})

-- Load External Fisch Script
local FischModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nakhun12310/CookieHub/refs/heads/main/Fisch.lua", true))()

-- Enhanced Teleport System with Safety Checks
local function SafeTeleport(position)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end

    local humanoid = character:FindFirstChild("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoid and rootPart then
        -- Find safe position
        local safeCFrame = FischModule:FindSafeSpot(position)
        
        -- Teleport animation
        humanoid:ChangeState(Enum.HumanoidStateType.Flying)
        rootPart.CFrame = safeCFrame + Vector3.new(0, 5, 0) -- Start above
        task.wait(0.2)
        rootPart.CFrame = safeCFrame
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
end

-- Main Tab
local MainTab = Window:CreateTab("Fisch Events", 4483362458) -- Replace icon ID

-- Event Selection Section
MainTab:CreateSection("Available Events")
local EventDropdown = MainTab:CreateDropdown({
    Name = "Select Event",
    Options = {"FischFright", "Archaeological Hunt", "Fischgiving", "Fischmas", "Winter's Edge", "Golden Tide"},
    CurrentOption = "Select Event",
    Flag = "EventSelection",
    Callback = function(Selected)
        local eventData = FischModule.Events[Selected]
        if eventData then
            SafeTeleport(eventData.coordinates)
        end
    end
})

-- Safety Systems Section
MainTab:CreateSection("Safety Configuration")
local WaterCheck = MainTab:CreateToggle({
    Name = "Avoid Water",
    CurrentValue = true,
    Flag = "WaterAvoidance",
    Callback = function(Value)
        FischModule.Config.AvoidWater = Value
    end
})

local LavaCheck = MainTab:CreateToggle({
    Name = "Avoid Lava",
    CurrentValue = true,
    Flag = "LavaAvoidance",
    Callback = function(Value)
        FischModule.Config.AvoidLava = Value
    end
})

-- Developer Tools Tab
local DevTab = Window:CreateTab("Developer Tools", 7733762089) -- Replace icon ID

-- Teleport Overrides
DevTab:CreateSection("Coordinate Overrides")
local XSlider = DevTab:CreateSlider({
    Name = "X Coordinate",
    Range = {-1000, 1000},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 0,
    Flag = "XCoord",
    Callback = function(Value) end
})

local YSlider = DevTab:CreateSlider({
    Name = "Y Coordinate",
    Range = {-1000, 1000},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 0,
    Flag = "YCoord",
    Callback = function(Value) end
})

local ZSlider = DevTab:CreateSlider({
    Name = "Z Coordinate",
    Range = {-1000, 1000},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 0,
    Flag = "ZCoord",
    Callback = function(Value) end
})

DevTab:CreateButton({
    Name = "Teleport to Custom Position",
    Callback = function()
        SafeTeleport(CFrame.new(
            XSlider.CurrentValue,
            YSlider.CurrentValue,
            ZSlider.CurrentValue
        ))
    end
})

-- Load existing configuration
Rayfield:LoadConfiguration()

-- Initialize Fisch Module with DEV settings
FischModule:Initialize({
    DebugMode = true,
    SafeTeleport = true,
    AdvancedPathfinding = false
})

-- Notify user
Rayfield:Notify({
    Title = "Cookie Hub DEV Loaded",
    Content = "Fisch event system initialized successfully!",
    Duration = 6.5,
    Image = 10888384525, -- Replace with your image ID
    Actions = {
        Ignore = {
            Name = "Okay",
            Callback = function()
                print("User acknowledged notification")
            end
        },
    },
})

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🎣 | Auto Farm Hub",
   Icon = 0,
   LoadingTitle = "Loading, please wait...",
   LoadingSubtitle = "by Nakhun12310",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Auto Farm Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
})

local MainTab = Window:CreateTab("Auto Farm", 124714113910876)
local MainSection = MainTab:CreateSection("Fishing")

Rayfield:Notify({
   Title = "Welcome to Auto Farm Hub!",
   Content = "Enjoy Your Fishing Auto Farm!",
   Duration = 6.5,
   Image = 124714113910876,
})

-- Define essential variables
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local GuiService = game:GetService("GuiService")

-- Ensure Character Loads Properly
local function getCharacter()
   return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local Char = getCharacter()
local Backpack = LocalPlayer:FindFirstChild("Backpack")

-- Auto Farm Variables
_G.AutoFarm = false

-- Auto Farm Toggle (Controls Auto Cast, Auto Shake, and Auto Reel)
MainTab:CreateToggle({
   Name = "Auto Farm",
   Callback = function(v)
      _G.AutoFarm = v
      _G.AutoCast = v
      _G.AutoShake = v
      _G.AutoReel = v

      spawn(function()
         while _G.AutoFarm do
            task.wait(0.1)

            -- Auto Cast
            Char = getCharacter()
            local Rod = Char:FindFirstChildOfClass("Tool")
            if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("cast") then
               Rod.events.cast:FireServer(100, 1)
            end

            -- Auto Shake
            local PlayerGUI = LocalPlayer:FindFirstChild("PlayerGui")
            local shakeUI = PlayerGUI and PlayerGUI:FindFirstChild("shakeui")
            if shakeUI and shakeUI.Enabled then
               local safezone = shakeUI:FindFirstChild("safezone")
               if safezone then
                  local button = safezone:FindFirstChild("button")
                  if button and button:IsA("ImageButton") and button.Visible then
                     GuiService.SelectedObject = button
                     VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                     VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                  end
               end
            end

            -- Auto Reel
            for _, v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
               if v:IsA("ScreenGui") and v.Name == "reel" then
                  local bar = v:FindFirstChild("bar")
                  if bar then
                     ReplicatedStorage.events.reelfinished:FireServer(100, true)
                  end
               end
            end
         end
      end)
   end
})

-- Auto Equip Fishing Rod
spawn(function()
   while task.wait(0.5) do
      if _G.AutoFarm then
         Char = getCharacter()
         Backpack = LocalPlayer:FindFirstChild("Backpack")
         if Backpack then
            for _, v in pairs(Backpack:GetChildren()) do
               if v:IsA("Tool") and v.Name:lower():find("rod") then
                  v.Parent = Char
               end
            end
         end
      end
   end
end)

-- Get the player's GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Get the UI
local ui = playerGui:WaitForChild("YourUI") -- Change "YourUI" to the name of your UI

-- Make the UI visible when the notebook is clicked
ui.Visible = true

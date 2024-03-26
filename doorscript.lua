-- Get the parts
local door = game.Workspace.Door -- Change this to the path of your door
local clickDetector = door:FindFirstChild("ClickDetector")
local animator = door:FindFirstChild("Animator")

-- Check if the ClickDetector and Animator are present
if not clickDetector then
    error("No ClickDetector found in the door.")
end
if not animator then
    error("No Animator found in the door.")
end

-- Get the animation
local animation = animator:FindFirstChild("DoorOpeningAnimation")
if not animation then
    error("No DoorOpeningAnimation found in the Animator.")
end

-- Define what happens when the door is clicked
local function onClick()
    -- Play the door opening animation
    animator:PlayAnimation(animation)
end

-- Connect the click event to the onClick function
clickDetector.MouseClick:Connect(onClick)


-- Get the parts
local ai = game.Workspace.AI -- Change this to the path of your AI
local player = game.Players.LocalPlayer.Character -- Change this to the path of your player

-- Get the services
local pathfindingService = game:GetService("PathfindingService")
local path = pathfindingService:CreatePath()

-- Define the aggressive behavior
local function triggerAggressiveScript()
    -- Get all the objects with the receive teleport script
    local objects = game.Workspace:GetChildren()
    local teleportObjects = {}
    for i, object in ipairs(objects) do
        if object:FindFirstChild("ReceiveTeleportScript") then
            table.insert(teleportObjects, object)
        end
    end

    -- Teleport the AI to a random object
    if #teleportObjects > 0 then
        local randomObject = teleportObjects[math.random(#teleportObjects)]
        ai.PrimaryPart.CFrame = randomObject.PrimaryPart.CFrame
    end

    -- Start moving randomly throughout the halls
    while true do
        -- Find a random destination
        local destination = game.Workspace:FindPartOnRay(Ray.new(ai.PrimaryPart.Position, Vector3.new(math.random(-100, 100), 0, math.random(-100, 100))), ai)
        if destination then
            -- Compute the path to the destination
            path:ComputeAsync(ai.PrimaryPart.Position, destination.Position)

            -- Follow the path
            for _, waypoint in ipairs(path:GetWaypoints()) do
                ai.Humanoid:MoveTo(waypoint.Position)
                if waypoint.Action == Enum.PathWaypointAction.Jump then
                    ai.Humanoid.Jump = true
                end
                ai.Humanoid.MoveToFinished:Wait()
            end
        end

        -- Check if the player is in sight
        local ray = Ray.new(ai.PrimaryPart.Position, (player.PrimaryPart.Position - ai.PrimaryPart.Position).Unit * 100)
        local part, position = game.Workspace:FindPartOnRay(ray, ai)
        if part and part:IsDescendantOf(player) then
            -- The player is in sight, start chasing
            while (player.PrimaryPart.Position - ai.PrimaryPart.Position).Magnitude < 100 do
                ai.Humanoid:MoveTo(player.PrimaryPart.Position)
                ai.Humanoid.MoveToFinished:Wait()
            end
        end
    end
end


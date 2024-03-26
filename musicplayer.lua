-- Get the Sound object
local sound = game.Workspace:WaitForChild("YourSound") -- Change "YourSound" to the name of your Sound

-- Define the fade in time
local fadeInTime = 5 -- Change this to the number of seconds you want the fade in to last

-- Define the initial volume
local initialVolume = 0

-- Define the final volume
local finalVolume = 1 -- Change this to the desired final volume (between 0 and 1)

-- Define the volume increment
local volumeIncrement = (finalVolume - initialVolume) / (fadeInTime * 30) -- 30 updates per second

-- Define the function to fade in the music
local function fadeInMusic()
    -- Set the initial volume
    sound.Volume = initialVolume

    -- Start playing the music
    sound:Play()

    -- Gradually increase the volume
    for i = 1, fadeInTime * 30 do
        sound.Volume = sound.Volume + volumeIncrement
        wait(1/30) -- Wait for 1/30 of a second
    end

    -- Make sure the final volume is correct
    sound.Volume = finalVolume

    -- Loop the music
    sound.Looped = true
end

-- Fade in the music when the game starts
fadeInMusic()
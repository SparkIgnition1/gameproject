--add config to top of musicplayer.lua script
-- Configuration ----------------------------------------------
local displayText = game.Workspace.SongDisplay -- Reference to text display element
local fadeTime = 5 -- Seconds for fade-in and fade-out

local songs = {
    ["Song1"] = {
        sound = game.Workspace.Song1,
        title = "Song 1 Title",
        artist = "Artist 1"
    },
    ["Song2"] = {
        sound = game.Workspace.Song2,
        title = "Song 2 Title",
        artist = "Artist 2"
    } 
    -- Add more songs here in the same format
}
------------------------------------------------------------

function fadeInText()
    displayText.TextTransparency = 1  -- Start transparent
    for i = 0, 1, 0.05 do  -- Change 0.05 for fade speed
        displayText.TextTransparency = 1 - i
        wait()
    end
end

function fadeOutText()
   for i = 0, 1, 0.05 do
       displayText.TextTransparency = i 
       wait()
   end
end

function playSong(songName)
    local songData = songs[songName]
    if songData then
        -- Update text 
        displayText.Text = songData.title .. " - " .. songData.artist

        -- Fade in text
        fadeInText()

        -- Start song
        songData.sound:Play()

        -- Wait for fade out time
        wait(fadeTime)

        -- Fade out text
        fadeOutText()
    end
end

-- Play a random song to start (this modifie's how the script start songs)
local randomSong = songs[math.random(#songs)]
playSong(randomSong) 

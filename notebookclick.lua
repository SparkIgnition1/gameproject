-- Get the parts
local notebook = game.Workspace.Notebook -- Change this to the path of your notebook
local clickDetector = notebook:FindFirstChild("ClickDetector")

-- Check if the ClickDetector is present
if not clickDetector then
    error("No ClickDetector found in the notebook.")
end

-- Define what happens when the notebook is clicked
local function onClick()
    -- Generate a random math problem
    local num1 = math.random(1, 10)
    local num2 = math.random(1, 10)
    local operators = {"+", "-", "*"}
    local operator = operators[math.random(#operators)]
    local problem = num1 .. " " .. operator .. " " .. num2
    local solution = loadstring("return " .. problem)()

    -- Display the problem in the UI and get the player's answer
    local playerAnswer = displayProblemAndGetAnswer(problem) -- You need to implement this function

    -- Check the player's answer
    if playerAnswer == solution then
        -- The answer is correct, do nothing
    else
        -- The answer is incorrect, trigger the aggressive script on the enemy AI
        triggerAggressiveScript() -- You need to implement this function
    end
end

-- Connect the click event to the onClick function
clickDetector.MouseClick:Connect(onClick)

-- Get the parts
local notebook = game.Workspace.Notebook -- Change this to the path of your notebook
local clickDetector = notebook:FindFirstChild("ClickDetector")
local ui = notebook:FindFirstChild("UI") -- Make the name of the screengui "UI"

-- Check if the ClickDetector is present
if not clickDetector then error("No ClickDetector found in the notebook.") end

-- Define the solveProblems function
local function solveProblems()
    -- Define the number of problems
    local numProblems = 5

    -- Solve each problem
    for i = 1, numProblems do
        -- Generate a random math problem
        local num1 = math.random(1, 10)
        local num2 = math.random(1, 10)
        local operators = {"+", "-", "*"}
        local operator = operators[math.random(#operators)]
        local problem = num1 .. " " .. operator .. " " .. num2
        local solution = loadstring("return " .. problem)()

        -- Ask the user to solve the problem and get the answer
        local userAnswer = _G.getUserAnswer(problem)

        -- Check if the answer is correct
        if userAnswer ~= solution then
            -- The answer is incorrect, trigger the aggressive AI
            _G.triggerAggressiveAI()
            return false
        end
    end

    -- All problems are solved, return true
    return true
end

-- Define what happens when the notebook is clicked
local function onClick()
    -- Make the UI visible
    ui.Visible = true

    -- Solve all the problems
    local allProblemsSolved = solveProblems()

    -- If all problems are solved, wait for 3 seconds and then close the UI
    if allProblemsSolved then
        wait(3)
        ui.Visible = false
    end
end

-- Connect the click event to the onClick function
clickDetector.MouseClick:Connect(onClick)

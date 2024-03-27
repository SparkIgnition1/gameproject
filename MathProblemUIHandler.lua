-- Get the UI
local ui = playerGui:WaitForChild("YourUI") -- Change "YourUI" to the name of your UI
local inputField = ui:WaitForChild("InputField") -- Change "InputField" to the name of your TextBox
local submitButton = ui:WaitForChild("SubmitButton") -- Change "SubmitButton" to the name of your TextButton

-- Define the getUserAnswer function
local function getUserAnswer(problem)
    -- Display the problem in the UI
    local problemTextLabel = ui:WaitForChild("ProblemTextLabel") -- Change "ProblemTextLabel" to the name of your TextLabel
    problemTextLabel.Text = problem

    -- Wait for the user to submit an answer
    local answerGiven = Instance.new("BindableEvent")
    submitButton.MouseButton1Click:Connect(function()
        answerGiven:Fire(inputField.Text)
    end)

    -- Return the user's answer
    return answerGiven.Event:Wait()
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Tạo seed tool
local tool = Instance.new("Tool")
tool.Name = "Candy Blossom Seed"
tool.RequiresHandle = false
tool.CanBeDropped = true
tool.Parent = backpack

-- Khi dùng để trồng (kích đất)
tool.Activated:Connect(function()
    -- Jumpscare
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9118826813"
    sound.Volume = 5
    sound.Parent = workspace

    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 1
    TweenService:Create(frame, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
    sound:Play()
    wait(1)
    TweenService:Create(frame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    wait(0.6)
    gui:Destroy()
end)

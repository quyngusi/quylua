local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Xóa nếu đã có để tránh trùng
if backpack:FindFirstChild("Candy Blossom Seed") then
    backpack:FindFirstChild("Candy Blossom Seed"):Destroy()
end

-- Tạo Tool Seed
local tool = Instance.new("Tool")
tool.Name = "Candy Blossom Seed"
tool.RequiresHandle = false
tool.CanBeDropped = false

-- Tạo Handle giả (bắt buộc với KRNL đôi khi)
local fakeHandle = Instance.new("Part")
fakeHandle.Name = "Handle"
fakeHandle.Size = Vector3.new(1,1,1)
fakeHandle.Transparency = 1
fakeHandle.Anchored = false
fakeHandle.CanCollide = false
fakeHandle.Parent = tool

tool.Parent = backpack

-- Sự kiện khi trồng cây (click xuống đất)
tool.Activated:Connect(function()
    -- Tạo tiếng hét
    local scream = Instance.new("Sound")
    scream.SoundId = "rbxassetid://9118826813"
    scream.Volume = 10
    scream.Parent = workspace
    scream:Play()

    -- Tạo màn hình đen
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    local black = Instance.new("Frame", gui)
    black.Size = UDim2.new(1, 0, 1, 0)
    black.BackgroundColor3 = Color3.new(0, 0, 0)
    black.BackgroundTransparency = 1

    -- Hiện dần rồi mờ dần
    TweenService:Create(black, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
    wait(1)
    TweenService:Create(black, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    wait(0.5)
    gui:Destroy()
end)

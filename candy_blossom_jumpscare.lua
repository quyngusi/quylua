local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Xóa nếu có tool cũ
local oldTool = backpack:FindFirstChild("Candy Blossom Seed")
if oldTool then oldTool:Destroy() end

-- Tạo tool seed
local tool = Instance.new("Tool")
tool.Name = "Candy Blossom Seed"
tool.RequiresHandle = true
tool.CanBeDropped = false

-- Tạo handle ẩn (KRNL cần)
local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(1, 1, 1)
handle.Transparency = 1
handle.Anchored = false
handle.CanCollide = false
handle.Parent = tool

tool.Parent = backpack

-- Sự kiện khi dùng tool (trồng)
tool.Activated:Connect(function()
    -- Phát tiếng hét
    local scream = Instance.new("Sound")
    scream.SoundId = "rbxassetid://9118826813" -- tiếng hét
    scream.Volume = 10
    scream.PlayOnRemove = true
    scream.Parent = workspace
    scream:Destroy() -- PlayOnRemove sẽ phát âm thanh ngay lập tức

    -- Màn hình đen toàn bộ
    local gui = Instance.new("ScreenGui")
    gui.ResetOnSpawn = false
    gui.Name = "JumpscareGui"
    gui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BorderSizePixel = 0
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.Parent = gui

    -- Làm mờ → đen → mờ lại
    TweenService:Create(frame, TweenInfo.new(0.1), {BackgroundTransparency = 0}):Play()
    wait(1)
    TweenService:Create(frame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    wait(0.5)
    gui:Destroy()
end)

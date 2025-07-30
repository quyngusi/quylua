local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Xoá tool cũ nếu có
local oldTool = backpack:FindFirstChild("Candy Blossom Seed")
if oldTool then oldTool:Destroy() end

-- Tạo tool
local tool = Instance.new("Tool")
tool.Name = "Candy Blossom Seed"
tool.RequiresHandle = true
tool.CanBeDropped = false

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(1, 1, 1)
handle.Transparency = 1
handle.CanCollide = false
handle.Anchored = false
handle.Parent = tool

tool.Parent = backpack

-- Sự kiện khi dùng tool
tool.Activated:Connect(function()
    -- Tạo âm thanh hét
    local scream = Instance.new("Sound")
    scream.SoundId = "rbxassetid://9118826813" -- âm thanh hét chuẩn
    scream.Volume = 10
    scream.Name = "ScreamSound"
    scream.Parent = workspace
    scream:Play() -- PHÁT TRỰC TIẾP
    game.Debris:AddItem(scream, 5)

    -- Màn hình đen
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

    -- Tween đen toàn màn
    TweenService:Create(frame, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
    wait(1.5)
    TweenService:Create(frame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    wait(0.5)
    gui:Destroy()
end)

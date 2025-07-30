-- grow a garden: tự spawn Candy Blossom vào garden plot cá nhân
-- khi lại gần quả sẽ bị jumpscare (màn hình đen + tiếng hù)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")

-- === Tìm khu vườn của bạn ===
local garden = nil
for _, plot in pairs(workspace:GetChildren()) do
    if plot:FindFirstChild("Owner") and plot.Owner.Value == player then
        garden = plot
        break
    end
end

if not garden then
    warn("Không tìm thấy garden của bạn.")
    return
end

-- === Tạo cây Candy Blossom trong garden ===
local tree = Instance.new("Model", garden)
tree.Name = "CandyBlossomTree"

local trunk = Instance.new("Part")
trunk.Size = Vector3.new(1, 5, 1)
trunk.Anchored = true
trunk.BrickColor = BrickColor.new("Reddish brown")
trunk.Position = garden.Position + Vector3.new(0, 2.5, 0)
trunk.Parent = tree

local leaves = Instance.new("Part")
leaves.Size = Vector3.new(4, 4, 4)
leaves.Shape = Enum.PartType.Ball
leaves.Anchored = true
leaves.BrickColor = BrickColor.new("Pink")
leaves.Position = trunk.Position + Vector3.new(0, 3, 0)
leaves.Parent = tree

-- === Tạo trái cây ===
local fruit = Instance.new("Part")
fruit.Shape = Enum.PartType.Ball
fruit.Size = Vector3.new(1,1,1)
fruit.Anchored = true
fruit.BrickColor = BrickColor.new("Bright red")
fruit.Position = leaves.Position + Vector3.new(1, 0, 0)
fruit.Name = "ScaryFruit"
fruit.Parent = tree

-- === Âm thanh hù ===
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9118826813" -- tiếng scream
sound.Volume = 5
sound.Parent = workspace

-- === Jumpscare GUI ===
local function jumpscare()
    if player:FindFirstChild("PlayerGui") then
        local screenGui = Instance.new("ScreenGui", player.PlayerGui)
        local frame = Instance.new("Frame", screenGui)
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.BackgroundTransparency = 1
        TweenService:Create(frame, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
        sound:Play()
        wait(1)
        TweenService:Create(frame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
        wait(0.5)
        screenGui:Destroy()
    end
end

-- === Phát hiện người chơi lại gần ===
local detecting = true
game:GetService("RunService").Heartbeat:Connect(function()
    if detecting and (root.Position - fruit.Position).Magnitude < 4 then
        detecting = false
        jumpscare()
    end
end)

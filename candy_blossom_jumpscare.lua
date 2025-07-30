local Players = game:GetService("Players")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Xóa tool cũ nếu có
local old = backpack:FindFirstChild("Candy Blossom Seed")
if old then old:Destroy() end

-- Tạo tool
local tool = Instance.new("Tool")
tool.Name = "Candy Blossom Seed"
tool.RequiresHandle = true
tool.CanBeDropped = false

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(1,1,1)
handle.Transparency = 1
handle.CanCollide = false
handle.Anchored = false
handle.Parent = tool

tool.Parent = backpack

-- Khi dùng hạt giống
tool.Activated:Connect(function()
    -- GUI hiển thị chữ đỏ
    local gui = Instance.new("ScreenGui")
    gui.ResetOnSpawn = false
    gui.Name = "InsultGui"
    gui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "con đỉ ngu"
    label.TextColor3 = Color3.new(1, 0, 0) -- đỏ
    label.TextScaled = true
    label.Font = Enum.Font.FredokaOne
    label.Parent = gui

    wait(2)
    gui:Destroy()
end)

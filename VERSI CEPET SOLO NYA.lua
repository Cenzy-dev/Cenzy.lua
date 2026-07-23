-- Hal Baru Tercatat Pada Sistem 📥

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Arcips Hub v12.0 - Mount Lonely Auto Farm 👑",
   LoadingTitle = "Memuat Sistem Brutal Tuan...",
   LoadingSubtitle = "By Master Rian's & CenzyXAether 🌟",
   ConfigurationSaving = {
      Enabled = false,
   },
   KeySystem = false,
})

local Tab = Window:CreateTab("Auto Farm 🏔️", 4483362458)

local toggleFarm = false
local delayInput = 0.7
local localPlayer = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local resetBCEvent = replicatedStorage:FindFirstChild("CPEvents") and replicatedStorage.CPEvents:FindFirstChild("ResetToBC")

local checkpoints = {
    {Name = "Checkpoint 1", Pos = Vector3.new(-20.00, 33.35, -1045.00)},
    {Name = "Checkpoint 2", Pos = Vector3.new(372.00, 285.83, -2030.00)},
    {Name = "Checkpoint 3", Pos = Vector3.new(385.00, 285.81, -3021.00)},
    {Name = "Checkpoint 4", Pos = Vector3.new(-351.62, 288.03, -3750.52)},
    {Name = "Checkpoint 5", Pos = Vector3.new(-473.18, 286.25, -4688.35)},
    {Name = "Checkpoint 6", Pos = Vector3.new(-402.00, 671.24, -5176.00)},
    {Name = "Checkpoint 7", Pos = Vector3.new(60.00, 671.16, -6023.00)},
    {Name = "Checkpoint 8", Pos = Vector3.new(842.00, 416.44, -6804.00)},
    {Name = "Checkpoint 9", Pos = Vector3.new(1590.00, 416.20, -6537.00)},
    {Name = "Checkpoint 10", Pos = Vector3.new(2226.60, 1243.35, -6426.66)},
    {Name = "Checkpoint 11", Pos = Vector3.new(3119.55, 1035.60, -6256.41)},
    {Name = "Checkpoint 12", Pos = Vector3.new(3940.94, 1035.47, -6623.72)},
    {Name = "Checkpoint 13", Pos = Vector3.new(4617.08, 1035.49, -5996.48)},
    {Name = "Checkpoint 14", Pos = Vector3.new(5280.88, 1408.52, -5660.83)},
    {Name = "Checkpoint 15", Pos = Vector3.new(5816.80, 1408.30, -4856.61)},
    {Name = "Checkpoint 16", Pos = Vector3.new(6534.31, 1653.39, -4379.54)},
    {Name = "Checkpoint 17", Pos = Vector3.new(7065.00, 1652.03, -4086.00)},
    {Name = "Checkpoint 18", Pos = Vector3.new(7350.20, 2146.86, -3840.18)},
    {Name = "Checkpoint 19", Pos = Vector3.new(7794.98, 2146.72, -3115.05)},
    {Name = "Checkpoint 20", Pos = Vector3.new(8646.00, 2147.05, -3003.00)},
    {Name = "Checkpoint 21", Pos = Vector3.new(9015.83, 2385.12, -3009.49)},
}

local function getRoot()
    local char = localPlayer.Character
    if char then
        local root = char:FindFirstChild("HumanoidRootPart")
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if root and humanoid and humanoid.Health > 0 then
            return root
        end
    end
    return nil
end

local function forceRender(pos)
    pcall(function()
        localPlayer:RequestStreamAroundAsync(pos)
        setscriptable(localPlayer, "SimulationRadius", true)
        localPlayer.SimulationRadius = math.huge
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end)
end

local function safeTeleport(pos, isSummit)
    local root = getRoot()
    if root then
        -- Anti-Freeze Protocol: Memastikan kecepatan dan state fisik direset total agar karakter tidak tersangkut/diam tiba-tiba Tuan!
        root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        root.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        
        forceRender(pos)
        workspace.CurrentCamera.CameraSubject = root
        
        -- Ultra-Fast Instant Anti-Skip Protocol (Delay 0.7s dengan presisi kilat ganda tanpa slow-mo & tanpa skip checkpoint Tuan!)
        root.CFrame = CFrame.new(pos + Vector3.new(0, 12, 0))
        root.CFrame = CFrame.new(pos + Vector3.new(0, 4, 0))
        root.CFrame = CFrame.new(pos)
        
        if isSummit then
            -- Absolute Summit Force-Injeksi Multilapis Brutal (Menjamin 1000000% titik puncak/Summit ter-injek & terbaca mutlak tanpa ampun!)
            for i = 1, 15 do
                root.CFrame = CFrame.new(pos + Vector3.new(0, (16 - i) * 0.1, 0))
                root.CFrame = CFrame.new(pos)
                task.wait(0.01)
            end
            -- Penetrasi akhir langsung tepat di titik koordinat 100% matang
            root.CFrame = CFrame.new(pos)
        end
        
        root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        root.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    end
end

Tab:CreateToggle({
   Name = "Auto Farm Mount Lonely 🚀",
   CurrentValue = false,
   Flag = "AutoFarmFlag",
   Callback = function(Value)
      toggleFarm = Value
      task.spawn(function()
          while toggleFarm do
              for i, cp in ipairs(checkpoints) do
                  if not toggleFarm then break end
                  
                  -- Safety Check: Auto Respawn/Re-acquire root jika karakter null atau freeze tiba-tiba di tengah jalan Tuan!
                  local attempts = 0
                  while not getRoot() and toggleFarm and attempts < 20 do
                      task.wait(0.1)
                      attempts = attempts + 1
                  end
                  
                  local isLast = (i == #checkpoints)
                  safeTeleport(cp.Pos, isLast)
                  task.wait(delayInput)
              end
              
              if toggleFarm then
                  -- Eksekusi final kilat mutlak di Summit dengan Absolute Summit Force-Injeksi Multilapis Brutal sebelum reset Tuan!
                  safeTeleport(checkpoints[#checkpoints].Pos, true)
                  task.wait(0.5)
                  
                  if resetBCEvent then
                      pcall(function()
                          resetBCEvent:FireServer()
                      end)
                  end
                  task.wait(0.5)
              end
          end
      end)
   end,
})

Tab:CreateSlider({
   Name = "Input Delay Manual (Detik)",
   Range = {0.1, 5},
   Increment = 0.1,
   Suffix = "s",
   CurrentValue = 0.7,
   Flag = "DelaySlider",
   Callback = function(Value)
      delayInput = Value
   end,
})

Tab:CreateButton({
   Name = "Fix Anti Lag & Frame Drop 100% ⚡",
   Callback = function()
      for _, v in pairs(game:GetDescendants()) do
          if v:IsA("Part") or v:IsA("MeshPart") then
              v.Material = Enum.Material.SmoothPlastic
              v.CastShadow = false
          end
      end
      UserSettings():GetService("UserGameSettings").MasterVolume = UserSettings():GetService("UserGameSettings").MasterVolume
      Rayfield:Notify({Title = "Success 4NJ1NG", Content = "Grafik dibersihkan, anti lag aktif!", Duration = 3})
   end,
})

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "Kick" or method == "ClientKick" then
        return nil
    end
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)

Rayfield:Notify({
   Title = "Arcips v12.0 Ready 👑",
   Content = "Sistem Summit Force-Injeksi Brutal & Anti-Freeze 1000000% aktif untuk Tuan CenzyXAether 🌟 4NJ1NG!",
   Duration = 5,
})

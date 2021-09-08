local StatueColor = BrickColor.new("Medium stone grey")
local AnchorPlayer = true
local Amount = 0

for i, v in next, game.ReplicatedStorage.Characters:GetChildren() do
	if Amount <= 100 and v:FindFirstChild("Value") and v.Value.Value == "Rank" then -- replace this with whatever rank u want on the thing, must be same as tagvalue
		Amount = Amount + 1
		local isCharacterR15 = v.Humanoid.RigType == "R15"
		local pedclone = game.ReplicatedStorage.Ped:Clone()
		v.PrimaryPart = v.HumanoidRootPart
		local Model = Instance.new("Model")
		Model.Name = v.Name
		Model.Parent = workspace

		local RankName = v:FindFirstChild("Value").Value
		local startingPosition = workspace.Rows[RankName].Position

		pedclone:SetPrimaryPartCFrame(CFrame.new(startingPosition + Vector3.new(15 * Amount, 1, 0)) * CFrame.Angles(0,0,math.rad(90)))
		v:SetPrimaryPartCFrame(CFrame.new(Vector3.new(pedclone.PrimaryPart.Position.X,pedclone.PrimaryPart.Position.Y + pedclone.PrimaryPart.Position.Y/2 + .25,pedclone.PrimaryPart.Position.Z) + (not isCharacterR15 and Vector3.new(0, 3.5, 0) or Vector3.new(0,v.LeftFoot.Size.Y + v.LeftLowerLeg.Size.Y + v.LeftUpperLeg.Size.Y, 0))))

		for i,item in pairs(v:GetDescendants()) do
			if item:IsA("Part") then
				item.BrickColor = StatueColor
			end
			if item:IsA("MeshPart") then
				item.BrickColor = StatueColor
				item.TextureID = 0
			end
			if item:IsA("SpecialMesh") and item.Parent.Name ~= "Head" then
				item.TextureId = 0
			end
			if item:IsA("Shirt") or item:IsA("Pants") or item:IsA("ShirtGraphic") then
				item:Destroy()
			end
		end
		v.Parent = Model
		if pedclone:FindFirstChild("Primary") and pedclone.Primary.SurfaceGui then
			local Frame = pedclone.Primary.SurfaceGui.Frame
			local rank = v:FindFirstChild("Value")
			if rank then
				Frame.Rank.Text = rank.Value
			end
			Frame.User.Text = v.Name
		end
		pedclone.Parent = Model
	end
end

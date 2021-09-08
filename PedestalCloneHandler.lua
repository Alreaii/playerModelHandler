local charTable = {}
local newPeds = {}
local joint = {}

local startingPosition = Vector3.new(0, 0, 0)
local count = 0

for i, v in ipairs(game.ReplicatedStorage.Characters:GetChildren()) do
	if count <= 10 then
		local cloned = v:Clone() 
		local pedclone = game.ReplicatedStorage.Ped:Clone() 
			table.insert(charTable,cloned)
			table.insert(newPeds,pedclone)

		cloned.PrimaryPart.Anchored = true
		
		pedclone:SetPrimaryPartCFrame(CFrame.new(startingPosition + Vector3.new(30 * i, 1, 0) * CFrame.Angles(math.pi/2, 0, 0)))
		
		cloned.PrimaryPart.CFrame = CFrame.new(pedclone.PrimaryPart.Position + Vector3.new(0, 5, 0)) 
			table.insert(joint, {cloned, pedclone})

		cloned.Parent = game.Workspace
		pedclone.Parent = game.Workspace
		count += 1
	end
end

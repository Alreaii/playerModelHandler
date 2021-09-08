for _,v in pairs(game.ReplicatedStorage.Characters:GetChildren()) do
	local StringVal = Instance.new("StringValue")
	StringVal.Value = "Rank" -- this is what you want the SurfanceGUI to say on the pedestal
	StringVal.Parent = v
end

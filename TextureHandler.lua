for i,v in pairs(workspace:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Material = "Slate" -- change this to what you want
    -- you can add a bunch of stuff here like material, colour3, canassign, collidable whatever, just use the v. variable to assign the value
	end
end


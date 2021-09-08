local UseDisplayName = false -- rblx displaynames (keep this false unless u want a bunch of troll names)
local StatueSpacing = 5 -- vector3 spacing
--------------------------------------------------

-- https://groups.rprxy.xyz/v1/groups/7647/users?sortOrder=Asc&limit=100
-- https://groups.rprxy.xyz/v1/groups/7647/roles/580447/users
-- "role":{"id":30658,"name":"Intrinsic","rank":1}}
-- role":{"id":580417,"name":"Extraordinary","rank":2}
-- "role":{"id":580447,"name":"Outstanding","rank":3}}
-- "role":{"id":45232554,"name":"Honored Member","rank":5}}

-- above are json examples from my project which this was written for

local HttpService = game:GetService("HttpService")

local URL = "https://groups.rprxy.xyz/v1/groups/7647/users?sortOrder=Asc&limit=100" -- webproxy api used

local response = HttpService:GetAsync(URL)

local balls = HttpService:JSONDecode(response)

-- local newUrl = url .. tostring(value[nextPageCursor]) -- i never fixed this, have a go if you want, i just manally changed the url with the nextPageCursor
-- an example of a url containing a cursor would be https://groups.rprxy.xyz/v1/groups/7647/roles/30658/users?sortOrder=Asc&limit=100&cursor=18174782_1_f68c30e70c8bf896b007c8aa90a3e989
-- note the cursor=(string)
-- this is what you use to navigate to the next page


local Counter = 0
local FailedIds = {}

for index, value in pairs(balls.data) do 
	Counter += 1
	local success = pcall(function()
		print("[" .. tostring(Counter) .. "] Creating avatar for " .. value['userId'] .. " (" .. value['username'] .. ")")
		local avatar = game.Players:CreateHumanoidModelFromUserId(value['userId'])
		-- avatar.HumanoidRootPart.CFrame = (1, 2, 3)
		if UseDisplayName then
			avatar.Name = value['displayName']
		else
			avatar.Name = value['username']
		end
		avatar.Parent = workspace
		avatar:MoveTo(Vector3.new(Counter * StatueSpacing,5,0))
	end)

	if success == false then
		warn(value['userId'] .. " (" .. value['username'] .. ")")
		table.insert(FailedIds, value['userId'])
	end

	-- URL = URL .. value['nextPageCursor']
	-- print(URL) 
end

if #FailedIds > 0 then
	for i, val in pairs(FailedIds) do
		print(tostring(val))
	end
end


# playerModelHandler
Creates player humanoid models from group json data scraped from roblox api and cframes them onto a pedestal

written in Lua(u)

tutorial:
- grab ur group data using a api service (i use some rbx proxy since u cant use native rblx if ur using studio but any web proxy with api will work)
- load in all the characters using the avatar renderer
- put them all in ReplicatedStorage under a folder called Characters
- put ur pedestal in replicatedstorage as well
- make a model with 5 parts. Name them the ranks you want and place them accordingly, the statues will be generated on the left of the parts according to the rank. Etc if you want to render in the avatar for a rank called "hello" then you'd name the part hello. 
- change TagAssign to whatever rank you want
- run the rest of the code

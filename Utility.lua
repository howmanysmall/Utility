-- @author devSparkle
-- @author Narrev

local GetChildren = game.GetChildren

local function GetDescendants(Object)
    --- Like GetChildren, but returns a table with all Descendants

	assert(typeof(Object) == "Instance", "Object is not an Instance")
	local Descendants = GetChildren(Object)
	local NumDescendants = #Descendants
	local Count = 0

	repeat
		Count = Count + 1
		local GrandChildren = GetChildren(Descendants[Count])
		local NumGrandChildren = #GrandChildren
		for a = 1, NumGrandChildren do
			Descendants[NumDescendants + a] = GrandChildren[a]
		end
		NumDescendants = NumDescendants + NumGrandChildren
	until Count == NumDescendants

	return Descendants
end

local Utility = {
	GetChildren = GetChildren;
	GetDescendants = GetDescendants;
}

local Key = "CallOnChildren"
local GetFunction = GetChildren
for a = 1, 2 do
	Utility[Key] = function(Object, FunctionToCall)
		assert(typeof(Object) == "Instance", "Object is not an Instance")
		assert(type(FunctionToCall) == "function", "FunctionToCall is not a function")

		local Objects = GetFunction(Object)
		for a = 1, #Objects do
			FunctionToCall(Objects[a])
		end
	end
	Key = "CallOnDescendants"
	GetFunction = GetDescendants
end

return Utility

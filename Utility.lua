-- @author devSparkle
-- @author Narrev

local GetChildren = game.GetChildren

local function GetDescendants(Object)
    --- Like GetChildren, but returns a table with all Descendants
	
	if typeof(Object) == "Instance" then
		local Descendants = GetChildren(Object)
		local NumDescendants = #Descendants
		local Count = 0
		
		if NumDescendants > 0 then
			repeat
				Count = Count + 1
				local GrandChildren = GetChildren(Descendants[Count])
				local NumGrandChildren = #GrandChildren
				for a = 1, NumGrandChildren do
					Descendants[NumDescendants + a] = GrandChildren[a]
				end
				NumDescendants = NumDescendants + NumGrandChildren
			until Count == NumDescendants
		end
		
		return Descendants
	else
		error("Object is not an Instance")
	end
end

local Utility = {
	GetDescendants = GetDescendants;
}

for Key, GetFunction in next, {CallOnChildren = GetChildren, CallOnDescendants = GetDescendants} do
	Utility[Key] = function(Object, FunctionToCall)
		if typeof(Object) ~= "Instance" then
			error("Object is not an Instance")
		elseif type(FunctionToCall) ~= "function" then
			error("FunctionToCall is not a function")
		else
			local Objects = GetFunction(Object)
			for a = 1, #Objects do
				FunctionToCall(Objects[a])
			end
		end
	end
end

return Utility

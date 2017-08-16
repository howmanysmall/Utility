-- @author devSparkle
-- @author Validark

local GetChildren = game.GetChildren

local function GetDescendants(Object)
    --- Like GetChildren, but returns a table with all Descendants
	if typeof(Object) ~= "Instance" then error("[Utility] Object is not an Instance", 0) end
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

local function Retrieve(Parent, Name, Class)
	--- Finds an Instance in Parent by Name or generates a new Instance of Class with Name if none exists
	
	local Object, InstanceCreated = Parent:FindFirstChild(Name)
	
	if not Object then
		InstanceCreated = true
		Object = Instance.new(Class)
		Object.Name = Name
		Object.Parent = Parent
	end
	
	return Object, InstanceCreated
end

local Utility = {
	GetDescendants = GetDescendants;
	Retrieve = Retrieve;
}

for FunctionName, GetFunction in next, {CallOnChildren = GetChildren, CallOnDescendants = GetDescendants} do
	Utility[FunctionName] = function(Object, FunctionToCall)
		if typeof(Object) ~= "Instance" then error(("[Utility] bad argument #1 to '%s' (instance expected, got %s)"):format(FunctionName, typeof(Object):lower()), 0) end

		local Objects = GetFunction(Object)
		for a = 1, #Objects do
			FunctionToCall(Objects[a])
		end
	end
end

return Utility

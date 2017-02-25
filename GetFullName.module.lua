-- @author Validark
-- Gets the string of the directory of an object, properly formatted
-- Corrects the built-in GetFullName function so that it returns properly formatted text.

local gsub = string.gsub
local _GetFullName = workspace.GetFullName

function GetFullName(Object)
	return (gsub(gsub(gsub(gsub(_GetFullName(Object), "^Workspace", "workspace"), "%.(%w*%s%w*)", "%[\"%1\"%]"), "%.(%d+[%w%s]+)", "%[\"%1\"%]"), "%.(%d+)", "%[%1%]"))
end

return GetFullName

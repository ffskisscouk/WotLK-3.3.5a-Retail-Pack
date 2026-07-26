local _, ns = ...

-- Lua API
local pairs = pairs
local table_insert = table.insert

-- Shared enable/disable for replacement-based modules
local function ReplacementOnEnable(self)
	self:RegisterMessageReplacement(self.replacements, true)
end

local function ReplacementOnDisable(self)
	self:UnregisterMessageReplacement(self.replacements)
end

local ClassColors = ns:NewModule("ClassColors")

ClassColors.OnInitialize = function(self)
	self.replacements = {}

	local Colors = ns.Colors
	for class, color in pairs(Colors.blizzclass) do
		if color and color.colorCode and Colors.class[class] and Colors.class[class].colorCode then
			table_insert(self.replacements, { color.colorCode, Colors.class[class].colorCode })
		end
	end
end

ClassColors.OnEnable = ReplacementOnEnable
ClassColors.OnDisable = ReplacementOnDisable

local QualityColors = ns:NewModule("QualityColors")

QualityColors.OnInitialize = function(self)
	self.replacements = {}

	local Colors = ns.Colors
	for i, color in pairs(Colors.blizzquality) do
		if color and color.colorCode and Colors.quality[i] and Colors.quality[i].colorCode then
			table_insert(self.replacements, { color.colorCode, Colors.quality[i].colorCode })
		end
	end
end

QualityColors.OnEnable = ReplacementOnEnable
QualityColors.OnDisable = ReplacementOnDisable

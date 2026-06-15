-- ============================================================================
-- DragonUI - Text Formatting Utilities
-- Keybind text abbreviation, number formatting, and display helpers.
-- ============================================================================

local addon = select(2,...);
local config = addon.config;
local pairs = pairs;
local floor = math.floor;
local format = string.format;
local gsub = string.gsub;

local GetKeyText
do
	local keyButton = gsub(KEY_BUTTON4, '%d', '')
	local keyNumpad = gsub(KEY_NUMPAD1, '%d', '')
	local displaySubs = {
		{ '('..keyButton..')', 'M' },
		{ '('..keyNumpad..')', 'N' },
		{ '(a%-)', 'a' },
		{ '(c%-)', 'c' },
		{ '(s%-)', 's' },
		{ KEY_BUTTON3, 'M3' },
		{ KEY_MOUSEWHEELUP, 'MU' },
		{ KEY_MOUSEWHEELDOWN, 'MD' },
		{ KEY_SPACE, 'BAR' },
		{ CAPSLOCK_KEY_TEXT, 'CL' },
		{ KEY_NUMLOCK, 'NL' },
		{ 'BUTTON', 'M' },
		{ 'NUMPAD', 'N' },
		{ '(ALT%-)', 'a' },
		{ '(CTRL%-)', 'c' },
		{ '(SHIFT%-)', 's' },
		{ 'MOUSEWHEELUP', 'MU' },
		{ 'MOUSEWHEELDOWN', 'MD' },
		{ 'SPACE', 'BAR' },
		{ '0 (цифр. кл.)', 'N0' },
		{ '1 (цифр. кл.)', 'N1' },
		{ '2 (цифр. кл.)', 'N2' },
		{ '3 (цифр. кл.)', 'N3' },
		{ '4 (цифр. кл.)', 'N4' },
		{ '5 (цифр. кл.)', 'N5' },
	};

	-- returns formatted key for text.
	-- @param key - a hotkey name
	function GetKeyText(key)
		if not key then return '' end
		for _,value in pairs(displaySubs) do
			key = gsub(key, value[1], value[2])
		end
		return key or error('invalid key string: '..tostring(key))
	end
end
addon.GetKeyText = GetKeyText


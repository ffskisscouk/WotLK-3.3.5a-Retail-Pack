local defaultWords = { "wts", "wtb", "recruting", "lfw" }
local messageLog = {}
local lastMessage = 0

if not words then words = {} end
if #words == 0 then words = defaultWords end

if not verbose then verbose = false end

local function UnitIsFriend(name)
	for i = 1, GetNumFriends() do
		if name == GetFriendInfo(i) then
			return true
		end
	end
	return false
end

local function GetStatusMessage(active) 
	if (active) then return "|cff00ff00active|r" else return "|cffff0000disabled|r" end
end

local function GetVerboseMessage()
	if (verbose) then return "|cff00ff00shown|r" else return "|cffff0000hidden|r" end
end

local function AddLog(player, msg)
	if verbose and lastMessage + 2 <= GetTime() then
		print("|cff00ffffChat Filter:|r Filtered a message from", player) 
		lastMessage = GetTime()
	end
	local message = format("|cffd3d3d3[%s]|r: %s", player, msg)
	if not tContains(messageLog, message) then
		table.insert(messageLog, 0, message)
	end
	if #messageLog > 20 then
		table.remove(messageLog, #messageLog)
	end
end

local function DisplayLog(n)
	if #messageLog == 0 then
		print("|cff00ffffChat Filter:|r The message log is empty")
	else
		local cnt
		if n > #messageLog then cnt = #messageLog else cnt = n end
		print("|cff00ffffChat Filter:|r Displaying the last", cnt, "messages")
		for i = 1, cnt do
			print("|cffd3d3d3" .. i .. "|r." .. messageLog[i])
		end
	end
end

local function ChatFilter(self, event, msg, player, ...)
	if not active or UnitIsInMyGuild(player) or UnitIsFriend(player) or UnitInRaid(player) or UnitInParty(player) then
		return false
	end
	local temp = strlower(msg)
	for i = 1, #words do
		if temp:find(strlower(words[i])) then
			AddLog(player, msg)
			return true
		end
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", ChatFilter)
--ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", ChatFilter)

-- Slash command handler
SLASH_CHATFILTER1, SLASH_CHATFILTER2 = "/chatfilter", "/cf"
SlashCmdList["CHATFILTER"] = function(msg)
	local cmd, arg1 = strsplit(" ",msg,2)
	if cmd == "toggle" then
		active = not active
		local status = GetStatusMessage(active)
		print("-- |cff00ffffChat Filter|r is now " .. status)
	elseif cmd == "words" then
		--local output = ""
		print("-- |cff00ffffChat Filter|r keywords:")
	    for i = 1, #words do
		--	output = output .. "|cff00ffff" .. i .. "|r \"" .. words[i] .. "\"  "
			print("-- |cff00ffff" .. i .. "|r \"" .. words[i] .. "\"")
		end
		--print(output)
	elseif cmd == "add" and arg1 then
		table.insert(words, arg1)
		print("-- Word " .. "\"|cff00ffff" .. arg1 .. "|r\" added succesfully" )
	elseif cmd == "remove" and arg1 then
		if not strmatch(arg1,"%d") then print("-- Input is not a number") return end
		if tonumber(arg1) > #words then print("-- Index is out of range. Max value is |cff00ffff" .. #words .. "|r") return end
		print("-- Word " .. "\"|cff00ffff" .. words[tonumber(arg1)] .. "|r\" removed successfully")
		table.remove(words, arg1)
	elseif cmd == "verbose" then
		verbose = not verbose
		print("-- Notifications will be " .. GetVerboseMessage())
	elseif cmd == "log" then
		if arg1 then
			if not strmatch(arg1,"%d") then print("-- Input is not a number") return end
			DisplayLog(tonumber(arg1))
		else
			DisplayLog(10)
		end
	elseif cmd == "default" then
		words = defaultWords
		print("-- Keywords was set to |cff00ffffdefault|r")
	else 
		local status = GetStatusMessage(active)
		print("|cff00ffffChat Filter|r is " .. status)
		print("/cf toggle - Turn filter |cff00ff00on|r / |cffff0000off|r")
		print("/cf words - View filter keywords (case-insensitive)")
		print("/cf add [|cff00ffffword|r] - Add |cff00ffffkeyword|r")
		print("/cf remove [|cff00ffffpos|r] - Remove keyword by |cff00ffffposition|r")
		print("/cf verbose - Show or hide filter notifications")
		print("/cf log [|cff00ffffn|r] - View the last |cff00ffffn|r filtered messages (up to 20)")
		print("/cf default - Set keywords to default")
	end
end
local _, ns = ...

local Module = ns:NewModule("BossMessages")

-- Lua API
local string_format = string.format

-- This module prettifies boss emote and boss whisper messages
-- by making them more visually distinct and cleaner

Module.OnChatEvent = function(_, _, event, message, author, ...)
	if not message then
		return
	end

	if event == "CHAT_MSG_MONSTER_EMOTE" or event == "CHAT_MSG_RAID_BOSS_EMOTE" then
		-- Format boss emotes with distinct color
		return false, string_format(ns.out.boss_emote, message), author, ...
	end

	if event == "CHAT_MSG_MONSTER_WHISPER" or event == "CHAT_MSG_RAID_BOSS_WHISPER" then
		-- Format boss whispers with distinct color
		return false, string_format(ns.out.boss_whisper, message), author, ...
	end
end

-- Proxy function for message event filter
local onChatEventProxy = function(...)
	return Module:OnChatEvent(...)
end

Module.OnEnable = function(self)
	self:RegisterMessageEventFilter("CHAT_MSG_MONSTER_EMOTE", onChatEventProxy)
	self:RegisterMessageEventFilter("CHAT_MSG_RAID_BOSS_EMOTE", onChatEventProxy)
	self:RegisterMessageEventFilter("CHAT_MSG_MONSTER_WHISPER", onChatEventProxy)
	self:RegisterMessageEventFilter("CHAT_MSG_RAID_BOSS_WHISPER", onChatEventProxy)
end

Module.OnDisable = function(self)
	self:UnregisterMessageEventFilter("CHAT_MSG_MONSTER_EMOTE", onChatEventProxy)
	self:UnregisterMessageEventFilter("CHAT_MSG_RAID_BOSS_EMOTE", onChatEventProxy)
	self:UnregisterMessageEventFilter("CHAT_MSG_MONSTER_WHISPER", onChatEventProxy)
	self:UnregisterMessageEventFilter("CHAT_MSG_RAID_BOSS_WHISPER", onChatEventProxy)
end

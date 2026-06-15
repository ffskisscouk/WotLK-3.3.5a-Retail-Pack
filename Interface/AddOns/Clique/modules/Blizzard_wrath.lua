--[[-------------------------------------------------------------------------
-- Blizzard_wrath.lua
--
-- This file contains the definitions of the blizzard frame integration
-- options. These settings will not apply until the user interface is
-- reloaded.
--
-- Events registered:
--   * ADDON_LOADED - To watch for loading of the ArenaUI
-------------------------------------------------------------------------]]--

local addonName, addon = ...
local L = addon.L

--addon:Printf("Loading Blizzard_wrath integration")

local waitForAddon

function addon:IntegrateBlizzardFrames()
    self:Wrath_BlizzSelfFrames()
    self:Wrath_BlizzPartyFrames()
    self:Wrath_BlizzBossFrames()

    if IsAddOnLoaded("CompactRaidFrame") then
        self:Wrath_BlizzCompactUnitFrames()
    else
    	waitForAddon = CreateFrame("Frame")
        waitForAddon["CompactRaidFrame"] = "Wrath_BlizzCompactUnitFrames"
    end

    if waitForAddon then
        waitForAddon:RegisterEvent("ADDON_LOADED")
        waitForAddon:SetScript("OnEvent", function(frame, event, ...)
            if waitForAddon[...] then
                self[waitForAddon[...]](self)
            end
        end)

        if not next(waitForAddon) then
            waitForAddon:UnregisterEvent("ADDON_LOADED")
            waitForAddon:SetScript("OnEvent", nil)
        end
    end
end

function addon:Wrath_BlizzCompactUnitFrames()
    if not addon.settings.blizzframes.compactraid then
        return
    end

    hooksecurefunc("CompactUnitFrame_SetUpFrame", function(frame, ...)
        --[[for i = 1, 3 do
            local buffFrame = frame.BuffFrame

            if buffFrame then
                addon:RegisterBlizzardFrame(buffFrame)
            end
        end]]

        addon:RegisterBlizzardFrame(frame)
    end)
end

function addon:Wrath_BlizzSelfFrames()
    local frames = {
        "PlayerFrame",
        "PetFrame",
        "TargetFrame",
        "TargetFrameToT",
    }

    -- Add focus frames for Wrath
    table.insert(frames, "FocusFrame")
    table.insert(frames, "FocusFrameToT")

    for idx, frame in ipairs(frames) do
        if addon.settings.blizzframes[frame] then
            addon:RegisterBlizzardFrame(frame)
        end
    end
end

function addon:Wrath_BlizzPartyFrames()
    if not addon.settings.blizzframes.party then
        return
    end

    local frames = {
        "PartyMemberFrame1",
		"PartyMemberFrame2",
		"PartyMemberFrame3",
		"PartyMemberFrame4",
        --"PartyMemberFrame5",
		"PartyMemberFrame1PetFrame",
		"PartyMemberFrame2PetFrame",
		"PartyMemberFrame3PetFrame",
        "PartyMemberFrame4PetFrame",
        --"PartyMemberFrame5PetFrame",
    }
    for idx, frame in ipairs(frames) do
        addon:RegisterBlizzardFrame(frame)
    end
end


function addon:Wrath_BlizzBossFrames()
    if not addon.settings.blizzframes.boss then
        return
    end

    local frames = {
        "Boss1TargetFrame",
        "Boss2TargetFrame",
        "Boss3TargetFrame",
        "Boss4TargetFrame",
    }
    for idx, frame in ipairs(frames) do
        addon:RegisterBlizzardFrame(frame)
    end
end

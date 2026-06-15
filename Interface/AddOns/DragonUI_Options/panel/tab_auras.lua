--[[
================================================================================
DragonUI Options Panel - Auras Tab
================================================================================
Weapon enchant separation options.
================================================================================
]]

local addon = DragonUI
if not addon then return end

local L = addon.L
local LO = addon.LO
local C = addon.PanelControls
local Panel = addon.OptionsPanel

-- ============================================================================
-- AURAS TAB BUILDER
-- ============================================================================

local function BuildAurasTab(scroll)
    -- ====================================================================
    -- WEAPON ENCHANTS
    -- ====================================================================
    local weaponSection = C:AddSection(scroll, LO["Weapon Enchants"])

    C:AddDescription(weaponSection,
        LO["Weapon enchant icons include rogue poisons, sharpening stones, wizard oils, and similar temporary weapon enhancements."])

    C:AddToggle(weaponSection, {
        label = LO["Separate Weapon Enchants"],
        desc = LO["Detach weapon enchant icons (poisons, sharpening stones, etc.) from the buff bar into their own independently moveable frame. Position it freely using Editor Mode."],
        getFunc = function()
            return addon.db.profile.buffs and addon.db.profile.buffs.separate_weapon_enchants
        end,
        setFunc = function(val)
            if not addon.db.profile.buffs then addon.db.profile.buffs = {} end
            addon.db.profile.buffs.separate_weapon_enchants = val
        end,
        callback = function(val)
            if addon.BuffFrameModule then
                addon.BuffFrameModule:ToggleWeaponEnchantSeparation(val)
            end
        end,
        requiresReload = false,
    })

    C:AddDescription(weaponSection,
        "|cff888888" .. LO["When enabled, a 'Weapon Enchants' mover appears in Editor Mode that you can drag to any position on screen."] .. "|r")

    -- ====================================================================
    -- RESET POSITION
    -- ====================================================================
    C:AddSpacer(scroll)
    local resetSection = C:AddSection(scroll, LO["Positions"])

    C:AddButton(resetSection, {
        label = LO["Reset Buff Frame Position"],
        width = 220,
        callback = function()
            if addon.db.profile.widgets and addon.db.profile.widgets.buffs then
                local w = addon.db.profile.widgets.buffs
                w.anchor = "TOPRIGHT"
                w.posX = -270
                w.posY = -15
                w.custom_position = false
            end
            if addon.BuffFrameModule then
                addon.BuffFrameModule:UpdatePosition()
            end
            print("|cFF00FF00[DragonUI]|r " .. LO["Buff frame position reset."])
        end,
    })

    C:AddButton(resetSection, {
        label = LO["Reset Weapon Enchant Position"],
        width = 220,
        callback = function()
            if addon.db.profile.widgets and addon.db.profile.widgets.weapon_enchants then
                local w = addon.db.profile.widgets.weapon_enchants
                w.anchor = "TOPRIGHT"
                w.posX = -100
                w.posY = -15
                w.custom_position = false
            end
            if addon.BuffFrameModule then
                addon.BuffFrameModule:UpdateWeaponEnchantPosition()
            end
            print("|cFF00FF00[DragonUI]|r " .. LO["Weapon enchant position reset."])
        end,
    })
end

-- Register the tab (order 12 — after Enhancements, before Profiles)
Panel:RegisterTab("auras", LO["Auras"], BuildAurasTab, 12)

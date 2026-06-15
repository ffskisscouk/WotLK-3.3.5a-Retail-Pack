--[[
================================================================================
DragonUI Options Panel - Micro Menu Tab
================================================================================
Micro menu, bags, XP/rep bars, additional bars.
================================================================================
]]

local addon = DragonUI
if not addon then return end

local L = addon.L
local LO = addon.LO
local C = addon.PanelControls
local Panel = addon.OptionsPanel

-- ============================================================================
-- MICRO MENU TAB BUILDER
-- ============================================================================

local function BuildMicromenuTab(scroll)
    -- ====================================================================
    -- MICRO MENU
    -- ====================================================================
    local menu = C:AddSection(scroll, LO["Micro Menu"])

    C:AddToggle(menu, {
        label = LO["Grayscale Icons"],
        desc = LO["Use grayscale icons instead of colored icons."],
        dbPath = "micromenu.grayscale_icons",
        requiresReload = true,
    })

    -- Mode-aware scale
    local modeKey = function()
        return (C:GetDBValue("micromenu.grayscale_icons") and "grayscale" or "normal")
    end

    C:AddSlider(menu, {
        label = LO["Menu Scale"],
        getFunc = function()
            return C:GetDBValue("micromenu." .. modeKey() .. ".scale_menu")
        end,
        setFunc = function(val)
            C:SetDBValue("micromenu." .. modeKey() .. ".scale_menu", val)
            if addon.RefreshMicromenu then addon.RefreshMicromenu() end
        end,
        min = 0.5, max = 3.0, step = 0.01,
        width = 200,
    })

    C:AddSlider(menu, {
        label = LO["Icon Spacing"],
        getFunc = function()
            return C:GetDBValue("micromenu." .. modeKey() .. ".icon_spacing")
        end,
        setFunc = function(val)
            C:SetDBValue("micromenu." .. modeKey() .. ".icon_spacing", val)
            if addon.RefreshMicromenu then addon.RefreshMicromenu() end
        end,
        min = 5, max = 40, step = 1,
        width = 200,
    })

    C:AddToggle(menu, {
        label = LO["Hide on Vehicle"],
        desc = LO["Hide micromenu and bags while in a vehicle."],
        dbPath = "micromenu.hide_on_vehicle",
        callback = function()
            if addon.RefreshMicromenuVehicle then addon.RefreshMicromenuVehicle() end
            if addon.RefreshBagsVehicle then addon.RefreshBagsVehicle() end
        end,
    })

    C:AddToggle(menu, {
        label = LO["Show Latency Indicator"],
        desc = LO["Show a colored bar below the Help button indicating connection quality (green/yellow/red). Requires UI reload."],
        dbPath = "micromenu.show_latency_indicator",
        callback = function()
            StaticPopup_Show("DRAGONUI_RELOAD_UI")
        end,
    })

end

-- Register the tab
Panel:RegisterTab("micromenu", LO["Micro Menu"], BuildMicromenuTab, 9)

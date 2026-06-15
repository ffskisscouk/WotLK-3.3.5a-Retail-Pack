--[[
================================================================================
DragonUI Options Panel - Minimap Tab
================================================================================
Minimap scale, tracking, clock, display settings.
================================================================================
]]

local addon = DragonUI
if not addon then return end

local L = addon.L
local LO = addon.LO
local C = addon.PanelControls
local Panel = addon.OptionsPanel

-- ============================================================================
-- MINIMAP TAB BUILDER
-- ============================================================================

local function RefreshMinimap()
    if addon.MinimapModule then
        addon.MinimapModule:UpdateSettings()
    end
end

local function BuildMinimapTab(scroll)
    -- ====================================================================
    -- BASIC SETTINGS
    -- ====================================================================
    local basic = C:AddSection(scroll, LO["Basic Settings"])

    C:AddSlider(basic, {
        label = LO["Scale"],
        dbPath = "minimap.scale",
        min = 0.5, max = 2.0, step = 0.01,
        width = 200,
        callback = RefreshMinimap,
    })

    C:AddSlider(basic, {
        label = LO["Border Alpha"],
        desc = LO["Top border alpha (0 to hide)."],
        dbPath = "minimap.border_alpha",
        min = 0, max = 1, step = 0.1,
        width = 200,
        callback = function()
            local val = C:GetDBValue("minimap.border_alpha") or 1
            if MinimapBorderTop then MinimapBorderTop:SetAlpha(val) end
        end,
    })

    local fadeToggle  -- forward reference for disabled-state refresh

    C:AddToggle(basic, {
        label = LO["Addon Button Skin"],
        desc = LO["Apply DragonUI border styling to addon icons."],
        dbPath = "minimap.addon_button_skin",
        callback = function()
            if addon.RefreshMinimap then addon:RefreshMinimap() end
        end,
    })

    fadeToggle = C:AddToggle(basic, {
        label = LO["Addon Button Fade"],
        desc = LO["Addon icons fade out when not hovered."],
        dbPath = "minimap.addon_button_fade",
        callback = function()
            if addon.RefreshMinimap then addon:RefreshMinimap() end
        end,
    })

    C:AddToggle(basic, {
        label = LO["New Blip Style"],
        desc = LO["Use newer-style minimap blip icons."],
        dbPath = "minimap.blip_skin",
        callback = RefreshMinimap,
    })

    C:AddSlider(basic, {
        label = LO["Player Arrow Size"],
        dbPath = "minimap.player_arrow_size",
        min = 8, max = 50, step = 1,
        width = 200,
        callback = RefreshMinimap,
    })

    -- ====================================================================
    -- TIME & CALENDAR
    -- ====================================================================
    local time = C:AddSection(scroll, LO["Time & Calendar"])

    C:AddToggle(time, {
        label = LO["Show Clock"],
        dbPath = "minimap.clock",
        callback = RefreshMinimap,
    })

    C:AddToggle(time, {
        label = LO["Show Calendar"],
        dbPath = "minimap.calendar",
        callback = function()
            local val = C:GetDBValue("minimap.calendar")
            if GameTimeFrame then
                if val then GameTimeFrame:Show() else GameTimeFrame:Hide() end
            end
        end,
    })

    C:AddSlider(time, {
        label = LO["Clock Font Size"],
        dbPath = "minimap.clock_font_size",
        min = 8, max = 20, step = 1,
        width = 200,
        callback = RefreshMinimap,
    })

    -- ====================================================================
    -- DISPLAY SETTINGS
    -- ====================================================================
    local display = C:AddSection(scroll, LO["Display Settings"])

    C:AddToggle(display, {
        label = LO["Tracking Icons"],
        desc = LO["Show current tracking icons (old style)."],
        dbPath = "minimap.tracking_icons",
        callback = function()
            if addon.MinimapModule then addon.MinimapModule:UpdateTrackingIcon() end
        end,
    })

    C:AddToggle(display, {
        label = LO["Zoom Buttons"],
        desc = LO["Show zoom buttons (+/-)."],
        dbPath = "minimap.zoom_buttons",
        callback = RefreshMinimap,
    })

    C:AddSlider(display, {
        label = LO["Zone Text Font Size"],
        desc = LO["Font size of the zone text above the minimap."],
        dbPath = "minimap.zonetext_font_size",
        min = 8, max = 20, step = 1,
        width = 200,
        callback = RefreshMinimap,
    })

    -- ====================================================================
    -- SEXYMAP COMPATIBILITY  (only when SexyMap is installed)
    -- ====================================================================
    if addon._sexyMapInstalled then
        local sm = C:AddSection(scroll, L["SexyMap Compatibility"])

        C:AddDescription(sm,
            L["Choose how DragonUI and SexyMap share the minimap."])

        C:AddDropdown(sm, {
            label = L["Minimap Mode"],
            values = {
                ["sexymap"]  = L["SexyMap"],
                ["dragonui"] = L["DragonUI"],
                ["hybrid"]   = L["Hybrid"],
            },
            width = 220,
            getFunc = function()
                local cfg = addon.db and addon.db.profile and addon.db.profile.modules
                    and addon.db.profile.modules.minimap
                return cfg and cfg.sexymap_mode or "dragonui"
            end,
            setFunc = function(val)
                if addon.db and addon.db.profile and addon.db.profile.modules
                    and addon.db.profile.modules.minimap then
                    addon.db.profile.modules.minimap.sexymap_mode = val
                end
                -- Enable/Disable the SexyMap addon at the WoW level so it
                -- actually loads (or doesn't) after the UI reload
                if val == "dragonui" then
                    DisableAddOn("SexyMap")
                else
                    -- "sexymap" or "hybrid" both need SexyMap loaded
                    EnableAddOn("SexyMap")
                end
                StaticPopup_Show("DRAGONUI_SEXYMAP_MODE_RELOAD")
            end,
        })

        C:AddDescription(sm,
            "|cFF888888" .. L["SexyMap"] .. ":|r " .. L["Uses SexyMap for the minimap."] .. "\n" ..
            "|cFF888888" .. L["DragonUI"] .. ":|r " .. L["Uses DragonUI for the minimap."] .. "\n" ..
            "|cFF888888" .. L["Hybrid"] .. ":|r " .. L["SexyMap visuals with DragonUI editor and positioning."])
    end
end

-- Register the tab
Panel:RegisterTab("minimap", LO["Minimap"], BuildMinimapTab, 8)

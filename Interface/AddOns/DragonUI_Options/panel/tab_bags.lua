--[[
================================================================================
DragonUI Options Panel - Bags Tab
================================================================================
Combuctor settings: enable/disable, category tabs, left/right side filter.
================================================================================
]]

local addon = DragonUI
if not addon then return end

local L = addon.L
local LO = addon.LO
local C = addon.PanelControls
local Panel = addon.OptionsPanel

-- ============================================================================
-- HELPERS
-- ============================================================================

local function GetCombuctorDB()
    local mc = addon.db.profile.modules and addon.db.profile.modules.combuctor
    return mc and mc.db
end

local function IsCombuctorEnabled()
    local mc = addon.db.profile.modules and addon.db.profile.modules.combuctor
    return mc and mc.enabled
end

local function HasSetInDB(setName)
    local db = GetCombuctorDB()
    if not db or not db.inventory or not db.inventory.sets then return false end
    for _, s in ipairs(db.inventory.sets) do
        if s == setName then return true end
    end
    return false
end

local function HasBankSetInDB(setName)
    local db = GetCombuctorDB()
    if not db or not db.bank or not db.bank.sets then return false end
    for _, s in ipairs(db.bank.sets) do
        if s == setName then return true end
    end
    return false
end

local function ToggleSetInList(sets, setName, enabled)
    if not sets then return end
    if enabled then
        local found = false
        for _, s in ipairs(sets) do
            if s == setName then found = true; break end
        end
        if not found then
            if setName == (ALL or "All") then
                table.insert(sets, 1, setName)
            else
                table.insert(sets, setName)
            end
        end
    else
        for i = #sets, 1, -1 do
            if sets[i] == setName then
                table.remove(sets, i)
            end
        end
    end
end

local function ToggleInventorySet(setName, enabled)
    local db = GetCombuctorDB()
    if db and db.inventory then
        ToggleSetInList(db.inventory.sets, setName, enabled)
    end
    if addon.RefreshCombuctorFrames then
        addon.RefreshCombuctorFrames()
    end
end

local function ToggleBankSet(setName, enabled)
    local db = GetCombuctorDB()
    if db and db.bank then
        ToggleSetInList(db.bank.sets, setName, enabled)
    end
    if addon.RefreshCombuctorFrames then
        addon.RefreshCombuctorFrames()
    end
end

-- Subtab exclude helpers
local function IsSubtabExcluded(key, parentName, childName)
    local db = GetCombuctorDB()
    if not db or not db[key] or not db[key].exclude then return false end
    local list = db[key].exclude[parentName]
    if not list then return false end
    for _, name in ipairs(list) do
        if name == childName then return true end
    end
    return false
end

local function ToggleSubtab(parentName, childName, enabled)
    local db = GetCombuctorDB()
    if not db then return end
    for _, key in ipairs({"inventory", "bank"}) do
        if db[key] then
            if not db[key].exclude then db[key].exclude = {} end
            if enabled then
                local list = db[key].exclude[parentName]
                if list then
                    for i = #list, 1, -1 do
                        if list[i] == childName then table.remove(list, i) end
                    end
                    if #list == 0 then db[key].exclude[parentName] = nil end
                end
            else
                if not db[key].exclude[parentName] then db[key].exclude[parentName] = {} end
                local list = db[key].exclude[parentName]
                local found = false
                for _, name in ipairs(list) do
                    if name == childName then found = true; break end
                end
                if not found then table.insert(list, childName) end
            end
        end
    end

    if addon.RefreshCombuctorFrames then
        addon.RefreshCombuctorFrames()
    end
end

-- ============================================================================
-- TAB BUILDER
-- ============================================================================

local function BuildBagsTab(scroll)
    C:AddLabel(scroll, "|cffFFD700" .. LO["Bags"] .. "|r", { color = C.Theme.textGold })
    C:AddDescription(scroll, LO["Configure Combuctor bag replacement settings."])
    C:AddSpacer(scroll)

    -- ====================================================================
    -- BAG BAR
    -- ====================================================================
    local bagBarSection = C:AddSection(scroll, LO["Bags"])

    C:AddSlider(bagBarSection, {
        label = LO["Bag Bar Scale"],
        dbPath = "bags.scale",
        min = 0.5, max = 2.0, step = 0.01,
        width = 200,
        callback = function()
            if addon.RefreshBagsPosition then addon.RefreshBagsPosition() end
        end,
    })

    -- ====================================================================
    -- COMBUCTOR ENABLE
    -- ====================================================================
    local mainSection = C:AddSection(scroll, LO["Combuctor"])

    C:AddToggle(mainSection, {
        label = LO["Enable Combuctor"],
        desc = LO["All-in-one bag replacement with item filtering, search, quality indicators, and bank integration."],
        getFunc = function() return IsCombuctorEnabled() end,
        setFunc = function(val)
            if not addon.db.profile.modules then addon.db.profile.modules = {} end
            if not addon.db.profile.modules.combuctor then addon.db.profile.modules.combuctor = {} end
            addon.db.profile.modules.combuctor.enabled = val
        end,
        requiresReload = true,
    })

    -- ====================================================================
    -- BAG SORT
    -- ====================================================================
    local sortSection = C:AddSection(scroll, LO["Bag Sort"] or "Bag Sort")
    C:AddDescription(sortSection, LO["Sort buttons for bags and bank. Sorts items by type, rarity, level, and name."] or "Sort buttons for bags and bank. Sorts items by type, rarity, level, and name.")

    C:AddToggle(sortSection, {
        label = LO["Enable Bag Sort"] or "Enable Bag Sort",
        desc = LO["Add sort buttons to bag and bank frames. Also enables /sort and /sortbank slash commands."] or "Add sort buttons to bag and bank frames. Also enables /sort and /sortbank slash commands.",
        getFunc = function()
            local mc = addon.db.profile.modules and addon.db.profile.modules.bagsort
            return mc and mc.enabled
        end,
        setFunc = function(val)
            if not addon.db.profile.modules then addon.db.profile.modules = {} end
            if not addon.db.profile.modules.bagsort then addon.db.profile.modules.bagsort = {} end
            addon.db.profile.modules.bagsort.enabled = val
        end,
        requiresReload = true,
    })

    -- ====================================================================
    -- INVENTORY CATEGORY TABS
    -- ====================================================================
    local tabSection = C:AddSection(scroll, LO["Inventory Tabs"])
    C:AddDescription(tabSection, LO["Choose which category tabs appear on the inventory bag frame."])

    -- "All" tab
    C:AddToggle(tabSection, {
        label = LO["Show 'All' Tab"],
        desc = LO["Show the 'All' category tab that displays all items without filtering."],
        getFunc = function() return HasSetInDB(ALL or "All") end,
        setFunc = function(val) ToggleInventorySet(ALL or "All", val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    -- Category tabs (matching KPack Combuctor set names)
    local Equipment = LO["Equipment"]
    local Usable = LO["Usable"]
    local Weapon, Armor, _, Consumable, _, TradeGood, _, _, Recipe, Gem, Misc, Quest = GetAuctionItemClasses()
    local Devices = select(10, GetAuctionItemSubClasses(6))

    C:AddToggle(tabSection, {
        label = LO["Show Equipment Tab"],
        desc = LO["Show the Equipment category tab for armor and weapons."],
        getFunc = function() return HasSetInDB(Equipment) end,
        setFunc = function(val) ToggleInventorySet(Equipment, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    -- Usable
    C:AddToggle(tabSection, {
        label = LO["Show Usable Tab"],
        desc = LO["Show the Usable category tab for consumables and devices."],
        getFunc = function() return HasSetInDB(Usable) end,
        setFunc = function(val) ToggleInventorySet(Usable, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    -- Quest
    C:AddToggle(tabSection, {
        label = LO["Show Quest Tab"],
        desc = LO["Show the Quest items category tab."],
        getFunc = function() return HasSetInDB(Quest) end,
        setFunc = function(val) ToggleInventorySet(Quest, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    -- Trade Goods
    C:AddToggle(tabSection, {
        label = LO["Show Trade Goods Tab"],
        desc = LO["Show the Trade Goods category tab (includes gems and recipes)."],
        getFunc = function() return HasSetInDB(TradeGood) end,
        setFunc = function(val) ToggleInventorySet(TradeGood, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    -- Miscellaneous
    C:AddToggle(tabSection, {
        label = LO["Show Miscellaneous Tab"],
        desc = LO["Show the Miscellaneous items category tab."],
        getFunc = function() return HasSetInDB(Misc) end,
        setFunc = function(val) ToggleInventorySet(Misc, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    -- ====================================================================
    -- BANK CATEGORY TABS
    -- ====================================================================
    local bankSection = C:AddSection(scroll, LO["Bank Tabs"])
    C:AddDescription(bankSection, LO["Choose which category tabs appear on the bank frame."])

    C:AddToggle(bankSection, {
        label = LO["Show 'All' Tab"],
        desc = LO["Show the 'All' category tab that displays all items without filtering."],
        getFunc = function() return HasBankSetInDB(ALL or "All") end,
        setFunc = function(val) ToggleBankSet(ALL or "All", val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    C:AddToggle(bankSection, {
        label = LO["Show Equipment Tab"],
        desc = LO["Show the Equipment category tab for armor and weapons."],
        getFunc = function() return HasBankSetInDB(Equipment) end,
        setFunc = function(val) ToggleBankSet(Equipment, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    C:AddToggle(bankSection, {
        label = LO["Show Usable Tab"],
        desc = LO["Show the Usable category tab for consumables and devices."],
        getFunc = function() return HasBankSetInDB(Usable) end,
        setFunc = function(val) ToggleBankSet(Usable, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    C:AddToggle(bankSection, {
        label = LO["Show Quest Tab"],
        desc = LO["Show the Quest items category tab."],
        getFunc = function() return HasBankSetInDB(Quest) end,
        setFunc = function(val) ToggleBankSet(Quest, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    C:AddToggle(bankSection, {
        label = LO["Show Trade Goods Tab"],
        desc = LO["Show the Trade Goods category tab (includes gems and recipes)."],
        getFunc = function() return HasBankSetInDB(TradeGood) end,
        setFunc = function(val) ToggleBankSet(TradeGood, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    C:AddToggle(bankSection, {
        label = LO["Show Miscellaneous Tab"],
        desc = LO["Show the Miscellaneous items category tab."],
        getFunc = function() return HasBankSetInDB(Misc) end,
        setFunc = function(val) ToggleBankSet(Misc, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    -- ====================================================================
    -- SUBTABS (BOTTOM FILTER TABS)
    -- ====================================================================
    local subtabSection = C:AddSection(scroll, LO["Subtabs"])
    C:AddDescription(subtabSection, LO["Configure which bottom subtabs appear within each category tab. Applies to both inventory and bank."])

    -- "All" category subtabs
    C:AddLabel(subtabSection, "|cffAAAAAA" .. (ALL or LO["All"]) .. "|r")
    C:AddToggle(subtabSection, {
        label = LO["Normal"],
        desc = LO["Show the Normal bags subtab (non-profession bags)."],
        getFunc = function() return not IsSubtabExcluded("inventory", ALL or LO["All"], "Normal") end,
        setFunc = function(val) ToggleSubtab(ALL or LO["All"], "Normal", val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })
    C:AddToggle(subtabSection, {
        label = LO["Trade Bags"],
        desc = LO["Show the Trade bags subtab (profession bags)."],
        getFunc = function() return not IsSubtabExcluded("inventory", ALL or LO["All"], "Trade") end,
        setFunc = function(val) ToggleSubtab(ALL or LO["All"], "Trade", val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    -- Equipment subtabs
    C:AddLabel(subtabSection, "|cffAAAAAA" .. Equipment .. "|r")
    C:AddToggle(subtabSection, {
        label = Armor,
        desc = LO["Show the Armor subtab."],
        getFunc = function() return not IsSubtabExcluded("inventory", Equipment, Armor) end,
        setFunc = function(val) ToggleSubtab(Equipment, Armor, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })
    C:AddToggle(subtabSection, {
        label = Weapon,
        desc = LO["Show the Weapon subtab."],
        getFunc = function() return not IsSubtabExcluded("inventory", Equipment, Weapon) end,
        setFunc = function(val) ToggleSubtab(Equipment, Weapon, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })
    C:AddToggle(subtabSection, {
        label = INVTYPE_TRINKET,
        desc = LO["Show the Trinket subtab."],
        getFunc = function() return not IsSubtabExcluded("inventory", Equipment, INVTYPE_TRINKET) end,
        setFunc = function(val) ToggleSubtab(Equipment, INVTYPE_TRINKET, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    -- Usable subtabs
    C:AddLabel(subtabSection, "|cffAAAAAA" .. Usable .. "|r")
    C:AddToggle(subtabSection, {
        label = Consumable,
        desc = LO["Show the Consumable subtab."],
        getFunc = function() return not IsSubtabExcluded("inventory", Usable, Consumable) end,
        setFunc = function(val) ToggleSubtab(Usable, Consumable, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })
    C:AddToggle(subtabSection, {
        label = Devices,
        desc = LO["Show the Devices subtab."],
        getFunc = function() return not IsSubtabExcluded("inventory", Usable, Devices) end,
        setFunc = function(val) ToggleSubtab(Usable, Devices, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    -- Trade Goods subtabs
    C:AddLabel(subtabSection, "|cffAAAAAA" .. TradeGood .. "|r")
    C:AddToggle(subtabSection, {
        label = TradeGood,
        desc = LO["Show the Trade Goods subtab."],
        getFunc = function() return not IsSubtabExcluded("inventory", TradeGood, TradeGood) end,
        setFunc = function(val) ToggleSubtab(TradeGood, TradeGood, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })
    C:AddToggle(subtabSection, {
        label = Gem,
        desc = LO["Show the Gem subtab."],
        getFunc = function() return not IsSubtabExcluded("inventory", TradeGood, Gem) end,
        setFunc = function(val) ToggleSubtab(TradeGood, Gem, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })
    C:AddToggle(subtabSection, {
        label = Recipe,
        desc = LO["Show the Recipe subtab."],
        getFunc = function() return not IsSubtabExcluded("inventory", TradeGood, Recipe) end,
        setFunc = function(val) ToggleSubtab(TradeGood, Recipe, val) end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    -- ====================================================================
    -- DISPLAY OPTIONS
    -- ====================================================================
    local displaySection = C:AddSection(scroll, LO["Display"])

    C:AddToggle(displaySection, {
        label = LO["Left Side Tabs"] .. " (" .. LO["Inventory"] .. ")",
        desc = LO["Place category filter tabs on the left side of the bag frame instead of the right."],
        getFunc = function()
            local db = GetCombuctorDB()
            return db and db.inventory and db.inventory.leftSideFilter or false
        end,
        setFunc = function(val)
            local db = GetCombuctorDB()
            if db and db.inventory then db.inventory.leftSideFilter = val end
            if addon.RefreshCombuctorFrames then addon.RefreshCombuctorFrames() end
        end,
        disabled = function() return not IsCombuctorEnabled() end,
    })

    C:AddToggle(displaySection, {
        label = LO["Left Side Tabs"] .. " (" .. LO["Bank"] .. ")",
        desc = LO["Place category filter tabs on the left side of the bank frame instead of the right."],
        getFunc = function()
            local db = GetCombuctorDB()
            return db and db.bank and db.bank.leftSideFilter or false
        end,
        setFunc = function(val)
            local db = GetCombuctorDB()
            if db and db.bank then db.bank.leftSideFilter = val end
            if addon.RefreshCombuctorFrames then addon.RefreshCombuctorFrames() end
        end,
        disabled = function() return not IsCombuctorEnabled() end,
    })
end

-- Register the tab
Panel:RegisterTab("bags", LO["Bags"], BuildBagsTab, 13)

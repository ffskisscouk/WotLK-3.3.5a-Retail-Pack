local addon = select(2, ...)

-- ============================================================================
-- COMBUCTOR MODULE FOR DRAGONUI
-- Ported from KPack Combuctor by bkader
-- All-in-one bag replacement with item filtering, search, bank integration.
-- ============================================================================

if _G.Combuctor then return end -- Don't load if standalone Combuctor is present

local _G = _G
local pairs, ipairs, next, select = pairs, ipairs, next, select
local format, strsplit = string.format, strsplit
local tinsert, tremove, tsort = table.insert, table.remove, table.sort
local floor, ceil, min, max = math.floor, math.ceil, math.min, math.max
local tonumber, tostring, type = tonumber, tostring, type
local GetItemInfo, GetItemIcon = GetItemInfo, GetItemIcon
local GetContainerItemInfo, GetContainerItemLink = GetContainerItemInfo, GetContainerItemLink
local GetContainerItemCooldown, GetContainerNumSlots = GetContainerItemCooldown, GetContainerNumSlots
local GetContainerNumFreeSlots = GetContainerNumFreeSlots
local GetKeyRingSize = GetKeyRingSize
local GetNumBankSlots = GetNumBankSlots
local GetInventoryItemLink = GetInventoryItemLink
local GetInventoryItemTexture = GetInventoryItemTexture
local GetInventoryItemCount = GetInventoryItemCount
local GetItemFamily = GetItemFamily
local IsInventoryItemLocked = IsInventoryItemLocked
local ContainerIDToInventoryID = ContainerIDToInventoryID
local BankButtonIDToInvSlotID = BankButtonIDToInvSlotID
local ContainerFrame_UpdateCooldown = ContainerFrame_UpdateCooldown
local CooldownFrame_SetTimer = CooldownFrame_SetTimer
local SetItemButtonTexture, SetItemButtonCount = SetItemButtonTexture, SetItemButtonCount
local SetItemButtonDesaturated, SetItemButtonTextureVertexColor = SetItemButtonDesaturated, SetItemButtonTextureVertexColor
local CursorHasItem, PickupContainerItem = CursorHasItem, PickupContainerItem
local SetPortraitTexture = SetPortraitTexture
local IsAltKeyDown = IsAltKeyDown
local PlaySound = PlaySound
local UnitName = UnitName
local NUM_BAG_SLOTS = NUM_BAG_SLOTS
local NUM_BANKBAGSLOTS = NUM_BANKBAGSLOTS
local KEYRING_CONTAINER = KEYRING_CONTAINER
local BACKPACK_CONTAINER = BACKPACK_CONTAINER
local BANK_CONTAINER = BANK_CONTAINER
local NUM_BANKGENERIC_SLOTS = NUM_BANKGENERIC_SLOTS

local TEXTURE_ITEM_QUEST_BORDER = TEXTURE_ITEM_QUEST_BORDER or [[Interface\ContainerFrame\UI-Icon-QuestBorder]]
local TEXTURE_ITEM_QUEST_BANG = TEXTURE_ITEM_QUEST_BANG or [[Interface\ContainerFrame\UI-Icon-QuestBang]]

local ItemSearch = LibStub("LibItemSearch-1.0")
local playerName = UnitName("player")
local playerClass = select(2, UnitClass("player"))

-- Module state tracking
local CombuctorModule = {
    initialized = false,
    applied = false,
    originalStates = {},
    hooks = {},
    frames = {}
}

-- Register with ModuleRegistry
if addon.RegisterModule then
    addon:RegisterModule("combuctor", CombuctorModule,
        (addon.L and addon.L["Combuctor"]) or "Combuctor",
        (addon.L and addon.L["All-in-one bag replacement with filtering and search"]) or "All-in-one bag replacement with filtering and search")
end

-- ============================================================================
-- CONFIGURATION FUNCTIONS
-- ============================================================================

local function GetModuleConfig()
    return addon:GetModuleConfig("combuctor")
end

local function IsModuleEnabled()
    return addon:IsModuleEnabled("combuctor")
end

-- ============================================================================
-- MODULE INTERNALS (replaces KPack core:NewClass / core:NewModule)
-- ============================================================================

local mod = {}
mod.modules = {}

function mod:NewClass(ftype, parent)
    local class = CreateFrame(ftype)
    class:Hide()
    class.mt = { __index = class }
    if parent then
        class = setmetatable(class, { __index = parent })
        class.super = function(self, method, ...)
            return parent[method](self, ...)
        end
    end
    class.Bind = function(self, obj)
        return setmetatable(obj, self.mt)
    end
    return class
end

function mod:NewModule(name, proto)
    local m
    if proto then
        m = setmetatable({}, { __index = proto })
    else
        m = {}
    end
    self.modules[name] = m
    return m
end

function mod:GetModule(name)
    return self.modules[name]
end

-- Callable access: mod("ModuleName") returns module
setmetatable(mod, {
    __call = function(self, name)
        return self.modules[name]
    end
})

-- ============================================================================
-- DATABASE
-- ============================================================================

local DB
local defaults = {
    inventory = {
        bags = { 0, 1, 2, 3, 4 },
        position = { "BOTTOMRIGHT", nil, "BOTTOMRIGHT", -64, 64 },
        showBags = false,
        leftSideFilter = true,
        w = 384,
        h = 512,
        sets = {},
        exclude = {}
    },
    bank = {
        bags = { -1, 5, 6, 7, 8, 9, 10, 11 },
        position = { "LEFT", nil, "LEFT", 24, 0 },
        showBags = false,
        leftSideFilter = false,
        w = 512,
        h = 512,
        sets = {},
        exclude = {}
    }
}

-- Localization strings
local L = {}
L.InventoryTitle = "%s's Inventory"
L.BankTitle = "%s's Bank"
L.Inventory = "Inventory"
L.Bank = "Bank"
L.Bags = "Bags"
L.BagToggle = "|cff00ff00Left-Click|r to toggle bag display"
L.InventoryToggle = "|cff00ff00Right-Click|r to toggle inventory"
L.BankToggle = "|cff00ff00Right-Click|r to toggle bank"
L.MoveTip = "|cff00ff00Drag|r to move"
L.ResetPositionTip = "|cff00ff00Alt+Right-Click|r to reset position"
L.ToggleInventory = "Toggle Inventory"
L.ToggleBank = "Toggle Bank"

-- Localize auction item classes
L.Weapon, L.Armor, L.Container, L.Consumable, L.Glyph, L.TradeGood, _, _, L.Recipe, L.Gem, L.Misc, L.Quest = GetAuctionItemClasses()
L.Devices, L.Explosives = select(10, GetAuctionItemSubClasses(6))
L.SimpleGem = select(8, GetAuctionItemSubClasses(7))

local function SetupDatabase()
    if not addon.db then return end
    if not addon.db.profile.modules then addon.db.profile.modules = {} end
    if not addon.db.profile.modules.combuctor then addon.db.profile.modules.combuctor = {} end

    local mc = addon.db.profile.modules.combuctor
    if not mc.db then mc.db = {} end

    DB = mc.db
    if not DB.inventory then
        DB.inventory = {}
        for k, v in pairs(defaults.inventory) do
            if type(v) == "table" then
                DB.inventory[k] = {}
                for kk, vv in pairs(v) do DB.inventory[k][kk] = vv end
            else
                DB.inventory[k] = v
            end
        end
    end
    if not DB.bank then
        DB.bank = {}
        for k, v in pairs(defaults.bank) do
            if type(v) == "table" then
                DB.bank[k] = {}
                for kk, vv in pairs(v) do DB.bank[k][kk] = vv end
            else
                DB.bank[k] = v
            end
        end
    end
    if not DB.inventory.sets then DB.inventory.sets = {} end
    if not DB.inventory.exclude then DB.inventory.exclude = {} end
    if not DB.bank.sets then DB.bank.sets = {} end
    if not DB.bank.exclude then DB.bank.exclude = {} end
end

function mod:GetProfile()
    return DB
end

function mod:SetMaxItemScale(scale)
    if DB then DB.maxScale = scale or 1 end
end

function mod:GetMaxItemScale()
    return (DB and DB.maxScale) or 1
end

-- ============================================================================
-- BAG TOGGLE
-- ============================================================================

function mod:Show(bag, auto)
    for _, frame in pairs(self.frames) do
        for _, bagID in pairs(frame.sets.bags) do
            if bagID == bag then
                frame:ShowFrame(auto)
                return
            end
        end
    end
end

function mod:Hide(bag, auto)
    for _, frame in pairs(self.frames) do
        for _, bagID in pairs(frame.sets.bags) do
            if bagID == bag then
                frame:HideFrame(auto)
                return
            end
        end
    end
end

function mod:Toggle(bag)
    for _, frame in pairs(self.frames) do
        for _, bagID in pairs(frame.sets.bags) do
            if bagID == bag then
                frame:ToggleFrame()
                return
            end
        end
    end
end

-- ============================================================================
-- ENVOY (EVENT BUS)
-- ============================================================================

do
    local Envoy = mod:NewModule("Envoy")

    function Envoy:New()
        return setmetatable({ listeners = {} }, { __index = Envoy })
    end

    function Envoy:Send(msg, ...)
        local listeners = self.listeners[msg]
        if listeners then
            for obj, method in pairs(listeners) do
                if type(method) == "string" then
                    obj[method](obj, msg, ...)
                elseif type(method) == "function" then
                    method(msg, ...)
                end
            end
        end
    end

    function Envoy:Register(obj, msg, method)
        if not self.listeners[msg] then
            self.listeners[msg] = {}
        end
        self.listeners[msg][obj] = method or msg
    end

    function Envoy:RegisterMany(obj, ...)
        for i = 1, select("#", ...) do
            local msg = select(i, ...)
            self:Register(obj, msg)
        end
    end

    function Envoy:RegisterMessage(obj, msg, method)
        self:Register(obj, msg, method or msg)
    end

    function Envoy:Unregister(obj, msg)
        local listeners = self.listeners[msg]
        if listeners then
            listeners[obj] = nil
            if not next(listeners) then
                self.listeners[msg] = nil
            end
        end
    end

    function Envoy:UnregisterAll(obj)
        for msg in pairs(self.listeners) do
            self:Unregister(obj, msg)
        end
    end
end

-- ============================================================================
-- INVENTORY EVENTS (BAG TRACKING)
-- ============================================================================

do
    local InventoryEvents = mod:NewModule("InventoryEvents", mod("Envoy"):New())
    local AtBank = false

    function InventoryEvents:AtBank()
        return AtBank
    end

    local function sendMessage(msg, ...)
        InventoryEvents:Send(msg, ...)
    end

    local Slots
    do
        local function getIndex(bagId, slotId)
            return (bagId < 0 and bagId * 100 - slotId) or bagId * 100 + slotId
        end

        Slots = {
            Set = function(self, bagId, slotId, itemLink, count, isLocked, onCooldown)
                local index = getIndex(bagId, slotId)
                local item = self[index] or {}
                item[1] = itemLink
                item[2] = count
                item[4] = onCooldown
                self[index] = item
            end,
            Remove = function(self, bagId, slotId)
                local index = getIndex(bagId, slotId)
                if self[index] then
                    self[index] = nil
                    return true
                end
            end,
            Get = function(self, bagId, slotId)
                return self[getIndex(bagId, slotId)]
            end
        }
        setmetatable(Slots, { __call = Slots.Get })
    end

    local BagTypes = {}
    local BagSizes = {}

    local function addItem(bagId, slotId)
        local texture, count, locked, quality, readable, lootable, itemLink =
            GetContainerItemInfo(bagId, slotId)
        local start, duration, enable = GetContainerItemCooldown(bagId, slotId)
        local onCooldown = (start > 0 and duration > 0 and enable > 0)

        Slots:Set(bagId, slotId, itemLink, count, locked, onCooldown)
        sendMessage("ITEM_SLOT_ADD", bagId, slotId, itemLink, count, onCooldown)
    end

    local function removeItem(bagId, slotId)
        if Slots:Remove(bagId, slotId) then
            sendMessage("ITEM_SLOT_REMOVE", bagId, slotId)
        end
    end

    local function updateItem(bagId, slotId)
        local item = Slots(bagId, slotId)
        if item then
            local prevLink = item[1]
            local prevCount = item[2]
            local texture, count, locked, quality, readable, lootable, itemLink =
                GetContainerItemInfo(bagId, slotId)
            if not (prevLink == itemLink and prevCount == count) then
                item[1] = itemLink
                item[2] = count
                sendMessage("ITEM_SLOT_UPDATE", bagId, slotId, itemLink, count)
            end
        else
            addItem(bagId, slotId)
        end
    end

    local function getBagSize(bagId)
        if bagId == KEYRING_CONTAINER then
            return GetKeyRingSize()
        end
        if bagId == BANK_CONTAINER then
            return NUM_BANKGENERIC_SLOTS
        end
        return GetContainerNumSlots(bagId)
    end

    local function updateBag(bagId)
        local size = getBagSize(bagId)
        local prevSize = BagSizes[bagId] or 0

        -- Check bag type change
        local _, newType = GetContainerNumFreeSlots(bagId)
        local prevType = BagTypes[bagId]
        if prevType ~= newType then
            BagTypes[bagId] = newType
            if prevType then
                sendMessage("BAG_UPDATE_TYPE", bagId, newType)
            end
        end

        BagSizes[bagId] = size

        if size > prevSize then
            for slot = prevSize + 1, size do
                addItem(bagId, slot)
            end
        elseif size < prevSize then
            for slot = size + 1, prevSize do
                removeItem(bagId, slot)
            end
        end

        for slot = 1, size do
            updateItem(bagId, slot)
        end
    end

    local function updateCooldowns(bagId)
        local size = getBagSize(bagId)
        for slot = 1, size do
            local item = Slots(bagId, slot)
            if item then
                local start, duration, enable = GetContainerItemCooldown(bagId, slot)
                local onCooldown = (start > 0 and duration > 0 and enable > 0)
                if item[4] ~= onCooldown then
                    item[4] = onCooldown
                    sendMessage("ITEM_SLOT_UPDATE_COOLDOWN", bagId, slot)
                end
            end
        end
    end

    -- Iterate bags
    local function forEachBag(func)
        func(KEYRING_CONTAINER)
        for bag = BACKPACK_CONTAINER, BACKPACK_CONTAINER + NUM_BAG_SLOTS do
            func(bag)
        end
        if AtBank then
            func(BANK_CONTAINER)
            for bag = NUM_BAG_SLOTS + 1, NUM_BAG_SLOTS + NUM_BANKBAGSLOTS do
                func(bag)
            end
        end
    end

    -- Event handlers
    local eventFrame = CreateFrame("Frame")
    eventFrame:SetScript("OnEvent", function(self, event, ...)
        if event == "PLAYER_LOGIN" then
            forEachBag(updateBag)
        elseif event == "BAG_UPDATE" then
            local bag = ...
            updateBag(bag)
        elseif event == "BAG_UPDATE_COOLDOWN" then
            forEachBag(updateCooldowns)
        elseif event == "PLAYERBANKSLOTS_CHANGED" then
            local slotId = ...
            if slotId and slotId > NUM_BANKGENERIC_SLOTS then
                local bagId = (slotId - NUM_BANKGENERIC_SLOTS) + NUM_BAG_SLOTS
                updateBag(bagId)
            else
                updateBag(BANK_CONTAINER)
            end
        end
    end)
    eventFrame:RegisterEvent("PLAYER_LOGIN")
    eventFrame:RegisterEvent("BAG_UPDATE")
    eventFrame:RegisterEvent("BAG_UPDATE_COOLDOWN")
    eventFrame:RegisterEvent("PLAYERBANKSLOTS_CHANGED")

    -- Bank detection (Show/Hide pattern, matching KPack reference)
    local bankWatcher = CreateFrame("Frame")
    bankWatcher:Hide()

    bankWatcher:SetScript("OnShow", function(self)
        AtBank = true
        updateBag(BANK_CONTAINER)
        forEachBag(updateBag)
        sendMessage("BANK_OPENED")
        -- After first open, simplify subsequent handler
        self:SetScript("OnShow", function(self)
            AtBank = true
            sendMessage("BANK_OPENED")
        end)
    end)

    bankWatcher:SetScript("OnHide", function(self)
        AtBank = false
        sendMessage("BANK_CLOSED")
    end)

    bankWatcher:SetScript("OnEvent", function(self, event)
        if event == "BANKFRAME_OPENED" then
            self:Show()
        else
            self:Hide()
        end
    end)
    bankWatcher:RegisterEvent("BANKFRAME_OPENED")
    bankWatcher:RegisterEvent("BANKFRAME_CLOSED")
end

-- ============================================================================
-- PLAYER INFO
-- ============================================================================

do
    local PlayerInfo = mod:NewModule("PlayerInfo")

    function PlayerInfo:AtBank()
        return mod("InventoryEvents"):AtBank()
    end

    function PlayerInfo:GetMoney(player)
        if player == playerName then
            return GetMoney()
        end
        return 0
    end
end

-- ============================================================================
-- BAG SLOT INFO
-- ============================================================================

do
    local BagSlotInfo = mod:NewModule("BagSlotInfo")

    local IsBank = {}
    IsBank[BANK_CONTAINER] = true

    function BagSlotInfo:IsBank(bag)
        return IsBank[bag]
    end

    function BagSlotInfo:IsBankBag(bag)
        return bag > NUM_BAG_SLOTS and bag <= NUM_BAG_SLOTS + NUM_BANKBAGSLOTS
    end

    function BagSlotInfo:IsBackpack(bag)
        return bag == BACKPACK_CONTAINER
    end

    function BagSlotInfo:IsKeyRing(bag)
        return bag == KEYRING_CONTAINER
    end

    function BagSlotInfo:IsCached(player, bag)
        if player ~= playerName then
            return true
        end
        if self:IsBank(bag) or self:IsBankBag(bag) then
            return not mod("InventoryEvents"):AtBank()
        end
        return false
    end

    function BagSlotInfo:IsBackpackBag(bag)
        return bag > 0 and bag < (NUM_BAG_SLOTS + 1)
    end

    function BagSlotInfo:GetSize(player, bag)
        if player == playerName then
            if bag == KEYRING_CONTAINER then
                return GetKeyRingSize()
            elseif bag == BANK_CONTAINER then
                return NUM_BANKGENERIC_SLOTS
            end
            return GetContainerNumSlots(bag)
        end
        return 0
    end

    function BagSlotInfo:GetBagType(player, bag)
        if self:IsBank(bag) or self:IsBackpack(bag) then
            return 0
        end
        if player == playerName then
            local itemLink = self:GetItemInfo(player, bag)
            if itemLink then
                return GetItemFamily(itemLink)
            end
        end
        return 0
    end

    function BagSlotInfo:IsTradeBag(player, bag)
        return (self:GetBagType(player, bag) or 0) > 0
    end

    function BagSlotInfo:ToInventorySlot(bag)
        if self:IsBackpack(bag) or self:IsBank(bag) then return nil end
        if self:IsBankBag(bag) then
            return BankButtonIDToInvSlotID(bag, 1)
        end
        return ContainerIDToInventoryID(bag)
    end

    function BagSlotInfo:IsLocked(player, bag)
        if self:IsBackpack(bag) or self:IsBank(bag) or self:IsCached(player, bag) then
            return false
        end
        return IsInventoryItemLocked(self:ToInventorySlot(bag))
    end

    function BagSlotInfo:IsPurchasable(player, bag)
        if not self:IsBankBag(bag) then return false end
        local purchasedSlots = GetNumBankSlots()
        return bag > (purchasedSlots + NUM_BAG_SLOTS)
    end

    function BagSlotInfo:GetItemInfo(player, bag)
        if self:IsBackpack(bag) or self:IsBank(bag) then return nil end
        if player == playerName then
            local invSlot = self:ToInventorySlot(bag)
            if invSlot then
                local link = GetInventoryItemLink("player", invSlot)
                local texture = GetInventoryItemTexture("player", invSlot)
                local count = GetInventoryItemCount("player", invSlot)
                return link, count, texture
            end
        end
        return nil
    end

    -- Global reference for other modules
    mod.BagSlotInfo = BagSlotInfo
end

-- ============================================================================
-- ITEM SLOT INFO
-- ============================================================================

do
    local ItemSlotInfo = mod:NewModule("ItemSlotInfo")

    function ItemSlotInfo:GetItemInfo(player, bag, slot)
        if player == playerName then
            local texture, count, locked, quality, readable, lootable, link = GetContainerItemInfo(bag, slot)
            if link and quality and quality < 0 then
                quality = select(3, GetItemInfo(link))
            end
            return texture, count, locked, quality, readable, lootable, link
        end
        return nil
    end

    function ItemSlotInfo:IsLocked(player, bag, slot)
        if self:IsCached(player, bag, slot) then
            return false
        end
        return select(3, GetContainerItemInfo(bag, slot))
    end

    function ItemSlotInfo:IsCached(player, bag, slot)
        return mod("BagSlotInfo"):IsCached(player, bag)
    end

    mod.ItemSlotInfo = ItemSlotInfo
end

-- ============================================================================
-- SETS (ITEM FILTERING)
-- ============================================================================

do
    local CombuctorSet = mod:NewModule("Sets", mod("Envoy"):New())

    local parentSets = {}
    local childSets = {}

    function CombuctorSet:Register(name, icon, rule, parent)
        local set = { name = name, icon = icon, rule = rule, parent = parent }
        if parent then
            childSets[parent] = childSets[parent] or {}
            tinsert(childSets[parent], set)
            self:Send("COMBUCTOR_SUBSET_ADD", name, parent)
        else
            tinsert(parentSets, set)
            self:Send("COMBUCTOR_SET_ADD", name)
        end
    end

    function CombuctorSet:Get(name, parent)
        if parent then
            local children = childSets[parent]
            if children then
                for _, set in ipairs(children) do
                    if set.name == name then
                        return set
                    end
                end
            end
        else
            for _, set in ipairs(parentSets) do
                if set.name == name then
                    return set
                end
            end
        end
    end

    function CombuctorSet:GetParentSets()
        return ipairs(parentSets)
    end

    function CombuctorSet:GetChildSets(parent)
        return ipairs(childSets[parent] or {})
    end

    -- Profession bag type bitmask
    local BAGTYPE_PROFESSION = 0x0008 + 0x0010 + 0x0020 + 0x0040 + 0x0080 + 0x0200 + 0x0400 + 0x8000

    -- Additional localization for sets
    L.Equipment = "Equipment"
    L.Usable = "Usable"
    L.Normal = "Normal"
    L.Trade = "Trade"

    -- Register default item sets (matching KPack Combuctor structure)

    -- ALL: parent set
    CombuctorSet:Register(ALL or "All", [[Interface\Icons\INV_Misc_EngGizmos_17]], function() return true end)
    -- ALL subtabs: All, Normal, Trade
    CombuctorSet:Register(ALL or "All", nil, nil, ALL or "All")
    CombuctorSet:Register(L.Normal, nil, function(player, bagType) return bagType and bagType == 0 end, ALL or "All")
    CombuctorSet:Register(L.Trade, nil, function(player, bagType) return bagType and bit.band(bagType, BAGTYPE_PROFESSION) > 0 end, ALL or "All")

    -- EQUIPMENT: parent set (armor + weapons)
    do
        local function isEquipment(_, _, _, _, _, _, _, itype)
            return (itype == L.Armor or itype == L.Weapon)
        end
        CombuctorSet:Register(L.Equipment, [[Interface\Icons\INV_Chest_Chain_04]], isEquipment)
        -- Equipment subtabs: All, Armor, Weapon, Trinket
        CombuctorSet:Register(ALL or "All", nil, nil, L.Equipment)
    end
    do
        local function isArmor(_, _, _, _, _, _, _, itype, _, _, equipLoc)
            return itype == L.Armor and equipLoc ~= "INVTYPE_TRINKET"
        end
        CombuctorSet:Register(L.Armor, nil, isArmor, L.Equipment)
    end
    do
        local function isWeapon(_, _, _, _, _, _, _, itype)
            return itype == L.Weapon
        end
        CombuctorSet:Register(L.Weapon, nil, isWeapon, L.Equipment)
    end
    do
        local function isTrinket(_, _, _, _, _, _, _, _, _, _, equipLoc)
            return equipLoc == "INVTYPE_TRINKET"
        end
        CombuctorSet:Register(INVTYPE_TRINKET, nil, isTrinket, L.Equipment)
    end

    -- USABLE: parent set (consumables + devices/explosives)
    do
        local function isUsable(_, _, _, _, _, _, _, itype, subType)
            if itype == L.Consumable then
                return true
            elseif itype == L.TradeGood then
                if subType == L.Devices or subType == L.Explosives then
                    return true
                end
            end
        end
        CombuctorSet:Register(L.Usable, [[Interface\Icons\INV_Potion_93]], isUsable)
        -- Usable subtabs: All, Consumable, Devices
        CombuctorSet:Register(ALL or "All", nil, nil, L.Usable)
    end
    do
        local function isConsumable(_, _, _, _, _, _, _, itype)
            return itype == L.Consumable
        end
        CombuctorSet:Register(L.Consumable, nil, isConsumable, L.Usable)
    end
    do
        local function isDevice(_, _, _, _, _, _, _, itype)
            return itype == L.TradeGood
        end
        CombuctorSet:Register(L.Devices, nil, isDevice, L.Usable)
    end

    -- QUEST: parent set (no subtabs)
    do
        local function isQuestItem(_, _, _, _, _, _, _, itype)
            return itype == L.Quest
        end
        CombuctorSet:Register(L.Quest, [[Interface\QuestFrame\UI-QuestLog-BookIcon]], isQuestItem)
        CombuctorSet:Register(ALL or "All", nil, nil, L.Quest)
    end

    -- TRADE GOODS: parent set (trade goods + gems + recipes, excluding devices/explosives)
    do
        local function isTradeGood(_, _, _, _, _, _, _, itype, subType)
            if itype == L.TradeGood then
                return not (subType == L.Devices or subType == L.Explosives)
            end
            return itype == L.Recipe or itype == L.Gem
        end
        CombuctorSet:Register(L.TradeGood, [[Interface\Icons\INV_Fabric_Silk_02]], isTradeGood)
        -- Trade Goods subtabs: All, Trade Goods, Gem, Recipe
        CombuctorSet:Register(ALL or "All", nil, nil, L.TradeGood)
    end
    do
        local function isTradeGoodOnly(_, _, _, _, _, _, _, itype)
            return itype == L.TradeGood
        end
        CombuctorSet:Register(L.TradeGood, nil, isTradeGoodOnly, L.TradeGood)
    end
    do
        local function isGem(_, _, _, _, _, _, _, itype)
            return itype == L.Gem
        end
        CombuctorSet:Register(L.Gem, nil, isGem, L.TradeGood)
    end
    do
        local function isRecipe(_, _, _, _, _, _, _, itype)
            return itype == L.Recipe
        end
        CombuctorSet:Register(L.Recipe, nil, isRecipe, L.TradeGood)
    end

    -- MISCELLANEOUS: parent set (no subtabs)
    do
        local function isMiscItem(_, _, _, link, _, _, _, itype)
            return itype == L.Misc and (link:match("%d+") ~= "6265")
        end
        CombuctorSet:Register(L.Misc, [[Interface\Icons\INV_Misc_Rune_01]], isMiscItem)
        CombuctorSet:Register(ALL or "All", nil, nil, L.Misc)
    end
end

-- ============================================================================
-- QUALITY FLAGS
-- ============================================================================

mod.QualityFlags = {}
for i = 0, 7 do
    mod.QualityFlags[i] = 2 ^ i
end

-- ============================================================================
-- ITEM SLOT CLASS
-- ============================================================================

do
    local ItemSlot = mod:NewClass("Button")
    mod.ItemSlot = ItemSlot

    local BagSlotInfo = mod.BagSlotInfo
    local ItemSlotInfo = mod.ItemSlotInfo
    local PlayerInfo = mod("PlayerInfo")

    local unused = {}
    local id = 1

    function ItemSlot:GetNextItemSlotID()
        local nextID = id
        id = id + 1
        return nextID
    end

    function ItemSlot:New()
        local item = next(unused)
        if item then
            unused[item] = nil
            return item
        end

        local itemID = self:GetNextItemSlotID()
        local item = self:Bind(CreateFrame("Button", format("DragonUI_CombuctorItem%d", itemID), nil, "ContainerFrameItemButtonTemplate"))

        local name = item:GetName()
        item:SetID(itemID)
        item:SetScript("OnEnter", self.OnEnter)
        item:SetScript("OnLeave", self.OnLeave)
        item:SetScript("OnShow", self.OnShow)
        item:SetScript("OnHide", self.OnHide)
        item:SetScript("OnUpdate", self.OnUpdate)
        item:RegisterForClicks("anyUp")
        item.UpdateTooltip = nil

        -- Quality border
        local border = item:CreateTexture(nil, "OVERLAY")
        border:SetWidth(67)
        border:SetHeight(67)
        border:SetPoint("CENTER", item, "CENTER", 0, -1)
        border:SetTexture([[Interface\Buttons\UI-ActionButton-Border]])
        border:SetBlendMode("ADD")
        border:Hide()
        item.border = border

        -- Quest border
        local questBorder = item:CreateTexture(nil, "OVERLAY")
        questBorder:SetSize(item:GetWidth(), item:GetHeight())
        questBorder:SetPoint("CENTER")
        questBorder:SetTexture(TEXTURE_ITEM_QUEST_BORDER)
        questBorder:Hide()
        item.questBorder = questBorder

        -- Cooldown
        item.cooldown = _G[name .. "Cooldown"]

        return item
    end

    function ItemSlot:Free()
        self:Hide()
        self:SetParent(nil)
        self:UnlockHighlight()
        unused[self] = true
    end

    function ItemSlot:Set(parent, bag, slot)
        self:SetParent(ItemSlot:GetDummyBag(parent, bag))
        self:SetID(slot)
        self:Update()
    end

    function ItemSlot:OnShow()
        self:Update()
    end

    function ItemSlot:OnHide()
        if self.hasStackSplit and self.hasStackSplit == 1 then
            StackSplitFrame:Hide()
        end
    end

    function ItemSlot:OnEnter()
        local dummySlot = self:GetDummyItemSlot()
        if self:IsCached() then
            dummySlot:SetParent(self)
            dummySlot:SetAllPoints(self)
            dummySlot:Show()
        else
            dummySlot:Hide()
            self._lastShiftState = nil  -- reset so OnUpdate detects shift on first hover
            if self:IsBank() then
                -- BANK_CONTAINER slots: use SetInventoryItem (bank-specific API)
                if self:GetItem() then
                    self:AnchorTooltip()
                    GameTooltip:SetInventoryItem("player", BankButtonIDToInvSlotID(self:GetID()))
                    GameTooltip:Show()
                    CursorUpdate(self)
                    if IsModifiedClick("COMPAREITEMS") then
                        GameTooltip_ShowCompareItem()
                    end
                    self.UpdateTooltip = self.OnEnter
                end
            else
                -- Inventory/bank-bag slots: native Blizzard handler correctly shows
                -- Soulbound, durability, and handles initial shift+compare
                ContainerFrameItemButton_OnEnter(self)
            end
        end
    end

    function ItemSlot:OnUpdate()
        -- Detect shift key state change WHILE hovering and show/hide the comparison
        -- tooltip WITHOUT rebuilding the main GameTooltip (which would corrupt
        -- Soulbound/durability text).
        if not self:IsMouseOver() or self:IsCached() then
            self._lastShiftState = nil
            return
        end
        if not GameTooltip:IsOwned(self) then return end
        local shiftDown = IsModifiedClick("COMPAREITEMS")
        if self._lastShiftState == shiftDown then return end
        self._lastShiftState = shiftDown
        if shiftDown then
            -- Shift just pressed: show comparison side-tooltip (does NOT touch main GameTooltip)
            GameTooltip_ShowCompareItem()
        else
            -- Shift released: hide comparison side-tooltips
            if GameTooltip.shoppingTooltips then
                for _, tt in ipairs(GameTooltip.shoppingTooltips) do
                    tt:Hide()
                end
            end
        end
    end

    function ItemSlot:OnLeave()
        self._lastShiftState = nil
        GameTooltip:Hide()
        ResetCursor()
    end

    function ItemSlot:OnModifiedClick(button)
        local link = self:IsCached() and self:GetItem()
        if link then
            HandleModifiedItemClick(link)
        end
    end

    function ItemSlot:Update()
        if not self:IsVisible() then return end

        local texture, count, locked, quality, readable, lootable, link = self:GetItemSlotInfo()
        self:SetItem(link)
        self:SetTexture(texture)
        self:SetCount(count)
        self:SetLocked(locked)
        self:SetReadable(readable)
        self:SetBorderQuality(quality)
        self:UpdateCooldown()
        self:UpdateSlotColor()
        if GameTooltip:IsOwned(self) and self.UpdateTooltip then
            self:UpdateTooltip()
        end
    end

    function ItemSlot:SetItem(itemLink)
        self.hasItem = itemLink or nil
    end

    function ItemSlot:GetItem()
        return self.hasItem
    end

    function ItemSlot:SetTexture(texture)
        SetItemButtonTexture(self, texture or self:GetEmptyItemTexture())
    end

    function ItemSlot:GetEmptyItemTexture()
        return [[Interface\PaperDoll\UI-Backpack-EmptySlot]]
    end

    function ItemSlot:UpdateSlotColor()
        if (not self:GetItem()) and self:IsTradeBagSlot() then
            local r, g, b = 0.5, 1, 0.5
            SetItemButtonTextureVertexColor(self, r, g, b)
            local normText = self.normText or self:GetNormalTexture()
            if normText and normText.SetVertexColor then
                normText:SetVertexColor(r, g, b)
            end
            return
        end
        SetItemButtonTextureVertexColor(self, 1, 1, 1)
        local normText = self.normText or self:GetNormalTexture()
        if normText and normText.SetVertexColor then
            normText:SetVertexColor(1, 1, 1)
        end
    end

    function ItemSlot:SetCount(count)
        SetItemButtonCount(self, count)
    end

    function ItemSlot:SetReadable(readable)
        self.readable = readable
    end

    function ItemSlot:SetLocked(locked)
        SetItemButtonDesaturated(self, locked)
    end

    function ItemSlot:UpdateLocked()
        self:SetLocked(self:IsLocked())
    end

    function ItemSlot:IsLocked()
        return ItemSlotInfo:IsLocked(self:GetPlayer(), self:GetBag(), self:GetID())
    end

    function ItemSlot:SetBorderQuality(quality)
        local border = self.border
        local qBorder = self.questBorder

        -- Quest item check
        local isQuestItem, isQuestStarter = self:IsQuestItem()
        if isQuestItem then
            qBorder:SetTexture(TEXTURE_ITEM_QUEST_BORDER)
            qBorder:SetAlpha(0.5)
            qBorder:Show()
            border:Hide()
            return
        end
        if isQuestStarter then
            qBorder:SetTexture(TEXTURE_ITEM_QUEST_BANG)
            qBorder:SetAlpha(0.5)
            qBorder:Show()
            border:Hide()
            return
        end

        -- Quality border
        if self:GetItem() and quality and quality > 1 then
            local r, g, b = GetItemQualityColor(quality)
            border:SetVertexColor(r, g, b, 0.5)
            border:Show()
            qBorder:Hide()
            return
        end

        qBorder:Hide()
        border:Hide()
    end

    function ItemSlot:UpdateBorder()
        local _, _, _, quality = self:GetItemSlotInfo()
        self:SetBorderQuality(quality)
    end

    function ItemSlot:UpdateCooldown()
        if self:GetItem() and not self:IsCached() then
            ContainerFrame_UpdateCooldown(self:GetBag(), self)
        else
            CooldownFrame_SetTimer(self.cooldown, 0, 0, 0)
            SetItemButtonTextureVertexColor(self, 1, 1, 1)
        end
    end

    -- UpdateTooltip is set to nil per-instance in Create() to prevent
    -- Update() from re-triggering OnEnter and clearing bank tooltips.
    ItemSlot.UpdateTooltip = nil

    function ItemSlot:AnchorTooltip()
        if self:GetRight() >= (GetScreenWidth() / 2) then
            GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        else
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        end
    end

    function ItemSlot:Highlight(enable)
        if enable then
            self:LockHighlight()
        else
            self:UnlockHighlight()
        end
    end

    function ItemSlot:GetPlayer()
        local player
        if self:GetParent() then
            local p = self:GetParent():GetParent()
            player = p and p.GetPlayer and p:GetPlayer()
        end
        return player or playerName
    end

    function ItemSlot:GetBag()
        return self:GetParent() and self:GetParent():GetID() or -1
    end

    function ItemSlot:IsSlot(bag, slot)
        return self:GetBag() == bag and self:GetID() == slot
    end

    function ItemSlot:IsCached()
        return BagSlotInfo:IsCached(self:GetPlayer(), self:GetBag())
    end

    function ItemSlot:IsBank()
        return BagSlotInfo:IsBank(self:GetBag())
    end

    function ItemSlot:IsBankSlot()
        local bag = self:GetBag()
        return BagSlotInfo:IsBank(bag) or BagSlotInfo:IsBankBag(bag)
    end

    function ItemSlot:AtBank()
        return PlayerInfo:AtBank()
    end

    function ItemSlot:GetItemSlotInfo()
        return ItemSlotInfo:GetItemInfo(self:GetPlayer(), self:GetBag(), self:GetID())
    end

    local QUEST_ITEM_SEARCH = format("t:%s|%s", select(10, GetAuctionItemClasses()), "quest")
    function ItemSlot:IsQuestItem()
        local itemLink = self:GetItem()
        if not itemLink then return false, false end
        if self:IsCached() then
            return ItemSearch:Find(itemLink, QUEST_ITEM_SEARCH), false
        else
            local isQuestItem, questID, isActive = GetContainerItemQuestInfo(self:GetBag(), self:GetID())
            return isQuestItem, (questID and not isActive)
        end
    end

    function ItemSlot:IsTradeBagSlot()
        return BagSlotInfo:IsTradeBag(self:GetPlayer(), self:GetBag())
    end

    function ItemSlot:GetDummyBag(parent, bag)
        local dummyBags = parent.dummyBags
        if not dummyBags then
            dummyBags = setmetatable({}, { __index = function(t, k)
                local f = CreateFrame("Frame", nil, parent)
                f:SetID(k)
                t[k] = f
                return f
            end })
            parent.dummyBags = dummyBags
        end
        return dummyBags[bag]
    end

    function ItemSlot:GetDummyItemSlot()
        if not ItemSlot.dummySlot then
            ItemSlot.dummySlot = ItemSlot:CreateDummyItemSlot()
        end
        return ItemSlot.dummySlot
    end

    function ItemSlot:CreateDummyItemSlot()
        local slot = CreateFrame("Button")
        slot:RegisterForClicks("anyUp")
        slot:SetToplevel(true)
        slot:Hide()

        local function Slot_OnEnter(self)
            local parent = self:GetParent()
            parent:LockHighlight()
            if parent:IsCached() and parent:GetItem() then
                ItemSlot.AnchorTooltip(self)
                GameTooltip:SetHyperlink(parent:GetItem())
                GameTooltip:Show()
            end
        end

        local function Slot_OnLeave(self)
            GameTooltip:Hide()
            self:Hide()
        end

        local function Slot_OnHide(self)
            local parent = self:GetParent()
            if parent then parent:UnlockHighlight() end
        end

        local function Slot_OnClick(self, button)
            self:GetParent():OnModifiedClick(button)
        end

        slot.UpdateTooltip = Slot_OnEnter
        slot:SetScript("OnClick", Slot_OnClick)
        slot:SetScript("OnEnter", Slot_OnEnter)
        slot:SetScript("OnLeave", Slot_OnLeave)
        slot:SetScript("OnShow", Slot_OnEnter)
        slot:SetScript("OnHide", Slot_OnHide)

        return slot
    end
end

-- ============================================================================
-- ITEM FRAME EVENTS
-- ============================================================================

do
    local FrameEvents = mod:NewModule("ItemFrameEvents")
    local frames = {}

    function FrameEvents:ITEM_LOCK_CHANGED(msg, ...) self:UpdateSlotLock(...) end
    function FrameEvents:UNIT_QUEST_LOG_CHANGED(msg, ...) self:UpdateBorder(...) end
    function FrameEvents:QUEST_ACCEPTED(msg, ...) self:UpdateBorder(...) end
    function FrameEvents:ITEM_SLOT_ADD(msg, ...) self:UpdateSlot(...) end
    function FrameEvents:ITEM_SLOT_REMOVE(msg, ...) self:RemoveItem(...) end
    function FrameEvents:ITEM_SLOT_UPDATE(msg, ...) self:UpdateSlot(...) end
    function FrameEvents:ITEM_SLOT_UPDATE_COOLDOWN(msg, ...) self:UpdateSlotCooldown(...) end
    function FrameEvents:BANK_OPENED(msg, ...) self:UpdateBankFrames(...) end
    function FrameEvents:BANK_CLOSED(msg, ...) self:UpdateBankFrames(...) end
    function FrameEvents:BAG_UPDATE_TYPE(msg, ...) self:UpdateSlotColor(...) end

    function FrameEvents:UpdateBorder(...)
        for f in self:GetFrames() do
            if f:GetPlayer() == playerName then f:UpdateBorder(...) end
        end
    end

    function FrameEvents:UpdateSlotColor(...)
        for f in self:GetFrames() do
            if f:GetPlayer() == playerName then f:UpdateSlotColor(...) end
        end
    end

    function FrameEvents:UpdateSlot(...)
        for f in self:GetFrames() do
            if f:GetPlayer() == playerName then
                if f:UpdateSlot(...) then f:RequestLayout() end
            end
        end
    end

    function FrameEvents:RemoveItem(...)
        for f in self:GetFrames() do
            if f:GetPlayer() == playerName then
                if f:RemoveItem(...) then f:RequestLayout() end
            end
        end
    end

    function FrameEvents:UpdateSlotLock(...)
        for f in self:GetFrames() do
            if f:GetPlayer() == playerName then f:UpdateSlotLock(...) end
        end
    end

    function FrameEvents:UpdateSlotCooldown(...)
        for f in self:GetFrames() do
            if f:GetPlayer() == playerName then f:UpdateSlotCooldown(...) end
        end
    end

    function FrameEvents:UpdateBankFrames()
        for f in self:GetFrames() do f:Regenerate() end
    end

    function FrameEvents:LayoutFrames()
        for f in self:GetFrames() do
            if f.needsLayout then
                f.needsLayout = nil
                f:Layout()
            end
        end
    end

    function FrameEvents:RequestLayout()
        self.Updater:Show()
    end

    function FrameEvents:GetFrames()
        return pairs(frames)
    end

    function FrameEvents:Register(f)
        frames[f] = true
    end

    function FrameEvents:Unregister(f)
        frames[f] = nil
    end

    -- Initialization
    do
        local f = CreateFrame("Frame")
        f:Hide()
        f:SetScript("OnEvent", function(self, event, ...)
            local method = FrameEvents[event]
            if method then method(FrameEvents, event, ...) end
        end)
        f:SetScript("OnUpdate", function(self)
            FrameEvents:LayoutFrames()
            self:Hide()
        end)
        f:RegisterEvent("ITEM_LOCK_CHANGED")
        f:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
        f:RegisterEvent("QUEST_ACCEPTED")
        FrameEvents.Updater = f

        mod("InventoryEvents"):RegisterMany(
            FrameEvents,
            "ITEM_SLOT_ADD", "ITEM_SLOT_REMOVE", "ITEM_SLOT_UPDATE",
            "ITEM_SLOT_UPDATE_COOLDOWN", "BANK_OPENED", "BANK_CLOSED", "BAG_UPDATE_TYPE"
        )
    end
end

-- ============================================================================
-- ITEM FRAME CLASS (grid of items)
-- ============================================================================

do
    local ItemFrame = mod:NewClass("Button")
    mod.ItemFrame = ItemFrame

    local FrameEvents = mod("ItemFrameEvents")
    local BagSlotInfo = mod.BagSlotInfo
    local ItemSlotInfo = mod.ItemSlotInfo

    local function ToIndex(bag, slot)
        return (bag < 0 and bag * 100 - slot) or (bag * 100 + slot)
    end

    function ItemFrame:New(parent)
        local f = self:Bind(CreateFrame("Button", nil, parent))
        f.items = {}
        f.bags = parent.sets.bags
        f.filter = parent.filter
        f.count = 0
        f:RegisterForClicks("anyUp")
        f:SetScript("OnShow", self.OnShow)
        f:SetScript("OnHide", self.OnHide)
        f:SetScript("OnClick", self.PlaceItem)
        return f
    end

    function ItemFrame:OnShow()
        self:UpdateUpdatable()
        self:Regenerate()
    end

    function ItemFrame:OnHide()
        self:UpdateUpdatable()
    end

    function ItemFrame:UpdateUpdatable()
        if self:IsVisible() then
            FrameEvents:Register(self)
        else
            FrameEvents:Unregister(self)
        end
    end

    function ItemFrame:SetPlayer(player)
        self.player = player
        self:ReloadAllItems()
    end

    function ItemFrame:GetPlayer()
        return self.player or playerName
    end

    function ItemFrame:HasItem(bag, slot, link)
        local hasBag = false
        for _, bagID in pairs(self.bags) do
            if bag == bagID then hasBag = true; break end
        end
        if not hasBag then return false end

        local f = self.filter
        if next(f) then
            local player = self:GetPlayer()
            local bagType = self:GetBagType(bag)
            link = link or self:GetItemLink(bag, slot)

            local name, quality, level, ilvl, itemType, subType, stackCount, equipLoc
            if link then
                name, link, quality, level, ilvl, itemType, subType, stackCount, equipLoc = GetItemInfo(link)
            end

            if f.quality and f.quality > 0 and not (quality and bit.band(f.quality, mod.QualityFlags[quality] or 0) > 0) then
                return false
            elseif f.rule and not f.rule(player, bagType, name, link, quality, level, ilvl, itemType, subType, stackCount, equipLoc) then
                return false
            elseif f.subRule and not f.subRule(player, bagType, name, link, quality, level, ilvl, itemType, subType, stackCount, equipLoc) then
                return false
            elseif f.name then
                return ItemSearch:Find(link, f.name)
            end
        end
        return true
    end

    function ItemFrame:AddItem(bag, slot)
        local index = ToIndex(bag, slot)
        local item = self.items[index]
        if item then
            item:Update()
            item:Highlight(self.highlightBag == bag)
        else
            item = mod.ItemSlot:New()
            item:Set(self, bag, slot)
            item:Highlight(self.highlightBag == bag)
            self.items[index] = item
            self.count = self.count + 1
            return true
        end
    end

    function ItemFrame:RemoveItem(bag, slot)
        local index = ToIndex(bag, slot)
        local item = self.items[index]
        if item then
            item:Free()
            self.items[index] = nil
            self.count = self.count - 1
            return true
        end
    end

    function ItemFrame:UpdateSlot(bag, slot, link)
        if self:HasItem(bag, slot, link) then
            return self:AddItem(bag, slot)
        end
        return self:RemoveItem(bag, slot)
    end

    function ItemFrame:UpdateSlotLock(bag, slot)
        if not slot then return end
        local item = self.items[ToIndex(bag, slot)]
        if item then item:UpdateLocked() end
    end

    function ItemFrame:UpdateSlotCooldown(bag, slot)
        local item = self.items[ToIndex(bag, slot)]
        if item then item:UpdateCooldown() end
    end

    function ItemFrame:UpdateBorder()
        for _, item in pairs(self.items) do item:UpdateBorder() end
    end

    function ItemFrame:UpdateSlotColor(bagId)
        for _, item in pairs(self.items) do
            if item:GetBag() == bagId then item:UpdateSlotColor() end
        end
    end

    function ItemFrame:Regenerate()
        if not self:IsVisible() then return end
        local changed = false
        for _, bag in pairs(self.bags) do
            for slot = 1, self:GetBagSize(bag) do
                if self:UpdateSlot(bag, slot) then changed = true end
            end
        end
        if changed then self:RequestLayout() end
    end

    function ItemFrame:RemoveAllItems()
        local changed = false
        for i, item in pairs(self.items) do
            changed = true
            item:Free()
            self.items[i] = nil
        end
        self.count = 0
        return changed
    end

    function ItemFrame:ReloadAllItems()
        if self:RemoveAllItems() and self:IsVisible() then
            self:Regenerate()
        end
    end

    function ItemFrame:RequestLayout()
        self.needsLayout = true
        self:TriggerLayout()
    end

    function ItemFrame:TriggerLayout()
        if self:IsVisible() and self.needsLayout then
            FrameEvents:RequestLayout(self)
        end
    end

    function ItemFrame:Layout(spacing)
        local width, height = self:GetWidth(), self:GetHeight()
        spacing = spacing or 2
        local count = self.count
        local size = 36 + spacing * 2
        local cols = 0
        local scale, rows
        local maxScale = mod:GetMaxItemScale()

        repeat
            cols = cols + 1
            scale = width / (size * cols)
            rows = floor(height / (size * scale))
        until (scale <= maxScale and cols * rows >= count)

        local items = self.items
        local i = 0

        for _, bag in ipairs(self.bags) do
            for slot = 1, self:GetBagSize(bag) do
                local item = items[ToIndex(bag, slot)]
                if item then
                    i = i + 1
                    local row = (i - 1) % cols
                    local col = ceil(i / cols) - 1
                    item:ClearAllPoints()
                    item:SetScale(scale)
                    item:SetPoint("TOPLEFT", self, "TOPLEFT", size * row + spacing, -(size * col + spacing))
                    item:Show()
                end
            end
        end
    end

    function ItemFrame:HighlightBag(bag)
        self.highlightBag = bag
        for _, item in pairs(self.items) do
            item:Highlight(item:GetBag() == bag)
        end
    end

    function ItemFrame:GetBagSize(bag)
        return BagSlotInfo:GetSize(self:GetPlayer(), bag)
    end

    function ItemFrame:GetBagType(bag)
        return BagSlotInfo:GetBagType(self:GetPlayer(), bag)
    end

    function ItemFrame:IsBagCached(bag)
        return BagSlotInfo:IsCached(self:GetPlayer(), bag)
    end

    function ItemFrame:GetItemLink(bag, slot)
        return select(7, ItemSlotInfo:GetItemInfo(self:GetPlayer(), bag, slot))
    end

    function ItemFrame:PlaceItem()
        if CursorHasItem() then
            for _, bag in ipairs(self.bags) do
                if not self:IsBagCached(bag) then
                    for slot = 1, self:GetBagSize(bag) do
                        if not GetContainerItemLink(bag, slot) then
                            PickupContainerItem(bag, slot)
                        end
                    end
                end
            end
        end
    end
end

-- ============================================================================
-- BAG CLASS
-- ============================================================================

do
    local Bag = mod:NewClass("Button")
    mod.Bag = Bag

    local SIZE = 30
    local NORMAL_TEXTURE_SIZE = 64 * (SIZE / 36)
    local BagSlotInfo = mod.BagSlotInfo
    local unused = {}
    local bagId = 1

    function Bag:New()
        local bag = self:Bind(CreateFrame("Button", format("DragonUI_CombuctorBag%d", bagId)))
        local name = bag:GetName()
        bag:SetSize(SIZE, SIZE)

        -- Expand hit rect to match the visual NormalTexture size
        local inset = (SIZE - NORMAL_TEXTURE_SIZE) / 2
        bag:SetHitRectInsets(inset, inset, inset, inset)

        local icon = bag:CreateTexture(name .. "IconTexture", "BORDER")
        icon:SetAllPoints(bag)

        local count = bag:CreateFontString(name .. "Count", "OVERLAY")
        count:SetFontObject("NumberFontNormalSmall")
        count:SetJustifyH("RIGHT")
        count:SetPoint("BOTTOMRIGHT", -2, 2)

        local nt = bag:CreateTexture(name .. "NormalTexture")
        nt:SetTexture([[Interface\Buttons\UI-Quickslot2]])
        nt:SetWidth(NORMAL_TEXTURE_SIZE)
        nt:SetHeight(NORMAL_TEXTURE_SIZE)
        nt:SetPoint("CENTER", 0, -1)
        bag:SetNormalTexture(nt)

        local pt = bag:CreateTexture()
        pt:SetTexture([[Interface\Buttons\UI-Quickslot-Depress]])
        pt:SetAllPoints(bag)
        bag:SetPushedTexture(pt)

        local ht = bag:CreateTexture()
        ht:SetTexture([[Interface\Buttons\ButtonHilight-Square]])
        ht:SetAllPoints(bag)
        bag:SetHighlightTexture(ht)

        bag:RegisterForClicks("anyUp")
        bag:RegisterForDrag("LeftButton")

        bag:SetScript("OnEnter", self.OnEnter)
        bag:SetScript("OnShow", self.OnShow)
        bag:SetScript("OnLeave", self.OnLeave)
        bag:SetScript("OnClick", self.OnClick)
        bag:SetScript("OnDragStart", self.OnDrag)
        bag:SetScript("OnReceiveDrag", self.OnClick)
        bag:SetScript("OnEvent", self.OnEvent)

        bagId = bagId + 1
        return bag
    end

    function Bag:Get()
        local f = next(unused)
        if f then
            unused[f] = nil
            return f
        end
        return self:New()
    end

    function Bag:Set(parent, id)
        self:SetID(id)
        self:SetParent(parent)

        if BagSlotInfo:IsBank(id) or BagSlotInfo:IsBackpack(id) then
            SetItemButtonTexture(self, [[Interface\Buttons\Button-Backpack-Up]])
            SetItemButtonTextureVertexColor(self, 1, 1, 1)
        else
            self:Update()
            self:RegisterEvent("ITEM_LOCK_CHANGED")
            self:RegisterEvent("CURSOR_UPDATE")
            self:RegisterEvent("BAG_UPDATE")
            self:RegisterEvent("PLAYERBANKSLOTS_CHANGED")
            if BagSlotInfo:IsBankBag(id) then
                self:RegisterEvent("BANKFRAME_OPENED")
                self:RegisterEvent("BANKFRAME_CLOSED")
                self:RegisterEvent("PLAYERBANKBAGSLOTS_CHANGED")
            end
        end
    end

    function Bag:Release()
        self:Hide()
        self:SetParent(nil)
        self:UnregisterAllEvents()
        _G[self:GetName() .. "Count"]:Hide()
        unused[self] = true
    end

    -- Helper to get the correct inventory slot
    function Bag:GetInventorySlot()
        return BagSlotInfo:ToInventorySlot(self:GetID())
    end

    function Bag:IsBagSlot()
        local id = self:GetID()
        return BagSlotInfo:IsBackpackBag(id) or BagSlotInfo:IsBankBag(id)
    end

    function Bag:IsPurchasable()
        return BagSlotInfo:IsPurchasable(playerName, self:GetID())
    end

    function Bag:Update()
        if not self:IsVisible() then return end
        local id = self:GetID()
        if BagSlotInfo:IsBackpack(id) or BagSlotInfo:IsBank(id) then return end

        -- Update lock
        if self:IsBagSlot() then
            SetItemButtonDesaturated(self, BagSlotInfo:IsLocked(playerName, id))
        end

        -- Update slot info (texture)
        if self:IsBagSlot() then
            local link, count, texture = BagSlotInfo:GetItemInfo(playerName, id)
            if link then
                SetItemButtonTexture(self, texture or GetItemIcon(link))
                SetItemButtonTextureVertexColor(self, 1, 1, 1)
            else
                SetItemButtonTexture(self, [[Interface\PaperDoll\UI-PaperDoll-Slot-Bag]])
                if self:IsPurchasable() then
                    SetItemButtonTextureVertexColor(self, 1, 0.1, 0.1)
                else
                    SetItemButtonTextureVertexColor(self, 1, 1, 1)
                end
            end
        end

        -- Update cursor highlight
        if self:IsBagSlot() then
            local invSlot = self:GetInventorySlot()
            if invSlot and CursorCanGoInSlot(invSlot) then
                self:LockHighlight()
            else
                self:UnlockHighlight()
            end
        end
    end

    function Bag:OnShow()
        self:Update()
    end

    function Bag:OnEnter()
        local id = self:GetID()
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        if BagSlotInfo:IsBackpack(id) or BagSlotInfo:IsBank(id) then
            GameTooltip:SetText(BACKPACK_TOOLTIP)
        else
            local invSlot = self:GetInventorySlot()
            if invSlot then
                if not GameTooltip:SetInventoryItem("player", invSlot) then
                    if self:IsPurchasable() then
                        GameTooltip:SetText(BANK_BAG_PURCHASE, 1, 1, 1)
                    else
                        GameTooltip:SetText(EQUIP_CONTAINER)
                    end
                end
            else
                GameTooltip:SetText(EQUIP_CONTAINER)
            end
        end
        GameTooltip:Show()
        -- Highlight items in this bag
        local parent = self:GetParent()
        if parent and parent.itemFrame then
            parent.itemFrame:HighlightBag(id)
        end
    end

    function Bag:OnLeave()
        if GameTooltip:IsOwned(self) then
            GameTooltip:Hide()
        end
        local parent = self:GetParent()
        if parent and parent.itemFrame then
            parent.itemFrame:HighlightBag(nil)
        end
    end

    function Bag:OnClick(button)
        local id = self:GetID()
        if BagSlotInfo:IsBackpack(id) or BagSlotInfo:IsBank(id) then return end

        if self:IsPurchasable() then
            self:PurchaseSlot()
        elseif CursorHasItem() then
            local invSlot = self:GetInventorySlot()
            if invSlot then
                PutItemInBag(invSlot)
            end
        else
            local invSlot = self:GetInventorySlot()
            if invSlot then
                PickupBagFromSlot(invSlot)
            end
        end
    end

    function Bag:OnDrag()
        local id = self:GetID()
        if not (BagSlotInfo:IsBackpack(id) or BagSlotInfo:IsBank(id)) then
            local invSlot = self:GetInventorySlot()
            if invSlot then
                PickupBagFromSlot(invSlot)
            end
        end
    end

    function Bag:PurchaseSlot()
        if not StaticPopupDialogs["CONFIRM_BUY_BANK_SLOT_COMBUCTOR"] then
            StaticPopupDialogs["CONFIRM_BUY_BANK_SLOT_COMBUCTOR"] = {
                text = CONFIRM_BUY_BANK_SLOT,
                button1 = YES,
                button2 = NO,
                OnAccept = function()
                    PurchaseSlot()
                end,
                OnShow = function(self)
                    MoneyFrame_Update(self:GetName() .. "MoneyFrame", GetBankSlotCost(GetNumBankSlots()))
                end,
                hasMoneyFrame = 1,
                timeout = 0,
                hideOnEscape = 1
            }
        end
        PlaySound("igMainMenuOption")
        StaticPopup_Show("CONFIRM_BUY_BANK_SLOT_COMBUCTOR")
    end

    function Bag:OnEvent(event)
        self:Update()
    end
end

-- ============================================================================
-- MONEY FRAME
-- ============================================================================

do
    local MoneyFrame = mod:NewClass("Frame")
    mod.MoneyFrame = MoneyFrame

    local moneyId = 1
    function MoneyFrame:New(parent)
        local f = self:Bind(CreateFrame("Frame", format("DragonUI_CombuctorMoney%d", moneyId), parent, "SmallMoneyFrameTemplate"))
        f:SetScript("OnShow", self.OnShow)
        f:SetFrameLevel(f:GetFrameLevel() + 4)
        moneyId = moneyId + 1
        return f
    end

    function MoneyFrame:OnShow()
        self:Update()
    end

    function MoneyFrame:Update()
        local money = mod("PlayerInfo"):GetMoney(self:GetParent():GetPlayer())
        MoneyFrame_Update(self:GetName(), money)
    end
end

-- ============================================================================
-- QUALITY FILTER
-- ============================================================================

do
    local FilterButton = mod:NewClass("CheckButton")
    local SIZE = 20
    local IsModifierKeyDown = IsModifierKeyDown

    function FilterButton:Create(parent, quality, qualityFlag)
        local button = self:Bind(CreateFrame("CheckButton", nil, parent, "UIRadioButtonTemplate"))
        button:SetWidth(SIZE)
        button:SetHeight(SIZE)
        button:SetScript("OnClick", self.OnClick)
        button:SetScript("OnEnter", self.OnEnter)
        button:SetScript("OnLeave", self.OnLeave)

        local bg = button:CreateTexture(nil, "BACKGROUND")
        bg:SetSize(SIZE / 3, SIZE / 3)
        bg:SetPoint("CENTER")

        local r, g, b = GetItemQualityColor(quality)
        bg:SetTexture(r * 1.25, g * 1.25, b * 1.25, 0.75)

        button:SetCheckedTexture(bg)
        button:GetNormalTexture():SetVertexColor(r, g, b)

        button.quality = quality
        button.qualityFlag = qualityFlag
        return button
    end

    function FilterButton:OnClick()
        local frame = self:GetParent():GetParent()
        if bit.band(frame:GetQuality(), self.qualityFlag) > 0 then
            if IsModifierKeyDown() or frame:GetQuality() == self.qualityFlag then
                frame:RemoveQuality(self.qualityFlag)
            else
                frame:SetQuality(self.qualityFlag)
            end
        elseif IsModifierKeyDown() then
            frame:AddQuality(self.qualityFlag)
        else
            frame:SetQuality(self.qualityFlag)
        end
    end

    function FilterButton:OnEnter()
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        local quality = self.quality
        if quality then
            local r, g, b = GetItemQualityColor(quality)
            GameTooltip:SetText(_G[format("ITEM_QUALITY%d_DESC", quality)], r, g, b)
        else
            GameTooltip:SetText(ALL)
        end
        GameTooltip:Show()
    end

    function FilterButton:OnLeave()
        GameTooltip:Hide()
    end

    function FilterButton:UpdateHighlight(quality)
        self:SetChecked(bit.band(quality, self.qualityFlag) > 0)
    end

    local QualityFilter = mod:NewClass("Frame")
    mod.QualityFilter = QualityFilter

    function QualityFilter:New(parent)
        local f = self:Bind(CreateFrame("Frame", nil, parent))

        f:AddQualityButton(0)
        f:AddQualityButton(1)
        f:AddQualityButton(2)
        f:AddQualityButton(3)
        f:AddQualityButton(4)
        f:AddQualityButton(5, mod.QualityFlags[5] + mod.QualityFlags[6])
        f:AddQualityButton(7)

        f:SetWidth(SIZE * 6)
        f:SetHeight(SIZE)
        f:UpdateHighlight()

        return f
    end

    function QualityFilter:AddQualityButton(quality, qualityFlags)
        local button = FilterButton:Create(self, quality, qualityFlags or mod.QualityFlags[quality])
        if self.prev then
            button:SetPoint("LEFT", self.prev, "RIGHT", 1, 0)
        else
            button:SetPoint("LEFT")
        end
        self.prev = button
    end

    function QualityFilter:UpdateHighlight()
        local quality = self:GetParent():GetQuality()
        for i = 1, select("#", self:GetChildren()) do
            select(i, self:GetChildren()):UpdateHighlight(quality)
        end
    end
end

-- ============================================================================
-- SIDE FILTER (category tabs on left/right)
-- ============================================================================

do
    local SideTab = mod:NewClass("CheckButton")

    function SideTab:New(parent, id)
        local tab = self:Bind(CreateFrame("CheckButton", format("%sSideTab%d", parent:GetParent():GetName(), id), parent, "DragonUI_CombuctorSideTabButtonTemplate"))
        tab.border = _G[tab:GetName() .. "Border"]
        return tab
    end

    function SideTab:Set(set)
        self.set = set
        self.tooltip = set.name
        if set.icon then
            self:SetNormalTexture(set.icon)
            self:GetNormalTexture():SetTexCoord(0.06, 0.94, 0.06, 0.94)
        end
    end

    function SideTab:SetReversed(reversed)
        self.reversed = reversed and true or nil
        if self.border then
            self.border:ClearAllPoints()
            if reversed then
                self.border:SetTexCoord(1, 0, 0, 1)
                self.border:SetPoint("TOPRIGHT", 3, 11)
            else
                self.border:SetTexCoord(0, 1, 0, 1)
                self.border:SetPoint("TOPLEFT", -3, 11)
            end
        end
    end

    function SideTab:UpdateHighlight(setName)
        self:SetChecked(self.set.name == setName)
    end

    local SideFilter = mod:NewClass("Frame")
    mod.SideFilter = SideFilter

    function SideFilter:New(parent, reversed)
        local f = self:Bind(CreateFrame("Frame", parent:GetName() .. "SideFilter", parent))
        f.buttons = setmetatable({}, { __index = function(t, k)
            local tab = SideTab:New(f, k)
            if k > 1 then
                tab:SetPoint("TOP", f.buttons[k - 1], "BOTTOM", 0, -17)
            end
            tab:SetScript("OnClick", function(self)
                parent:SetCategory(self.set.name)
            end)
            t[k] = tab
            return tab
        end })
        f.reversed = reversed
        f:SetReversed(reversed)
        return f
    end

    function SideFilter:SetReversed(enable)
        self.reversed = enable
        self:UpdateAnchoring()
    end

    function SideFilter:Reversed()
        return self.reversed
    end

    function SideFilter:UpdateAnchoring()
        local parent = self:GetParent()
        if self.reversed then
            if self.buttons[1] then
                self.buttons[1]:ClearAllPoints()
                self.buttons[1]:SetPoint("TOPRIGHT", parent, "TOPLEFT", 10, -80)
            end
        else
            if self.buttons[1] then
                self.buttons[1]:ClearAllPoints()
                self.buttons[1]:SetPoint("TOPLEFT", parent, "TOPRIGHT", -32, -65)
            end
        end
        -- Update border flip and icon offset for all visible buttons
        for _, button in pairs(self.buttons) do
            if button:IsShown() and button.SetReversed then
                button:SetReversed(self.reversed)
            end
        end
    end

    function SideFilter:UpdateFilters()
        local CombuctorSet = mod("Sets")
        local parent = self:GetParent()
        local numFilters = 0

        for _, set in CombuctorSet:GetParentSets() do
            if parent:HasSet(set.name) then
                numFilters = numFilters + 1
                self.buttons[numFilters]:Set(set)
                self.buttons[numFilters]:Show()
            end
        end

        -- Hide excess buttons (important after profile reset)
        for i = numFilters + 1, #self.buttons do
            self.buttons[i]:Hide()
            self.buttons[i]:SetHeight(0.001)
        end
        -- Restore height for visible buttons
        for i = 1, numFilters do
            self.buttons[i]:SetHeight(32)
        end

        self:UpdateAnchoring()
        if numFilters > 0 then
            self:Show()
        else
            self:Hide()
        end
    end

    function SideFilter:UpdateHighlight()
        local category = self:GetParent():GetCategory()
        for _, button in pairs(self.buttons) do
            if button:IsShown() then
                button:UpdateHighlight(category)
            end
        end
    end
end

-- ============================================================================
-- BOTTOM FILTER (subcategory tabs)
-- ============================================================================

do
    local BottomTab = mod:NewClass("Button")

    function BottomTab:New(parent, id)
        local tab = self:Bind(CreateFrame("Button", parent:GetName() .. "Tab" .. id, parent, "DragonUI_CombuctorFrameTabButtonTemplate"))
        tab:SetID(id)
        tab:SetScript("OnClick", function(self)
            parent:GetParent():SetSubCategory(self.set.name)
        end)
        return tab
    end

    function BottomTab:Set(set)
        self.set = set
        if set.icon then
            self:SetFormattedText("|T%s:%d|t %s", set.icon, 16, set.name)
        else
            self:SetText(set.name)
        end
        PanelTemplates_TabResize(self, 0)
        self:GetHighlightTexture():SetWidth(self:GetTextWidth() + 30)
    end

    function BottomTab:UpdateHighlight(setName)
        if self.set.name == setName then
            PanelTemplates_SetTab(self:GetParent(), self:GetID())
        end
    end

    local BottomFilter = mod:NewClass("Frame")
    mod.BottomFilter = BottomFilter

    function BottomFilter:New(parent)
        local f = self:Bind(CreateFrame("Frame", parent:GetName() .. "BottomFilter", parent))
        f.buttons = setmetatable({}, { __index = function(t, k)
            local tab = BottomTab:New(f, k)
            if k > 1 then
                tab:SetPoint("LEFT", f.buttons[k - 1], "RIGHT", -16, 0)
            else
                tab:SetPoint("CENTER", parent, "BOTTOMLEFT", 60, 46)
            end
            t[k] = tab
            return tab
        end })
        return f
    end

    function BottomFilter:UpdateFilters()
        local numFilters = 0
        local parent = self:GetParent()
        local CombuctorSet = mod("Sets")

        for _, set in CombuctorSet:GetChildSets(parent:GetCategory()) do
            if parent:HasSubSet(set.name, set.parent) then
                numFilters = numFilters + 1
                self.buttons[numFilters]:Set(set)
            end
        end

        if numFilters > 1 then
            for i = 1, numFilters do self.buttons[i]:Show() end
            for i = numFilters + 1, #self.buttons do self.buttons[i]:Hide() end
            PanelTemplates_SetNumTabs(self, numFilters)
            self:UpdateHighlight()
            self:Show()
        else
            PanelTemplates_SetNumTabs(self, 0)
            self:Hide()
        end
        self:GetParent():UpdateClampInsets()
    end

    function BottomFilter:UpdateHighlight()
        local category = self:GetParent():GetSubCategory()
        for _, button in pairs(self.buttons) do
            if button:IsShown() then button:UpdateHighlight(category) end
        end
    end
end

-- ============================================================================
-- FRAME EVENTS (set configuration relay)
-- ============================================================================

do
    local FrameEvents = mod:NewModule("FrameEvents")
    local frames = {}

    function FrameEvents:Load()
        local CSet = mod("Sets")
        CSet:RegisterMessage(self, "COMBUCTOR_SET_ADD", "UpdateSets")
        CSet:RegisterMessage(self, "COMBUCTOR_SET_UPDATE", "UpdateSets")
        CSet:RegisterMessage(self, "COMBUCTOR_SET_REMOVE", "UpdateSets")
        CSet:RegisterMessage(self, "COMBUCTOR_CONFIG_SET_ADD", "UpdateSetConfig")
        CSet:RegisterMessage(self, "COMBUCTOR_CONFIG_SET_REMOVE", "UpdateSetConfig")
        CSet:RegisterMessage(self, "COMBUCTOR_SUBSET_ADD", "UpdateSubSets")
        CSet:RegisterMessage(self, "COMBUCTOR_SUBSET_UPDATE", "UpdateSubSets")
        CSet:RegisterMessage(self, "COMBUCTOR_SUBSET_REMOVE", "UpdateSubSets")
        CSet:RegisterMessage(self, "COMBUCTOR_CONFIG_SUBSET_ADD", "UpdateSubSetConfig")
        CSet:RegisterMessage(self, "COMBUCTOR_CONFIG_SUBSET_REMOVE", "UpdateSubSetConfig")
    end

    function FrameEvents:UpdateSets(msg, name)
        for f in self:GetFrames() do
            if f:HasSet(name) then f:UpdateSets() end
        end
    end

    function FrameEvents:UpdateSetConfig(msg, key, name)
        for f in self:GetFrames() do
            if f.key == key then f:UpdateSets() end
        end
    end

    function FrameEvents:UpdateSubSetConfig(msg, key, name, parent)
        for f in self:GetFrames() do
            if f.key == key and f:GetCategory() == parent then f:UpdateSubSets() end
        end
    end

    function FrameEvents:UpdateSubSets(msg, name, parent)
        for f in self:GetFrames() do
            if f:GetCategory() == parent then f:UpdateSubSets() end
        end
    end

    function FrameEvents:Register(f) frames[f] = true end
    function FrameEvents:Unregister(f) frames[f] = nil end
    function FrameEvents:GetFrames() return pairs(frames) end

    FrameEvents:Load()
end

-- ============================================================================
-- INVENTORY FRAME CLASS (main window)
-- ============================================================================

do
    local InventoryFrame = mod:NewClass("Frame")
    mod.Frame = InventoryFrame

    local CombuctorSet = mod("Sets")
    local FrameEvents = mod("FrameEvents")

    local BASE_WIDTH = 384
    local ITEM_FRAME_WIDTH_OFFSET = 312 - BASE_WIDTH
    local BASE_HEIGHT = 512
    local ITEM_FRAME_HEIGHT_OFFSET = 346 - BASE_HEIGHT

    local lastID = 1
    function InventoryFrame:New(titleText, settings, isBank, key)
        local f = self:Bind(CreateFrame("Frame", format("DragonUI_CombuctorFrame%d", lastID), UIParent, "DragonUI_CombuctorInventoryTemplate"))
        f:SetScript("OnShow", self.OnShow)
        f:SetScript("OnHide", self.OnHide)

        f.sets = settings
        f.isBank = isBank
        f.key = key
        f.titleText = titleText
        f.bagButtons = {}
        f.filter = { quality = 0 }

        f:SetWidth(settings.w or BASE_WIDTH)
        f:SetHeight(settings.h or BASE_HEIGHT)

        -- Override min resize to allow smaller heights than the NineSlice base
        f:SetMinResize(BASE_WIDTH, 350)

        f.title = _G[f:GetName() .. "Title"]
        f.sideFilter = mod.SideFilter:New(f, f:IsSideFilterOnLeft())
        f.bottomFilter = mod.BottomFilter:New(f)
        f.nameFilter = _G[f:GetName() .. "Search"]

        f.qualityFilter = mod.QualityFilter:New(f)
        f.qualityFilter:SetPoint("BOTTOMLEFT", 24, 65)

        f.itemFrame = mod.ItemFrame:New(f)
        f.itemFrame:SetPoint("TOPLEFT", 24, -78)

        f.moneyFrame = mod.MoneyFrame:New(f)
        f.moneyFrame:SetPoint("BOTTOMRIGHT", -40, 67)

        f:UpdateTitleText()
        f:UpdateBagToggleHighlight()
        f:UpdateBagFrame()
        f.sideFilter:UpdateFilters()
        f:LoadPosition()
        f:UpdateClampInsets()

        lastID = lastID + 1
        tinsert(UISpecialFrames, f:GetName())
        return f
    end

    function InventoryFrame:UpdateTitleText()
        self.title:SetFormattedText(self.titleText, self:GetPlayer())
    end

    function InventoryFrame:OnTitleEnter(title)
        GameTooltip:SetOwner(title, "ANCHOR_LEFT")
        GameTooltip:SetText(title:GetText(), 1, 1, 1)
        GameTooltip:AddLine(L.MoveTip)
        GameTooltip:AddLine(L.ResetPositionTip)
        GameTooltip:Show()
    end

    function InventoryFrame:OnBagToggleClick(toggle, button)
        if button == "LeftButton" then
            _G[toggle:GetName() .. "Icon"]:SetTexCoord(0.075, 0.925, 0.075, 0.925)
            self:ToggleBagFrame()
        else
            if self.isBank then
                mod:Toggle(BACKPACK_CONTAINER)
            else
                mod:Toggle(BANK_CONTAINER)
            end
        end
    end

    function InventoryFrame:OnBagToggleEnter(toggle)
        GameTooltip:SetOwner(toggle, "ANCHOR_LEFT")
        GameTooltip:SetText(L.Bags, 1, 1, 1)
        GameTooltip:AddLine(L.BagToggle)
        if self.isBank then
            GameTooltip:AddLine(L.InventoryToggle)
        else
            GameTooltip:AddLine(L.BankToggle)
        end
        GameTooltip:Show()
    end

    function InventoryFrame:ToggleBagFrame()
        self.sets.showBags = not self.sets.showBags
        self:UpdateBagToggleHighlight()
        self:UpdateBagFrame()
    end

    function InventoryFrame:UpdateBagFrame()
        for i, bag in pairs(self.bagButtons) do
            self.bagButtons[i] = nil
            bag:Release()
        end
        if self.sets.showBags then
            for _, bagID in ipairs(self.sets.bags) do
                if bagID ~= KEYRING_CONTAINER then
                    local bag = mod.Bag:Get()
                    bag:Set(self, bagID)
                    tinsert(self.bagButtons, bag)
                end
            end
            for i, bag in ipairs(self.bagButtons) do
                bag:ClearAllPoints()
                if i > 1 then
                    bag:SetPoint("TOP", self.bagButtons[i - 1], "BOTTOM", 0, -6)
                else
                    bag:SetPoint("TOPRIGHT", -48, -82)
                end
                bag:Show()
            end
        end
        self:UpdateItemFrameSize()
    end

    function InventoryFrame:UpdateBagToggleHighlight()
        if self.sets.showBags then
            _G[self:GetName() .. "BagToggle"]:LockHighlight()
        else
            _G[self:GetName() .. "BagToggle"]:UnlockHighlight()
        end
    end

    function InventoryFrame:SetFilter(key, value)
        if self.filter[key] ~= value then
            self.filter[key] = value
            self.itemFrame:Regenerate()
            return true
        end
    end

    function InventoryFrame:GetFilter(key)
        return self.filter[key]
    end

    function InventoryFrame:SetPlayer(player)
        if self:GetPlayer() ~= player then
            self.player = player
            self:UpdateTitleText()
            self:UpdateBagFrame()
            self:UpdateSets()
            self.itemFrame:SetPlayer(player)
            self.moneyFrame:Update()
        end
    end

    function InventoryFrame:GetPlayer()
        return self.player or playerName
    end

    function InventoryFrame:UpdateSets(category)
        self.sideFilter:UpdateFilters()
        self:SetCategory(category or self:GetCategory())
        self:UpdateSubSets()
    end

    function InventoryFrame:UpdateSubSets(subCategory)
        self.bottomFilter:UpdateFilters()
        self:SetSubCategory(subCategory or self:GetSubCategory())
    end

    function InventoryFrame:HasSet(name)
        for _, setName in self:GetSets() do
            if setName == name then return true end
        end
        return false
    end

    function InventoryFrame:HasSubSet(name, parent)
        if self:HasSet(parent) then
            local excludeSets = self:GetExcludedSubsets(parent)
            if excludeSets then
                for _, childSet in pairs(excludeSets) do
                    if childSet == name then return false end
                end
            end
            return true
        end
        return false
    end

    function InventoryFrame:GetSets()
        local profile = mod:GetProfile()
        return ipairs(profile[self.key].sets)
    end

    function InventoryFrame:GetExcludedSubsets(parent)
        local profile = mod:GetProfile()
        return profile[self.key].exclude[parent]
    end

    function InventoryFrame:SetCategory(name)
        if not (self:HasSet(name) and CombuctorSet:Get(name)) then
            name = self:GetDefaultCategory()
        end
        local set = name and CombuctorSet:Get(name)
        if self:SetFilter("rule", (set and set.rule) or nil) then
            self.category = name
            self.sideFilter:UpdateHighlight()
            self:UpdateSubSets()
        end
    end

    function InventoryFrame:GetCategory()
        return self.category or self:GetDefaultCategory()
    end

    function InventoryFrame:GetDefaultCategory()
        for _, set in CombuctorSet:GetParentSets() do
            if self:HasSet(set.name) then return set.name end
        end
    end

    function InventoryFrame:SetSubCategory(name)
        local parent = self:GetCategory()
        if not (parent and self:HasSubSet(name, parent) and CombuctorSet:Get(name, parent)) then
            name = self:GetDefaultSubCategory()
        end
        local set = name and CombuctorSet:Get(name, parent)
        if self:SetFilter("subRule", (set and set.rule) or nil) then
            self.subCategory = name
            self.bottomFilter:UpdateHighlight()
        end
    end

    function InventoryFrame:GetSubCategory()
        return self.subCategory or self:GetDefaultSubCategory()
    end

    function InventoryFrame:GetDefaultSubCategory()
        local parent = self:GetCategory()
        if parent then
            for _, set in CombuctorSet:GetChildSets(parent) do
                if self:HasSubSet(set.name, parent) then return set.name end
            end
        end
    end

    function InventoryFrame:AddQuality(quality)
        self:SetFilter("quality", self:GetFilter("quality") + quality)
        self.qualityFilter:UpdateHighlight()
    end

    function InventoryFrame:RemoveQuality(quality)
        self:SetFilter("quality", self:GetFilter("quality") - quality)
        self.qualityFilter:UpdateHighlight()
    end

    function InventoryFrame:SetQuality(quality)
        self:SetFilter("quality", quality)
        self.qualityFilter:UpdateHighlight()
    end

    function InventoryFrame:GetQuality()
        return self:GetFilter("quality") or 0
    end

    function InventoryFrame:OnSizeChanged()
        local w, h = self:GetWidth(), self:GetHeight()
        self.sets.w = w
        self.sets.h = h
        self:SizeTLTextures(w, h)
        self:SizeBLTextures(w, h)
        self:SizeTRTextures(w, h)
        self:SizeBRTextures(w, h)
        self:UpdateItemFrameSize()
    end

    function InventoryFrame:SizeTLTextures(w, h)
        local n = self:GetName()
        _G[n .. "TLRight"]:SetWidth(128 + (w - BASE_WIDTH) / 2)
        _G[n .. "TLBottom"]:SetHeight(128 + (h - BASE_HEIGHT) / 2)
        _G[n .. "TLBottomRight"]:SetWidth(128 + (w - BASE_WIDTH) / 2)
        _G[n .. "TLBottomRight"]:SetHeight(128 + (h - BASE_HEIGHT) / 2)
    end

    function InventoryFrame:SizeBLTextures(w, h)
        local n = self:GetName()
        _G[n .. "BLRight"]:SetWidth(128 + (w - BASE_WIDTH) / 2)
        _G[n .. "BLTop"]:SetHeight(128 + (h - BASE_HEIGHT) / 2)
        _G[n .. "BLTopRight"]:SetWidth(128 + (w - BASE_WIDTH) / 2)
        _G[n .. "BLTopRight"]:SetHeight(128 + (h - BASE_HEIGHT) / 2)
    end

    function InventoryFrame:SizeTRTextures(w, h)
        local n = self:GetName()
        _G[n .. "TRLeft"]:SetWidth(64 + (w - BASE_WIDTH) / 2)
        _G[n .. "TRBottom"]:SetHeight(128 + (h - BASE_HEIGHT) / 2)
        _G[n .. "TRBottomLeft"]:SetWidth(64 + (w - BASE_WIDTH) / 2)
        _G[n .. "TRBottomLeft"]:SetHeight(128 + (h - BASE_HEIGHT) / 2)
    end

    function InventoryFrame:SizeBRTextures(w, h)
        local n = self:GetName()
        _G[n .. "BRLeft"]:SetWidth(64 + (w - BASE_WIDTH) / 2)
        _G[n .. "BRTop"]:SetHeight(128 + (h - BASE_HEIGHT) / 2)
        _G[n .. "BRTopLeft"]:SetWidth(64 + (w - BASE_WIDTH) / 2)
        _G[n .. "BRTopLeft"]:SetHeight(128 + (h - BASE_HEIGHT) / 2)
    end

    function InventoryFrame:UpdateItemFrameSize()
        if not self.itemFrame then return end
        local prevW, prevH = self.itemFrame:GetWidth(), self.itemFrame:GetHeight()
        local newW = self:GetWidth() + ITEM_FRAME_WIDTH_OFFSET
        if next(self.bagButtons) then
            newW = newW - 36
        end
        local newH = self:GetHeight() + ITEM_FRAME_HEIGHT_OFFSET
        if not (prevW == newW and prevH == newH) then
            self.itemFrame:SetWidth(newW)
            self.itemFrame:SetHeight(newH)
            self.itemFrame:RequestLayout()
        end
    end

    function InventoryFrame:UpdateClampInsets()
        local l, r, t, b
        if self.bottomFilter:IsShown() then
            t, b = -15, 35
        else
            t, b = -15, 65
        end
        if self.sideFilter:IsShown() then
            if self.sideFilter:Reversed() then
                l, r = -20, -35
            else
                l, r = 15, 0
            end
        else
            l, r = 15, -35
        end
        self:SetClampRectInsets(l, r, t, b)
    end

    function InventoryFrame:SavePosition(point, parent, relPoint, x, y)
        if point then
            self.sets.position = { point, nil, relPoint, x, y }
        else
            self.sets.position = nil
        end
        self:LoadPosition()
    end

    function InventoryFrame:LoadPosition()
        if self.sets.position then
            local point, _, relPoint, x, y = unpack(self.sets.position)
            self:ClearAllPoints()
            self:SetPoint(point, self:GetParent(), relPoint, x, y)
            self:SetUserPlaced(true)
        else
            -- No saved position: anchor at a visible default so the frame actually renders
            self:ClearAllPoints()
            if self.isBank then
                self:SetPoint("LEFT", UIParent, "LEFT", 24, 0)
            else
                self:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -64, 64)
            end
            self:SetUserPlaced(nil)
        end
    end

    function InventoryFrame:OnShow()
        PlaySound("igBackPackOpen")
        FrameEvents:Register(self)
        self:UpdateSets(self:GetDefaultCategory())
    end

    function InventoryFrame:OnHide()
        PlaySound("igBackPackClose")
        FrameEvents:Unregister(self)
        if self:IsBank() and self:AtBank() then
            CloseBankFrame()
        end
        self:SetPlayer(playerName)
    end

    function InventoryFrame:ToggleFrame(auto)
        if self:IsShown() then self:HideFrame(auto) else self:ShowFrame(auto) end
    end

    function InventoryFrame:ShowFrame(auto)
        if not self:IsShown() then
            ShowUIPanel(self)
            self.autoShown = auto or nil
        end
    end

    function InventoryFrame:HideFrame(auto)
        if self:IsShown() then
            if not auto or self.autoShown then
                HideUIPanel(self)
                self.autoShown = nil
            end
        end
    end

    function InventoryFrame:SetLeftSideFilter(enable)
        self.sets.leftSideFilter = enable and true or nil
        self.sideFilter:SetReversed(enable)
    end

    function InventoryFrame:IsSideFilterOnLeft()
        return self.sets.leftSideFilter
    end

    function InventoryFrame:IsBank()
        return self.isBank
    end

    function InventoryFrame:AtBank()
        return mod("PlayerInfo"):AtBank()
    end
end

-- ============================================================================
-- APPLY / RESTORE SYSTEM
-- ============================================================================

local AutoShowInventory, AutoHideInventory

local function ApplyCombuctorSystem()
    if CombuctorModule.applied then return end

    SetupDatabase()
    if not DB then return end

    -- Sets are empty by default (no category tabs shown)
    -- Users can enable individual tabs via the options panel

    -- Create frames only once; toggling module should reuse existing frames.
    mod.frames = mod.frames or {}
    if not mod.frames[1] then
        mod.frames[1] = mod.Frame:New(L.InventoryTitle, DB.inventory, false, "inventory")
    end
    if not mod.frames[2] then
        mod.frames[2] = mod.Frame:New(L.BankTitle, DB.bank, true, "bank")
    end

    AutoShowInventory = function()
        mod:Show(BACKPACK_CONTAINER, true)
    end
    AutoHideInventory = function()
        mod:Hide(BACKPACK_CONTAINER, true)
    end

    -- Store originals for restore
    CombuctorModule.originalStates.OpenBackpack = _G.OpenBackpack
    CombuctorModule.originalStates.ToggleBank = _G.ToggleBank
    CombuctorModule.originalStates.ToggleBackpack = _G.ToggleBackpack
    CombuctorModule.originalStates.OpenAllBags = _G.OpenAllBags
    CombuctorModule.originalStates.ToggleAllBags = _G.ToggleAllBags

    -- Hook bag functions
    _G.OpenBackpack = AutoShowInventory
    if not CombuctorModule.hooks.closeBackpack then
        hooksecurefunc("CloseBackpack", AutoHideInventory)
        CombuctorModule.hooks.closeBackpack = true
    end

    _G.ToggleBank = function(bag) mod:Toggle(bag) end
    _G.ToggleBackpack = function() mod:Toggle(BACKPACK_CONTAINER) end
    -- Some keybind paths call OpenAllBags directly, so make it a true toggle.
    _G.OpenAllBags = function() mod:Toggle(BACKPACK_CONTAINER) end
    if _G.ToggleAllBags then
        _G.ToggleAllBags = function() mod:Toggle(BACKPACK_CONTAINER) end
    end

    if not CombuctorModule.hooks.closeAllBags then
        hooksecurefunc("CloseAllBags", function() mod:Hide(BACKPACK_CONTAINER) end)
        CombuctorModule.hooks.closeAllBags = true
    end
    BankFrame:UnregisterAllEvents()
    BankFrame:Hide()

    if not CombuctorModule.hooks.inventoryEvents then
        mod("InventoryEvents"):Register(mod, "BANK_OPENED", function()
            mod:Show(BANK_CONTAINER, true)
            mod:Show(BACKPACK_CONTAINER, true)
        end)
        mod("InventoryEvents"):Register(mod, "BANK_CLOSED", function()
            mod:Hide(BANK_CONTAINER, true)
            mod:Hide(BACKPACK_CONTAINER, true)
        end)
        CombuctorModule.hooks.inventoryEvents = true
    end

    -- Auto show/hide on trade/auction/mail
    local autoEventFrame = CombuctorModule.frames.autoEventFrame or CreateFrame("Frame")
    autoEventFrame:UnregisterAllEvents()
    autoEventFrame:SetScript("OnEvent", function(self, event)
        if event == "MAIL_CLOSED" or event == "TRADE_CLOSED" or
           event == "TRADE_SKILL_CLOSE" or event == "AUCTION_HOUSE_CLOSED" then
            AutoHideInventory()
        elseif event == "TRADE_SHOW" or event == "TRADE_SKILL_SHOW" or
               event == "AUCTION_HOUSE_SHOW" then
            AutoShowInventory()
        end
    end)
    autoEventFrame:RegisterEvent("MAIL_CLOSED")
    autoEventFrame:RegisterEvent("TRADE_CLOSED")
    autoEventFrame:RegisterEvent("TRADE_SKILL_CLOSE")
    autoEventFrame:RegisterEvent("AUCTION_HOUSE_CLOSED")
    autoEventFrame:RegisterEvent("TRADE_SHOW")
    autoEventFrame:RegisterEvent("TRADE_SKILL_SHOW")
    autoEventFrame:RegisterEvent("AUCTION_HOUSE_SHOW")
    CombuctorModule.frames.autoEventFrame = autoEventFrame

    -- Slash commands
    SlashCmdList["DRAGONUI_COMBUCTOR"] = function(msg)
        msg = msg and msg:lower() or ""
        if msg == "bank" then
            mod:Toggle(BANK_CONTAINER)
        elseif msg == "bags" or msg == "inventory" then
            mod:Toggle(BACKPACK_CONTAINER)
        else
            mod:Toggle(BACKPACK_CONTAINER)
        end
    end
    SLASH_DRAGONUI_COMBUCTOR1 = "/cbt"
    SLASH_DRAGONUI_COMBUCTOR2 = "/combuctor"

    CombuctorModule.applied = true
end

local function RestoreCombuctorSystem()
    if not CombuctorModule.applied then return end

    if CombuctorModule.frames.autoEventFrame then
        CombuctorModule.frames.autoEventFrame:UnregisterAllEvents()
        CombuctorModule.frames.autoEventFrame:SetScript("OnEvent", nil)
    end

    -- Hide all frames
    if mod.frames then
        for _, frame in pairs(mod.frames) do
            if frame.HideFrame then frame:HideFrame() end
        end
    end

    -- Restore original bag functions
    if CombuctorModule.originalStates.OpenBackpack then
        _G.OpenBackpack = CombuctorModule.originalStates.OpenBackpack
    end
    if CombuctorModule.originalStates.ToggleBank then
        _G.ToggleBank = CombuctorModule.originalStates.ToggleBank
    end
    if CombuctorModule.originalStates.ToggleBackpack then
        _G.ToggleBackpack = CombuctorModule.originalStates.ToggleBackpack
    end
    if CombuctorModule.originalStates.OpenAllBags then
        _G.OpenAllBags = CombuctorModule.originalStates.OpenAllBags
    end
    if CombuctorModule.originalStates.ToggleAllBags then
        _G.ToggleAllBags = CombuctorModule.originalStates.ToggleAllBags
    end

    CombuctorModule.originalStates = {}
    CombuctorModule.applied = false
end

local function RefreshCombuctorFrames()
    if not mod.frames then return end

    for _, frame in pairs(mod.frames) do
        if frame and frame.UpdateSets then
            frame:UpdateSets()
        end
        if frame and frame.SetLeftSideFilter then
            frame:SetLeftSideFilter(frame:IsSideFilterOnLeft())
        end
        if frame and frame.UpdateClampInsets then
            frame:UpdateClampInsets()
        end
    end
end

-- ============================================================================
-- PROFILE CHANGE HANDLER
-- ============================================================================

local function OnProfileChanged()
    if IsModuleEnabled() then
        if not CombuctorModule.applied then
            ApplyCombuctorSystem()
        else
            -- Profile changed while module is active: refresh DB and existing frames
            SetupDatabase()
            if not DB then return end

            -- Sets remain as stored in profile (empty = no category tabs)

            -- Update existing frames to point to new DB tables
            if mod.frames then
                for _, frame in pairs(mod.frames) do
                    if frame.key and DB[frame.key] then
                        frame.sets = DB[frame.key]
                        frame:SetWidth(frame.sets.w or 384)
                        frame:SetHeight(frame.sets.h or 440)
                        if frame.UpdateSets then
                            frame:UpdateSets()
                        end
                    end
                end
            end
        end
    else
        if addon:ShouldDeferModuleDisable("combuctor", CombuctorModule) then
            return
        end
        RestoreCombuctorSystem()
    end
end

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

initFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "DragonUI" then
        if not IsModuleEnabled() then return end

        addon:After(0.5, function()
            if addon.db and addon.db.RegisterCallback then
                addon.db.RegisterCallback(addon, "OnProfileChanged", OnProfileChanged)
                addon.db.RegisterCallback(addon, "OnProfileCopied", OnProfileChanged)
                addon.db.RegisterCallback(addon, "OnProfileReset", OnProfileChanged)
            end
        end)

    elseif event == "PLAYER_ENTERING_WORLD" then
        if not IsModuleEnabled() then return end
        ApplyCombuctorSystem()
    end
end)

-- Export for external use
addon.ApplyCombuctorSystem = ApplyCombuctorSystem
addon.RestoreCombuctorSystem = RestoreCombuctorSystem
addon.RefreshCombuctorFrames = RefreshCombuctorFrames

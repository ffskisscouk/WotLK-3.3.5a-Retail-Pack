--[[
================================================================================
DragonUI - Module Base Template
================================================================================
This file contains the base template that all DragonUI modules should follow
to maintain consistency and correct functionality.

USAGE:
1. Copy this template when creating a new module
2. Replace "ModuleName" with your module's name
3. Implement the Apply() and Restore() functions
4. Register necessary events and hooks

IMPORTANT:
- Always use SafeCall() for secure frame modifications
- Track all events, hooks and frames created
- Implement proper cleanup in Restore()
================================================================================
]]

local addon = select(2, ...)

-- ============================================================================
-- MODULE BASE MIXIN
-- Shared functions that all modules can use
-- ============================================================================

addon.ModuleBase = {}

-- Create a new module with the standard structure
function addon.ModuleBase:New(moduleName)
    local Module = {
        name = moduleName,
        initialized = false,
        applied = false,
        originalStates = {},      -- Original states for restoration
        registeredEvents = {},    -- Registered events (for cleanup)
        hooks = {},               -- Registered hooks (for cleanup)
        stateDrivers = {},        -- Registered state drivers (for cleanup)
        frames = {},              -- Created frames (for cleanup)
        pendingUpdate = false,    -- If there's a pending operation due to combat
        eventFrame = nil          -- Frame to handle events
    }
    
    -- Store global reference
    addon[moduleName .. "Module"] = Module
    
    return Module
end

-- ============================================================================
-- COMBAT SAFETY SYSTEM
-- Centralized system to handle combat-safe operations
-- ============================================================================

addon.CombatSafety = {
    pendingOperations = {},
    eventFrame = nil,
    initialized = false
}

function addon.CombatSafety:Initialize()
    if self.initialized then return end
    
    self.eventFrame = CreateFrame("Frame")
    self.eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
    self.eventFrame:SetScript("OnEvent", function(_, event)
        if event == "PLAYER_REGEN_ENABLED" then
            self:ExecuteAllPending()
        end
    end)
    
    self.initialized = true
end

function addon.CombatSafety:AddPending(id, func, ...)
    self.pendingOperations[id] = {
        func = func,
        args = {...}
    }
end

function addon.CombatSafety:ExecutePending(id)
    local operation = self.pendingOperations[id]
    if operation then
        local success, err = pcall(operation.func, unpack(operation.args))
        if not success then
            addon:Error(addon.L and addon.L["Error executing pending operation:"] or "Error executing pending operation:", err)
        end
        self.pendingOperations[id] = nil
    end
end

function addon.CombatSafety:ExecuteAllPending()
    for id, _ in pairs(self.pendingOperations) do
        self:ExecutePending(id)
    end
end

function addon.CombatSafety:HasPending(id)
    return self.pendingOperations[id] ~= nil
end

-- Utility function for combat-safe calls
-- Returns: success (bool), result (any)
-- If in combat, registers the operation for later and returns false
function addon.SafeCall(operationId, func, ...)
    if InCombatLockdown() then
        addon.CombatSafety:Initialize()
        addon.CombatSafety:AddPending(operationId, func, ...)
        return false, nil
    end
    
    local success, result = pcall(func, ...)
    if not success then
        addon:Error(addon.L and addon.L["Error in SafeCall:"] or "Error in SafeCall:", result)
        return false, nil
    end
    
    return true, result
end

-- ============================================================================
-- EVENT MANAGEMENT HELPERS
-- Helper functions to handle events with tracking
-- ============================================================================

-- Register an event with automatic tracking
function addon.ModuleBase:RegisterEvent(module, event, handler)
    if not module.eventFrame then
        module.eventFrame = CreateFrame("Frame")
        module.eventFrame:SetScript("OnEvent", function(self, event, ...)
            local handler = module.registeredEvents[event]
            if handler then
                if type(handler) == "function" then
                    handler(event, ...)
                elseif type(handler) == "string" and module[handler] then
                    module[handler](module, event, ...)
                end
            end
        end)
    end
    
    if not module.registeredEvents[event] then
        module.registeredEvents[event] = handler
        module.eventFrame:RegisterEvent(event)
        return true
    end
    
    return false
end

-- Unregister an event with cleanup
function addon.ModuleBase:UnregisterEvent(module, event)
    if module.registeredEvents[event] then
        if module.eventFrame then
            module.eventFrame:UnregisterEvent(event)
        end
        module.registeredEvents[event] = nil
        return true
    end
    return false
end

-- Unregister all events from a module
function addon.ModuleBase:UnregisterAllEvents(module)
    if module.eventFrame then
        module.eventFrame:UnregisterAllEvents()
    end
    module.registeredEvents = {}
end

-- ============================================================================
-- HOOK MANAGEMENT HELPERS
-- Helper functions to handle hooks with tracking
-- ============================================================================

-- Register a secure hook with tracking
function addon.ModuleBase:SecureHook(module, target, method, hookFunc)
    local hookId = tostring(target) .. "_" .. method
    
    if not module.hooks[hookId] then
        hooksecurefunc(target, method, hookFunc)
        module.hooks[hookId] = {
            target = target,
            method = method,
            func = hookFunc
        }
        return true
    end
    
    return false
end

-- Register a hook on a global function
function addon.ModuleBase:SecureHookGlobal(module, funcName, hookFunc)
    if not module.hooks[funcName] then
        hooksecurefunc(funcName, hookFunc)
        module.hooks[funcName] = {
            funcName = funcName,
            func = hookFunc
        }
        return true
    end
    
    return false
end

-- ============================================================================
-- STATE DRIVER MANAGEMENT
-- Functions to handle state drivers with tracking
-- ============================================================================

-- Register a state driver with tracking
function addon.ModuleBase:RegisterStateDriver(module, frame, state, condition)
    local driverId = tostring(frame) .. "_" .. state
    
    if not module.stateDrivers[driverId] then
        RegisterStateDriver(frame, state, condition)
        module.stateDrivers[driverId] = {
            frame = frame,
            state = state,
            condition = condition
        }
        return true
    end
    
    return false
end

-- Unregister a state driver
function addon.ModuleBase:UnregisterStateDriver(module, frame, state)
    local driverId = tostring(frame) .. "_" .. state
    
    if module.stateDrivers[driverId] then
        UnregisterStateDriver(frame, state)
        module.stateDrivers[driverId] = nil
        return true
    end
    
    return false
end

-- Unregister all state drivers from a module
function addon.ModuleBase:UnregisterAllStateDrivers(module)
    for id, driver in pairs(module.stateDrivers) do
        UnregisterStateDriver(driver.frame, driver.state)
    end
    module.stateDrivers = {}
end

-- ============================================================================
-- FRAME MANAGEMENT HELPERS
-- Functions to handle created frames with tracking
-- ============================================================================

-- Register a created frame for later cleanup
function addon.ModuleBase:RegisterFrame(module, frameName, frame)
    module.frames[frameName] = frame
end

-- Hide and cleanup all frames from a module
function addon.ModuleBase:HideAllFrames(module)
    for name, frame in pairs(module.frames) do
        if frame and frame.Hide then
            frame:Hide()
        end
    end
end

-- ============================================================================
-- ORIGINAL STATE MANAGEMENT
-- Functions to save and restore original states
-- ============================================================================

-- Save the original state of a frame
function addon.ModuleBase:SaveOriginalState(module, frameName, frame)
    if not frame then return end
    
    module.originalStates[frameName] = {
        isShown = frame:IsShown(),
        alpha = frame:GetAlpha(),
        scale = frame:GetScale(),
        point = {frame:GetPoint(1)}
    }
end

-- Restore the original state of a frame
function addon.ModuleBase:RestoreOriginalState(module, frameName, frame)
    if not frame then return end
    
    local state = module.originalStates[frameName]
    if not state then return end
    
    -- Don't modify secure frames in combat
    if InCombatLockdown() then
        addon.SafeCall("restore_" .. frameName, function()
            addon.ModuleBase:RestoreOriginalState(module, frameName, frame)
        end)
        return
    end
    
    frame:SetAlpha(state.alpha or 1)
    frame:SetScale(state.scale or 1)
    
    if state.point and state.point[1] then
        frame:ClearAllPoints()
        frame:SetPoint(unpack(state.point))
    end
    
    if state.isShown then
        frame:Show()
    else
        frame:Hide()
    end
end

-- ============================================================================
-- MODULE LIFECYCLE HELPERS
-- Functions for module lifecycle management
-- ============================================================================

-- Check if a module is enabled in configuration
function addon.ModuleBase:IsModuleEnabled(moduleName)
    local cfg = addon.db and addon.db.profile and addon.db.profile.modules 
                and addon.db.profile.modules[moduleName:lower()]
    return cfg and cfg.enabled
end

-- Get module configuration
function addon.ModuleBase:GetModuleConfig(moduleName)
    return addon.db and addon.db.profile and addon.db.profile.modules 
           and addon.db.profile.modules[moduleName:lower()]
end

-- Full cleanup of a module
function addon.ModuleBase:Cleanup(module)
    -- Unregister all events
    self:UnregisterAllEvents(module)
    
    -- Unregister all state drivers
    self:UnregisterAllStateDrivers(module)
    
    -- Hide all created frames
    self:HideAllFrames(module)
    
    -- Restore original states
    for frameName, _ in pairs(module.originalStates) do
        local frame = module.frames[frameName] or _G[frameName]
        if frame then
            self:RestoreOriginalState(module, frameName, frame)
        end
    end
    
    -- Mark as not applied
    module.applied = false
end

-- ============================================================================
-- MODULE TEMPLATE
-- Complete template to copy when creating new modules
-- ============================================================================

--[[
-- Copy this template to create a new module:

local addon = select(2, ...)
local ModuleName = "MyModule"  -- Change to your module name

-- ============================================================================
-- MODULE CONFIGURATION
-- ============================================================================

local function GetModuleConfig()
    return addon.db and addon.db.profile and addon.db.profile.modules 
           and addon.db.profile.modules[ModuleName:lower()]
end

local function IsModuleEnabled()
    local cfg = GetModuleConfig()
    return cfg and cfg.enabled
end

-- ============================================================================
-- MODULE STATE TRACKING
-- ============================================================================

local Module = addon.ModuleBase:New(ModuleName)

-- ============================================================================
-- MODULE FUNCTIONS
-- ============================================================================

local function Apply()
    if not IsModuleEnabled() then return end
    if Module.applied then return end
    
    -- Check combat for secure frames
    local success = addon.SafeCall(ModuleName .. "_apply", function()
        -- Save original states
        -- Apply changes
        -- Register events
        -- Create hooks
        
        Module.applied = true
    end)
    
    if not success then
        Module.pendingUpdate = true
    end
end

local function Restore()
    if not Module.applied then return end
    
    local success = addon.SafeCall(ModuleName .. "_restore", function()
        -- Cleanup using ModuleBase
        addon.ModuleBase:Cleanup(Module)
    end)
    
    if not success then
        Module.pendingUpdate = true
    end
end

local function Initialize()
    if Module.initialized then return end
    if not IsModuleEnabled() then return end
    
    Apply()
    Module.initialized = true
end

-- ============================================================================
-- PROFILE CALLBACKS
-- ============================================================================

local function OnProfileChanged()
    if IsModuleEnabled() then
        if not Module.applied then
            Apply()
        else
            -- Refresh settings
        end
    else
        Restore()
    end
end

-- ============================================================================
-- PUBLIC API
-- ============================================================================

function addon["Refresh" .. ModuleName]()
    if not IsModuleEnabled() then return end
    -- Refresh logic
end

function addon["Refresh" .. ModuleName .. "System"]()
    if IsModuleEnabled() then
        if not Module.initialized then
            Initialize()
        else
            addon["Refresh" .. ModuleName]()
        end
    else
        Restore()
    end
end

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

-- Register for initialization when DragonUI is ready
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        -- Wait for addon.db to be available
        if addon.db then
            Initialize()
            
            -- Register profile callbacks
            addon.db.RegisterCallback(addon, "OnProfileChanged", OnProfileChanged)
            addon.db.RegisterCallback(addon, "OnProfileCopied", OnProfileChanged)
            addon.db.RegisterCallback(addon, "OnProfileReset", OnProfileChanged)
        end
        self:UnregisterEvent("PLAYER_LOGIN")
    end
end)

]]


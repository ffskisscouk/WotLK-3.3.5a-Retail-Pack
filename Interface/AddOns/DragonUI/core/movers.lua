--[[
================================================================================
DragonUI - Movers System
================================================================================
Centralized system for managing moveable UI elements.
Based on ElvUI's Movers.lua pattern, simplified for DragonUI.

This system provides:
- Registration of moveable frames
- Drag & drop handling with combat safety
- Position save/load with database integration
- Reset to default positions
- Integration with Editor Mode
================================================================================
]]

local addon = select(2, ...)
local L = addon.L

-- ============================================================================
-- MOVERS REGISTRY
-- ============================================================================

addon.Movers = addon.Movers or {}

local Movers = {
    -- All registered movers
    created = {},
    -- Disabled movers (for modules that are turned off)
    disabled = {},
    -- Is config/editor mode active?
    configMode = false,
    -- Currently dragging?
    isDragging = false
}

addon.MoversSystem = Movers

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

-- Get point as a formatted string for storage
local function GetPointString(frame)
    local point, relativeTo, relativePoint, x, y = frame:GetPoint()
    local parentName = relativeTo and relativeTo:GetName() or "UIParent"
    return string.format("%s,%s,%s,%d,%d", point or "CENTER", parentName, relativePoint or "CENTER", x or 0, y or 0)
end

-- Parse point string back to values
local function ParsePointString(pointString)
    local point, parentName, relativePoint, x, y = strsplit(",", pointString)
    x = tonumber(x) or 0
    y = tonumber(y) or 0
    return point, parentName, relativePoint, x, y
end

-- Calculate mover position relative to screen quadrant
local function CalculateMoverPoints(mover)
    local screenWidth = UIParent:GetRight()
    local screenHeight = UIParent:GetTop()
    local screenCenter = UIParent:GetCenter()
    local x, y = mover:GetCenter()
    
    if not x or not y then
        return 0, 0, "CENTER"
    end

    local LEFT = screenWidth / 3
    local RIGHT = screenWidth * 2 / 3
    local TOP = screenHeight / 2
    local point

    if y >= TOP then
        point = "TOP"
        y = -(screenHeight - mover:GetTop())
    else
        point = "BOTTOM"
        y = mover:GetBottom()
    end

    if x >= RIGHT then
        point = point .. "RIGHT"
        x = mover:GetRight() - screenWidth
    elseif x <= LEFT then
        point = point .. "LEFT"
        x = mover:GetLeft()
    else
        x = x - screenCenter
    end

    return math.floor(x + 0.5), math.floor(y + 0.5), point
end

-- ============================================================================
-- MOVER CREATION
-- ============================================================================

local function CreateMoverFrame(parent, name, text, configPath)
    if not parent then return nil end
    
    local width = parent.dirtyWidth or parent:GetWidth()
    local height = parent.dirtyHeight or parent:GetHeight()
    
    local mover = CreateFrame("Button", "DragonUI_Mover_" .. name, UIParent)
    mover:SetClampedToScreen(true)
    mover:RegisterForDrag("LeftButton", "RightButton")
    mover:SetMovable(true)
    mover:SetSize(width, height)
    mover:Hide()
    
    -- Store references
    mover.parent = parent
    mover.name = name
    mover.textString = text
    mover.configPath = configPath
    
    -- Frame level setup
    mover:SetFrameLevel(parent:GetFrameLevel() + 1)
    mover:SetFrameStrata("DIALOG")
    
    -- Green overlay texture (editor mode indicator)
    local overlay = mover:CreateTexture(nil, "BACKGROUND")
    overlay:SetAllPoints(mover)
    overlay:SetTexture(0, 1, 0, 0.3) -- Semi-transparent green
    mover.overlay = overlay
    
    -- Border texture
    local border = mover:CreateTexture(nil, "BORDER")
    border:SetAllPoints(mover)
    border:SetTexture(0, 1, 0, 0.8)
    border:SetTexCoord(0, 1, 0, 1)
    mover.border = border
    
    -- Create backdrop manually for 3.3.5a
    mover:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        tileSize = 0,
        edgeSize = 12,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    mover:SetBackdropColor(0, 0.5, 0, 0.5)
    mover:SetBackdropBorderColor(0, 1, 0, 0.8)
    
    -- Text label
    local fs = mover:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    fs:SetPoint("CENTER")
    fs:SetText(text or name)
    fs:SetTextColor(1, 1, 1, 1)
    mover.text = fs
    
    -- ========================================================================
    -- SCRIPTS
    -- ========================================================================
    
    mover:SetScript("OnDragStart", function(self)
        if InCombatLockdown() then
            addon:Print(L["Cannot move frames during combat!"])
            return
        end
        
        Movers.isDragging = true
        self:StartMoving()
    end)
    
    mover:SetScript("OnDragStop", function(self)
        if InCombatLockdown() then
            addon:Print(L["Cannot move frames during combat!"])
            return
        end
        
        Movers.isDragging = false
        self:StopMovingOrSizing()
        
        -- Calculate new position
        local x, y, point = CalculateMoverPoints(self)
        self:ClearAllPoints()
        self:SetPoint(point, UIParent, point, x, y)
        
        -- Update parent to follow mover
        if self.parent then
            self.parent:ClearAllPoints()
            self.parent:SetPoint("CENTER", self, "CENTER", 0, 0)
        end
        
        -- Save position
        Movers:SavePosition(self.name)
        
        -- Execute postdrag callback if exists
        if Movers.created[self.name] and Movers.created[self.name].postdrag then
            Movers.created[self.name].postdrag(self)
        end
        
        self:SetUserPlaced(false)
    end)
    
    mover:SetScript("OnEnter", function(self)
        if Movers.isDragging then return end
        
        self:SetBackdropBorderColor(1, 1, 0, 1) -- Yellow on hover
        self.text:SetTextColor(1, 1, 0, 1)
        
        -- Show tooltip with name
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:AddLine(self.textString or self.name, 1, 1, 1)
        GameTooltip:AddLine(L["Drag to move"], 0.7, 0.7, 0.7)
        GameTooltip:AddLine(L["Right-click to reset"], 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    
    mover:SetScript("OnLeave", function(self)
        if Movers.isDragging then return end
        
        self:SetBackdropBorderColor(0, 1, 0, 0.8)
        self.text:SetTextColor(1, 1, 1, 1)
        GameTooltip:Hide()
    end)
    
    mover:SetScript("OnMouseDown", function(self, button)
        if button == "RightButton" then
            -- Reset to default position
            Movers:ResetPosition(self.name)
        end
    end)
    
    -- Track parent size changes
    parent:SetScript("OnSizeChanged", function(frame)
        if InCombatLockdown() then return end
        
        if frame.mover then
            local w = frame.dirtyWidth or frame:GetWidth()
            local h = frame.dirtyHeight or frame:GetHeight()
            frame.mover:SetSize(w, h)
        end
    end)
    
    -- Link parent to mover
    parent.mover = mover
    
    return mover
end

-- ============================================================================
-- PUBLIC API
-- ============================================================================

-- Register a new mover
function Movers:RegisterMover(info)
    local name = info.name
    local parent = info.parent
    local text = info.text or name
    local configPath = info.configPath -- e.g., {"widgets", "player"}
    local postdrag = info.postdrag
    local defaultPoint = info.defaultPoint -- e.g., "CENTER,UIParent,CENTER,0,0"
    
    if not name or not parent then
        addon:Error(addon.L["RegisterMover: name and parent are required"])
        return
    end
    
    if self.created[name] then
        -- Already registered, just update
        return self.created[name].mover
    end
    
    -- Store mover data
    self.created[name] = {
        parent = parent,
        text = text,
        configPath = configPath,
        postdrag = postdrag,
        defaultPoint = defaultPoint or GetPointString(parent),
        mover = nil
    }
    
    -- Create the mover frame
    local mover = CreateMoverFrame(parent, name, text, configPath)
    if mover then
        self.created[name].mover = mover
        
        -- Apply saved or default position
        self:LoadPosition(name)
        
        -- Attach parent to mover
        parent:ClearAllPoints()
        parent:SetPoint("CENTER", mover, "CENTER", 0, 0)
    end
    
    return mover
end

-- Save mover position to database
function Movers:SavePosition(name)
    local data = self.created[name]
    if not data or not data.mover then return end
    
    local mover = data.mover
    local pointString = GetPointString(mover)
    
    -- Save to movers table in database
    if not addon.db.profile.movers then
        addon.db.profile.movers = {}
    end
    addon.db.profile.movers[name] = pointString
    
    -- Also update legacy configPath if specified
    if data.configPath and #data.configPath == 2 then
        local section, key = data.configPath[1], data.configPath[2]
        if addon.db.profile[section] and addon.db.profile[section][key] then
            local point, _, _, x, y = ParsePointString(pointString)
            addon.db.profile[section][key].anchor = point
            addon.db.profile[section][key].posX = x
            addon.db.profile[section][key].posY = y
        end
    end
end

-- Load mover position from database
function Movers:LoadPosition(name)
    local data = self.created[name]
    if not data or not data.mover then return end
    
    local mover = data.mover
    local pointString
    
    -- Try to load from movers table first
    if addon.db.profile.movers and addon.db.profile.movers[name] then
        pointString = addon.db.profile.movers[name]
    -- Fallback to legacy configPath
    elseif data.configPath and #data.configPath == 2 then
        local section, key = data.configPath[1], data.configPath[2]
        if addon.db.profile[section] and addon.db.profile[section][key] then
            local cfg = addon.db.profile[section][key]
            if cfg.anchor and cfg.posX and cfg.posY then
                pointString = string.format("%s,UIParent,%s,%d,%d", 
                    cfg.anchor, cfg.anchor, cfg.posX, cfg.posY)
            end
        end
    end
    
    -- Apply position
    if pointString then
        local point, parentName, relativePoint, x, y = ParsePointString(pointString)
        mover:ClearAllPoints()
        mover:SetPoint(point, UIParent, relativePoint, x, y)
    else
        -- Use default position
        local point, parentName, relativePoint, x, y = ParsePointString(data.defaultPoint)
        mover:ClearAllPoints()
        mover:SetPoint(point, UIParent, relativePoint, x, y)
    end
end

-- Reset mover to default position
function Movers:ResetPosition(name)
    if InCombatLockdown() then
        addon:Print(L["Cannot reset positions during combat!"])
        return
    end
    
    local data = self.created[name]
    if not data or not data.mover then return end
    
    local mover = data.mover
    local point, parentName, relativePoint, x, y = ParsePointString(data.defaultPoint)
    
    mover:ClearAllPoints()
    mover:SetPoint(point, UIParent, relativePoint, x, y)
    
    -- Clear saved position
    if addon.db.profile.movers then
        addon.db.profile.movers[name] = nil
    end
    
    -- Update parent
    if data.parent then
        data.parent:ClearAllPoints()
        data.parent:SetPoint("CENTER", mover, "CENTER", 0, 0)
    end
    
    -- Execute postdrag callback
    if data.postdrag then
        data.postdrag(mover)
    end
    
    addon:Print(string.format(L["Reset position: %s"], data.text or name))
end

-- Reset all movers to default
function Movers:ResetAllPositions()
    if InCombatLockdown() then
        addon:Print(L["Cannot reset positions during combat!"])
        return
    end
    
    for name, _ in pairs(self.created) do
        self:ResetPosition(name)
    end
    
    addon:Print(L["All positions reset to defaults"])
end

-- Toggle config/editor mode
function Movers:ToggleConfigMode(show, moverType)
    if InCombatLockdown() then
        addon:Print(L["Cannot toggle editor mode during combat!"])
        return
    end
    
    self.configMode = show
    
    for name, data in pairs(self.created) do
        if data.mover then
            if show then
                -- Check mover type filter if provided
                if not moverType or (data.moverType and data.moverType == moverType) then
                    data.mover:Show()
                end
            else
                data.mover:Hide()
            end
        end
    end
    
    if show then
        addon:Print(L["Editor mode enabled - Drag frames to reposition"])
    else
        addon:Print(L["Editor mode disabled - Positions saved"])
    end
end

-- Disable a mover (when module is disabled)
function Movers:DisableMover(name)
    if self.disabled[name] then return end
    if not self.created[name] then return end
    
    -- Move to disabled registry
    self.disabled[name] = self.created[name]
    self.created[name] = nil
    
    -- Hide mover
    if self.disabled[name].mover then
        self.disabled[name].mover:Hide()
    end
end

-- Enable a mover (when module is enabled)
function Movers:EnableMover(name)
    if self.created[name] then return end
    if not self.disabled[name] then return end
    
    -- Move back to created registry
    self.created[name] = self.disabled[name]
    self.disabled[name] = nil
    
    -- Show mover if in config mode
    if self.configMode and self.created[name].mover then
        self.created[name].mover:Show()
    end
end

-- Get mover by name
function Movers:GetMover(name)
    local data = self.created[name] or self.disabled[name]
    return data and data.mover
end

-- Check if mover has been moved from default
function Movers:HasBeenMoved(name)
    return addon.db.profile.movers and addon.db.profile.movers[name] ~= nil
end

-- Apply all saved positions (called on profile change)
function Movers:ApplyAllPositions()
    for name, _ in pairs(self.created) do
        self:LoadPosition(name)
    end
end

-- ============================================================================
-- INTEGRATION WITH LEGACY SYSTEM
-- ============================================================================

-- Bridge function to integrate with existing RegisterEditableFrame
function addon:RegisterMover(info)
    return Movers:RegisterMover(info)
end

-- Toggle movers visibility
function addon:ToggleMovers(show)
    Movers:ToggleConfigMode(show)
end

-- Reset all positions
function addon:ResetAllMovers()
    Movers:ResetAllPositions()
end

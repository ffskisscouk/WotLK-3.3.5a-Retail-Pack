--[[
================================================================================
DragonUI Options Panel - Main Frame
================================================================================
Custom dark-themed options panel. Built with raw frames, not AceGUI containers.
Individual controls still use AceGUI widgets (skinned by controls.lua).
================================================================================
]]

local addon = DragonUI
if not addon then return end

local L = addon.L
local LO = addon.LO

local AceGUI = LibStub("AceGUI-3.0")

-- ============================================================================
-- PANEL MODULE
-- ============================================================================

local Panel = {}
addon.OptionsPanel = Panel

Panel.frame      = nil    -- raw Frame
Panel.tabs       = {}     -- { key = { text, builder, order } }
Panel.tabOrder   = {}     -- ordered keys
Panel.tabButtons = {}     -- visual tab buttons
Panel.currentTab = nil
Panel.scrollWidget = nil  -- current AceGUI ScrollFrame inside content

-- ============================================================================
-- THEME
-- ============================================================================

local T = {
    bg        = { 0.06, 0.06, 0.08, 0.96 },
    border    = { 0.20, 0.20, 0.22, 1 },
    titleBg   = { 0.08, 0.08, 0.10, 1 },
    tabNormal = { 0.12, 0.12, 0.14, 1 },
    tabHover  = { 0.20, 0.20, 0.24, 1 },
    tabActive = { 0.09, 0.52, 0.82, 1 },
    accent    = { 0.09, 0.52, 0.82, 1 },
    textWhite = { 1, 1, 1, 1 },
    textDim   = { 0.55, 0.55, 0.55, 1 },
    contentBg = { 0.09, 0.09, 0.11, 1 },
    font      = (addon.Fonts and addon.Fonts.NARROW) or "Interface\\AddOns\\DragonUI_Options\\fonts\\PTSansNarrow.ttf",
}

-- ============================================================================
-- BACKDROP TEMPLATES (3.3.5a)
-- ============================================================================

local BD_MAIN = {
    bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
    edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
    tile = false, edgeSize = 1,
    insets = { left = 0, right = 0, top = 0, bottom = 0 },
}

local BD_INNER = {
    bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
    edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
    tile = false, edgeSize = 1,
    insets = { left = 0, right = 0, top = 0, bottom = 0 },
}

-- Ensure FontStrings always get a valid font even if locale/custom font paths fail.
local function SetSafeFont(fs, size, flags)
    if not fs then return end

    local tryFonts = {
        T.font,
        addon.Fonts and addon.Fonts.PRIMARY,
        STANDARD_TEXT_FONT,
        "Fonts\\FRIZQT__.TTF",
    }

    local ok = false
    for _, fontPath in ipairs(tryFonts) do
        if fontPath and fs:SetFont(fontPath, size or 12, flags or "") then
            ok = true
            break
        end
    end

    if not ok then
        fs:SetFontObject(GameFontNormal)
    end
end

-- ============================================================================
-- TAB REGISTRATION
-- ============================================================================

function Panel:RegisterTab(key, text, builder, order)
    self.tabs[key] = {
        text    = text,
        value   = key,
        builder = builder,
        order   = order or 999,
    }
    self.tabOrder = {}
    for k in pairs(self.tabs) do
        table.insert(self.tabOrder, k)
    end
    table.sort(self.tabOrder, function(a, b)
        return (self.tabs[a].order or 999) < (self.tabs[b].order or 999)
    end)
end

-- ============================================================================
-- CREATE FRAME
-- ============================================================================

local function CreatePanel()
    -- Main frame
    local f = CreateFrame("Frame", "DragonUIOptionsPanel", UIParent)
    f:SetFrameStrata("DIALOG")
    f:SetWidth(920)
    f:SetHeight(650)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:SetClampedToScreen(true)
    f:SetBackdrop(BD_MAIN)
    f:SetBackdropColor(unpack(T.bg))
    f:SetBackdropBorderColor(unpack(T.border))

    -- Drag
    f:SetScript("OnMouseDown", function(self, btn)
        if btn == "LeftButton" then self:StartMoving() end
    end)
    f:SetScript("OnMouseUp", function(self) self:StopMovingOrSizing() end)

    -- Resize support
    f:SetResizable(true)
    f:SetMinResize(700, 450)
    f:SetMaxResize(1400, 900)

    -- Title bar
    local titleBar = CreateFrame("Frame", nil, f)
    titleBar:SetPoint("TOPLEFT", 1, -1)
    titleBar:SetPoint("TOPRIGHT", -1, -1)
    titleBar:SetHeight(32)
    titleBar:SetBackdrop(BD_INNER)
    titleBar:SetBackdropColor(unpack(T.titleBg))
    titleBar:SetBackdropBorderColor(0, 0, 0, 0)

    local titleText = titleBar:CreateFontString(nil, "OVERLAY")
    SetSafeFont(titleText, 15, "OUTLINE")
    titleText:SetPoint("LEFT", 12, 0)
    titleText:SetText("|cff1784d1" .. LO["DragonUI"] .. "|r |cffaaaaaa2.5|r")

    -- Editor Mode button (in title bar) - styled pill button with neon green border
    local editorBtn = CreateFrame("Button", nil, titleBar)
    editorBtn:SetSize(104, 22)
    editorBtn:SetPoint("RIGHT", titleBar, "RIGHT", -36, 0)
    editorBtn:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
        tile = false, edgeSize = 1,
        insets = { left = 0, right = 0, top = 0, bottom = 0 },
    })
    editorBtn:SetBackdropColor(0.05, 0.12, 0.05, 1)
    editorBtn:SetBackdropBorderColor(0.0, 0.9, 0.0, 0.7)
    local editorText = editorBtn:CreateFontString(nil, "OVERLAY")
    SetSafeFont(editorText, 11, "")
    editorText:SetPoint("CENTER", 0, 0)
    editorText:SetText("|cff00dd00" .. LO["Editor Mode"] .. "|r")
    editorBtn:SetScript("OnClick", function()
        Panel:Close()
        if addon.EditorMode then addon.EditorMode:Toggle() end
    end)
    editorBtn:SetScript("OnEnter", function()
        editorBtn:SetBackdropColor(0.0, 0.9, 0.0, 0.25)
        editorBtn:SetBackdropBorderColor(0.0, 1.0, 0.0, 1.0)
        editorText:SetText("|cff00ff00" .. LO["Editor Mode"] .. "|r")
    end)
    editorBtn:SetScript("OnLeave", function()
        editorBtn:SetBackdropColor(0.05, 0.12, 0.05, 1)
        editorBtn:SetBackdropBorderColor(0.0, 0.9, 0.0, 0.7)
        editorText:SetText("|cff00dd00" .. LO["Editor Mode"] .. "|r")
    end)

    -- KeyBind Mode button (in title bar) - styled pill button with neon green border
    local keybindBtn = CreateFrame("Button", nil, titleBar)
    keybindBtn:SetSize(104, 22)
    keybindBtn:SetPoint("RIGHT", editorBtn, "LEFT", -6, 0)
    keybindBtn:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
        tile = false, edgeSize = 1,
        insets = { left = 0, right = 0, top = 0, bottom = 0 },
    })
    keybindBtn:SetBackdropColor(0.05, 0.12, 0.05, 1)
    keybindBtn:SetBackdropBorderColor(0.0, 0.9, 0.0, 0.7)
    local keybindText = keybindBtn:CreateFontString(nil, "OVERLAY")
    SetSafeFont(keybindText, 11, "")
    keybindText:SetPoint("CENTER", 0, 0)
    keybindText:SetText("|cff00dd00" .. LO["KeyBind Mode"] .. "|r")
    keybindBtn:SetScript("OnClick", function()
        Panel:Close()
        if addon.KeyBindingModule and LibStub and LibStub("LibKeyBound-1.0", true) then
            LibStub("LibKeyBound-1.0"):Toggle()
        end
    end)
    keybindBtn:SetScript("OnEnter", function()
        keybindBtn:SetBackdropColor(0.0, 0.9, 0.0, 0.25)
        keybindBtn:SetBackdropBorderColor(0.0, 1.0, 0.0, 1.0)
        keybindText:SetText("|cff00ff00" .. LO["KeyBind Mode"] .. "|r")
    end)
    keybindBtn:SetScript("OnLeave", function()
        keybindBtn:SetBackdropColor(0.05, 0.12, 0.05, 1)
        keybindBtn:SetBackdropBorderColor(0.0, 0.9, 0.0, 0.7)
        keybindText:SetText("|cff00dd00" .. LO["KeyBind Mode"] .. "|r")
    end)

    -- Close button
    local closeBtn = CreateFrame("Button", nil, titleBar)
    closeBtn:SetSize(20, 20)
    closeBtn:SetPoint("RIGHT", -8, 0)
    closeBtn:SetNormalFontObject(GameFontNormal)

    local closeTex = closeBtn:CreateFontString(nil, "OVERLAY")
    SetSafeFont(closeTex, 16, "OUTLINE")
    closeTex:SetPoint("CENTER", 0, 0)
    closeTex:SetText("|cffccccccx|r")
    closeBtn:SetScript("OnClick", function() Panel:Close() end)
    closeBtn:SetScript("OnEnter", function() closeTex:SetText("|cffff4444x|r") end)
    closeBtn:SetScript("OnLeave", function() closeTex:SetText("|cffccccccx|r") end)

    -- Accent line under title bar
    local accent = f:CreateTexture(nil, "OVERLAY")
    accent:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
    accent:SetPoint("TOPLEFT", titleBar, "BOTTOMLEFT", 0, 0)
    accent:SetPoint("TOPRIGHT", titleBar, "BOTTOMRIGHT", 0, 0)
    accent:SetHeight(2)
    accent:SetVertexColor(unpack(T.accent))

    -- Tab strip (left side vertical)
    local tabStrip = CreateFrame("Frame", nil, f)
    tabStrip:SetPoint("TOPLEFT", 1, -35)
    tabStrip:SetPoint("BOTTOMLEFT", 1, 1)
    tabStrip:SetWidth(140)
    tabStrip:SetBackdrop(BD_INNER)
    tabStrip:SetBackdropColor(0.07, 0.07, 0.09, 1)
    tabStrip:SetBackdropBorderColor(0, 0, 0, 0)
    f.tabStrip = tabStrip

    -- Separator line between tabs and content
    local sep = f:CreateTexture(nil, "OVERLAY")
    sep:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
    sep:SetPoint("TOPLEFT", tabStrip, "TOPRIGHT", 0, 0)
    sep:SetPoint("BOTTOMLEFT", tabStrip, "BOTTOMRIGHT", 0, 0)
    sep:SetWidth(1)
    sep:SetVertexColor(unpack(T.border))

    -- Content area
    local content = CreateFrame("Frame", nil, f)
    content:SetPoint("TOPLEFT", tabStrip, "TOPRIGHT", 1, 0)
    content:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -1, 1)
    content:SetBackdrop(BD_INNER)
    content:SetBackdropColor(unpack(T.contentBg))
    content:SetBackdropBorderColor(0, 0, 0, 0)
    f.content = content

    -- Status bar at bottom
    local statusText = f:CreateFontString(nil, "OVERLAY")
    SetSafeFont(statusText, 11, "")
    statusText:SetPoint("BOTTOM", f, "BOTTOM", 0, 4)
    statusText:SetTextColor(0.4, 0.4, 0.4, 1)
    statusText:SetText(LO["Commands: /dragonui, /dui, /pi — /dragonui edit (editor) — /dragonui help"])

    -- Resize grip (bottom-right corner)
    local resizeGrip = CreateFrame("Frame", nil, f)
    resizeGrip:SetSize(16, 16)
    resizeGrip:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -2, 2)
    resizeGrip:EnableMouse(true)
    resizeGrip:SetFrameLevel(f:GetFrameLevel() + 10)

    local gripTex = resizeGrip:CreateTexture(nil, "OVERLAY")
    gripTex:SetAllPoints()
    gripTex:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
    gripTex:SetVertexColor(0.4, 0.4, 0.4, 0.5)

    -- Draw diagonal grip lines
    for i = 1, 3 do
        local line = resizeGrip:CreateTexture(nil, "OVERLAY")
        line:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
        line:SetVertexColor(0.6, 0.6, 0.6, 0.8)
        line:SetSize(i * 4, 1)
        line:SetPoint("BOTTOMRIGHT", resizeGrip, "BOTTOMRIGHT", -1, i * 4)
    end

    resizeGrip:SetScript("OnMouseDown", function(self, btn)
        if btn == "LeftButton" then
            f:StartSizing("BOTTOMRIGHT")
        end
    end)
    resizeGrip:SetScript("OnMouseUp", function(self)
        f:StopMovingOrSizing()
        -- Update scroll content width to match new panel size
        if Panel.scrollWidget then
            Panel.scrollWidget.content:SetWidth(f.content:GetWidth() - 32)
            Panel.scrollWidget:DoLayout()
        end
    end)
    resizeGrip:SetScript("OnEnter", function()
        gripTex:SetVertexColor(0.6, 0.6, 0.6, 0.8)
    end)
    resizeGrip:SetScript("OnLeave", function()
        gripTex:SetVertexColor(0.4, 0.4, 0.4, 0.5)
    end)

    f:SetScript("OnSizeChanged", function(self, w, h)
        -- Live-update scroll content width during resize
        if Panel.scrollWidget then
            Panel.scrollWidget.content:SetWidth(self.content:GetWidth() - 32)
            Panel.scrollWidget:DoLayout()
        end
    end)

    -- ESC to close
    tinsert(UISpecialFrames, "DragonUIOptionsPanel")

    return f
end

-- ============================================================================
-- BUILD TAB BUTTONS (vertical strip)
-- ============================================================================

local function BuildTabButtons()
    -- Clear old
    for _, btn in pairs(Panel.tabButtons) do
        btn:Hide()
        btn:SetParent(nil)
    end
    wipe(Panel.tabButtons)

    local strip = Panel.frame.tabStrip
    local yOff = -8

    for _, key in ipairs(Panel.tabOrder) do
        local tabInfo = Panel.tabs[key]
        local btn = CreateFrame("Button", nil, strip)
        btn:SetSize(136, 26)
        btn:SetPoint("TOPLEFT", strip, "TOPLEFT", 2, yOff)

        -- Background
        local bg = btn:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        bg:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
        bg:SetVertexColor(unpack(T.tabNormal))
        btn.bg = bg

        -- Active indicator bar
        local indicator = btn:CreateTexture(nil, "OVERLAY")
        indicator:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
        indicator:SetPoint("TOPLEFT", btn, "TOPLEFT", 0, 0)
        indicator:SetPoint("BOTTOMLEFT", btn, "BOTTOMLEFT", 0, 0)
        indicator:SetWidth(3)
        indicator:SetVertexColor(unpack(T.accent))
        indicator:Hide()
        btn.indicator = indicator

        -- Text
        local text = btn:CreateFontString(nil, "OVERLAY")
        SetSafeFont(text, 12, "")
        text:SetPoint("LEFT", 10, 0)
        text:SetText(tabInfo.text)
        text:SetTextColor(0.7, 0.7, 0.7, 1)
        btn.text = text

        btn.tabKey = key
        btn:SetScript("OnClick", function()
            Panel:SelectTab(key)
        end)
        btn:SetScript("OnEnter", function(self)
            if Panel.currentTab ~= self.tabKey then
                self.bg:SetVertexColor(unpack(T.tabHover))
                self.text:SetTextColor(1, 1, 1, 1)
            end
        end)
        btn:SetScript("OnLeave", function(self)
            if Panel.currentTab ~= self.tabKey then
                self.bg:SetVertexColor(unpack(T.tabNormal))
                self.text:SetTextColor(0.7, 0.7, 0.7, 1)
            end
        end)

        Panel.tabButtons[key] = btn
        yOff = yOff - 28
    end
end

-- ============================================================================
-- UPDATE TAB VISUALS
-- ============================================================================

local function UpdateTabVisuals()
    for key, btn in pairs(Panel.tabButtons) do
        if key == Panel.currentTab then
            btn.bg:SetVertexColor(0.12, 0.12, 0.16, 1)
            btn.text:SetTextColor(1, 1, 1, 1)
            btn.indicator:Show()
        else
            btn.bg:SetVertexColor(unpack(T.tabNormal))
            btn.text:SetTextColor(0.7, 0.7, 0.7, 1)
            btn.indicator:Hide()
        end
    end
end

-- ============================================================================
-- SELECT TAB
-- ============================================================================

function Panel:SelectTab(key)
    if not self.tabs[key] then return end
    self.currentTab = key
    UpdateTabVisuals()

    -- Release old scroll widget if any
    if self.scrollWidget then
        self.scrollWidget:ReleaseChildren()
        AceGUI:Release(self.scrollWidget)
        self.scrollWidget = nil
    end

    -- Create AceGUI scroll inside the content frame
    local scroll = AceGUI:Create("ScrollFrame")
    scroll:SetLayout("Flow")

    -- Attach the AceGUI scroll frame to our content area
    local sf = scroll.frame
    sf:SetParent(self.frame.content)
    sf:ClearAllPoints()
    sf:SetPoint("TOPLEFT", self.frame.content, "TOPLEFT", 6, -6)
    sf:SetPoint("BOTTOMRIGHT", self.frame.content, "BOTTOMRIGHT", -6, 6)
    sf:SetFrameStrata("DIALOG")
    sf:Show()

    -- Fix content area sizing
    scroll.content:SetWidth(self.frame.content:GetWidth() - 32)

    self.scrollWidget = scroll

    -- Call the tab builder
    local tabInfo = self.tabs[key]
    if tabInfo and tabInfo.builder then
        local ok, err = pcall(tabInfo.builder, scroll)
        if not ok then
            local errLabel = AceGUI:Create("Label")
            errLabel:SetText("|cFFFF0000" .. LO["Error:"] .. "|r " .. tostring(err))
            errLabel:SetFullWidth(true)
            scroll:AddChild(errLabel)
        end
    end

    -- Trigger layout
    scroll:DoLayout()

    -- Deferred re-skin pass to fix vanilla texture bleed-through
    -- AceGUI widgets from the pool may have textures reset by OnAcquire/layout;
    -- re-skinning after a short delay ensures our dark theme wins.
    if not Panel.reskinFrame then
        Panel.reskinFrame = CreateFrame("Frame")
        Panel.reskinFrame:Hide()
        Panel.reskinFrame:SetScript("OnUpdate", function(self, elapsed)
            self.elapsed = (self.elapsed or 0) + elapsed
            if self.elapsed >= 0.15 then
                self:Hide()
                local C = addon.PanelControls
                if Panel.scrollWidget and C and C.ReskinAll then
                    C:ReskinAll(Panel.scrollWidget)
                end
            end
        end)
    end
    Panel.reskinFrame.elapsed = 0
    Panel.reskinFrame:Show()
end

-- ============================================================================
-- OPEN / CLOSE / TOGGLE
-- ============================================================================

function Panel:Open(selectTab)
    if InCombatLockdown() then
        print("|cFFFF0000[DragonUI]|r " .. LO["Cannot open options during combat."])
        return
    end

    if not self.frame then
        self.frame = CreatePanel()
        BuildTabButtons()
    end

    self.frame:Show()
    self.frame:SetFrameLevel(100)

    local tab = selectTab or self.currentTab or (self.tabOrder[1] or nil)
    if tab then
        self:SelectTab(tab)
    end
end

function Panel:Close()
    if self.frame then
        -- Release the scroll widget properly
        if self.scrollWidget then
            self.scrollWidget:ReleaseChildren()
            AceGUI:Release(self.scrollWidget)
            self.scrollWidget = nil
        end
        self.frame:Hide()
    end
end

function Panel:Toggle(selectTab)
    if self.frame and self.frame:IsShown() then
        self:Close()
    else
        self:Open(selectTab)
    end
end

function Panel:IsOpen()
    return self.frame and self.frame:IsShown()
end

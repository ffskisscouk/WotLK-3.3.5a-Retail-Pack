--[[
================================================================================
DragonUI Options Panel - Controls Library
================================================================================
Reusable control builders with auto-binding to addon.db.profile.
Post-skins AceGUI widgets for a clean, dark look.
================================================================================
]]

local addon = DragonUI
if not addon then return end

local L = addon.L
local LO = addon.LO

local AceGUI = LibStub("AceGUI-3.0")

-- ============================================================================
-- MODULE
-- ============================================================================

local Controls = {}
addon.PanelControls = Controls

-- ============================================================================
-- THEME
-- ============================================================================

Controls.Theme = {
    accent      = { 0.09, 0.52, 0.82, 1 },
    accentHex   = "1784d1",
    headerBg    = { 0.12, 0.12, 0.14, 0.9 },
    sectionBg   = { 0.10, 0.10, 0.12, 0.8 },
    sectionBorder = { 0.22, 0.22, 0.24, 1 },
    textNormal  = { 0.9, 0.9, 0.9, 1 },
    textDim     = { 0.72, 0.72, 0.72, 1 },
    textGold    = { 1.0, 0.82, 0.0, 1 },
    warning     = { 1.0, 0.4, 0.0, 1 },
    success     = { 0.0, 1.0, 0.0, 1 },
    danger      = { 1.0, 0.2, 0.2, 1 },
    widgetBg    = { 0.14, 0.14, 0.16, 1 },
    widgetBorder = { 0.25, 0.25, 0.28, 1 },
    buttonBg    = { 0.16, 0.16, 0.18, 1 },
    buttonHover = { 0.09, 0.52, 0.82, 0.3 },
    font        = (addon.Fonts and addon.Fonts.NARROW) or "Interface\\AddOns\\DragonUI_Options\\fonts\\PTSansNarrow.ttf",
    fontSize    = 13,
}

local BD_WIDGET = {
    bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
    edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
    tile = false, edgeSize = 1,
    insets = { left = 0, right = 0, top = 0, bottom = 0 },
}

-- Ensure widgets always receive a valid font even when a custom/system font path is unavailable.
local function SafeSetFont(fs, size, flags, preferredFont)
    if not fs then return end

    local tryFonts = {
        preferredFont,
        Controls.Theme.font,
        addon.Fonts and addon.Fonts.PRIMARY,
        STANDARD_TEXT_FONT,
        "Fonts\\FRIZQT__.TTF",
    }

    for _, fontPath in ipairs(tryFonts) do
        if fontPath and fs.SetFont and fs:SetFont(fontPath, size or 12, flags or "") then
            return
        end
    end

    if fs.SetFontObject then
        fs:SetFontObject(GameFontNormal)
    end
end

-- ============================================================================
-- DB PATH HELPERS
-- ============================================================================

function Controls:GetDBValue(dbPath)
    if not dbPath or not addon.db or not addon.db.profile then return nil end
    local path = { strsplit(".", dbPath) }
    local value = addon.db.profile
    for _, key in ipairs(path) do
        if type(value) ~= "table" then return nil end
        value = value[key]
    end
    return value
end

function Controls:SetDBValue(dbPath, val)
    if not dbPath or not addon.db or not addon.db.profile then return end
    local path = { strsplit(".", dbPath) }
    local target = addon.db.profile
    for i = 1, #path - 1 do
        if not target[path[i]] then target[path[i]] = {} end
        target = target[path[i]]
    end
    target[path[#path]] = val
end

function Controls:EnsureModuleTable(moduleName)
    if not addon.db or not addon.db.profile then
        return {}
    end

    if not addon.db.profile.modules then
        addon.db.profile.modules = {}
    end

    if not addon.db.profile.modules[moduleName] then
        addon.db.profile.modules[moduleName] = {}
    end

    return addon.db.profile.modules[moduleName]
end

-- ============================================================================
-- WIDGET SKINNING
-- ============================================================================

local function SkinCheckBox(widget)
    -- Darken the checkbox background
    if widget.checkbg then
        widget.checkbg:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
        widget.checkbg:SetVertexColor(0.14, 0.14, 0.16, 1)
        widget.checkbg:SetWidth(18)
        widget.checkbg:SetHeight(18)
    end
    if widget.check then
        widget.check:SetVertexColor(0.09, 0.72, 1.0, 1)
    end
    if widget.highlight then
        widget.highlight:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
        widget.highlight:SetVertexColor(0.09, 0.52, 0.82, 0.2)
    end
    -- Style text
    if widget.text then
        SafeSetFont(widget.text, 12, "")
    end
    if widget.desc then
        SafeSetFont(widget.desc, 11, "")
    end
end

local function SkinSlider(widget)
    -- The slider widget has: slider (frame), editbox, label, lowtext, hightext
    if widget.slider then
        widget.slider:SetBackdrop(BD_WIDGET)
        widget.slider:SetBackdropColor(0.14, 0.14, 0.16, 1)
        widget.slider:SetBackdropBorderColor(0.22, 0.22, 0.24, 1)

        -- Thumb
        local thumb = widget.slider:GetThumbTexture()
        if thumb then
            thumb:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
            thumb:SetVertexColor(0.09, 0.52, 0.82, 1)
            thumb:SetWidth(12)
            thumb:SetHeight(12)
        end
    end
    if widget.editbox then
        widget.editbox:SetBackdrop(BD_WIDGET)
        widget.editbox:SetBackdropColor(0.12, 0.12, 0.14, 1)
        widget.editbox:SetBackdropBorderColor(0.22, 0.22, 0.24, 1)
        SafeSetFont(widget.editbox, 11, "")
    end
    if widget.label then
        SafeSetFont(widget.label, 12, "")
    end
end

local function SkinDropdown(widget)
    local dd = widget.dropdown
    if not dd or dd._dragonSkinned then return end
    dd._dragonSkinned = true

    -- 1. Strip ALL texture regions from UIDropDownMenuTemplate (ElvUI StripTextures pattern)
    if dd.GetNumRegions then
        for i = 1, dd:GetNumRegions() do
            local region = select(i, dd:GetRegions())
            if region and region.IsObjectType and region:IsObjectType("Texture") then
                region:SetTexture(nil)
            end
        end
    end

    -- 2. Create dark backdrop on the dropdown frame itself
    local bg = CreateFrame("Frame", nil, dd)
    bg:SetFrameLevel(dd:GetFrameLevel())
    bg:SetBackdrop(BD_WIDGET)
    bg:SetBackdropColor(0.14, 0.14, 0.16, 1)
    bg:SetBackdropBorderColor(0.25, 0.25, 0.28, 1)
    bg:SetPoint("TOPLEFT", dd, "TOPLEFT", 15, -2)
    bg:SetPoint("BOTTOMRIGHT", dd, "BOTTOMRIGHT", -21, 0)
    dd.backdrop = bg

    -- 3. Reposition arrow button to the right edge of the backdrop
    local btn = widget.button
    if btn then
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", bg, "TOPRIGHT", -22, -2)
        btn:SetPoint("BOTTOMRIGHT", bg, "BOTTOMRIGHT", -2, 2)
        btn:SetParent(bg)
        if btn:GetNormalTexture() then
            btn:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 1)
        end
        if btn:GetHighlightTexture() then
            btn:GetHighlightTexture():SetVertexColor(0.09, 0.52, 0.82, 0.6)
        end
    end

    -- 4. Reposition display text inside the backdrop (MUST reparent so it draws above)
    local text = widget.text
    if text then
        text:SetParent(bg)
        text:ClearAllPoints()
        text:SetJustifyH("LEFT")
        text:SetPoint("LEFT", bg, "LEFT", 5, 0)
        if btn then
            text:SetPoint("RIGHT", btn, "LEFT", -3, 0)
        end
        SafeSetFont(text, 12, "")
        text:SetVertexColor(1, 1, 1)
    end

    -- 5. Label above the backdrop
    if widget.label then
        widget.label:ClearAllPoints()
        widget.label:SetPoint("BOTTOMLEFT", bg, "TOPLEFT", 2, 1)
        SafeSetFont(widget.label, 12, "")
        widget.label:SetTextColor(1, 0.82, 0)
    end

    -- 6. Pullout skinning (immediate + lazy via button hook)
    local function SkinPullout()
        local po = widget.pullout
        if po and po.frame and not po.frame._dragonSkinned then
            po.frame._dragonSkinned = true
            po.frame:SetBackdrop(BD_WIDGET)
            po.frame:SetBackdropColor(0.10, 0.10, 0.12, 0.98)
            po.frame:SetBackdropBorderColor(0.25, 0.25, 0.28, 1)
            if po.slider then
                po.slider:SetBackdrop(BD_WIDGET)
                po.slider:SetBackdropColor(0.14, 0.14, 0.16, 1)
                po.slider:SetBackdropBorderColor(0.20, 0.20, 0.22, 1)
                local thumb = po.slider:GetThumbTexture()
                if thumb then
                    thumb:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
                    thumb:SetVertexColor(0.09, 0.52, 0.82, 1)
                    thumb:SetWidth(8)
                    thumb:SetHeight(16)
                end
            end
        end
    end
    SkinPullout()
    if btn then
        btn:HookScript("OnClick", SkinPullout)
    end
end

local function SkinButton(widget)
    local f = widget.frame
    if f then
        -- Strip ALL texture regions from UIPanelButtonTemplate2 (Left/Middle/Right)
        -- This is the same ElvUI StripTextures pattern used for dropdowns
        if f.GetNumRegions then
            for i = 1, f:GetNumRegions() do
                local region = select(i, f:GetRegions())
                if region and region.IsObjectType and region:IsObjectType("Texture") then
                    region:SetTexture(nil)
                    region:SetAlpha(0)
                    region:Hide()
                end
            end
        end

        -- Also strip named button textures if they exist
        local name = f:GetName()
        if name then
            for _, suffix in ipairs({"Left", "Middle", "Right", "left", "middle", "right"}) do
                local tex = _G[name .. suffix]
                if tex and tex.SetTexture then
                    tex:SetTexture(nil)
                    tex:SetAlpha(0)
                    tex:Hide()
                end
            end
        end

        f:SetBackdrop(BD_WIDGET)
        f:SetBackdropColor(0.16, 0.16, 0.18, 1)
        f:SetBackdropBorderColor(0.25, 0.25, 0.28, 1)

        -- Re-create highlight as a child frame texture so it draws above backdrop
        if not f._dragonHighlight then
            local hl = f:CreateTexture(nil, "HIGHLIGHT")
            hl:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
            hl:SetVertexColor(0.09, 0.52, 0.82, 0.25)
            hl:SetAllPoints()
            f._dragonHighlight = hl
        end

        -- Strip the template highlight/normal/pushed/disabled if still lingering
        if f:GetNormalTexture() then f:GetNormalTexture():SetTexture(nil); f:GetNormalTexture():SetAlpha(0) end
        if f:GetPushedTexture() then f:GetPushedTexture():SetTexture(nil); f:GetPushedTexture():SetAlpha(0) end
        if f:GetHighlightTexture() then f:GetHighlightTexture():SetTexture(nil); f:GetHighlightTexture():SetAlpha(0) end
        if f:GetDisabledTexture() then f:GetDisabledTexture():SetTexture(nil); f:GetDisabledTexture():SetAlpha(0) end

        -- Style text
        if widget.text then
            SafeSetFont(widget.text, 11, "")
        end
    end
end

local function SkinLabel(widget)
    if widget.label then
        SafeSetFont(widget.label, 11, "")
    end
end

local function SkinHeading(widget)
    if widget.label then
        SafeSetFont(widget.label, 13, "OUTLINE")
        widget.label:SetTextColor(unpack(Controls.Theme.accent))
    end
    -- Make the separator lines match theme
    if widget.left then
        widget.left:SetVertexColor(0.22, 0.22, 0.24, 1)
    end
    if widget.right then
        widget.right:SetVertexColor(0.22, 0.22, 0.24, 1)
    end
end

-- Skin InlineGroup to match dark theme
local function SkinInlineGroup(widget)
    -- The border frame
    local border = widget.content and widget.content:GetParent()
    if border and border.SetBackdrop then
        border:SetBackdrop(BD_WIDGET)
        border:SetBackdropColor(0.08, 0.08, 0.10, 0.6)
        border:SetBackdropBorderColor(0.20, 0.20, 0.22, 0.8)
    end
    if widget.titletext then
        SafeSetFont(widget.titletext, 13, "OUTLINE")
        widget.titletext:SetTextColor(unpack(Controls.Theme.textGold))
    end
end

-- ============================================================================
-- DEFERRED RE-SKIN (fixes vanilla texture bleed-through after reload)
-- ============================================================================

local function ReskinWidget(widget)
    if not widget or not widget.type then return end
    local t = widget.type
    if t == "CheckBox" then
        SkinCheckBox(widget)
    elseif t == "Slider" then
        SkinSlider(widget)
    elseif t == "Dropdown" then
        -- Force re-skin by clearing the flag
        if widget.dropdown then widget.dropdown._dragonSkinned = nil end
        SkinDropdown(widget)
    elseif t == "Button" then
        SkinButton(widget)
    elseif t == "Label" then
        SkinLabel(widget)
    elseif t == "InteractiveLabel" then
        -- Re-apply sub-tab font instead of SkinLabel (which sets size 11)
        if widget._dragonSubTabFont and widget.label then
            SafeSetFont(widget.label, widget._dragonSubTabFont[2], widget._dragonSubTabFont[3], widget._dragonSubTabFont[1])
        end
    elseif t == "Heading" then
        SkinHeading(widget)
    elseif t == "InlineGroup" then
        SkinInlineGroup(widget)
    end
end

local function ReskinContainer(container)
    if not container or not container.children then return end
    for _, child in ipairs(container.children) do
        ReskinWidget(child)
        -- Recurse into containers (InlineGroup, SimpleGroup, ScrollFrame)
        if child.children then
            ReskinContainer(child)
        end
    end
end

function Controls:ReskinAll(scrollWidget)
    if scrollWidget then
        ReskinContainer(scrollWidget)
    end
end

-- ============================================================================
-- HEADING / SECTION SEPARATOR
-- ============================================================================

function Controls:AddHeading(parent, text)
    local heading = AceGUI:Create("Heading")
    heading:SetText(text)
    heading:SetFullWidth(true)
    SkinHeading(heading)
    parent:AddChild(heading)
    return heading
end

-- ============================================================================
-- DESCRIPTION / LABEL
-- ============================================================================

function Controls:AddLabel(parent, text, opts)
    opts = opts or {}
    local label = AceGUI:Create("Label")
    label:SetText(text)
    label:SetFullWidth(true)
    if opts.color then
        label:SetColor(unpack(opts.color))
    end
    SkinLabel(label)
    if opts.fontSize and label.label then
        SafeSetFont(label.label, opts.fontSize, "")
    end
    parent:AddChild(label)
    return label
end

function Controls:AddDescription(parent, text)
    return self:AddLabel(parent, text, { color = self.Theme.textDim })
end

function Controls:AddCopyableText(parent, text)
    local editBox = AceGUI:Create("EditBox")
    editBox:SetText(text)
    editBox:SetFullWidth(true)
    editBox:DisableButton(true)
    editBox:SetCallback("OnEnterPressed", function(w)
        if w and w.ClearFocus then
            w:ClearFocus()
            return
        end
        if w and w.editbox and w.editbox.ClearFocus then
            w.editbox:ClearFocus()
        end
    end)
    editBox:SetCallback("OnTextChanged", function(w) w:SetText(text) end)
    parent:AddChild(editBox)
    return editBox
end

-- ============================================================================
-- SPACER
-- ============================================================================

function Controls:AddSpacer(parent)
    local spacer = AceGUI:Create("Label")
    spacer:SetText(" ")
    spacer:SetFullWidth(true)
    parent:AddChild(spacer)
    return spacer
end

-- ============================================================================
-- TOGGLE (CheckBox)
-- ============================================================================

function Controls:AddToggle(parent, opts)
    local cb = AceGUI:Create("CheckBox")
    cb:SetLabel(opts.label or "Toggle")
    if opts.desc then cb:SetDescription(opts.desc) end
    if opts.width then cb:SetWidth(opts.width) else cb:SetFullWidth(true) end

    if opts.getFunc then
        cb:SetValue(opts.getFunc() and true or false)
    elseif opts.dbPath then
        cb:SetValue(self:GetDBValue(opts.dbPath) and true or false)
    end

    if opts.disabled then
        if type(opts.disabled) == "function" then
            cb:SetDisabled(opts.disabled())
        else
            cb:SetDisabled(opts.disabled)
        end
    end

    cb:SetCallback("OnValueChanged", function(_, _, value)
        if opts.setFunc then
            opts.setFunc(value)
        elseif opts.dbPath then
            self:SetDBValue(opts.dbPath, value)
        end
        if opts.callback then opts.callback(value) end
        if opts.requiresReload then StaticPopup_Show("DRAGONUI_RELOAD_UI") end
    end)

    SkinCheckBox(cb)
    parent:AddChild(cb)
    return cb
end

-- ============================================================================
-- SLIDER
-- ============================================================================

function Controls:AddSlider(parent, opts)
    local slider = AceGUI:Create("Slider")
    slider:SetLabel(opts.label or "Slider")
    slider:SetSliderValues(opts.min or 0, opts.max or 1, opts.step or 0.01)
    if opts.isPercent then slider:SetIsPercent(true) end
    if opts.width then slider:SetWidth(opts.width) end

    local val
    if opts.getFunc then
        val = opts.getFunc()
    elseif opts.dbPath then
        val = self:GetDBValue(opts.dbPath)
    end
    slider:SetValue(val or opts.default or opts.min or 0)

    if opts.disabled then
        if type(opts.disabled) == "function" then
            slider:SetDisabled(opts.disabled())
        else
            slider:SetDisabled(opts.disabled)
        end
    end

    slider:SetCallback("OnValueChanged", function(_, _, value)
        if opts.setFunc then
            opts.setFunc(value)
        elseif opts.dbPath then
            self:SetDBValue(opts.dbPath, value)
        end
        if opts.callback then opts.callback(value) end
    end)

    if opts.desc then
        slider:SetCallback("OnEnter", function(w)
            GameTooltip:SetOwner(w.frame, "ANCHOR_TOPRIGHT")
            GameTooltip:SetText(opts.label or "Slider", 1, 1, 1)
            GameTooltip:AddLine(opts.desc, nil, nil, nil, true)
            GameTooltip:Show()
        end)
        slider:SetCallback("OnLeave", function() GameTooltip:Hide() end)
    end

    SkinSlider(slider)
    parent:AddChild(slider)
    return slider
end

-- ============================================================================
-- DROPDOWN
-- ============================================================================

function Controls:AddDropdown(parent, opts)
    local dd = AceGUI:Create("Dropdown")
    dd:SetLabel(opts.label or "Select")
    dd:SetList(opts.values or {})
    if opts.width then dd:SetWidth(opts.width) end

    local val
    if opts.getFunc then
        val = opts.getFunc()
    elseif opts.dbPath then
        val = self:GetDBValue(opts.dbPath)
    end
    if val then dd:SetValue(val) end

    if opts.disabled then
        if type(opts.disabled) == "function" then
            dd:SetDisabled(opts.disabled())
        else
            dd:SetDisabled(opts.disabled)
        end
    end

    dd:SetCallback("OnValueChanged", function(_, _, value)
        if opts.setFunc then
            opts.setFunc(value)
        elseif opts.dbPath then
            self:SetDBValue(opts.dbPath, value)
        end
        if opts.callback then opts.callback(value) end
    end)

    SkinDropdown(dd)
    parent:AddChild(dd)
    return dd
end

-- ============================================================================
-- COLOR PICKER
-- ============================================================================

function Controls:AddColorPicker(parent, opts)
    local cp = AceGUI:Create("ColorPicker")
    cp:SetLabel(opts.label or "Color")
    cp:SetHasAlpha(opts.hasAlpha or false)

    local color
    if opts.getFunc then
        color = { opts.getFunc() }
    elseif opts.dbPath then
        color = self:GetDBValue(opts.dbPath)
    end
    if color and type(color) == "table" then
        cp:SetColor(color.r or color[1] or 1, color.g or color[2] or 1, color.b or color[3] or 1, color.a or color[4] or 1)
    end

    cp:SetCallback("OnValueConfirmed", function(_, _, r, g, b, a)
        if opts.setFunc then
            opts.setFunc(r, g, b, a)
        elseif opts.dbPath then
            self:SetDBValue(opts.dbPath, { r = r, g = g, b = b, a = a or 1 })
        end
        if opts.callback then opts.callback(r, g, b, a) end
    end)

    parent:AddChild(cp)
    return cp
end

-- ============================================================================
-- BUTTON
-- ============================================================================

function Controls:AddButton(parent, opts)
    local btn = AceGUI:Create("Button")
    btn:SetText(opts.label or "Button")
    if opts.width then btn:SetWidth(opts.width) end
    if opts.disabled then
        if type(opts.disabled) == "function" then
            btn:SetDisabled(opts.disabled())
        else
            btn:SetDisabled(opts.disabled)
        end
    end
    btn:SetCallback("OnClick", function()
        GameTooltip:Hide()
        if opts.callback then opts.callback() end
    end)
    if opts.desc then
        btn:SetCallback("OnEnter", function(w)
            GameTooltip:SetOwner(w.frame, "ANCHOR_TOPRIGHT")
            GameTooltip:SetText(opts.label or "Button", 1, 1, 1)
            GameTooltip:AddLine(opts.desc, nil, nil, nil, true)
            GameTooltip:Show()
        end)
        btn:SetCallback("OnLeave", function() GameTooltip:Hide() end)
    end
    SkinButton(btn)
    parent:AddChild(btn)
    return btn
end

-- ============================================================================
-- SECTION (InlineGroup)
-- ============================================================================

function Controls:AddSection(parent, title)
    local group = AceGUI:Create("InlineGroup")
    group:SetTitle(title or "")
    group:SetFullWidth(true)
    group:SetLayout("Flow")
    SkinInlineGroup(group)
    parent:AddChild(group)
    return group
end

-- ============================================================================
-- ROW (SimpleGroup)
-- ============================================================================

function Controls:AddRow(parent, opts)
    opts = opts or {}
    local group = AceGUI:Create("SimpleGroup")
    group:SetFullWidth(true)
    group:SetLayout(opts.layout or "Flow")
    parent:AddChild(group)
    return group
end

-- ============================================================================
-- TEXTURE PREVIEW (for Gryphons etc.)
-- ============================================================================

function Controls:AddTexturePreview(parent, opts)
    -- opts: { label, texture, texCoord, width, height }
    -- Uses AceGUI Icon widget
    local icon = AceGUI:Create("Icon")
    icon:SetImage(opts.texture, unpack(opts.texCoord or { 0, 1, 0, 1 }))
    icon:SetImageSize(opts.width or 64, opts.height or 64)
    icon:SetLabel(opts.label or "")
    if opts.fullWidth then
        icon:SetFullWidth(true)
    else
        icon:SetWidth((opts.width or 64) + 16)
    end
    -- Disable click behavior and remove hover highlight
    icon:SetCallback("OnClick", function() end)
    icon:SetCallback("OnEnter", function() end)
    icon:SetCallback("OnLeave", function() end)
    if icon.highlight then
        icon.highlight:SetTexture(nil)
    end
    if icon.frame then
        icon.frame:EnableMouse(false)
    end
    parent:AddChild(icon)
    return icon
end

-- ============================================================================
-- SUB-TAB BAR (horizontal navigation within a tab)
-- ============================================================================

function Controls:AddSubTabs(parent, tabs, activeKey, onSelect)
    -- tabs = { { key="player", label="Player" }, ... }
    -- activeKey = currently selected sub-tab key
    -- onSelect(key) = callback when a sub-tab is clicked
    local row = AceGUI:Create("SimpleGroup")
    row:SetFullWidth(true)
    row:SetLayout("Flow")
    parent:AddChild(row)

    for _, tab in ipairs(tabs) do
        local btn = AceGUI:Create("InteractiveLabel")
        btn:SetWidth(math.max(#tab.label * 8.5, 70))

        local isActive = (tab.key == activeKey)
        if isActive then
            btn:SetText("|cff1784d1" .. tab.label .. "|r")
        else
            btn:SetText("|cffaaaaaa" .. tab.label .. "|r")
        end

        -- Font sizing — stored on widget for deferred re-skin pass
        local fontFlags = isActive and "OUTLINE" or ""
        btn._dragonSubTabFont = { self.Theme.font, 12, fontFlags }
        if btn.label then
            SafeSetFont(btn.label, 12, fontFlags, self.Theme.font)
        end

        btn:SetCallback("OnClick", function()
            if onSelect then onSelect(tab.key) end
        end)
        btn:SetCallback("OnEnter", function(w)
            if not isActive and w.label then
                w:SetText("|cffdddddd" .. tab.label .. "|r")
            end
        end)
        btn:SetCallback("OnLeave", function(w)
            if not isActive and w.label then
                w:SetText("|cffaaaaaa" .. tab.label .. "|r")
            end
        end)

        row:AddChild(btn)

        -- Re-apply font after AddChild (guards against AceGUI pool/layout resets)
        if btn.label then
            SafeSetFont(btn.label, 12, fontFlags, self.Theme.font)
        end
    end

    -- Separator line under the sub-tab bar
    local sep = AceGUI:Create("Heading")
    sep:SetText("")
    sep:SetFullWidth(true)
    SkinHeading(sep)
    parent:AddChild(sep)

    return row
end

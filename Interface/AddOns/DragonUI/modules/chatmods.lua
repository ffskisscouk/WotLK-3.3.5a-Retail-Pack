    local addon = select(2, ...)

    -- ============================================================================
    -- CHAT MODS MODULE FOR DRAGONUI
    -- Ported from KPack ChatMods by bkader
    -- Features: hide chat buttons, editbox positioning, mousewheel scroll,
    -- tell target (/tt), URL detection & copy, link hover tooltips,
    -- chat copy (double-click tab), unlimited resizing, AFK/DND dedup.
    -- ============================================================================

    local _G = _G
    local format, gsub, find = string.format, string.gsub, string.find
    local abs = math.abs
    local ipairs, select, tostring = ipairs, select, tostring
    local tinsert, table_concat = table.insert, table.concat
    local NUM_CHAT_WINDOWS = NUM_CHAT_WINDOWS or 10
    local CHAT_FRAME_LIMIT = 10
    local CHAT_EDITBOX_PARTS = {"Left", "Mid", "Right"}

    -- Module state tracking
    local ChatModsModule = {
        initialized = false,
        applied = false,
        originalStates = {},
        hooks = {},
        frames = {}
    }

    -- Register with ModuleRegistry
    if addon.RegisterModule then
        addon:RegisterModule("chatmods", ChatModsModule,
            (addon.L and addon.L["Chat Mods"]) or "Chat Mods",
            (addon.L and addon.L["Chat enhancements: hide buttons, editbox position, URL copy, chat copy, link hover, tell target"]) or "Chat enhancements: hide buttons, editbox position, URL copy, chat copy, link hover, tell target")
    end

    -- ============================================================================
    -- CONFIGURATION FUNCTIONS
    -- ============================================================================

    local function GetModuleConfig()
        return addon:GetModuleConfig("chatmods")
    end

    local function IsModuleEnabled()
        return addon:IsModuleEnabled("chatmods")
    end

    -- ============================================================================
    -- BUTTON HIDING & CHAT FRAME TWEAKS
    -- ============================================================================

    local ALPHA_EPSILON = 0.01
    local HOVER_UPDATE_THROTTLE = 0.1
    local HOVER_IDLE_TICKS_TO_SLEEP = 3

    local function IsAlphaChanged(current, target)
        return abs((current or 0) - (target or 0)) > ALPHA_EPSILON
    end

    local function SetMouseIfChanged(frame, enabled)
        if not frame or not frame.EnableMouse then return end
        if frame.IsMouseEnabled and frame:IsMouseEnabled() == enabled then
            return
        end
        frame:EnableMouse(enabled)
    end

    local function SetButtonVisible(button, visible)
        if not button then return end

        if not button:IsShown() then
            button:Show()
        end

        local alpha = visible and 1 or 0
        if IsAlphaChanged(button:GetAlpha(), alpha) then
            button:SetAlpha(alpha)
        end
        SetMouseIfChanged(button, visible)
    end

    local function SetButtonAlpha(button, alpha)
        if not button then return end

        if not button:IsShown() then
            button:Show()
        end
        if IsAlphaChanged(button:GetAlpha(), alpha) then
            button:SetAlpha(alpha)
        end
        SetMouseIfChanged(button, alpha >= 0.95)
    end

    local function SetChatHoverButtonsVisible(i, visible, entry)
        local bf = (entry and entry.bf) or _G["ChatFrame" .. i .. "ButtonFrame"]
        if bf then
            if not bf:IsShown() then
                bf:Show()
            end
            local alpha = visible and 1 or 0
            if IsAlphaChanged(bf:GetAlpha(), alpha) then
                bf:SetAlpha(alpha)
            end
            SetMouseIfChanged(bf, visible)
        end

        -- BF-child buttons: parent frame alpha handles fade, just toggle mouse
        local upBtn = (entry and entry.upBtn) or _G["ChatFrame" .. i .. "ButtonFrameUpButton"]
        local downBtn = (entry and entry.downBtn) or _G["ChatFrame" .. i .. "ButtonFrameDownButton"]
        local bottomBtn = (entry and entry.bottomBtn) or _G["ChatFrame" .. i .. "ButtonFrameBottomButton"]
        if upBtn then
            if not upBtn:IsShown() then upBtn:Show() end
            SetMouseIfChanged(upBtn, visible)
        end
        if downBtn then
            if not downBtn:IsShown() then downBtn:Show() end
            SetMouseIfChanged(downBtn, visible)
        end
        if bottomBtn then
            if not bottomBtn:IsShown() then bottomBtn:Show() end
            SetMouseIfChanged(bottomBtn, visible)
        end

        -- Non-child buttons need independent control
        if i == 1 then
            SetButtonVisible((entry and entry.menuBtn) or _G.ChatFrameMenuButton, visible)
            SetButtonVisible((entry and entry.friendsBtn) or _G.FriendsMicroButton, visible)
        end
    end

local function StripButtonFrameBackground(buttonFrame)
    if not buttonFrame then return end

    for idx = 1, select("#", buttonFrame:GetRegions()) do
        local region = select(idx, buttonFrame:GetRegions())
        if region and region:GetObjectType() == "Texture" then
            region:SetAlpha(0)
        end
    end

    if buttonFrame.SetBackdropColor then
        buttonFrame:SetBackdropColor(0, 0, 0, 0)
    end
    if buttonFrame.SetBackdropBorderColor then
        buttonFrame:SetBackdropBorderColor(0, 0, 0, 0)
    end

    buttonFrame.DragonUIBackgroundStripped = true
end

local function SetChatHoverButtonsAlpha(i, alpha, entry)
        local bf = (entry and entry.bf) or _G["ChatFrame" .. i .. "ButtonFrame"]
        if bf then
            if not bf:IsShown() then
                bf:Show()
            end
            if IsAlphaChanged(bf:GetAlpha(), alpha) then
                bf:SetAlpha(alpha)
            end
            SetMouseIfChanged(bf, alpha >= 0.95)
        end

    -- BF-child buttons: parent frame alpha handles fade, just toggle mouse
    local upBtn = (entry and entry.upBtn) or _G["ChatFrame" .. i .. "ButtonFrameUpButton"]
    local downBtn = (entry and entry.downBtn) or _G["ChatFrame" .. i .. "ButtonFrameDownButton"]
    local bottomBtn = (entry and entry.bottomBtn) or _G["ChatFrame" .. i .. "ButtonFrameBottomButton"]
    SetMouseIfChanged(upBtn, alpha >= 0.95)
    SetMouseIfChanged(downBtn, alpha >= 0.95)
    SetMouseIfChanged(bottomBtn, alpha >= 0.95)

    -- Non-child buttons need independent alpha control
    if i == 1 then
        SetButtonAlpha((entry and entry.menuBtn) or _G.ChatFrameMenuButton, alpha)
        SetButtonAlpha((entry and entry.friendsBtn) or _G.FriendsMicroButton, alpha)
    end
end

    local function GetTabIdleAlpha(config)
        return (config and config.tabIdleAlpha ~= nil) and config.tabIdleAlpha or 0
    end

    local function GetStyleIdleAlpha(config)
        return (config and config.chatBgIdleAlpha ~= nil) and config.chatBgIdleAlpha or 0
    end

    local function GetEditboxIdleAlpha(config)
        return (config and config.editboxIdleAlpha ~= nil) and config.editboxIdleAlpha or 0
    end

    local StartChatButtonsHoverUpdater
    local StopChatButtonsHoverUpdater

    local function RefreshChatFadeState()
        if not ChatModsModule.applied then return end

        local cfg = GetModuleConfig()
        local tabIdleAlpha = GetTabIdleAlpha(cfg)
        local styleIdleAlpha = GetStyleIdleAlpha(cfg)
        local ebIdleAlpha = GetEditboxIdleAlpha(cfg)

        for i = 1, CHAT_FRAME_LIMIT do
            local cf = _G["ChatFrame" .. i]
            local tab = _G["ChatFrame" .. i .. "Tab"]
            local bf = _G["ChatFrame" .. i .. "ButtonFrame"]
            local eb = _G["ChatFrame" .. i .. "EditBox"]

            local hovered = (tab and tab:IsMouseOver())
                or (cf and cf:IsMouseOver())
                or (bf and bf:IsMouseOver())
                or (eb and eb:IsMouseOver())

            local tabAlpha = hovered and 1 or tabIdleAlpha
            if tab then
                tab.noMouseAlpha = tabIdleAlpha
                if IsAlphaChanged(tab:GetAlpha(), tabAlpha) then
                    tab:SetAlpha(tabAlpha)
                end
            end

            SetChatHoverButtonsAlpha(i, tabAlpha)

            if cf and cf._dragonUIBgFrame and cf._dragonUIBgFrame:IsShown() then
                local bgAlpha = styleIdleAlpha
                if IsAlphaChanged(cf._dragonUIBgFrame:GetAlpha(), bgAlpha) then
                    cf._dragonUIBgFrame:SetAlpha(bgAlpha)
                end
            end

            if eb then
                if eb:GetBackdrop() then
                    local ebAlpha = eb:HasFocus() and 1 or ebIdleAlpha
                    if IsAlphaChanged(eb:GetAlpha(), ebAlpha) then
                        eb:SetAlpha(ebAlpha)
                    end
                else
                    if IsAlphaChanged(eb:GetAlpha(), 1) then
                        eb:SetAlpha(1)
                    end
                end
            end
        end

        StartChatButtonsHoverUpdater(true)
    end

local function OnChatHoverInteraction()
    if not ChatModsModule.applied then return end
    StartChatButtonsHoverUpdater(true)
end

local function AttachChatHoverRefreshHooks(frame)
    if not frame or frame.DragonUIHoverRefreshHooked then return end
    frame:HookScript("OnEnter", OnChatHoverInteraction)
    frame:HookScript("OnLeave", OnChatHoverInteraction)
    frame.DragonUIHoverRefreshHooked = true
end

StopChatButtonsHoverUpdater = function()
    local updater = ChatModsModule.hooks.chatButtonsHoverUpdater
    if updater and updater:GetScript("OnUpdate") then
        updater:SetScript("OnUpdate", nil)
    end
    ChatModsModule.frames.chatHoverForceUpdate = nil
    ChatModsModule.frames.chatHoverIdleTicks = 0
end

StartChatButtonsHoverUpdater = function(forceUpdate)
    local updater = ChatModsModule.hooks.chatButtonsHoverUpdater
    local onUpdate = ChatModsModule.frames.chatHoverOnUpdate
    if not updater or not onUpdate then return end

    if forceUpdate then
        ChatModsModule.frames.chatHoverForceUpdate = true
    end
    ChatModsModule.frames.chatHoverIdleTicks = 0

    if not updater:GetScript("OnUpdate") then
        updater:SetScript("OnUpdate", onUpdate)
    end
end

local function EnsureChatButtonsHoverUpdater()
    if ChatModsModule.hooks.chatButtonsHoverUpdater then
        return
    end

    local updater = CreateFrame("Frame")
    local _throttle = 0

    ChatModsModule.frames.chatHoverOnUpdate = function(_, elapsed)
        _throttle = _throttle + elapsed
        if _throttle < HOVER_UPDATE_THROTTLE then return end
        _throttle = 0

        if not ChatModsModule.applied then
            StopChatButtonsHoverUpdater()
            return
        end

        local entries = ChatModsModule.frames.chatHoverEntries
        if not entries or #entries == 0 then
            StopChatButtonsHoverUpdater()
            return
        end

        -- Cache config once per tick, outside the loop
        local cfg = GetModuleConfig()
        local idleAlpha = GetStyleIdleAlpha(cfg)
        local ebIdleAlpha = GetEditboxIdleAlpha(cfg)
        local forceUpdate = ChatModsModule.frames.chatHoverForceUpdate
        ChatModsModule.frames.chatHoverForceUpdate = nil

        local hasActiveTransition = false
        local wroteVisualState = false

        for _, entry in ipairs(entries) do
            -- StripButtonFrameBackground is NOT called here - it's handled by the
            -- OnShow hook set in ApplyChatFrameTweaks. Calling it on a throttle
            -- causes a visible flicker when Blizzard restores textures between ticks.

            -- Mirror the tab's current alpha (Blizzard fades it via noMouseAlpha).
            local tabAlpha = entry.tab and entry.tab:GetAlpha() or 0
            if forceUpdate or entry.lastTabAlpha == nil or IsAlphaChanged(entry.lastTabAlpha, tabAlpha) then
                SetChatHoverButtonsAlpha(entry.index, tabAlpha, entry)
                entry.lastTabAlpha = tabAlpha
                wroteVisualState = true
            end

            -- Sync style background frame with tab fade.
            local cf = entry.cf
            if cf and cf._dragonUIBgFrame and cf._dragonUIBgFrame:IsShown() then
                local bgAlpha = idleAlpha
                if forceUpdate or entry.lastBgAlpha == nil or IsAlphaChanged(entry.lastBgAlpha, bgAlpha) then
                    cf._dragonUIBgFrame:SetAlpha(bgAlpha)
                    entry.lastBgAlpha = bgAlpha
                    wroteVisualState = true
                end
            else
                entry.lastBgAlpha = nil
            end

            -- Sync editbox style backdrop: independent from hover.
            local eb = entry.eb
            if eb and eb:GetBackdrop() then
                local ebAlpha = eb:HasFocus() and 1 or ebIdleAlpha
                if forceUpdate or entry.lastEditboxAlpha == nil or IsAlphaChanged(entry.lastEditboxAlpha, ebAlpha) then
                    eb:SetAlpha(ebAlpha)
                    entry.lastEditboxAlpha = ebAlpha
                    wroteVisualState = true
                end
            else
                entry.lastEditboxAlpha = nil
            end

            local hovered = (entry.tab and entry.tab:IsMouseOver())
                or (entry.cf and entry.cf:IsMouseOver())
                or (entry.bf and entry.bf:IsMouseOver())
                or (entry.eb and (entry.eb:IsMouseOver() or entry.eb:HasFocus()))

            local targetTabAlpha = hovered and 1 or ((entry.tab and entry.tab.noMouseAlpha) or 0)
            if hovered or IsAlphaChanged(tabAlpha, targetTabAlpha) then
                hasActiveTransition = true
            end
        end

        if hasActiveTransition then
            ChatModsModule.frames.chatHoverIdleTicks = 0
            return
        end

        if wroteVisualState then
            ChatModsModule.frames.chatHoverIdleTicks = 1
            return
        end

        ChatModsModule.frames.chatHoverIdleTicks = (ChatModsModule.frames.chatHoverIdleTicks or 0) + 1
        if ChatModsModule.frames.chatHoverIdleTicks >= HOVER_IDLE_TICKS_TO_SLEEP then
            StopChatButtonsHoverUpdater()
        end
    end

    ChatModsModule.hooks.chatButtonsHoverUpdater = updater
end

local function ApplyChatFrameTweaks()

    ChatModsModule.frames.chatHoverEntries = ChatModsModule.frames.chatHoverEntries or {}
    wipe(ChatModsModule.frames.chatHoverEntries)
    local tabIdleAlpha = GetTabIdleAlpha(GetModuleConfig())

    for i = 1, CHAT_FRAME_LIMIT do
        local cf = _G[format("ChatFrame%d", i)]
        if cf then
            -- Fix tab fading
            local tab = _G["ChatFrame" .. i .. "Tab"]
            local eb = _G["ChatFrame" .. i .. "EditBox"]
            if tab then
                tab:SetAlpha(1)
                tab.noMouseAlpha = tabIdleAlpha
            end
            cf:SetFading(true)

            -- Unlimited resizing
            cf:SetMinResize(0, 0)
            cf:SetMaxResize(0, 0)

            -- Allow chat frame to reach screen edges
            cf:SetClampedToScreen(true)
            cf:SetClampRectInsets(0, 0, 0, 0)

            -- Transparent editbox
            for _, part in ipairs(CHAT_EDITBOX_PARTS) do
                local tex = _G["ChatFrame" .. i .. "EditBox" .. part]
                if tex then tex:SetTexture(0, 0, 0, 0) end
                local focus = _G["ChatFrame" .. i .. "EditBoxFocus" .. part]
                if focus then
                    focus:SetTexture(0, 0, 0, 0.8)
                    focus:SetHeight(18)
                end
            end

            local bf = _G["ChatFrame" .. i .. "ButtonFrame"]
            if bf then
                StripButtonFrameBackground(bf)
                if not bf.DragonUIBackgroundHooked then
                    bf:HookScript("OnShow", function(self)
                        StripButtonFrameBackground(self)
                        OnChatHoverInteraction()
                    end)
                    bf.DragonUIBackgroundHooked = true
                end
                local entry = {
                    index = i,
                    cf = cf,
                    tab = tab,
                    bf = bf,
                    eb = eb,
                    upBtn = _G["ChatFrame" .. i .. "ButtonFrameUpButton"],
                    downBtn = _G["ChatFrame" .. i .. "ButtonFrameDownButton"],
                    bottomBtn = _G["ChatFrame" .. i .. "ButtonFrameBottomButton"],
                    menuBtn = (i == 1) and _G.ChatFrameMenuButton or nil,
                    friendsBtn = (i == 1) and _G.FriendsMicroButton or nil,
                    lastTabAlpha = nil,
                    lastBgAlpha = nil,
                    lastEditboxAlpha = nil,
                }
                SetChatHoverButtonsVisible(i, false, entry)

                tinsert(ChatModsModule.frames.chatHoverEntries, entry)
            end

            AttachChatHoverRefreshHooks(cf)
            AttachChatHoverRefreshHooks(tab)
            AttachChatHoverRefreshHooks(bf)
            AttachChatHoverRefreshHooks(eb)
            if eb and not eb.DragonUIFocusRefreshHooked then
                eb:HookScript("OnEditFocusGained", OnChatHoverInteraction)
                eb:HookScript("OnEditFocusLost", OnChatHoverInteraction)
                eb.DragonUIFocusRefreshHooked = true
            end
        end
    end

    EnsureChatButtonsHoverUpdater()
    if ChatModsModule.applied then
        StartChatButtonsHoverUpdater(true)
    end

    -- Keep toast frame on screen
    if BNToastFrame then
        BNToastFrame:SetClampedToScreen(true)
    end
end

-- ============================================================================
-- CHAT FRAME STYLE (background skin)
-- ============================================================================

local BD_CHATBG = {
    bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
    edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
    tile = false, edgeSize = 1,
    insets = { left = 0, right = 0, top = 0, bottom = 0 },
}

-- style name -> { bg r/g/b/a, border r/g/b/a or nil }
local CHAT_STYLES = {
    dark = {
        bg     = {0.03, 0.03, 0.04, 0.80},
        border = nil,
    },
    dragon = {
        bg     = {0.05, 0.05, 0.08, 0.88},
        border = {0.30, 0.30, 0.40, 0.85},
    },
    midnight = {
        bg     = {0.00, 0.00, 0.00, 0.95},
        border = {0.75, 0.62, 0.18, 0.85},
    },
}

-- Extra pixels the background frame extends beyond ChatFrame's edges.
-- Tune these constants manually to adjust coverage.
local CHATBG_LEFT_PAD     = 3  -- extends left past frame edge
local CHATBG_TOP_EXTEND   = 3  -- extends above frame top edge
local CHATBG_RIGHT_EXTEND = 2  -- extends right past frame edge
local CHATBG_BOTTOM_EXTEND = 6 -- extends below frame bottom edge

local function ApplyChatStyle()
    local config = GetModuleConfig()
    local style = (config and config.chatStyle) or "none"
    local def = CHAT_STYLES[style]

    for i = 1, CHAT_FRAME_LIMIT do
        local cf = _G["ChatFrame" .. i]
        if cf then
            -- Always clear cf's native Blizzard backdrop so our bgFrame
            -- (which sits behind cf at level-1) isn't obscured by it.
            cf:SetBackdrop(nil)

            if not def then
                if cf._dragonUIBgFrame then
                    cf._dragonUIBgFrame:Hide()
                end
            else
                -- Create a dedicated backdrop frame as a child of cf.
                -- It sits at level-1 (behind cf's text) with cf's backdrop
                -- cleared above, so it's fully visible.
                if not cf._dragonUIBgFrame then
                    local bg = CreateFrame("Frame", nil, cf)
                    bg:SetFrameLevel(cf:GetFrameLevel() - 1)
                    cf._dragonUIBgFrame = bg
                end
                local bg = cf._dragonUIBgFrame
                -- Always update anchor in case extend constants changed.
                bg:ClearAllPoints()
                bg:SetPoint("TOPLEFT",     cf, "TOPLEFT",     -CHATBG_LEFT_PAD,   CHATBG_TOP_EXTEND)
                bg:SetPoint("BOTTOMRIGHT", cf, "BOTTOMRIGHT",  CHATBG_RIGHT_EXTEND, -CHATBG_BOTTOM_EXTEND)
                bg:SetBackdrop(BD_CHATBG)
                local r, g, b, a = unpack(def.bg)
                bg:SetBackdropColor(r, g, b, a)
                if def.border then
                    local br, bg2, bb, ba = unpack(def.border)
                    bg:SetBackdropBorderColor(br, bg2, bb, ba)
                else
                    bg:SetBackdropBorderColor(0, 0, 0, 0)
                end
                bg:SetAlpha(GetStyleIdleAlpha(config))
                bg:Show()
            end
        end
    end

    RefreshChatFadeState()
end

-- Editbox backdrop: slightly larger insets so the skin fills the full editbox
-- including the bottom edge that Blizzard's default textures leave exposed.
local BD_EDITBOX = {
    bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
    edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
    tile = false, edgeSize = 1,
    insets = { left = 0, right = 0, top = 0, bottom = 0 },
}

local function ApplyEditboxStyle()
    local config = GetModuleConfig()
    local style = (config and config.editboxStyle) or "none"
    local def = CHAT_STYLES[style]
    local ebIdleAlpha = GetEditboxIdleAlpha(config)

    for i = 1, CHAT_FRAME_LIMIT do
        local eb = _G["ChatFrame" .. i .. "EditBox"]
        if eb then
            -- Focus textures (Left/Mid/Right) render a solid black input indicator.
            -- When our custom style is active they overlap it, so we hide them;
            -- when no custom style is set we keep them hidden to avoid a stale dark line.
            local focusAlpha = 0
            for _, part in ipairs(CHAT_EDITBOX_PARTS) do
                local focus = _G["ChatFrame" .. i .. "EditBoxFocus" .. part]
                if focus then focus:SetTexture(0, 0, 0, focusAlpha) end
            end

            if not def then
                eb:SetBackdrop(nil)
                eb:SetAlpha(1)
            else
                eb:SetBackdrop(BD_EDITBOX)
                local r, g, b, a = unpack(def.bg)
                eb:SetBackdropColor(r, g, b, a)
                if def.border then
                    local br, bg2, bb, ba = unpack(def.border)
                    eb:SetBackdropBorderColor(br, bg2, bb, ba)
                else
                    eb:SetBackdropBorderColor(0, 0, 0, 0)
                end
                eb:SetAlpha(eb:HasFocus() and 1 or ebIdleAlpha)
            end
        end
    end

    RefreshChatFadeState()
end

-- ============================================================================
-- EDITBOX POSITIONING
-- ============================================================================

-- Height of the chat editbox in pixels. Default Blizzard is ~32; reduce for compact look.
local EDITBOX_HEIGHT = 22
-- Vertical gap between the chat frame bottom and the editbox. Increase to move it down.
local EDITBOX_Y_OFFSET = -6

local function ApplyEditBoxPosition()
    local config = GetModuleConfig()
    local pos = config and config.editbox or "bottom"

    for i = 1, CHAT_FRAME_LIMIT do
        local cf = _G[format("ChatFrame%d", i)]
        local eb = _G["ChatFrame" .. i .. "EditBox"]
        if cf and eb then
            eb:SetAltArrowKeyMode(false)
            eb:ClearAllPoints()
            eb:EnableMouse(false)
            eb:SetHeight(EDITBOX_HEIGHT)

            if pos == "middle" then
                eb:SetPoint("BOTTOMLEFT", UIParent, "BOTTOM", -200 - (CHATBG_LEFT_PAD - 1), 150)
                eb:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOM", 200, 150)
            elseif pos == "top" then
                eb:SetPoint("BOTTOMLEFT", cf, "TOPLEFT", 2 - (CHATBG_LEFT_PAD - 0), 20)
                eb:SetPoint("BOTTOMRIGHT", cf, "TOPRIGHT", -2, 20)
            else -- bottom: place just below the chat frame with no gap
                eb:SetPoint("TOPLEFT", cf, "BOTTOMLEFT", -(CHATBG_LEFT_PAD - 0), EDITBOX_Y_OFFSET)
                eb:SetPoint("TOPRIGHT", cf, "BOTTOMRIGHT", 2, EDITBOX_Y_OFFSET)
            end
        end
    end
end

-- ============================================================================
-- TELL TARGET (/tt)
-- ============================================================================

local function TellTarget(msg)
    if not UnitExists("target") then return end
    if not (msg and msg:len() > 0) then return end
    if not UnitIsFriend("player", "target") then return end
    local name, realm = UnitName("target")
    if realm and not UnitIsSameServer("player", "target") then
        name = format("%s-%s", name, realm)
    end
    SendChatMessage(msg, "WHISPER", nil, name)
end

-- ============================================================================
-- MOUSEWHEEL SCROLL ENHANCEMENTS
-- ============================================================================

local function OnMouseScroll(self, dir)
    if dir > 0 then
        if IsShiftKeyDown() then
            self:ScrollToTop()
        elseif IsControlKeyDown() then
            self:ScrollUp()
            self:ScrollUp()
        end
    elseif dir < 0 then
        if IsShiftKeyDown() then
            self:ScrollToBottom()
        elseif IsControlKeyDown() then
            self:ScrollDown()
            self:ScrollDown()
        end
    end
end

-- ============================================================================
-- EDITBOX MOUSE TOGGLE (enable on open, disable on send)
-- ============================================================================

local function OnChatFrameOpenChat()
    for i = 1, CHAT_FRAME_LIMIT do
        local box = _G["ChatFrame" .. i .. "EditBox"]
        if box then box:EnableMouse(true) end
    end
end

local function OnChatEditSendText()
    for i = 1, CHAT_FRAME_LIMIT do
        local box = _G["ChatFrame" .. i .. "EditBox"]
        if box then box:EnableMouse(false) end
    end
end

-- ============================================================================
-- LINK HOVER TOOLTIPS (Alt + hover)
-- ============================================================================

local HOVERABLE_LINK_TYPES = {
    achievement = true, enchant = true, glyph = true, item = true,
    quest = true, spell = true, talent = true, unit = true
}

local function OnHyperlinkEnter(self, data, link)
    local linkType = data:match("^(.-):")
    if HOVERABLE_LINK_TYPES[linkType] and IsAltKeyDown() then
        ShowUIPanel(GameTooltip)
        GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR")
        GameTooltip:SetHyperlink(link)
        GameTooltip:Show()
    end
end

local function OnHyperlinkLeave(self, data, link)
    local linkType = data:match("^(.-):")
    if HOVERABLE_LINK_TYPES[linkType] then
        HideUIPanel(GameTooltip)
    end
end

local function ApplyLinkHover()
    for i = 1, NUM_CHAT_WINDOWS do
        local frame = _G["ChatFrame" .. i]
        if frame then
            frame:SetScript("OnHyperlinkEnter", OnHyperlinkEnter)
            frame:SetScript("OnHyperlinkLeave", OnHyperlinkLeave)
        end
    end
end

-- ============================================================================
-- AFK / DND MESSAGE DEDUP
-- ============================================================================

local afkDndCache = {}
local function FilterAfkDnd(arg1, arg2)
    if afkDndCache[arg2] and afkDndCache[arg2] == arg1 then
        return true
    end
    afkDndCache[arg2] = arg1
end

-- ============================================================================
-- URL DETECTION AND COPY
-- ============================================================================

local URL_TLDs = {
    "[Cc][Oo][Mm]", "[Uu][Kk]", "[Nn][Ee][Tt]", "[Dd][Ee]", "[Ff][Rr]",
    "[Ee][Ss]", "[Bb][Ee]", "[Cc][Cc]", "[Uu][Ss]", "[Kk][Oo]", "[Cc][Hh]",
    "[Tt][Ww]", "[Cc][Nn]", "[Rr][Uu]", "[Gg][Rr]", "[Gg][Gg]", "[Ii][Tt]",
    "[Ee][Uu]", "[Tt][Vv]", "[Nn][Ll]", "[Hh][Uu]", "[Oo][Rr][Gg]"
}

local URL_TLD_PATTERNS = {}
for i = 1, #URL_TLDs do
    URL_TLD_PATTERNS[i] = "(%S-%." .. URL_TLDs[i] .. "/?%S*)"
end

local URL_IP_PATTERN = "(%d+%.%d+%.%d+%.%d+:?%d*/?%S*)"
local URL_HYPERLINK_TEMPLATE = "|cffffffff|Hurl:%1|h[%1]|h|r"

local function URLFilter(self, event, msg, ...)
    if not msg then return end
    if not find(msg, ".", 1, true) then
        return
    end

    for i = 1, #URL_TLD_PATTERNS do
        local newmsg, found = gsub(msg, URL_TLD_PATTERNS[i], URL_HYPERLINK_TEMPLATE)
        if found > 0 then
            return false, newmsg, ...
        end
    end
    -- IP address pattern
    local newmsg, found = gsub(msg, URL_IP_PATTERN, URL_HYPERLINK_TEMPLATE)
    if found > 0 then
        return false, newmsg, ...
    end
end

local function ApplyURLDetection()
    local chatEvents = {
        "CHAT_MSG_CHANNEL", "CHAT_MSG_YELL", "CHAT_MSG_GUILD",
        "CHAT_MSG_OFFICER", "CHAT_MSG_PARTY", "CHAT_MSG_PARTY_LEADER",
        "CHAT_MSG_RAID", "CHAT_MSG_RAID_LEADER", "CHAT_MSG_SAY",
        "CHAT_MSG_WHISPER", "CHAT_MSG_BN_WHISPER", "CHAT_MSG_BN_CONVERSATION",
    }
    for _, event in ipairs(chatEvents) do
        ChatFrame_AddMessageEventFilter(event, URLFilter)
    end

    local currentLink
    local origOnHyperlinkShow = _G.ChatFrame_OnHyperlinkShow

    -- Store original for restore
    if not ChatModsModule.originalStates.ChatFrame_OnHyperlinkShow then
        ChatModsModule.originalStates.ChatFrame_OnHyperlinkShow = origOnHyperlinkShow
    end

    _G.ChatFrame_OnHyperlinkShow = function(self, link, text, button)
        if not StaticPopupDialogs["DRAGONUI_URLCOPY_DIALOG"] then
            StaticPopupDialogs["DRAGONUI_URLCOPY_DIALOG"] = {
                text = "URL",
                button2 = CLOSE or "Close",
                hasEditBox = 1,
                hasWideEditBox = 1,
                showAlert = 1,
                OnShow = function(frame)
                    local editBox = _G[frame:GetName() .. "WideEditBox"]
                    editBox:SetText(currentLink)
                    currentLink = nil
                    editBox:SetFocus()
                    editBox:HighlightText(0)
                    local btn = _G[frame:GetName() .. "Button2"]
                    btn:ClearAllPoints()
                    btn:SetWidth(200)
                    btn:SetPoint("CENTER", editBox, "CENTER", 0, -30)
                    _G[frame:GetName() .. "AlertIcon"]:Hide()
                end,
                EditBoxOnEscapePressed = function(frame)
                    frame:GetParent():Hide()
                end,
                timeout = 0,
                whileDead = 1,
                hideOnEscape = 1
            }
        end

        if link and link:sub(1, 3) == "url" then
            currentLink = link:sub(5)
            StaticPopup_Show("DRAGONUI_URLCOPY_DIALOG")
            return
        end

        SetItemRef(link, text, button, self)
    end
end

-- ============================================================================
-- CHAT COPY (double-click tab)
-- ============================================================================

local copyFrame

local function CreateCopyFrame()
    copyFrame = CreateFrame("Frame", "DragonUI_ChatCopyFrame", UIParent)
    copyFrame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 3, right = 3, top = 5, bottom = 3 }
    })
    copyFrame:SetBackdropColor(0, 0, 0, 1)
    copyFrame:SetWidth(500)
    copyFrame:SetHeight(400)
    copyFrame:SetPoint("CENTER", UIParent, "CENTER")
    copyFrame:Hide()
    copyFrame:SetFrameStrata("DIALOG")

    local scrollArea = CreateFrame("ScrollFrame", "DragonUI_ChatCopyScroll", copyFrame, "UIPanelScrollFrameTemplate")
    scrollArea:SetPoint("TOPLEFT", copyFrame, "TOPLEFT", 8, -30)
    scrollArea:SetPoint("BOTTOMRIGHT", copyFrame, "BOTTOMRIGHT", -30, 8)

    local editBox = CreateFrame("EditBox", "DragonUI_ChatCopyBox", copyFrame)
    editBox:SetMultiLine(true)
    editBox:SetMaxLetters(99999)
    editBox:EnableMouse(true)
    editBox:SetAutoFocus(false)
    editBox:SetFontObject(ChatFontNormal)
    editBox:SetWidth(400)
    editBox:SetHeight(270)
    editBox:SetScript("OnEscapePressed", function(self)
        self:GetParent():GetParent():Hide()
        self:SetText("")
    end)
    scrollArea:SetScrollChild(editBox)

    local close = CreateFrame("Button", "DragonUI_ChatCopyClose", copyFrame, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", copyFrame, "TOPRIGHT")
    tinsert(UISpecialFrames, "DragonUI_ChatCopyFrame")
end

local function ChatCopyFunc(frame)
    local cf = _G[format("ChatFrame%d", frame:GetID())]
    if not cf then return end
    local _, size = cf:GetFont()
    FCF_SetChatWindowFontSize(cf, cf, 0.01)

    local lines = {}
    local ct = 1
    local regionCount = select("#", cf:GetRegions())
    for i = regionCount, 1, -1 do
        local region = select(i, cf:GetRegions())
        if region:GetObjectType() == "FontString" then
            lines[ct] = tostring(region:GetText())
            ct = ct + 1
        end
    end

    local text = table_concat(lines, "\n", 1, ct - 1)
    FCF_SetChatWindowFontSize(cf, cf, size)
    DragonUI_ChatCopyFrame:Show()
    DragonUI_ChatCopyBox:SetText(text)
    DragonUI_ChatCopyBox:HighlightText(0)
end

local function ChatCopyHint(frame)
    GameTooltip:SetOwner(frame, "ANCHOR_TOP")
    if SHOW_NEWBIE_TIPS == "1" then
        GameTooltip:AddLine(CHAT_OPTIONS_LABEL, 1, 1, 1)
        GameTooltip:AddLine(NEWBIE_TOOLTIP_CHATOPTIONS, nil, nil, nil, 1)
    end
    GameTooltip:AddLine((SHOW_NEWBIE_TIPS == "1" and "\n" or "") .. (addon.L["Double-Click to Copy"] or "Double-Click to Copy"))
    GameTooltip:Show()
end

local function ApplyChatCopy()
    if not copyFrame then
        CreateCopyFrame()
    end

    local copyLabel = (addon.L and addon.L["Copy Text"]) or "Copy Text"

    if not ChatModsModule.hooks.chatTabMenuCopyText then
        hooksecurefunc("FCF_Tab_OnClick", function(tab, button)
            if not ChatModsModule.applied then return end
            if button ~= "RightButton" then return end
            if not tab or not tab.GetID or tab:GetID() ~= 1 then return end
            if not UIDropDownMenu_CreateInfo or not UIDropDownMenu_AddButton then return end

            local info = UIDropDownMenu_CreateInfo()
            info.text = copyLabel
            info.notCheckable = 1
            info.value = "DRAGONUI_COPY_TEXT"
            info.func = function()
                ChatCopyFunc(tab)
            end
            UIDropDownMenu_AddButton(info)
        end)
        ChatModsModule.hooks.chatTabMenuCopyText = true
    end

    for i = 1, CHAT_FRAME_LIMIT do
        local tab = _G[format("ChatFrame%dTab", i)]
        if tab then
            if not tab.DragonUIChatCopyDoubleClickHooked then
                tab:HookScript("OnDoubleClick", ChatCopyFunc)
                tab.DragonUIChatCopyDoubleClickHooked = true
            end
            if not tab.DragonUIChatCopyHintHooked then
                tab:HookScript("OnEnter", ChatCopyHint)
                tab.DragonUIChatCopyHintHooked = true
            end

            -- Keep hover wake-up robust even if other addons rewire tab scripts.
            AttachChatHoverRefreshHooks(tab)
        end
    end
end

-- ============================================================================
-- STICKY CHANNELS
-- ============================================================================

local function ApplyStickyChannels()
    ChatTypeInfo.BN_WHISPER.sticky = 0
    ChatTypeInfo.EMOTE.sticky = 0
    ChatTypeInfo.OFFICER.sticky = 1
    ChatTypeInfo.RAID_WARNING.sticky = 0
    ChatTypeInfo.WHISPER.sticky = 1
    ChatTypeInfo.YELL.sticky = 0

    _G.CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0
    _G.CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0
end

-- ============================================================================
-- APPLY / RESTORE SYSTEM
-- ============================================================================

local function ApplyChatModsSystem()
    if ChatModsModule.applied then return end

    -- Expand available chat font sizes (default WoW only has a few)
    ChatModsModule.originalStates.CHAT_FONT_HEIGHTS = CHAT_FONT_HEIGHTS
    CHAT_FONT_HEIGHTS = {10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}

    ApplyChatFrameTweaks()
    ApplyEditBoxPosition()
    ApplyChatStyle()
    ApplyEditboxStyle()
    ApplyLinkHover()

    ApplyURLDetection()
    ApplyChatCopy()
    ApplyStickyChannels()

    -- AFK/DND dedup filters
    if not ChatModsModule.hooks.afkDndFilter then
        ChatFrame_AddMessageEventFilter("CHAT_MSG_AFK", FilterAfkDnd)
        ChatFrame_AddMessageEventFilter("CHAT_MSG_DND", FilterAfkDnd)
        ChatModsModule.hooks.afkDndFilter = true
    end

    -- Tell Target slash command
    SlashCmdList["DRAGONUI_TELLTARGET"] = TellTarget
    SLASH_DRAGONUI_TELLTARGET1 = "/tt"
    SLASH_DRAGONUI_TELLTARGET2 = "/wt"

    -- Mousewheel scroll hook
    if not ChatModsModule.hooks.mouseScroll then
        hooksecurefunc("FloatingChatFrame_OnMouseScroll", OnMouseScroll)
        ChatModsModule.hooks.mouseScroll = true
    end

    -- Editbox mouse toggle hooks
    if not ChatModsModule.hooks.chatOpen then
        hooksecurefunc("ChatFrame_OpenChat", OnChatFrameOpenChat)
        ChatModsModule.hooks.chatOpen = true
    end
    if not ChatModsModule.hooks.chatSend then
        hooksecurefunc("ChatEdit_SendText", OnChatEditSendText)
        ChatModsModule.hooks.chatSend = true
    end

    if not ChatModsModule.hooks.chatFadeWake then
        hooksecurefunc("FCF_FadeInChatFrame", OnChatHoverInteraction)
        hooksecurefunc("FCF_FadeOutChatFrame", OnChatHoverInteraction)
        ChatModsModule.hooks.chatFadeWake = true
    end

    ChatModsModule.applied = true
    StartChatButtonsHoverUpdater(true)
end

local function RestoreChatModsSystem()
    if not ChatModsModule.applied then return end

    StopChatButtonsHoverUpdater()

    -- Remove filters on disable so re-enable does not stack duplicate handlers.
    if ChatModsModule.hooks.afkDndFilter and ChatFrame_RemoveMessageEventFilter then
        ChatFrame_RemoveMessageEventFilter("CHAT_MSG_AFK", FilterAfkDnd)
        ChatFrame_RemoveMessageEventFilter("CHAT_MSG_DND", FilterAfkDnd)
        ChatModsModule.hooks.afkDndFilter = nil
    end

    -- Restore chat frame and editbox backdrops
    for i = 1, CHAT_FRAME_LIMIT do
        local cf = _G["ChatFrame" .. i]
        if cf then
            if cf._dragonUIBgFrame then
                cf._dragonUIBgFrame:Hide()
            end
        end
        local eb = _G["ChatFrame" .. i .. "EditBox"]
        if eb then eb:SetBackdrop(nil) end
    end

    -- Restore original chat font heights
    if ChatModsModule.originalStates.CHAT_FONT_HEIGHTS then
        CHAT_FONT_HEIGHTS = ChatModsModule.originalStates.CHAT_FONT_HEIGHTS
        ChatModsModule.originalStates.CHAT_FONT_HEIGHTS = nil
    end

    -- Restore URL handler
    if ChatModsModule.originalStates.ChatFrame_OnHyperlinkShow then
        _G.ChatFrame_OnHyperlinkShow = ChatModsModule.originalStates.ChatFrame_OnHyperlinkShow
        ChatModsModule.originalStates.ChatFrame_OnHyperlinkShow = nil
    end

    -- Restore right-click chat tab menu initializer
    if ChatModsModule.originalStates.ChatFrame_Initialize then
        _G.ChatFrame_Initialize = ChatModsModule.originalStates.ChatFrame_Initialize
        ChatModsModule.originalStates.ChatFrame_Initialize = nil
    end

    -- Hide copy frame
    if copyFrame then
        copyFrame:Hide()
    end

    -- Hooks installed via hooksecurefunc can't be removed, but they'll be
    -- guarded by ChatModsModule.applied check if we wrap them.
    -- For a full disable, a /reload is recommended.

    ChatModsModule.applied = false
end

-- ============================================================================
-- PROFILE CHANGE HANDLER
-- ============================================================================

local function OnProfileChanged()
    if IsModuleEnabled() then
        if not ChatModsModule.applied then
            ApplyChatModsSystem()
        end
        ApplyEditBoxPosition()
        ApplyChatStyle()
        ApplyEditboxStyle()
        RefreshChatFadeState()
    else
        if addon:ShouldDeferModuleDisable("chatmods", ChatModsModule) then
            return
        end
        RestoreChatModsSystem()
    end
end

-- Public API for options panel
addon.ApplyChatStyle = function()
    if ChatModsModule.applied then
        ApplyChatStyle()
    end
end

addon.ApplyEditBoxPosition = function()
    if ChatModsModule.applied then
        ApplyEditBoxPosition()
        RefreshChatFadeState()
    end
end

addon.ApplyEditboxStyle = function()
    if ChatModsModule.applied then
        ApplyEditboxStyle()
    end
end

addon.RefreshChatFadeState = function()
    if ChatModsModule.applied then
        RefreshChatFadeState()
    end
end

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "DragonUI" then
        if not IsModuleEnabled() then return end

        -- Register profile callbacks
        addon:After(0.5, function()
            if addon.db and addon.db.RegisterCallback then
                addon.db.RegisterCallback(addon, "OnProfileChanged", OnProfileChanged)
                addon.db.RegisterCallback(addon, "OnProfileCopied", OnProfileChanged)
                addon.db.RegisterCallback(addon, "OnProfileReset", OnProfileChanged)
            end
        end)

    elseif event == "PLAYER_ENTERING_WORLD" then
        if not IsModuleEnabled() then return end
        ApplyChatModsSystem()
        -- Re-apply tab noMouseAlpha after a short delay so it isn't overwritten
        -- by Blizzard's FCFManager_UpdateChatFrameListAlpha which fires after PEW.
        addon:After(1, function()
            if not ChatModsModule.applied then return end
            RefreshChatFadeState()
        end)
    end
end)

-- Export for external use
addon.ApplyChatModsSystem = ApplyChatModsSystem
addon.RestoreChatModsSystem = RestoreChatModsSystem

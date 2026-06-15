--[[
 DragonUI - Simplified Chinese Locale (zhCN)
 Community translation — Edit this file to contribute!

 Guidelines:
 - Use `true` for strings you haven't translated yet (falls back to English)
 - Keep format specifiers like %s, %d, %.1f intact
 - Keep slash commands untranslated (/dragonui, /dui, /rl)
 - Keep "DragonUI" as addon name untranslated
 - Keep color codes |cff...|r outside of L[] strings
]]

local L = LibStub("AceLocale-3.0"):NewLocale("DragonUI", "zhCN")
if not L then return end

-- Example:
-- L["Cannot toggle editor mode during combat!"] = "战斗中无法切换编辑模式！"

-- UnitFrameLayers compatibility popup
L["TooltipWidget"] = true
L["DragonUI - UnitFrameLayers Detected"] = true
L["DragonUI already includes Unit Frame Layers functionality (heal prediction, absorb shields, and animated health loss)."] = true
L["Choose how to resolve this overlap:"] = true
L["Use DragonUI: disable external UnitFrameLayers and enable DragonUI layers."] = true
L["Disable Both: disable external UnitFrameLayers and keep DragonUI layers disabled."] = true
L["Use DragonUI"] = true
L["Disable Both"] = true
L["DragonUI - D3D9Ex Warning"] = "DragonUI - D3D9Ex 警告"
L["DragonUI detected that your client is using D3D9Ex."] = "DragonUI 检测到你的客户端正在使用 D3D9Ex。"
L["DragonUI's action bar system is not compatible with D3D9Ex."] = "DragonUI 的动作条系统与 D3D9Ex 不兼容。"
L["Some DragonUI action bar textures will be missing while this mode is active."] = "启用此模式后，部分 DragonUI 动作条纹理将不会显示。"
L["If you want to disable this mode, open WTF\\Config.wtf."] = "如果你想关闭此模式，请打开 WTF\\Config.wtf。"
L["Delete this line:"] = "删除这一行："
L["Or replace it with:"] = "或改成这一行："
L["Hide Gryphons"] = "隐藏狮鹫"
L["Understood"] = "知道了"
L["Buttons"] = "按钮"
L["Main Bars"] = "主动作条"

L["Copy Text"] = "复制文本"

-- 编辑模式标签
L["TargetCastbar"] = "目标施法条"
L["FocusCastbar"] = "焦点施法条"
L["Right-click to reset"] = "右键重置"

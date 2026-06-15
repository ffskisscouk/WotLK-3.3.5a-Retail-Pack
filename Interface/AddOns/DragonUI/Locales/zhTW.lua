--[[
 DragonUI - Traditional Chinese Locale (zhTW)
 Community translation — Edit this file to contribute!

 Guidelines:
 - Use `true` for strings you haven't translated yet (falls back to English)
 - Keep format specifiers like %s, %d, %.1f intact
 - Keep slash commands untranslated (/dragonui, /dui, /rl)
 - Keep "DragonUI" as addon name untranslated
 - Keep color codes |cff...|r outside of L[] strings
]]

local L = LibStub("AceLocale-3.0"):NewLocale("DragonUI", "zhTW")
if not L then return end

-- Example:
-- L["Cannot toggle editor mode during combat!"] = "戰鬥中無法切換編輯模式！"

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
L["DragonUI detected that your client is using D3D9Ex."] = "DragonUI 偵測到你的客戶端正在使用 D3D9Ex。"
L["DragonUI's action bar system is not compatible with D3D9Ex."] = "DragonUI 的動作條系統與 D3D9Ex 不相容。"
L["Some DragonUI action bar textures will be missing while this mode is active."] = "啟用此模式時，部分 DragonUI 動作條材質會缺失。"
L["If you want to disable this mode, open WTF\\Config.wtf."] = "如果你想停用這個模式，請打開 WTF\\Config.wtf。"
L["Delete this line:"] = "刪除這一行："
L["Or replace it with:"] = "或改成這一行："
L["Hide Gryphons"] = "隱藏獅鷲"
L["Understood"] = "知道了"
L["Buttons"] = "按鈕"
L["Main Bars"] = "主動作條"

L["Copy Text"] = "複製文字"

-- 編輯模式標籤
L["TargetCastbar"] = "目標施法條"
L["FocusCastbar"] = "焦點施法條"
L["Right-click to reset"] = "右鍵重設"

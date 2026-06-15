--[[
 DragonUI - Portuguese (Brazil) Locale (ptBR)
 Community translation — Edit this file to contribute!

 Guidelines:
 - Use `true` for strings you haven't translated yet (falls back to English)
 - Keep format specifiers like %s, %d, %.1f intact
 - Keep slash commands untranslated (/dragonui, /dui, /rl)
 - Keep "DragonUI" as addon name untranslated
 - Keep color codes |cff...|r outside of L[] strings
]]

local L = LibStub("AceLocale-3.0"):NewLocale("DragonUI", "ptBR")
if not L then return end

-- Example:
-- L["Cannot toggle editor mode during combat!"] = "Não é possível alternar o modo editor durante o combate!"

-- UnitFrameLayers compatibility popup
L["TooltipWidget"] = true
L["DragonUI - UnitFrameLayers Detected"] = true
L["DragonUI already includes Unit Frame Layers functionality (heal prediction, absorb shields, and animated health loss)."] = true
L["Choose how to resolve this overlap:"] = true
L["Use DragonUI: disable external UnitFrameLayers and enable DragonUI layers."] = true
L["Disable Both: disable external UnitFrameLayers and keep DragonUI layers disabled."] = true
L["Use DragonUI"] = true
L["Disable Both"] = true
L["DragonUI - D3D9Ex Warning"] = "DragonUI - Aviso de D3D9Ex"
L["DragonUI detected that your client is using D3D9Ex."] = "DragonUI detectou que seu cliente está usando D3D9Ex."
L["DragonUI's action bar system is not compatible with D3D9Ex."] = "O sistema de barras de ação do DragonUI não é compatível com D3D9Ex."
L["Some DragonUI action bar textures will be missing while this mode is active."] = "Algumas texturas das barras de ação do DragonUI vão ficar ausentes enquanto este modo estiver ativo."
L["If you want to disable this mode, open WTF\\Config.wtf."] = "Se quiser desativar este modo, abra WTF\\Config.wtf."
L["Delete this line:"] = "Apague esta linha:"
L["Or replace it with:"] = "Ou substitua por esta:"
L["Hide Gryphons"] = "Esconder grifos"
L["Understood"] = "Entendi"
L["Buttons"] = "Botões"
L["Main Bars"] = "Barras principais"

L["Copy Text"] = "Copiar texto"

-- Labels do modo editor
L["TargetCastbar"] = "Barra de lançamento do Alvo"
L["FocusCastbar"] = "Barra de lançamento do Foco"
L["Right-click to reset"] = "Clique com o botão direito para redefinir"

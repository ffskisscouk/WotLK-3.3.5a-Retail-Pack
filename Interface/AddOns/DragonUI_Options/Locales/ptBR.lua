--[[
 DragonUI_Options - Portuguese (Brazil) Locale (ptBR)
 Community translation — Edit this file to contribute!

 Guidelines:
 - Use `true` for strings you haven't translated yet (falls back to English)
 - Keep format specifiers like %s, %d, %.1f intact
 - Keep "DragonUI" as addon name untranslated
 - Keep color codes |cff...|r outside of L[] strings
]]

local L = LibStub("AceLocale-3.0"):NewLocale("DragonUI_Options", "ptBR")
if not L then return end

-- Example:
-- L["General"] = "Geral"

-- LAYOUT PRESETS
L["Layout Presets"] = "Predefinições de Layout"
L["Save and restore complete UI layouts. Each preset captures all positions, scales, and settings."] = "Salve e restaure layouts completos de interface. Cada predefinição captura todas as posições, escalas e configurações."
L["No presets saved yet."] = "Nenhuma predefinição salva ainda."
L["Save New Preset"] = "Salvar Nova Predefinição"
L["Save your current UI layout as a new preset."] = "Salvar o layout atual da interface como nova predefinição."
L["Preset"] = "Predefinição"
L["Enter a name for this preset:"] = "Digite um nome para esta predefinição:"
L["Save"] = "Salvar"
L["Load"] = "Carregar"
L["Load preset '%s'? This will overwrite your current layout settings."] = "Carregar predefinição '%s'? Isso sobrescreverá suas configurações de layout atuais."
L["Load Preset"] = "Carregar Predefinição"
L["Delete preset '%s'? This cannot be undone."] = "Excluir predefinição '%s'? Isso não pode ser desfeito."
L["Delete Preset"] = "Excluir Predefinição"
L["Duplicate Preset"] = "Duplicar Predefinição"
L["Preset saved: "] = "Predefinição salva: "
L["Preset loaded: "] = "Predefinição carregada: "
L["Preset deleted: "] = "Predefinição excluída: "
L["Preset duplicated: "] = "Predefinição duplicada: "
L["Also delete all saved layout presets?"] = "Também excluir todas as predefinições de layout salvas?"
L["Presets kept."] = "Predefinições mantidas."

-- PRESET IMPORT / EXPORT
L["Export Preset"] = "Exportar Predefinição"
L["Import Preset"] = "Importar Predefinição"
L["Import a preset from a text string shared by another player."] = "Importe uma predefinição de um texto compartilhado por outro jogador."
L["Import"] = "Importar"
L["Select All"] = "Selecionar Tudo"
L["Close"] = "Fechar"
L["Enter a name for the imported preset:"] = "Digite um nome para a predefinição importada:"
L["Imported Preset"] = "Predefinição Importada"
L["Preset imported: "] = "Predefinição importada: "
L["Invalid preset string."] = "Texto de predefinição inválido."
L["Not a valid DragonUI preset string."] = "Não é um texto de predefinição DragonUI válido."
L["Failed to export preset."] = "Falha ao exportar a predefinição."
L["Show Buff/Debuff on Focus"] = "Mostrar buffs/debuffs no foco"
L["Uses the native large focus frame mode to show buffs and debuffs on the focus frame."] = "Usa o modo nativo de quadro de foco grande para mostrar buffs e debuffs no quadro de foco."
L["Gryphon previews are hidden while D3D9Ex is active to avoid client crashes."] = "As prévias dos grifos ficam ocultas enquanto o D3D9Ex estiver ativo para evitar travamentos do cliente."

-- Chat Mods
L["Enable Chat Mods"] = "Ativar Mods de Chat"
L["Enables or disables Chat Mods."] = "Ativa ou desativa os mods de chat."
L["Editbox Position"] = "Posi\u00e7\u00e3o da Caixa de Entrada"
L["Choose where the chat editbox is positioned."] = "Escolha onde a caixa de entrada do chat fica posicionada."
L["Top"] = "Cima"
L["Bottom"] = "Baixo"
L["Middle"] = "Meio"
L["Tab & Button Fade"] = "Desvanecimento de abas e botões"
L["How visible chat tabs are when not hovered. 0 = fully hidden, 1 = fully visible."] = "Visibilidade das abas de chat sem o cursor. 0 = totalmente ocultas, 1 = totalmente vis\u00edveis."
L["Chat Style Opacity"] = "Opacidade do estilo do chat"
L["Minimum opacity of the custom chat background. At 0 it fades with tabs; above 0 it stays partially visible when idle."] = "Opacidade mínima do fundo personalizado do chat. Em 0 desvanece com as abas; acima disso permanece parcialmente visível quando inativo."
L["Text Box Min Opacity"] = "Opacidade mín. da caixa de texto"
L["Minimum opacity of the text input box when idle. At 0 it fades with tabs; above 0 it stays partially visible."] = "Opacidade mínima da caixa de texto quando inativa. Em 0 desvanece com as abas; acima disso permanece parcialmente visível."
L["Chat Style"] = "Estilo do chat"
L["Visual style for the chat frame background."] = "Estilo visual do fundo do quadro de chat."
L["Editbox Style"] = "Estilo da caixa de entrada"
L["Visual style for the chat input box background."] = "Estilo visual do fundo da caixa de entrada do chat."
L["Dark"] = "Escuro"
L["DragonUI Style"] = "Estilo DragonUI"
L["Midnight"] = "Meia-noite"
L["Chat"] = "Chat"
L["Appearance"] = "Apar\u00eancia"
-- Auras tab
L["Positions"] = "Posições"
L["Reset Buff Frame Position"] = "Redefinir posição das auras"
L["Buff frame position reset."] = "Posição do quadro de auras redefinida."
L["Reset Weapon Enchant Position"] = "Redefinir posição dos encantamentos de arma"
L["Weapon enchant position reset."] = "Posição dos encantamentos de arma redefinida."
-- Latency indicator (player only)
L["Latency Indicator"] = "Indicador de Lat\195\170ncia"
L["Enable Latency Indicator"] = "Ativar Indicador de Lat\195\170ncia"
L["Show a safe-zone overlay based on real cast latency."] = "Mostra uma zona segura baseada na lat\195\170ncia real da conjura\195\167\195\163o."
L["Latency Color"] = "Cor da Lat\195\170ncia"
L["Latency Alpha"] = "Opacidade da Lat\195\170ncia"
L["Opacity of the latency indicator."] = "Opacidade do indicador de lat\195\170ncia."

-- Combat Flash (player frame)
L["Combat Flash"] = "Flash de Combate"
L["Show Combat Flash"] = "Mostrar Flash de Combate"
L["Pulsing glow effect when entering combat. Works with all frame modes."] = "Efeito de brilho pulsante ao entrar em combate. Funciona com todos os modos de quadro."
L["Combat Flash Opacity"] = "Opacidade do Flash de Combate"
L["Maximum opacity of the combat flash pulse effect."] = "Opacidade m\195\161xima do efeito de pulso do flash de combate."

-- Castbar detach/reattach
L["Castbar detached - positioned freely via Editor Mode"] = "Barra de lancamento desacoplada - posicionada livremente no Modo Editor"
L["Castbar attached - follows Target frame"] = "Barra de lancamento acoplada - segue o quadro do Alvo"
L["Castbar attached - follows Focus frame"] = "Barra de lancamento acoplada - segue o quadro do Foco"
L["Re-attach Castbar to Target"] = "Reacoplar barra de lancamento ao Alvo"
L["Re-attach Castbar to Focus"] = "Reacoplar barra de lancamento ao Foco"
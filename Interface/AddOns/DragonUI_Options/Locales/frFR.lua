--[[
 DragonUI_Options - French Locale (frFR)
 Community translation — Edit this file to contribute!

 Guidelines:
 - Use `true` for strings you haven't translated yet (falls back to English)
 - Keep format specifiers like %s, %d, %.1f intact
 - Keep "DragonUI" as addon name untranslated
 - Keep color codes |cff...|r outside of L[] strings
]]

local L = LibStub("AceLocale-3.0"):NewLocale("DragonUI_Options", "frFR")
if not L then return end

-- Example:
-- L["General"] = "Général"

-- LAYOUT PRESETS
L["Layout Presets"] = "Préréglages de disposition"
L["Save and restore complete UI layouts. Each preset captures all positions, scales, and settings."] = "Sauvegardez et restaurez des dispositions d'interface complètes. Chaque préréglage capture toutes les positions, échelles et paramètres."
L["No presets saved yet."] = "Aucun préréglage sauvegardé."
L["Save New Preset"] = "Nouveau préréglage"
L["Save your current UI layout as a new preset."] = "Sauvegarder votre disposition actuelle comme nouveau préréglage."
L["Preset"] = "Préréglage"
L["Enter a name for this preset:"] = "Entrez un nom pour ce préréglage :"
L["Save"] = "Sauvegarder"
L["Load"] = "Charger"
L["Load preset '%s'? This will overwrite your current layout settings."] = "Charger le préréglage '%s' ? Cela écrasera vos paramètres de disposition actuels."
L["Load Preset"] = "Charger un préréglage"
L["Delete preset '%s'? This cannot be undone."] = "Supprimer le préréglage '%s' ? Cette action est irréversible."
L["Delete Preset"] = "Supprimer un préréglage"
L["Duplicate Preset"] = "Dupliquer un préréglage"
L["Preset saved: "] = "Préréglage sauvegardé : "
L["Preset loaded: "] = "Préréglage chargé : "
L["Preset deleted: "] = "Préréglage supprimé : "
L["Preset duplicated: "] = "Préréglage dupliqué : "
L["Also delete all saved layout presets?"] = "Supprimer également tous les préréglages de disposition sauvegardés ?"
L["Presets kept."] = "Préréglages conservés."

-- PRESET IMPORT / EXPORT
L["Export Preset"] = "Exporter le préréglage"
L["Import Preset"] = "Importer un préréglage"
L["Import a preset from a text string shared by another player."] = "Importer un préréglage depuis un texte partagé par un autre joueur."
L["Import"] = "Importer"
L["Select All"] = "Tout sélectionner"
L["Close"] = "Fermer"
L["Enter a name for the imported preset:"] = "Entrez un nom pour le préréglage importé :"
L["Imported Preset"] = "Préréglage importé"
L["Preset imported: "] = "Préréglage importé : "
L["Invalid preset string."] = "Texte de préréglage invalide."
L["Not a valid DragonUI preset string."] = "Ce n'est pas un texte de préréglage DragonUI valide."
L["Failed to export preset."] = "Échec de l'exportation du préréglage."
L["Show Buff/Debuff on Focus"] = "Afficher les buffs/debuffs sur la focalisation"
L["Uses the native large focus frame mode to show buffs and debuffs on the focus frame."] = "Utilise le mode natif de grand cadre de focalisation pour afficher les buffs et debuffs sur le cadre de focalisation."
L["Gryphon previews are hidden while D3D9Ex is active to avoid client crashes."] = "Les aperçus de griffons sont masqués lorsque D3D9Ex est actif pour éviter les plantages du client."

-- Chat Mods
L["Enable Chat Mods"] = "Activer les mods de chat"
L["Enables or disables Chat Mods."] = "Active ou désactive les mods de chat."
L["Editbox Position"] = "Position de la zone de saisie"
L["Choose where the chat editbox is positioned."] = "Choisissez o\u00f9 se trouve la zone de saisie du chat."
L["Top"] = "Haut"
L["Bottom"] = "Bas"
L["Middle"] = "Milieu"
L["Tab & Button Fade"] = "Fondu des onglets et boutons"
L["How visible chat tabs are when not hovered. 0 = fully hidden, 1 = fully visible."] = "Visibilité des onglets de chat sans survol. 0 = complètement cachés, 1 = complètement visibles."
L["Opacity of tabs, buttons and chat background when not hovered. 0 = hidden, 1 = always visible."] = "Opacit\u00e9 des onglets, boutons et fond du chat sans survol. 0 = cach\u00e9, 1 = toujours visible."
L["Chat Style Opacity"] = "Opacité du style du chat"
L["Minimum opacity of the custom chat background. At 0 it fades with tabs; above 0 it stays partially visible when idle."] = "Opacité minimale du fond personnalisé du chat. À 0 il s'estompe avec les onglets ; au-dessus, il reste partiellement visible au repos."
L["Text Box Min Opacity"] = "Opacité min. du champ de saisie"
L["Minimum opacity of the text input box when idle. At 0 it fades with tabs; above 0 it stays partially visible."] = "Opacité minimale du champ de saisie au repos. À 0 il s'estompe avec les onglets ; au-dessus, il reste partiellement visible."L["Chat Style"] = "Style du chat"
L["Visual style for the chat frame background."] = "Style visuel du fond du cadre de chat."
L["Editbox Style"] = "Style de la zone de saisie"
L["Visual style for the chat input box background."] = "Style visuel du fond de la zone de saisie du chat."
L["Dark"] = "Sombre"
L["DragonUI Style"] = "Style DragonUI"
L["Midnight"] = "Minuit"
L["Chat"] = "Chat"
L["Appearance"] = "Apparence"

-- Auras tab
L["Positions"] = "Positions"
L["Reset Buff Frame Position"] = "Réinitialiser la position des auras"
L["Buff frame position reset."] = "Position du cadre d'auras réinitialisée."
L["Reset Weapon Enchant Position"] = "Réinitialiser la position des enchantements d'arme"
L["Weapon enchant position reset."] = "Position des enchantements d'arme réinitialisée."

-- Latency indicator (player only)
L["Latency Indicator"] = "Indicateur de latence"
L["Enable Latency Indicator"] = "Activer l'indicateur de latence"
L["Show a safe-zone overlay based on real cast latency."] = "Affiche une zone de confort bas\195\169e sur la latence r\195\169elle du sort."
L["Latency Color"] = "Couleur de la latence"
L["Latency Alpha"] = "Opacit\195\169 de la latence"
L["Opacity of the latency indicator."] = "Opacit\195\169 de l'indicateur de latence."

-- Combat Flash (player frame)
L["Combat Flash"] = "Flash de Combat"
L["Show Combat Flash"] = "Afficher le Flash de Combat"
L["Pulsing glow effect when entering combat. Works with all frame modes."] = "Effet de pulsation lumineuse en entrant en combat. Fonctionne avec tous les modes de cadre."
L["Combat Flash Opacity"] = "Opacit\195\169 du Flash de Combat"
L["Maximum opacity of the combat flash pulse effect."] = "Opacit\195\169 maximale de l'effet de pulsation du flash de combat."

-- Castbar detach/reattach
L["Castbar detached - positioned freely via Editor Mode"] = "Barre d'incantation detachee - position libre via le mode editeur"
L["Castbar attached - follows Target frame"] = "Barre d'incantation attachee - suit le cadre Cible"
L["Castbar attached - follows Focus frame"] = "Barre d'incantation attachee - suit le cadre Focus"
L["Re-attach Castbar to Target"] = "Rattacher la barre d'incantation a la cible"
L["Re-attach Castbar to Focus"] = "Rattacher la barre d'incantation au focus"

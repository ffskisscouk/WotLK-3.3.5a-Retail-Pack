--[[
================================================================================
DragonUI_Options - German Locale (Default)
================================================================================
Base locale for the options panel: labels, descriptions, section headers,
dropdown values, print messages, popup text.

When adding new strings:
1. Add L[<your key>] = true here
2. Use L["Your String"] in your options code
3. Add translations to other locale files
================================================================================
]]

local L = LibStub("AceLocale-3.0"):NewLocale("DragonUI_Options", "deDE")
if not L then return end

-- ============================================================================
-- GENERAL / PANEL
-- ============================================================================

L["DragonUI"] = "DragonUI"
L["Use the tabs on the left to configure modules, action bars, unit frames, minimap, and more."] = "Verwende die Tabs links, um Module, Aktionsleisten, Einheitenrahmen, Minimap und mehr zu konfigurieren."
L["Editor Mode"] = "Editor-Modus"
L["Exit Editor Mode"] = "Editor-Modus beenden"
L["KeyBind Mode Active"] = "Tastenbelegungsmodus aktiv"
L["Move UI Elements"] = "UI-Elemente verschieben"
L["Cannot open options during combat."] = "Optionen können im Kampf nicht geöffnet werden."
L["Open DragonUI Settings"] = "DragonUI-Einstellungen öffnen"
L["Open the DragonUI configuration panel."] = "Das DragonUI-Konfigurationsfenster öffnen."
L["Use /dragonui to open the full settings panel."] = "Nutze /dragonui, um das vollständige Einstellungsfenster zu öffnen."

-- Quick Actions
L["Quick Actions"] = "Schnellaktionen"
L["Jump to popular settings sections."] = "Schnellzugriff auf beliebte Einstellungen."
L["Action Bar Layout"] = "Aktionsleisten-Layout"
L["Configure dark tinting for all UI chrome."] = "Dunkle Tönung für alle UI-Elemente konfigurieren."
L["Full-width health bar that fills the entire player frame."] = "Breiter Lebensbalken, der den gesamten Spielerrahmen ausfüllt."
L["Add a decorative dragon to your player frame."] = "Dekorativen Drachen zum Spielerrahmen hinzufügen."
L["Heal prediction, absorb shields and animated health loss."] = "Heilvorhersage, Absorptionsschilde und animierter Lebensverlust."
L["Change columns, rows, and buttons shown per action bar."] = "Spalten, Zeilen und sichtbare Buttons pro Aktionsleiste ändern."
L["Switch micro menu icons between colored and grayscale style."] = "Mikro-Menü-Icons zwischen Farbe und Graustufen umschalten."
L["About"] = "Über"
L["Bringing the retail WoW look to 3.3.5a, inspired by Dragonflight UI."] = "Der Retail-WoW-Look für 3.3.5a, inspiriert von Dragonflight UI."
L["Created and maintained by Neticsoul, with community contributions."] = "Erstellt und gepflegt von Neticsoul, mit Beiträgen der Community."

L["Commands: /dragonui, /dui, /pi — /dragonui edit (editor) — /dragonui help"] = "Befehle: /dragonui, /dui, /pi — /dragonui edit (Editor) — /dragonui help"
L["GitHub (select and Ctrl+C to copy):"] = "GitHub (markieren und Strg+C zum Kopieren):"
L["All"] = "Alle"
L["Error:"] = "Fehler:"
L["Error: DragonUI addon not found!"] = "Fehler: DragonUI-Addon nicht gefunden!"

-- ============================================================================
-- STATIC POPUPS
-- ============================================================================

L["Changing this setting requires a UI reload to apply correctly."] = "Das Ändern dieser Einstellung erfordert ein Neuladen der UI, damit änderungen korrekt angewendet werden."
L["Reload UI"] = "UI neu laden"
L["Not Now"] = "Nicht jetzt"
L["Reload Now"] = "Jetzt neu laden"
L["Cancel"] = "Abbrechen"
L["Yes"] = "Ja"
L["No"] = "Nein"

-- ============================================================================
-- TAB NAMES
-- ============================================================================

L["General"] = "Allgemein"
L["Modules"] = "Module"
L["Action Bars"] = "Aktionsleisten"
L["Additional Bars"] = "Zusätzliche Leisten"
L["Minimap"] = "Minikarte"
L["Profiles"] = "Profile"
L["Unit Frames"] = "Einheitenfenster"
L["XP & Rep Bars"] = "EP- & Rufleisten"
L["Chat"] = "Chat"
L["Appearance"] = "Erscheinungsbild"

-- ============================================================================
-- MODULES TAB
-- ============================================================================

-- Headers & descriptions
L["Module Control"] = "Modulsteuerung"
L["Enable or disable specific DragonUI modules"] = "Bestimmte DragonUI-Module aktivieren oder deaktivieren"
L["Toggle individual modules on or off. Disabled modules revert to the default Blizzard UI."] = "Einzelne Module ein- oder ausschalten. Deaktivierte Module fallen auf die Blizzard-Standard-UI zurück."
L["Visual enhancements that add Dragonflight-style polish to the UI."] = "Visuelle Verbesserungen, die der UI Dragonflight-Ästhetik geben."
L["Warning: These are individual module controls. The options above may control multiple modules at once. Changes here will be reflected above and vice versa."] = "Warnung: Das sind Einzel-Modul-Steuerungen. Die Optionen oben können mehrere Module gleichzeitig steuern. Änderungen hier werden oben übernommen und umgekehrt."
L["Warning:"] = "Warnung:"
L["Individual overrides. The grouped toggles above take priority."] = "Einzel-Overrides. Die gruppierten Schalter oben haben Vorrang."
L["Advanced - Individual Module Control"] = "Erweitert - Einzelne Modulsteuerung"

-- Section headers
L["Cast Bars"] = "Zauberleiste"
L["Other Modules"] = "Weitere Module"
L["UI Systems"] = "UI-Systeme"
L["Enable All Action Bar Modules"] = "Alle Aktionsleisten-Module aktivieren"
L["Cast Bar"] = "Zauberleiste"
L["Custom player, target, and focus cast bars"] = "Benutzerdefinierte Zauberleisten für Spieler, Ziel und Fokus"
L["Cooldown text on action buttons"] = "Abklingzeittext auf Aktionsbuttons"
L["Shaman totem bar positioning and styling"] = "Positionierung und Styling der Schamanen-Totemleiste"
L["Dragonflight-styled player unit frame"] = "Spieler-Unitframe im Dragonflight-Stil"
L["Dragonflight-styled boss target frames"] = "Boss-Zielrahmen im Dragonflight-Stil"

-- Toggle labels
L["Action Bars System"] = "Aktionsleisten-System"
L["Micro Menu & Bags"] = "Mikromenü & Taschen"
L["Cooldown Timers"] = "Abklingzeit-Timer"
L["Minimap System"] = "Minikarten-System"
L["Buff Frame System"] = "Stärkungsfenster-System"
L["Dark Mode"] = "Dunkelmodus"
L["Item Quality Borders"] = "Rahmen nach Gegenstandsqualität"
L["Enable Enhanced Tooltips"] = "Erweiterte Tooltips aktivieren"
L["KeyBind Mode"] = "Tastenbelegungsmodus"
L["Quest Tracker"] = "Questverfolgung"

-- Module toggle descriptions
L["Enable DragonUI player castbar. When disabled, shows default Blizzard castbar."] = "DragonUI-Spieler-Zauberleiste aktivieren. Wenn deaktiviert, wird die Blizzard-Standard-Zauberleiste angezeigt."
L["Enable DragonUI player castbar styling."] = "DragonUI-Stil für die Spieler-Zauberleiste aktivieren."
L["Enable DragonUI target castbar. When disabled, shows default Blizzard castbar."] = "DragonUI-Ziel-Zauberleiste aktivieren. Wenn deaktiviert, wird die Blizzard-Standard-Zauberleiste angezeigt."
L["Enable DragonUI target castbar styling."] = "DragonUI-Stil für die Ziel-Zauberleiste aktivieren."
L["Enable DragonUI focus castbar. When disabled, shows default Blizzard castbar."] = "DragonUI-Fokus-Zauberleiste aktivieren. Wenn deaktiviert, wird die Blizzard-Standard-Zauberleiste angezeigt."
L["Enable DragonUI focus castbar styling."] = "DragonUI-Stil für die Fokus-Zauberleiste aktivieren."
L["Enable the complete DragonUI action bars system. This controls: Main action bars, vehicle interface, stance/shapeshift bars, pet action bars, multicast bars (totems/possess), button styling, and hide Blizzard elements. When disabled, all action bar related features will use default Blizzard interface."] = "Das komplette DragonUI-Aktionsleisten-System aktivieren. Steuert: Hauptaktionsleisten, Fahrzeug-Interface, Haltungs-/Gestaltleisten, Begleiteraktionsleisten, Multicast-Leisten (Totems/Besessenheit), Button-Styling und das Ausblenden von Blizzard-Elementen. Wenn deaktiviert, nutzen alle Aktionsleisten-Funktionen die Blizzard-Standardoberfläche."
L["Master toggle for the complete action bars system."] = "Hauptschalter für das komplette Aktionsleisten-System."
L["Includes main bars, vehicle, stance, pet, totem bars, and button styling."] = "Enthält Hauptleisten, Fahrzeug, Haltung, Begleiter, Totemleisten und Button-Styling."
L["Apply DragonUI micro menu and bags system styling and positioning. Includes character button, spellbook, talents, etc. and bag management. When disabled, these elements will use default Blizzard positioning and styling."] = "DragonUI-Styling und Positionierung für Mikromenü & Taschen anwenden. Enthält Charakter-Button, Zauberbuch, Talente usw. sowie Taschenverwaltung. Wenn deaktiviert, nutzen diese Elemente Blizzard-Standard-Positionierung und -Stil."
L["Micro menu and bags styling."] = "Stil für Mikromenü & Taschen."
L["Show cooldown timers on action buttons. When disabled, cooldown timers will be hidden and the system will be completely deactivated."] = "Abklingzeit-Timer auf Aktionsbuttons anzeigen. Wenn deaktiviert, werden Timer ausgeblendet und das System vollständig deaktiviert."
L["Show cooldown timers on action buttons."] = "Abklingzeit-Timer auf Aktionsbuttons anzeigen."
L["Enable DragonUI minimap enhancements including custom styling, positioning, tracking icons, and calendar. When disabled, uses default Blizzard minimap appearance and positioning."] = "DragonUI-Minimap-Verbesserungen aktivieren: eigenes Styling, Positionierung, Tracking-Icons und Kalender. Wenn deaktiviert, wird die Blizzard-Standard-Minimap verwendet."
L["Minimap styling, tracking icons, and calendar."] = "Minimap-Styling, Tracking-Icons und Kalender."
L["Enable DragonUI buff frame with custom styling, positioning, and toggle button functionality. When disabled, uses default Blizzard buff frame appearance and positioning."] = "DragonUI-Stärkungsfenster mit eigenem Styling, Positionierung und Umschalt-Button aktivieren. Wenn deaktiviert, wird das Blizzard-Standard-Stärkungsfenster verwendet."
L["Buff frame styling and toggle button."] = "Stärkungsfenster-Styling und Umschalt-Button."
L["Separate Weapon Enchants"] = "Separate Waffenverzauberungen"
L["Detach weapon enchant icons (poisons, sharpening stones, etc.) from the buff bar into their own independently moveable frame. Position it freely using Editor Mode."] = "Entfernt die Symbole für Waffenverzauberungen (Gifte, Schleifsteine usw.) aus der Buff-Leiste und verschiebt sie in einen eigenen, unabhängig verschiebbaren Rahmen. Positionieren Sie diesen frei im Editor-Modus."

-- Auras tab
L["Auras"] = "Auren"
L["Show Toggle Button"] = "Zeige wechsel Knopf"
L["Show a collapse/expand button next to the buff icons."] = "Zeige eine Schaltfläche zum Ein- und Ausblenden neben den Buff-Symbolen an."
L["Weapon Enchants"] = "Waffenverzauberungen"
L["Weapon enchant icons include rogue poisons, sharpening stones, wizard oils, and similar temporary weapon enhancements."] = "Zu den Symbolen für Waffenverzauberungen gehören Schurken-Gifte, Schleifsteine, Zaubereröle und ähnliche vorübergehende Waffenverbesserungen."
L["When enabled, a 'Weapon Enchants' mover appears in Editor Mode that you can drag to any position on screen."] = "Wenn diese Option aktiviert ist, erscheint im Editor-Modus ein „Waffenverzauberungen”-Mover, den Sie an eine beliebige Position auf dem Bildschirm ziehen können."
L["Positions"] = "Positionen"
L["Reset Buff Frame Position"] = "Buff-Rahmenposition zurücksetzen"
L["Reset Weapon Enchant Position"] = "Waffenverzauberungsposition zurücksetzen"
L["Buff frame position reset."] = "Buff-Rahmenposition zurücksetzen."
L["Weapon enchant position reset."] = "Waffenverzauberungsposition zurückgesetzt."

L["DragonUI quest tracker positioning and styling."] = "Positionierung und Styling der DragonUI-Questverfolgung."
L["LibKeyBound integration for intuitive hover + key press binding."] = "LibKeyBound-Integration für intuitives Belegen (Hover + Tastendruck)."

-- Toggle keybinding mode description
L["Toggle keybinding mode. Hover over action buttons and press keys to bind them instantly. Press ESC to clear bindings."] = "Tastenbelegungsmodus umschalten. Fahre über Aktionsbuttons und drücke Tasten, um sie sofort zu belegen. Drücke ESC, um Belegungen zu löschen."

-- Enable/disable dynamic descriptions
L["Enable/disable "] = "Aktivieren/deaktivieren "

-- Dark Mode
L["Dark Mode Intensity"] = "Dunkelmodus-Intensität"
L["Light (subtle)"] = "Hell (dezent)"
L["Medium (balanced)"] = "Mittel (ausgewogen)"
L["Dark (maximum)"] = "Dunkel (maximal)"
L["Apply darker tinted textures to all UI chrome: action bars, unit frames, minimap, bags, micro menu, and more."] = "Dunkler getönte Texturen auf alle UI-Elemente anwenden: Aktionsleisten, Einheitenfenster, Minimap, Taschen, Mikromenü und mehr."
L["Apply darker tinted textures to all UI elements."] = "Dunkler getönte Texturen auf alle UI-Elemente anwenden."
L["Darkens UI borders and chrome only: action bar borders, unit frame borders, minimap border, bag slot borders, micro menu, castbar borders, and decorative elements. Icons, portraits, and abilities are never affected."] = "Dunkelt nur UI-Rahmen und Zierleisten ab: Aktionsleisten-Rahmen, Einheitenfenster-Rahmen, Minimap-Rahmen, Taschenplatz-Rahmen, Mikromenü, Zauberbalken-Rahmen und Deko-Elemente. Icons, Porträts und Fähigkeiten sind nicht betroffen."
L["Enable Dark Mode"] = "Dunkelmodus aktivieren"

-- Dark Mode - Custom Color
L["Custom Color"] = "Benutzerdefinierte Farbe"
L["Override presets with a custom tint color."] = "Voreinstellungen mit einer eigenen Tönungsfarbe überschreiben."
L["Tint Color"] = "Tönungsfarbe"
L["Intensity"] = "Intensität"

-- Range Indicator
L["Tint action button icons when target is out of range (red), not enough mana (blue), or unusable (gray)."] = "Aktionsbutton-Icons einfärben, wenn das Ziel außer Reichweite ist (rot), nicht genug Mana vorhanden ist (blau) oder die Fähigkeit nicht nutzbar ist (grau)."
L["Tints action button icons based on range and usability: red = out of range, blue = not enough mana, gray = unusable."] = "Färbt Aktionsbutton-Icons je nach Reichweite/Nutzbarkeit: rot = außer Reichweite, blau = nicht genug Mana, grau = nicht nutzbar."
L["Enable Range Indicator"] = "Reichweitenanzeige aktivieren"
L["Color action button icons when target is out of range or ability is unusable."] = "Aktionsbutton-Icons färben, wenn das Ziel außer Reichweite ist oder die Fähigkeit nicht nutzbar ist."

-- Item Quality Borders
L["Show colored glow borders on action buttons containing items, colored by item quality (green = uncommon, blue = rare, purple = epic, etc.)."] = "Farbige Leuchtrahmen auf Aktionsbuttons mit Gegenständen anzeigen – je nach Qualität (grün = ungewöhnlich, blau = selten, lila = episch, usw.)."
L["Enable Item Quality Borders"] = "Rahmen nach Gegenstandsqualität aktivieren"
L["Show quality-colored borders on items in bags, character panel, bank, merchant, and inspect frames."] = "Rahmen nach Qualität bei Gegenständen in Taschen, Charakterfenster, Bank, Händler und Inspizieren anzeigen."
L["Adds quality-colored glow borders to items in your bags, character panel, bank, merchant, and inspect frames: green = uncommon, blue = rare, purple = epic, orange = legendary."] = "Fügt Leuchtrahmen nach Qualität in Taschen hinzu, Charakterfenster, Bank, Händler und Inspizieren: grün = ungewöhnlich, blau = selten, lila = episch, orange = legendär."
L["Minimum Quality"] = "Mindestqualität"
L["Only show colored borders for items at or above this quality level."] = "Farbige Rahmen nur für Gegenstände dieser Qualität oder höher anzeigen."
L["Poor"] = "Schlecht"
L["Common"] = "Gewöhnlich"
L["Uncommon"] = "Ungewöhnlich"
L["Rare"] = "Selten"
L["Epic"] = "Episch"
L["Legendary"] = "Legendär"

-- Enhanced Tooltips
L["Enhanced Tooltips"] = "Erweiterte Tooltips"
L["Improves GameTooltip with class-colored borders, class-colored names, target-of-target info, and styled health bars."] = "Verbessert GameTooltip: Rahmen nach Klassenfarbe, Namen nach Klassenfarbe, Ziel-des-Ziels-Info und stilisierte Lebensleisten."
L["Activate all tooltip improvements. Sub-options below control individual features."] = "Alle Tooltip-Verbesserungen aktivieren. Unteroptionen steuern einzelne Features."
L["Class-Colored Border"] = "Rahmen nach Klassenfarbe"
L["Color the tooltip border by the unit's class (players) or reaction (NPCs)."] = "Tooltip-Rahmen nach Klasse (Spieler) oder Reaktion (NPCs) einfärben."
L["Class-Colored Name"] = "Name nach Klassenfarbe"
L["Color the unit name text in the tooltip by class color (players only)."] = "Einheitenname im Tooltip nach Klassenfarbe einfärben (nur Spieler)."
L["Add a 'Targeting: <name>' line showing who the unit is targeting."] = "Eine Zeile „Zielt auf: <name>“ hinzufügen, die zeigt, wen die Einheit anvisiert."
L["Add a 'Targeting: <name>' line to the tooltip showing who the unit is targeting."] = "Eine Zeile „Zielt auf: <name>“ im Tooltip hinzufügen, die zeigt, wen die Einheit anvisiert."
L["Styled Health Bar"] = "Stilisierte Lebensleiste"
L["Restyle the tooltip health bar with class/reaction colors."] = "Tooltip-Lebensleiste mit Klassen-/Reaktionsfarben neu stylen."
L["Restyle the tooltip health bar with class/reaction colors and slimmer look."] = "Tooltip-Lebensleiste mit Klassen-/Reaktionsfarben und schlanker Optik neu stylen."
L["Anchor to Cursor"] = "Am Cursor verankern"
L["Make the tooltip follow the cursor position instead of the default anchor."] = "Tooltip der Cursorposition folgen lassen statt der Standard-Verankerung."

-- Chat Mods
L["Enable Chat Mods"] = "Chat-Mods aktivieren"
L["Enables or disables Chat Mods."] = "Aktiviert oder deaktiviert Chat-Mods."
L["Editbox Position"] = "Editbox-Position"
L["Choose where the chat editbox is positioned."] = "Wähle die Position des Chat-Eingabefelds."
L["Top"] = "Oben"
L["Bottom"] = "Unten"
L["Middle"] = "Mitte"
L["Tab & Button Fade"] = "Tab- & Schaltflächen-Einblenden"
L["How visible chat tabs are when not hovered. 0 = fully hidden, 1 = fully visible."] = "Wie sichtbar Chat-Tabs sind, wenn sie nicht überfahren werden. 0 = vollständig ausgeblendet, 1 = vollständig sichtbar."
L["Chat Style Opacity"] = "Chat-Stil-Deckkraft"
L["Minimum opacity of the custom chat background. At 0 it fades with tabs; above 0 it stays partially visible when idle."] = "Minimale Deckkraft des benutzerdefinierten Chat-Hintergrunds. Bei 0 blendet er mit den Tabs aus; darüber bleibt er im Leerlauf teilweise sichtbar."
L["Text Box Min Opacity"] = "Min. Deckkraft des Eingabefelds"
L["Minimum opacity of the text input box when idle. At 0 it fades with tabs; above 0 it stays partially visible."] = "Minimale Deckkraft des Eingabefelds im Leerlauf. Bei 0 blendet es mit den Tabs aus; darüber bleibt es teilweise sichtbar."
L["Chat Style"] = "Chat-Stil"
L["Visual style for the chat frame background."] = "Visueller Stil des Chat-Frame-Hintergrunds."
L["Editbox Style"] = "Editbox-Stil"
L["Visual style for the chat input box background."] = "Visueller Stil des Hintergrunds des Chat-Eingabefelds."
L["Dark"] = "Dunkel"
L["DragonUI Style"] = "DragonUI-Stil"
L["Midnight"] = "Mitternacht"

-- Combuctor
L["Enable Combuctor"] = "Combuctor (Kombi-Beutel) aktivieren"
L["All-in-one bag replacement with item filtering, search, quality indicators, and bank integration."] = "Komplett-Taschenersatz mit Gegenstandsfilterung, Suche, Qualitätsindikatoren und Bankintegration."
L["Combuctor Settings"] = "Combuctor (Kombi-Beutel) Einstellungen"

-- Bag Sort
L["Bag Sort"] = "Taschen sortieren"
L["Enable Bag Sort"] = "Taschen sortieren aktivieren"
L["Sort buttons for bags and bank. Sorts items by type, rarity, level, and name."] = "Sortier-Buttons für Taschen und Bank. Sortiert Gegenstände nach Typ, Seltenheit, Stufe und Name."
L["Add sort buttons to bag and bank frames. Also enables /sort and /sortbank slash commands."] = "Fügt Sortier-Buttons zu Taschen- und Bankfenstern hinzu. Aktiviert auch die Befehle /sort und /sortbank."
L["Sort bags and bank items with buttons"] = "Taschen und Bank mit Buttons sortieren"

L["Show 'All' Tab"] = "Registerkarte „Alle“ anzeigen"
L["Show the 'All' category tab that displays all items without filtering."] = "Zeigt die Registerkarte „Alle“ an, auf der alle Elemente ohne Filterung angezeigt werden."
L["Show Equipment Tab"] = "Registerkarte „Ausrüstung“ anzeigen"
L["Show the Equipment category tab for armor and weapons."] = "Zeigt Registerkarte „Ausrüstung“ für Rüstungen und Waffen an."
L["Show Usable Tab"] = "Registerkarte „Verwendbar“ anzeigen"
L["Show the Usable category tab for consumables and devices."] = "Zeigt die Registerkarte „Verwendbare Kategorie“ für Verbrauchsmaterialien und Geräte an."
L["Show Consumable Tab"] = "Registerkarte „Verbrauchsmaterialien“ anzeigen"
L["Show the Consumable category tab."] = "Zeigt die Registerkarte „Verbrauchsmaterialien“ an."
L["Show Quest Tab"] = "Quest-Registerkarte anzeigen"
L["Show the Quest items category tab."] = "Zeigt die Registerkarte „Quest-Gegenstände“ an."
L["Show Trade Goods Tab"] = "Registerkarte „Handelswaren“ anzeigen"
L["Show the Trade Goods category tab (includes gems and recipes)."] = "Zeigt die Registerkarte „Handelswaren“ (enthält Edelsteine und Rezepte)."
L["Show Miscellaneous Tab"] = "Registerkarte „Verschiedenes“ anzeigen"
L["Show the Miscellaneous items category tab."] = "Zeigt die Registerkarte „Verschiedenes“ an."
L["Left Side Tabs"] = "Tabs links"
L["Place category filter tabs on the left side of the bag frame instead of the right."] = "Kategorie-Filter-Tabs auf der linken Seite des Taschenfensters statt rechts platzieren."
L["Place category filter tabs on the left side of the bank frame instead of the right."] = "Platziert die Filterregisterkarten für die Kategorien auf der linken Seite des Bankrahmens statt auf der rechten Seite."
L["Changes require closing and reopening bags to take effect."] = "Änderungen müssen durch Schließen und erneutes Öffnen der Taschen bestätigt werden, um wirksam zu werden."
L["Subtabs"] = "Unterregisterkarten"
L["Configure which bottom subtabs appear within each category tab. Applies to both inventory and bank."] = "Konfiguriert, welche Unterregisterkarten innerhalb jeder Kategorie-Registerkarte angezeigt werden sollen. Gilt sowohl für Lagerbestand als auch für Bank."
L["Normal"] = "Normal"
L["Trade Bags"] = "Handelsbeutel"
L["Show the Normal bags subtab (non-profession bags)."] = "Zeigt die Unterregisterkarte „Normale Taschen“ (Taschen, die nicht für Berufe bestimmt sind)."
L["Show the Trade bags subtab (profession bags)."] = "Zeigt die Unterregisterkarte „Handelsbeutel“ (Berufsbeutel)."
L["Show the Armor subtab."] = "Zeigt die Unterregisterkarte „Rüstung“ an."
L["Show the Weapon subtab."] = "Zeigt die Unterregisterkarte „Waffe“ an."
L["Show the Trinket subtab."] = "Zeige die Unterregisterkarte „Schmuckstücke“ an."
L["Show the Consumable subtab."] = "Zeigt die Unterregisterkarte „Verbrauchsmaterialien“ an."
L["Show the Devices subtab."] = "Zeigt die Unterregisterkarte „Geräte“ an."
L["Show the Trade Goods subtab."] = "Zeigt die Unterregisterkarte „Handelsgüter“ an."
L["Show the Gem subtab."] = "Zeigt die Unterregisterkarte „Edelstein“ an."
L["Show the Recipe subtab."] = "Zeigt die Unterregisterkarte „Rezept“ an."
L["Configure Combuctor bag replacement settings."] = "Einstellungen für den Austausch des Combuctors (Kombi-Beutels) konfigurieren."
L["Category Tabs"] = "Kategorie-Registerkarten"
L["Inventory Tabs"] = "Inventar-Registerkarten"
L["Bank Tabs"] = "Bank-Registerkarten"
L["Inventory"] = "Inventar"
L["Bank"] = "Bank"
L["Choose which category tabs appear on the bag frame. Changes require closing and reopening bags to take effect."] = "Wähle aus, welche Kategorie-Registerkarten auf dem Taschenrahmen angezeigt werden sollen. Änderungen müssen durch Schließen und erneutes Öffnen der Taschen bestätigt werden, um wirksam zu werden."
L["Choose which category tabs appear on the inventory bag frame."] = "Wähle aus, welche Kategorie-Registerkarten auf dem Inventartaschenrahmen angezeigt werden sollen."
L["Choose which category tabs appear on the bank frame."] = "Wähle aus, welche Kategorie-Registerkarten im Bankrahmen angezeigt werden sollen."
L["Display"] = "Bildschirm"

-- Advanced modules - Fallback display names
L["Main Bars"] = "Hauptleisten"
L["Vehicle"] = "Fahrzeug"
L["Multicast"] = "Multicast"
L["Buttons"] = "Buttons"
L["Hide Blizzard Elements"] = "Blizzard-Elemente ausblenden"
L["Buffs"] = "Stärkungen"
L["KeyBinding"] = "Tastenbelegung"
L["Cooldowns"] = "Abklingzeiten"

-- Advanced modules - RegisterModule display names (from module files)
L["Micro Menu"] = "Mikromenü"
L["Loot Roll"] = "Beute würfeln"
L["Key Binding"] = "Tastenbelegung"
L["Item Quality"] = "Gegenstandsqualität"
L["Buff Frame"] = "Stärkungsfenster"
L["Hide Blizzard"] = "Blizzard ausblenden"
L["Tooltip"] = "Tooltip"

-- Advanced modules - RegisterModule descriptions (from module files)
L["Micro menu and bags system styling and positioning"] = "Styling und Positionierung von Mikromenü & Taschen"
L["Quest tracker positioning and styling"] = "Positionierung und Styling der Questverfolgung"
L["Enhanced tooltip styling with class colors and health bars"] = "Erweitertes Tooltip-Styling mit Klassenfarben und Lebensleisten"
L["Hide default Blizzard UI elements"] = "Blizzard-Standard-UI-Elemente ausblenden"
L["Custom minimap styling, positioning, tracking icons and calendar"] = "Eigenes Minimap-Styling, Positionierung, Tracking-Icons und Kalender"
L["Main action bars, status bars, scaling and positioning"] = "Hauptaktionsleisten, Statusleisten, Skalierung und Positionierung"
L["LibKeyBound integration for intuitive keybinding"] = "LibKeyBound-Integration für intuitive Tastenbelegung"
L["Color item borders by quality in bags, character panel, bank, and merchant"] = "Gegenstandsrahmen nach Qualität in Taschen, Charakterfenster, Bank und Händler einfärben"
L["Darken UI borders and chrome"] = "UI-Rahmen und Zierleisten abdunkeln"
L["Action button styling and enhancements"] = "Styling und Verbesserungen für Aktionsbuttons"
L["Custom buff frame styling, positioning and toggle button"] = "Eigenes Styling/Positionierung fürs Stärkungsfenster und Umschalt-Button"
L["Vehicle interface enhancements"] = "Verbesserungen fürs Fahrzeug-Interface"
L["Stance/shapeshift bar positioning and styling"] = "Positionierung und Styling der Haltungs-/Gestaltleiste"
L["Pet action bar positioning and styling"] = "Positionierung und Styling der Begleiteraktionsleiste"
L["Multicast (totem/possess) bar positioning and styling"] = "Positionierung und Styling der Multicast-Leiste (Totems/Besessenheit)"
L["Chat Mods"] = "Chat-Mods"
L["Chat enhancements: hide buttons, editbox position, URL copy, chat copy, link hover, tell target"] = "Chat-Verbesserungen: Schaltflächen ausblenden, Position des Bearbeitungsfelds, URL kopieren, Chat kopieren, Link-Hover, Ziel angeben"
L["Combuctor"] = "Combuctor (Kombi-Beutel)"
L["All-in-one bag replacement with filtering and search"] = "All-in-One-Ersatz für Taschen mit Filter- und Suchfunktion"

-- ============================================================================
-- ACTION BARS TAB
-- ============================================================================

-- Sub-tabs
L["Layout"] = "Layout"
L["Visibility"] = "Sichtbarkeit"

-- Scales section
L["Action Bar Scales"] = "Aktionsleisten-Skalierung"
L["Main Bar Scale"] = "Hauptleiste-Skalierung"
L["Right Bar Scale"] = "Skalierung der rechten Leiste"
L["Left Bar Scale"] = "Skalierung der linken Leiste"
L["Bottom Left Bar Scale"] = "Skalierung der Leiste unten links"
L["Bottom Right Bar Scale"] = "Skalierung der Leiste unten rechts"
L["Scale for main action bar"] = "Skalierung der Hauptaktionsleiste"
L["Scale for right action bar (MultiBarRight)"] = "Skalierung der rechten Aktionsleiste (MultiBarRight)"
L["Scale for left action bar (MultiBarLeft)"] = "Skalierung der linken Aktionsleiste (MultiBarLeft)"
L["Scale for bottom left action bar (MultiBarBottomLeft)"] = "Skalierung der unten linken Aktionsleiste (MultiBarBottomLeft)"
L["Scale for bottom right action bar (MultiBarBottomRight)"] = "Skalierung der unten rechten Aktionsleiste (MultiBarBottomRight)"
L["Reset All Scales"] = "Alle Skalierungen zurücksetzen"
L["Reset all action bar scales to their default values (0.9)"] = "Alle Aktionsleisten-Skalierungen auf Standardwerte (0.9) zurücksetzen"
L["All action bar scales reset to default values (0.9)"] = "Alle Aktionsleisten-Skalierungen auf Standardwerte (0.9) zurückgesetzt"
L["All action bar scales reset to 0.9"] = "Alle Aktionsleisten-Skalierungen auf 0.9 zurückgesetzt"

-- Positions section
L["Action Bar Positions"] = "Aktionsleisten-Positionen"
L["Tip: Use the Move UI Elements button above to reposition action bars with your mouse."] = "Tipp: Nutze oben „UI-Elemente verschieben“, um Aktionsleisten mit der Maus neu zu positionieren."
L["Left Bar Horizontal"] = "Linke Leiste horizontal"
L["Make the left secondary bar horizontal instead of vertical."] = "Linke Nebenleiste horizontal statt vertikal machen."
L["Right Bar Horizontal"] = "Rechte Leiste horizontal"
L["Make the right secondary bar horizontal instead of vertical."] = "Rechte Nebenleiste horizontal statt vertikal machen."

-- Button Appearance section
L["Button Appearance"] = "Button-Aussehen"
L["Main Bar Only Background"] = "Hintergrund nur für Hauptleiste"
L["If checked, only the main action bar buttons will have a background. If unchecked, all action bar buttons will have a background."] = "Wenn aktiviert, haben nur Buttons der Hauptaktionsleiste einen Hintergrund. Wenn deaktiviert, haben alle Aktionsleisten-Buttons einen Hintergrund."
L["Only the main action bar buttons will have a background."] = "Nur Buttons der Hauptaktionsleiste haben einen Hintergrund."
L["Hide Main Bar Background"] = "Hauptleisten-Hintergrund ausblenden"
L["Hide the background texture of the main action bar (makes it completely transparent)"] = "Hintergrundtextur der Hauptaktionsleiste ausblenden (macht sie komplett transparent)"
L["Hide the background texture of the main action bar."] = "Hintergrundtextur der Hauptaktionsleiste ausblenden."

-- Text visibility
L["Text Visibility"] = "Text-Sichtbarkeit"
L["Count Text"] = "Anzahltext"
L["Show Count"] = "Anzahl anzeigen"
L["Show Count Text"] = "Anzahltext anzeigen"
L["Hotkey Text"] = "Hotkey-Text"
L["Show Hotkey"] = "Hotkey anzeigen"
L["Show Hotkey Text"] = "Hotkey-Text anzeigen"
L["Range Indicator"] = "Reichweitenanzeige"
L["Show small range indicator point on buttons"] = "Kleinen Reichweitenpunkt auf Buttons anzeigen"
L["Show range indicator dot on buttons."] = "Reichweitenpunkt auf Buttons anzeigen."
L["Macro Text"] = "Makrotext"
L["Show Macro Names"] = "Makronamen anzeigen"
L["Page Numbers"] = "Seitennummern"
L["Show Pages"] = "Seiten anzeigen"
L["Show Page Numbers"] = "Seitennummern anzeigen"

-- Cooldown text
L["Cooldown Text"] = "Abklingzeit-Text"
L["Min Duration"] = "Mindestdauer"
L["Minimum duration for text triggering"] = "Mindestdauer zum Einblenden des Textes"
L["Minimum duration for cooldown text to appear."] = "Mindestdauer, damit Abklingzeit-Text erscheint."
L["Text Color"] = "Textfarbe"
L["Cooldown Text Color"] = "Abklingzeit-Textfarbe"
L["Size of cooldown text."] = "Größe des Abklingzeit-Textes."

-- Colors
L["Colors"] = "Farben"
L["Macro Text Color"] = "Makrotext-Farbe"
L["Color for macro text"] = "Farbe für Makrotext"
L["Hotkey Shadow Color"] = "Hotkey-Schattenfarbe"
L["Shadow color for hotkey text"] = "Schattenfarbe für Hotkey-Text"
L["Border Color"] = "Rahmenfarbe"
L["Border color for buttons"] = "Rahmenfarbe für Buttons"

-- Gryphons
L["Gryphons"] = "Greifen"
L["Gryphon Style"] = "Greifen-Stil"
L["Display style for the action bar end-cap gryphons."] = "Anzeigestil für die Greifen an den Endkappen der Aktionsleiste."
L["End-cap ornaments flanking the main action bar."] = "Endkappen-Ornamente links/rechts der Hauptaktionsleiste."
L["Gryphon previews are hidden while D3D9Ex is active to avoid client crashes."] = "Greifen-Vorschauen werden ausgeblendet, solange D3D9Ex aktiv ist, um Client-Abstürze zu vermeiden."
L["Style"] = "Stil"
L["Old"] = "Alt"
L["New"] = "Neu"
L["Flying"] = "Fliegend"
L["Hide Gryphons"] = "Greifen ausblenden"
L["Classic"] = "Klassisch"
L["Dragonflight"] = "Dragonflight"
L["Hidden"] = "Ausgeblendet"
L["Dragonflight (Wyvern)"] = "Dragonflight (Wyvern)"
L["Dragonflight (Gryphon)"] = "Dragonflight (Greif)"

-- Layout section
L["Main Bar Layout"] = "Layout Hauptleiste"
L["Bottom Left Bar Layout"] = "Layout unten links"
L["Bottom Right Bar Layout"] = "Layout unten rechts"
L["Right Bar Layout"] = "Layout rechte Leiste"
L["Left Bar Layout"] = "Layout linke Leiste"
L["Configure the main action bar grid layout. Rows are determined automatically from columns and buttons shown."] = "Rasterlayout der Hauptaktionsleiste konfigurieren. Reihen werden automatisch aus Spalten und angezeigten Buttons bestimmt."
L["Columns"] = "Spalten"
L["Buttons Shown"] = "Angezeigte Buttons"
L["Quick Presets"] = "Schnell-Presets"
L["Apply layout presets to multiple bars at once."] = "Layout-Presets auf mehrere Leisten gleichzeitig anwenden."
L["Both 1x12"] = "Beide 1x12"
L["Both 2x6"] = "Beide 2x6"
L["Reset All"] = "Alles zurücksetzen"
L["All bar layouts reset to defaults."] = "Alle Leisten-Layouts auf Standard zurückgesetzt."

-- Visibility section
L["Bar Visibility"] = "Leisten-Sichtbarkeit"
L["Control when action bars are visible. Bars can show only on hover, only in combat, or both. When no option is checked the bar is always visible."] = "Steuert, wann Aktionsleisten sichtbar sind. Leisten können nur beim Darüberfahren, nur im Kampf oder beides angezeigt werden. Wenn keine Option aktiv ist, sind Leisten immer sichtbar."
L["Enable / Disable Bars"] = "Leisten aktivieren/deaktivieren"
L["Bottom Left Bar"] = "Unten links"
L["Bottom Right Bar"] = "Unten rechts"
L["Right Bar"] = "Rechte Leiste"
L["Left Bar"] = "Linke Leiste"
L["Main Bar"] = "Hauptleiste"
L["Show on Hover Only"] = "Nur beim Darüberfahren anzeigen"
L["Show in Combat Only"] = "Nur im Kampf anzeigen"
L["Hide the main bar until you hover over it."] = "Hauptleiste ausblenden, bis du darüberfährst."
L["Hide the main bar until you enter combat."] = "Hauptleiste ausblenden, bis du in den Kampf gehst."

-- ============================================================================
-- ADDITIONAL BARS TAB
-- ============================================================================

L["Bars that appear based on your class and situation."] = "Leisten, die je nach Klasse und Situation erscheinen."
L["Specialized bars that appear when needed (stance/pet/vehicle/totems)"] = "Spezialleisten, die bei Bedarf erscheinen (Haltung/Begleiter/Fahrzeug/Totems)"
L["Auto-show bars: Stance (Warriors/Druids/DKs) • Pet (Hunters/Warlocks/DKs) • Vehicle (All classes) • Totem (Shamans)"] = "Auto-Leisten: Haltung (Krieger/Druiden/Todesritter) • Begleiter (Jäger/Hexenmeister/Todesritter) • Fahrzeug (alle Klassen) • Totem (Schamanen)"

-- Common settings
L["Common Settings"] = "Allgemeine Einstellungen"
L["Button Size"] = "Button-Größe"
L["Size of buttons for all additional bars"] = "Größe der Buttons für alle zusätzlichen Leisten"
L["Button Spacing"] = "Button-Abstand"
L["Space between buttons for all additional bars"] = "Abstand zwischen Buttons für alle zusätzlichen Leisten"

-- Stance Bar
L["Stance Bar"] = "Haltungsleiste"
L["Warriors, Druids, Death Knights"] = "Krieger, Druiden, Todesritter"
L["X Position"] = "X-Position"
L["Y Position"] = "Y-Position"
L["Y Offset"] = "Y-Versatz"
L["Horizontal position of stance bar from screen center. Negative values move left, positive values move right."] = "Horizontale Position der Haltungsleiste relativ zur Bildschirmmitte. Negative Werte nach links, positive nach rechts."

-- Pet Bar
L["Pet Bar"] = "Begleiterleiste"
L["Hunters, Warlocks, Death Knights - Use editor mode to move"] = "Jäger, Hexenmeister, Todesritter – zum Verschieben Editor-Modus nutzen"
L["Show Empty Slots"] = "Leere Plätze anzeigen"
L["Display empty action slots on pet bar"] = "Leere Aktionsplätze auf der Begleiterleiste anzeigen"

-- Vehicle Bar
L["Vehicle Bar"] = "Fahrzeugleiste"
L["All classes (vehicles/special mounts)"] = "Alle Klassen (Fahrzeuge/spezielle Reittiere)"
L["Custom Art Style"] = "Eigener Art-Stil"
L["Use custom vehicle bar art style with health/power bars and themed skin. Requires UI reload to apply."] = "Eigenen Fahrzeugleisten-Artstil mit Lebens-/Ressourcenleisten und thematischem Skin verwenden. Erfordert UI-Neuladen."
L["Blizzard Art Style"] = "Blizzard-Art-Stil"
L["Use Blizzard vehicle bar art with health/power display. Requires reload."] = "Blizzard-Fahrzeugleisten-Stil mit Lebens-/Ressourcenanzeige verwenden. Erfordert Neuladen."

-- Totem Bar
L["Totem Bar"] = "Totemleiste"
L["Totem Bar (Shaman)"] = "Totemleiste (Schamane)"
L["Shamans only - Totem multicast bar. Position is controlled via Editor Mode."] = "Nur Schamanen – Totem-Multicast-Leiste. Position wird über den Editor-Modus gesteuert."
L["TIP: Use Editor Mode to position the totem bar (type /dragonui edit)."] = "TIPP: Nutze den Editor-Modus, um die Totemleiste zu positionieren (Befehl: /dragonui edit)."

-- ============================================================================
-- CAST BARS TAB
-- ============================================================================

L["Player Castbar"] = "Spieler-Zauberleisten"
L["Target Castbar"] = "Ziel-Zauberleiste"
L["Focus Castbar"] = "Fokus-Zauberleiste"

-- Sub-tabs
L["Player"] = "Spieler"
L["Target"] = "Ziel"
L["Focus"] = "Fokus"

-- Common options
L["Width"] = "Breite"
L["Width of the cast bar"] = "Breite der Zauberleiste"
L["Height"] = "Höhe"
L["Height of the cast bar"] = "Höhe der Zauberleiste"
L["Scale"] = "Skalierung"
L["Size scale of the cast bar"] = "Größenskalierung der Zauberleiste"
L["Show Icon"] = "Icon anzeigen"
L["Show the spell icon next to the cast bar"] = "Zauber-Icon neben der Zauberleiste anzeigen"
L["Show Spell Icon"] = "Zauber-Icon anzeigen"
L["Show the spell icon next to the target castbar"] = "Zauber-Icon neben der Ziel-Zauberleiste anzeigen"
L["Icon Size"] = "Icon-Größe"
L["Size of the spell icon"] = "Größe des Zauber-Icons"
L["Text Mode"] = "Textmodus"
L["Choose how to display spell text: Simple (centered spell name only) or Detailed (spell name + time)"] = "Wähle, wie Zaubertext angezeigt wird: Einfach (nur zentrierter Zaubername) oder Detailliert (Zaubername + Zeit)"
L["Simple (Centered Name Only)"] = "Einfach (nur zentrierter Name)"
L["Simple (Name Only)"] = "Einfach (nur Name)"
L["Simple"] = "Einfach"
L["Detailed (Name + Time)"] = "Detailliert (Name + Zeit)"
L["Detailed"] = "Detailliert"
L["Time Precision"] = "Zeitgenauigkeit"
L["Decimal places for remaining time."] = "Dezimalstellen für Restzeit."
L["Max Time Precision"] = "Max. Zeitgenauigkeit"
L["Decimal places for total time."] = "Dezimalstellen für Gesamtzeit."
L["Hold Time (Success)"] = "Haltezeit (Erfolg)"
L["How long the bar stays visible after a successful cast."] = "Wie lange die Leiste nach einem erfolgreichen Zauber sichtbar bleibt."
L["How long the bar stays after a successful cast."] = "Wie lange die Leiste nach einem erfolgreichen Zauber bleibt."
L["How long to show the castbar after successful completion"] = "Wie lange die Zauberleiste nach erfolgreichem Abschluss angezeigt wird"
L["Hold Time (Interrupt)"] = "Haltezeit (Unterbrechung)"
L["How long the bar stays visible after being interrupted."] = "Wie lange die Leiste nach einer Unterbrechung sichtbar bleibt."
L["How long the bar stays after being interrupted."] = "Wie lange die Leiste nach einer Unterbrechung bleibt."
L["How long to show the castbar after interruption/failure"] = "Wie lange die Zauberleiste nach Unterbrechung/Fehlschlag angezeigt wird"
L["Auto-Adjust for Auras"] = "Auto-Anpassung für Auren"
L["Automatically adjust position based on target auras (CRITICAL FEATURE)"] = "Position automatisch anhand der Ziel-Auren anpassen (KRITISCHE FUNKTION)"
L["Shift castbar when buff/debuff rows are showing."] = "Zauberleiste verschieben, wenn Buff-/Debuff-Reihen angezeigt werden."
L["Automatically adjust position based on focus auras"] = "Position automatisch anhand der Fokus-Auren anpassen"
L["Reset Position"] = "Position zurücksetzen"
L["Resets the X and Y position to default."] = "Setzt X- und Y-Position auf Standard zurück."
L["Reset target castbar position to default"] = "Ziel-Zauberleiste-Position auf Standard zurücksetzen"
L["Reset focus castbar position to default"] = "Fokus-Zauberleiste-Position auf Standard zurücksetzen"
L["Player castbar position reset."] = "Spieler-Zauberleiste-Position zurückgesetzt."
L["Target castbar position reset."] = "Ziel-Zauberleiste-Position zurückgesetzt."
L["Focus castbar position reset."] = "Fokus-Zauberleiste-Position zurückgesetzt."
L["Castbar detached - positioned freely via Editor Mode"] = "Zauberleiste geloest - frei im Editor-Modus positioniert"
L["Castbar attached - follows Target frame"] = "Zauberleiste angeheftet - folgt dem Zielrahmen"
L["Castbar attached - follows Focus frame"] = "Zauberleiste angeheftet - folgt dem Fokusrahmen"
L["Re-attach Castbar to Target"] = "Zauberleiste wieder an Zielrahmen anheften"
L["Re-attach Castbar to Focus"] = "Zauberleiste wieder an Fokusrahmen anheften"

-- Width/height descriptions for target/focus
L["Width of the target castbar"] = "Breite der Ziel-Zauberleiste"
L["Height of the target castbar"] = "Höhe der Ziel-Zauberleiste"
L["Scale of the target castbar"] = "Skalierung der Ziel-Zauberleiste"
L["Width of the focus castbar"] = "Breite der Fokus-Zauberleiste"
L["Height of the focus castbar"] = "Höhe der Fokus-Zauberleiste"
L["Scale of the focus castbar"] = "Skalierung der Fokus-Zauberleiste"
L["Show the spell icon next to the focus castbar"] = "Zauber-Icon neben der Fokus-Zauberleiste anzeigen"
L["Time to show the castbar after successful cast completion"] = "Anzeigezeit nach erfolgreichem Zauberabschluss"
L["Time to show the castbar after cast interruption"] = "Anzeigezeit nach Zauberunterbrechung"

-- Latency indicator (player only)
L["Latency Indicator"] = "Latenzindikator"
L["Enable Latency Indicator"] = "Latenzindikator aktivieren"
L["Show a safe-zone overlay based on real cast latency."] = "Zeigt eine sichere Zone basierend auf der realen Zauberlatenz."
L["Latency Color"] = "Latenzfarbe"
L["Latency Alpha"] = "Latenz-Deckkraft"
L["Opacity of the latency indicator."] = "Deckkraft des Latenzindikators."

-- ============================================================================
-- ENHANCEMENTS TAB
-- ============================================================================

L["Enhancements"] = "Verbesserungen"
L["Visual enhancements that add Dragonflight-style polish to the UI. These are optional — disable any you don't want."] = "Visuelle Verbesserungen, die der UI den Dragonflight-Feinschliff geben. Optional — deaktiviere, was du nicht willst."

-- (Dark Mode, Range Indicator, Item Quality, Tooltips defined above in MODULES section)

-- ============================================================================
-- MICRO MENU TAB
-- ============================================================================

L["Gray Scale Icons"] = "Graustufen-Icons"
L["Grayscale Icons"] = "Graustufen-Icons"
L["Use grayscale icons instead of colored icons for the micro menu"] = "Graustufen-Icons statt farbiger Icons im Mikromenü verwenden"
L["Use grayscale icons instead of colored icons."] = "Graustufen-Icons statt farbiger Icons verwenden."
L["Grayscale Icons Settings"] = "Einstellungen: Graustufen-Icons"
L["Normal Icons Settings"] = "Einstellungen: Normale Icons"
L["Menu Scale"] = "Menü-Skalierung"
L["Icon Spacing"] = "Icon-Abstand"
L["Hide on Vehicle"] = "Im Fahrzeug ausblenden"
L["Hide micromenu and bags if you sit on vehicle"] = "Mikromenü und Taschen ausblenden, wenn du in einem Fahrzeug sitzt"
L["Hide micromenu and bags while in a vehicle."] = "Mikromenü und Taschen im Fahrzeug ausblenden."
L["Show Latency Indicator"] = "Latenzindikator anzeigen"
L["Show a colored bar below the Help button indicating connection quality (green/yellow/red). Requires UI reload."] = "Farbigen Balken unter dem Hilfe-Button anzeigen, der die Verbindungsqualität zeigt (grün/gelb/rot). Erfordert UI-Neuladen."

-- Bags
L["Bags"] = "Taschen"
L["Configure the position and scale of the bag bar independently from the micro menu."] = "Position und Skalierung der Taschenleiste unabhängig vom Mikromenü konfigurieren."
L["Bag Bar Scale"] = "Skalierung Taschenleiste"

-- XP & Rep Bars
L["XP & Rep Bars (Legacy Offsets)"] = "EP- & Rufleisten (Legacy-Versatz)"
L["Main XP & Rep bar options have moved to the XP & Rep Bars tab."] = "Die Hauptoptionen für EP- & Rufleisten sind in den Tab „EP- & Rufleisten“ umgezogen."
L["These offset options are for advanced positioning adjustments."] = "Diese Versatz-Optionen sind für erweiterte Positionsanpassungen."
L["Both Bars Offset"] = "Versatz beider Leisten"
L["Y offset when XP & reputation bar are shown"] = "Y-Versatz, wenn EP- & Rufleiste angezeigt werden"
L["Single Bar Offset"] = "Versatz einzelner Leiste"
L["Y offset when XP or reputation bar is shown"] = "Y-Versatz, wenn EP- oder Rufleiste angezeigt wird"
L["No Bar Offset"] = "Kein Leisten-Versatz"
L["Y offset when no XP or reputation bar is shown"] = "Y-Versatz, wenn keine EP- oder Rufleiste angezeigt wird"
L["Rep Bar Above XP Offset"] = "Versatz Rufleiste über EP"
L["Y offset for reputation bar when XP bar is shown"] = "Y-Versatz der Rufleiste, wenn die EP-Leiste angezeigt wird"
L["Rep Bar Offset"] = "Versatz Rufleiste"
L["Y offset when XP bar is not shown"] = "Y-Versatz, wenn die EP-Leiste nicht angezeigt wird"

-- ============================================================================
-- MINIMAP TAB
-- ============================================================================

L["Basic Settings"] = "Grundeinstellungen"
L["Border Alpha"] = "Rahmen-Alpha"
L["Top border alpha (0 to hide)."] = "Alpha der oberen Leiste (0 zum Ausblenden)."
L["Addon Button Skin"] = "Addon-Button-Skin"
L["Apply DragonUI border styling to addon icons (e.g., bag addons)"] = "DragonUI-Rahmenstil auf Addon-Icons anwenden (z. B. Taschen-Addons)"
L["Apply DragonUI border styling to addon icons."] = "DragonUI-Rahmenstil auf Addon-Icons anwenden."
L["Addon Button Fade"] = "Addon-Button-Ausblenden"
L["Addon icons fade out when not hovered."] = "Addon-Icons ausblenden, wenn nicht darübergefahren wird."
L["Player Arrow Size"] = "Spielerpfeil-Größe"
L["Size of the player arrow on the minimap"] = "Größe des Spielerpfeils auf der Minikarte"
L["New Blip Style"] = "Neuer Blip-Stil"
L["Use new DragonUI object icons on the minimap. When disabled, uses classic Blizzard icons."] = "Neue DragonUI-Objekticons auf der Minikarte verwenden. Wenn deaktiviert, werden klassische Blizzard-Icons genutzt."
L["Use newer-style minimap blip icons."] = "Minimap-Blip-Icons im neueren Stil verwenden."

-- Time & Calendar
L["Time & Calendar"] = "Uhrzeit & Kalender"
L["Show Clock"] = "Uhr anzeigen"
L["Show/hide the minimap clock"] = "Minimap-Uhr ein-/ausblenden"
L["Show Calendar"] = "Kalender anzeigen"
L["Show/hide the calendar frame"] = "Kalenderfenster ein-/ausblenden"
L["Clock Font Size"] = "Uhr-Schriftgröße"
L["Font size for the clock numbers on the minimap"] = "Schriftgröße der Uhrzahlen auf der Minikarte"

-- Display Settings
L["Display Settings"] = "Anzeigeeinstellungen"
L["Tracking Icons"] = "Tracking-Icons"
L["Show current tracking icons (old style)."] = "Aktuelle Tracking-Icons anzeigen (alter Stil)."
L["Zoom Buttons"] = "Zoom-Buttons"
L["Show zoom buttons (+/-)."] = "Zoom-Buttons anzeigen (+/-)."
L["Zone Text Size"] = "Zonentext-Größe"
L["Zone Text Font Size"] = "Zonentext-Schriftgröße"
L["Zone text font size on top border"] = "Schriftgröße des Zonentextes in der oberen Leiste"
L["Font size of the zone text above the minimap."] = "Schriftgröße des Zonentextes über der Minikarte."

-- Position
L["Position"] = "Position"
L["Reset minimap to default position (top-right corner)"] = "Minikarte auf Standardposition zurücksetzen (oben rechts)"
L["Reset Minimap Position"] = "Minikarten-Position zurücksetzen"
L["Minimap position reset to default"] = "Minikarten-Position auf Standard zurückgesetzt"
L["Minimap position reset."] = "Minikarten-Position zurückgesetzt."

-- ============================================================================
-- QUEST TRACKER TAB
-- ============================================================================

L["Configures the quest objective tracker position and behavior."] = "Konfiguriert Position und Verhalten der Questziel-Verfolgung."
L["Position and display settings for the objective tracker."] = "Positions- und Anzeigeeinstellungen für die Questziel-Verfolgung."
L["Show Header Background"] = "Header-Hintergrund anzeigen"
L["Show/hide the decorative header background texture."] = "Dekorative Header-Hintergrundtextur ein-/ausblenden."
L["Anchor Point"] = "Ankerpunkt"
L["Screen anchor point for the quest tracker."] = "Bildschirm-Ankerpunkt für die Questverfolgung."
L["Top Right"] = "Oben rechts"
L["Top Left"] = "Oben links"
L["Bottom Right"] = "Unten rechts"
L["Bottom Left"] = "Unten links"
L["Center"] = "Mitte"
L["Horizontal position offset"] = "Horizontaler Positionsversatz"
L["Vertical position offset"] = "Vertikaler Positionsversatz"
L["Reset quest tracker to default position"] = "Questverfolgung auf Standardposition zurücksetzen"
L["Font Size"] = "Schriftgröße"
L["Font size for quest tracker text"] = "Schriftgröße für den Text der Questverfolgung"

-- ============================================================================
-- UNIT FRAMES TAB
-- ============================================================================

-- Sub-tabs
L["Pet"] = "Begleiter"
L["ToT / ToF"] = "ZdZ / ZdF"
L["Party"] = "Gruppe"

-- Common options
L["Global Scale"] = "Globale Skalierung"
L["Global scale for all unit frames"] = "Globale Skalierung für alle Einheitenfenster"
L["Scale of the player frame"] = "Skalierung des Spielerfensters"
L["Scale of the target frame"] = "Skalierung des Zielfensters"
L["Scale of the focus frame"] = "Skalierung des Fokusfensters"
L["Scale of the pet frame"] = "Skalierung des Begleiterfensters"
L["Scale of the target of target frame"] = "Skalierung des Ziel-des-Ziels-Fensters"
L["Scale of the focus of target frame"] = "Skalierung des Ziel-des-Fokus-Fensters"
L["Scale of party frames"] = "Skalierung der Gruppenfenster"
L["Class Color"] = "Klassenfarbe"
L["Class Color Health"] = "Leben nach Klassenfarbe"
L["Use class color for health bar"] = "Klassenfarbe für Lebensleiste verwenden"
L["Use class color for health bars in party frames"] = "Klassenfarbe für Lebensleisten in Gruppenfenstern verwenden"
L["Class Portrait"] = "Klassenporträt"
L["Show class icon instead of 3D portrait"] = "Klassenicon statt 3D-Porträt anzeigen"
L["Show class icon instead of 3D portrait (only for players)"] = "Klassenicon statt 3D-Porträt anzeigen (nur Spieler)"
L["Class icon instead of 3D model for players."] = "Klassenicon statt 3D-Modell bei Spielern."
L["Alternative Class Icons"] = "Alternative Klassenicons"
L["Use DragonUI alternative class icons instead of Blizzard's class icon atlas."] = "DragonUI-Klassenicons anstelle des Blizzard-Klassenicon-Atlas verwenden."
L["Large Numbers"] = "Große Zahlen"
L["Format Large Numbers"] = "Große Zahlen formatieren"
L["Format large numbers (1k, 1m)"] = "Große Zahlen formatieren (1k, 1m)"
L["Text Format"] = "Textformat"
L["How to display health and mana values"] = "Wie Lebens- und Manawerte angezeigt werden"
L["Choose how to display health and mana text"] = "Wähle, wie Lebens- und Manatext angezeigt wird"

-- Text format values
L["Current Value Only"] = "Nur aktueller Wert"
L["Current Value"] = "Aktueller Wert"
L["Percentage Only"] = "Nur Prozent"
L["Percentage"] = "Prozent"
L["Both (Numbers + Percentage)"] = "Beides (Zahlen + Prozent)"
L["Numbers + %"] = "Zahlen + %"
L["Current/Max Values"] = "Aktuell/Max"
L["Current / Max"] = "Aktuell / Max"

-- Party text format values
L["Current Value Only (2345)"] = "Nur aktueller Wert (2345)"
L["Formatted Current (2.3k)"] = "Formatiert aktuell (2.3k)"
L["Percentage Only (75%)"] = "Nur Prozent (75%)"
L["Percentage + Current (75% | 2.3k)"] = "Prozent + Aktuell (75% | 2.3k)"

-- Health/Mana text
L["Always Show Health Text"] = "Lebens-Text immer anzeigen"
L["Show health text always (true) or only on hover (false)"] = "Lebens-Text immer anzeigen (true) oder nur beim Darüberfahren (false)"
L["Always show health text on party frames (instead of only on hover)"] = "Lebens-Text in Gruppenfenstern immer anzeigen (statt nur beim Darüberfahren)"
L["Always display health text (otherwise only on mouseover)"] = "Lebens-Text immer anzeigen (sonst nur bei Mouseover)"
L["Always Show Mana Text"] = "Mana-Text immer anzeigen"
L["Show mana/power text always (true) or only on hover (false)"] = "Mana-/Ressourcen-Text immer anzeigen (true) oder nur beim Darüberfahren (false)"
L["Always show mana text on party frames (instead of only on hover)"] = "Mana-Text in Gruppenfenstern immer anzeigen (statt nur beim Darüberfahren)"
L["Always display mana/energy/rage text (otherwise only on mouseover)"] = "Mana-/Energie-/Wut-Text immer anzeigen (sonst nur bei Mouseover)"

-- Player frame specific
L["Player Frame"] = "Spielerfenster"
L["Dragon Decoration"] = "Drachendekoration"
L["Add decorative dragon to your player frame for a premium look"] = "Dekorativen Drachen am Spielerfenster hinzufügen (Premium-Look)"
L["None"] = "Keine"
L["Elite Dragon (Golden)"] = "Elite-Drache (golden)"
L["Elite (Golden)"] = "Elite (golden)"
L["RareElite Dragon (Winged)"] = "Selten-Elite-Drache (geflügelt)"
L["RareElite (Winged)"] = "Selten-Elite (geflügelt)"
L["Glow Effects"] = "Leuchteffekte"
L["Show Rest Glow"] = "Ruhen-Leuchten anzeigen"
L["Show a golden glow around the player frame when resting (in an inn or city). Works with all frame modes: normal, elite, fat health bar, and vehicle."] = "Goldenes Leuchten um das Spielerfenster anzeigen, wenn du ruhst (in Gasthaus oder Stadt). Funktioniert mit allen Modi: normal, elite, breite Lebensleiste und Fahrzeug."
L["Golden glow around the player frame when resting (inn or city). Works with all frame modes."] = "Goldenes Leuchten um das Spielerfenster beim Ruhen (Gasthaus oder Stadt). Funktioniert mit allen Fenster-Modi."
L["Combat Flash"] = "Kampfblitz"
L["Show Combat Flash"] = "Kampfblitz anzeigen"
L["Pulsing glow effect when entering combat. Works with all frame modes."] = "Pulsierender Leuchteffekt beim Betreten des Kampfes. Funktioniert mit allen Fenster-Modi."
L["Combat Flash Opacity"] = "Kampfblitz-Deckkraft"
L["Maximum opacity of the combat flash pulse effect."] = "Maximale Deckkraft des Kampfblitz-Pulseffekts."
L["Always Show Alternate Mana Text"] = "Alternativen Mana-Text immer anzeigen"
L["Show mana text always visible (default: hover only)"] = "Mana-Text immer sichtbar anzeigen (Standard: nur beim Darüberfahren)"
L["Alternate Mana (Druid)"] = "Alternatives Mana (Druide)"
L["Always Show"] = "Immer anzeigen"
L["Druid mana text visible at all times, not just on hover."] = "Druiden-Mana-Text immer sichtbar, nicht nur beim Darüberfahren."
L["Alternate Mana Text Format"] = "Format alternativer Mana-Text"
L["Choose text format for alternate mana display"] = "Textformat für die Anzeige des alternativen Manas wählen"
L["Percentage + Current/Max"] = "Prozent + Aktuell/Max"

-- Fat Health Bar
L["Health Bar Style"] = "Lebensleisten-Stil"
L["Fat Health Bar"] = "Breite Lebensleiste"
L["Enable"] = "Aktivieren"
L["Full-width health bar that fills the entire frame area. Uses modified border texture that removes the inner divider line. Compatible with Dragon Decoration (requires fat variant textures). Note: Automatically disabled during vehicle UI."] = "Lebensleiste in voller Breite, die den gesamten Fensterbereich füllt. Verwendet eine angepasste Rahmen-Textur ohne innere Trennlinie. Kompatibel mit Drachendekoration (benötigt breite Variant-Texturen). Hinweis: Wird automatisch im Fahrzeug-UI deaktiviert."
L["Full-width health bar. Auto-disabled in vehicles."] = "Lebensleiste in voller Breite. Im Fahrzeug automatisch deaktiviert."
L["Hide Mana Bar (Fat Mode)"] = "Mana-Leiste ausblenden (Breitmodus)"
L["Hide Mana Bar"] = "Mana-Leiste ausblenden"
L["Completely hide the mana bar when Fat Health Bar is active."] = "Mana-Leiste vollständig ausblenden, wenn die breite Lebensleiste aktiv ist."
L["Mana Bar Width (Fat Mode)"] = "Mana-Leistenbreite (Breitmodus)"
L["Mana Bar Width"] = "Mana-Leistenbreite"
L["Width of the mana bar when Fat Health Bar is active. Movable via Editor Mode."] = "Breite der Mana-Leiste, wenn die breite Lebensleiste aktiv ist. Verschiebbar über Editor-Modus."
L["Mana Bar Height (Fat Mode)"] = "Mana-Leistenhöhe (Breitmodus)"
L["Mana Bar Height"] = "Mana-Leistenhöhe"
L["Height of the mana bar when Fat Health Bar is active."] = "Höhe der Mana-Leiste, wenn die breite Lebensleiste aktiv ist."
L["Mana Bar Texture"] = "Mana-Leistentextur"
L["Choose the texture style for the power/mana bar. Only applies in Fat Health Bar mode."] = "Texturstil für Ressourcen-/Mana-Leiste wählen. Gilt nur im Breitmodus."
L["DragonUI (Default)"] = "DragonUI (Standard)"
L["Blizzard Classic"] = "Blizzard Classic"
L["Flat Solid"] = "Flach (einfarbig)"
L["Smooth"] = "Glatt"
L["Aluminium"] = "Aluminium"
L["LiteStep"] = "LiteStep"

-- Power Bar Colors
L["Power Bar Colors"] = "Ressourcenleisten-Farben"
L["Mana"] = "Mana"
L["Rage"] = "Wut"
L["Energy"] = "Energie"
-- L["Focus"] = true  -- Already defined above
L["Runic Power"] = "Runenmacht"
L["Happiness"] = "Zufriedenheit"
L["Runes"] = "Runen"
L["Reset Colors to Default"] = "Farben auf Standard zurücksetzen"

-- Target frame
L["Target Frame"] = "Zielfenster"
L["Threat Glow"] = "Bedrohungs-Glühen"
L["Show threat glow effect"] = "Bedrohungs-Leuchteffekt anzeigen"
L["Show Name Background"] = "Namenshintergrund anzeigen"
L["Show the colored name background behind the target name."] = "Zeigt den farbigen Hintergrund hinter dem Zielnamen an."

-- Focus frame
L["Focus Frame"] = "Fokusfenster"
L["Show the colored name background behind the focus name."] = "Zeigt den farbigen Hintergrund hinter dem Fokusnamen an."
L["Show Buff/Debuff on Focus"] = "Buffs/Debuffs beim Fokus anzeigen"
L["Uses the native large focus frame mode to show buffs and debuffs on the focus frame."] = "Verwendet den nativen großen Fokusfenster-Modus, um Buffs und Debuffs am Fokusfenster anzuzeigen."
L["Override Position"] = "Position überschreiben"
L["Override default positioning"] = "Standardpositionierung überschreiben"
L["Move the pet frame independently from the player frame."] = "Begleiterfenster unabhängig vom Spielerfenster bewegen."

-- Pet frame
L["Pet Frame"] = "Begleiterfenster"
L["Allows the pet frame to be moved freely. When unchecked, it will be positioned relative to the player frame."] = "Erlaubt, das Begleiterfenster frei zu bewegen. Wenn deaktiviert, wird es relativ zum Spielerfenster positioniert."
L["Horizontal position (only active if Override is checked)"] = "Horizontale Position (nur aktiv, wenn Überschreiben aktiviert ist)"
L["Vertical position (only active if Override is checked)"] = "Vertikale Position (nur aktiv, wenn Überschreiben aktiviert ist)"

-- Target of Target
L["Target of Target"] = "Ziel des Ziels"
L["Follows the Target frame by default. Move it in Editor Mode (/dragonui edit) to detach and position freely."] = "Folgt standardmäßig dem Zielfenster. Im Editor-Modus (/dragonui edit) bewegen, um es zu lösen und frei zu positionieren."
L["Detached — positioned freely via Editor Mode"] = "Gelöst — frei positioniert via Editor-Modus"
L["Attached — follows Target frame"] = "Angeheftet — folgt dem Zielfenster"
L["Re-attach to Target"] = "Wieder ans Ziel anheften"

-- Target of Focus
L["Target of Focus"] = "Ziel des Fokus"
L["Follows the Focus frame by default. Move it in Editor Mode (/dragonui edit) to detach and position freely."] = "Folgt standardmäßig dem Fokusfenster. Im Editor-Modus (/dragonui edit) bewegen, um es zu lösen und frei zu positionieren."
L["Attached — follows Focus frame"] = "Angeheftet — folgt dem Fokusfenster"
L["Re-attach to Focus"] = "Wieder an den Fokus anheften"

-- Party Frames
L["Party Frames"] = "Gruppenfenster"
L["Party Frames Configuration"] = "Gruppenfenster-Konfiguration"
L["Custom styling for party member frames with automatic health/mana text display and class colors."] = "Eigenes Styling für Gruppenmitgliederfenster mit automatischer Lebens-/Mana-Textanzeige und Klassenfarben."

-- Boss Frames
L["Boss Frames"] = "Boss-Rahmen"
L["Enabled"] = "Aktiviert"

L["Orientation"] = "Ausrichtung"
L["Vertical"] = "Vertikal"
L["Horizontal"] = "Horizontal"
L["Party frame orientation"] = "Ausrichtung der Gruppenfenster"
L["Vertical Padding"] = "Vertikaler Abstand"
L["Space between party frames in vertical mode."] = "Abstand zwischen Gruppenfenstern im vertikalen Modus."
L["Horizontal Padding"] = "Horizontaler Abstand"
L["Space between party frames in horizontal mode."] = "Abstand zwischen Gruppenfenstern im horizontalen Modus."

-- ============================================================================
-- XP & REP BARS TAB
-- ============================================================================

L["Bar Style"] = "Leistenstil"
L["XP / Rep Bar Style"] = "EP-/Rufleisten-Stil"
L["DragonflightUI: fully custom bars with rested XP background.\nRetailUI: atlas-based reskin of Blizzard bars.\n\nChanging style requires a UI reload."] = "DragonflightUI: vollständig eigene Leisten mit Ruh-EP-Hintergrund.\nRetailUI: atlasbasierter Reskin der Blizzard-Leisten.\n\nStilwechsel erfordert ein UI-Neuladen."
L["DragonflightUI"] = "DragonflightUI"
L["RetailUI"] = "RetailUI"
L["XP bar style changed to "] = "EP-Leistenstil geändert zu "
L["A UI reload is required to apply this change."] = "Ein UI-Neuladen ist erforderlich, um diese Änderung anzuwenden."

-- Size & Scale
L["Size & Scale"] = "Größe & Skalierung"
L["Bar Height"] = "Leistenhöhe"
L["Height of the XP and Reputation bars (in pixels)."] = "Höhe der EP- und Rufleisten (in Pixel)."
L["Experience Bar Scale"] = "Skalierung EP-Leiste"
L["Scale of the experience bar."] = "Skalierung der EP-Leiste."
L["Reputation Bar Scale"] = "Rufleisten-Skalierung"
L["Scale of the reputation bar."] = "Skalierung der Rufleiste."

-- Rested XP
L["Rested XP"] = "Ruhe-EP"
L["Show Rested XP Background"] = "Ruhe-EP-Hintergrund anzeigen"
L["Display a translucent bar showing the total available rested XP range.\n(DragonflightUI style only)"] = "Durchsichtige Leiste anzeigen, die den gesamten verfügbaren Ruhe-EP-Bereich zeigt.\n(Nur DragonflightUI-Stil)"
L["Show Exhaustion Tick"] = "Erschöpfungsmarke anzeigen"
L["Show the exhaustion tick indicator on the XP bar, marking where rested XP ends."] = "Erschöpfungs-Markierung auf der EP-Leiste anzeigen, die das Ende der Ruhe-EP markiert."

-- Text Display
L["Text Display"] = "Textanzeige"
L["Always Show Text"] = "Text immer anzeigen"
L["Always display XP/Rep text instead of only on hover."] = "EP-/Ruf-Text immer anzeigen statt nur beim Darüberfahren."
L["Show XP Percentage"] = "EP-Prozent anzeigen"
L["Display XP percentage alongside the value text."] = "EP-Prozent zusätzlich zum Wert anzeigen."

-- ============================================================================
-- PROFILES TAB
-- ============================================================================

L["Database not available."] = "Datenbank nicht verfügbar."
L["Save and switch between different configurations per character."] = "Pro Charakter unterschiedliche Konfigurationen speichern und wechseln."
L["Current Profile"] = "Aktuelles Profil"
L["Active: "] = "Aktiv: "
L["Switch or Create Profile"] = "Profil wechseln oder erstellen"
L["Select Profile"] = "Profil auswählen"
L["New Profile Name"] = "Neuer Profilname"
L["Copy From"] = "Kopieren von"
L["Copies all settings from the selected profile into your current one."] = "Kopiert alle Einstellungen des gewählten Profils in dein aktuelles Profil."
L["Copied profile: "] = "Profil kopiert: "
L["Delete Profile"] = "Profil löschen"
L["Warning: Deleting a profile is permanent and cannot be undone."] = "Warnung: Das Löschen eines Profils ist dauerhaft und kann nicht rückgängig gemacht werden."
L["Delete"] = "Löschen"
L["Deleted profile: "] = "Profil gelöscht: "
L["Are you sure you want to delete the profile '%s'? This cannot be undone."] = "Möchtest du das Profil '%s' wirklich löschen? Dies kann nicht rückgängig gemacht werden."
L["Reset Current Profile"] = "Aktuelles Profil zurücksetzen"
L["Restores the current profile to its defaults. This cannot be undone."] = "Setzt das aktuelle Profil auf Standardwerte zurück. Das kann nicht rückgängig gemacht werden."
L["Reset Profile"] = "Profil zurücksetzen"
L["All changes will be lost and the UI will be reloaded.\nAre you sure you want to reset your profile?"] = "Alle Änderungen gehen verloren und die UI wird neu geladen.\nBist du sicher, dass du dein Profil zurücksetzen möchtest?"
L["Profile reset to defaults."] = "Profil auf Standard zurückgesetzt."

-- UNIT FRAME LAYERS MODULE
L["Unit Frame Layers"] = "Unit-Frame-Ebenen"
L["Enable Unit Frame Layers"] = "Unit-Frame-Ebenen aktivieren"
L["Heal prediction, absorb shields, and animated health loss on unit frames"] = "Heilvorhersage, Absorptionsschilde und animierter Lebensverlust auf Unit-Frames"
L["Heal prediction bars, absorb shields, and animated health loss overlays on unit frames."] = "Heilvorhersagebalken, Absorptionsschilde und animierte Lebensverlust-Overlays auf Unit-Frames."
L["Show heal prediction, absorb shields, and animated health loss on all unit frames."] = "Zeigt Heilvorhersage, Absorptionsschilde und animierten Lebensverlust auf allen Unit-Frames."
L["Animated Health Loss"] = "Animierter Lebensverlust"
L["Show animated red health loss bar on player frame when taking damage."] = "Zeigt beim Erleiden von Schaden einen animierten roten Lebensverlustbalken im Spielerrahmen."
L["Builder/Spender Feedback"] = "Generator/Verbraucher-Feedback"
L["Show mana gain/loss glow feedback on player mana bar (experimental)."] = "Zeigt Leuchteffekte für Mana-Gewinn/-Verlust auf der Manaleiste des Spielers an (experimentell)."

-- LAYOUT PRESETS
L["Layout Presets"] = "Layout-Vorlagen"
L["Save and restore complete UI layouts. Each preset captures all positions, scales, and settings."] = "Speichern und Wiederherstellen kompletter UI-Layouts. Jede Vorlage erfasst alle Positionen, Skalierungen und Einstellungen."
L["No presets saved yet."] = "Noch keine Vorlagen gespeichert."
L["Save New Preset"] = "Neue Vorlage speichern"
L["Save your current UI layout as a new preset."] = "Aktuelles UI-Layout als neue Vorlage speichern."
L["Preset"] = "Vorlage"
L["Enter a name for this preset:"] = "Namen für diese Vorlage eingeben:"
L["Save"] = "Speichern"
L["Load"] = "Laden"
L["Load preset '%s'? This will overwrite your current layout settings."] = "Vorlage '%s' laden? Aktuelle Layout-Einstellungen werden überschrieben."
L["Load Preset"] = "Vorlage laden"
L["Delete preset '%s'? This cannot be undone."] = "Vorlage '%s' löschen? Dies kann nicht rückgängig gemacht werden."
L["Delete Preset"] = "Vorlage löschen"
L["Duplicate Preset"] = "Vorlage duplizieren"
L["Preset saved: "] = "Vorlage gespeichert: "
L["Preset loaded: "] = "Vorlage geladen: "
L["Preset deleted: "] = "Vorlage gelöscht: "
L["Preset duplicated: "] = "Vorlage dupliziert: "
L["Also delete all saved layout presets?"] = "Auch alle gespeicherten Layout-Vorlagen löschen?"
L["Presets kept."] = "Vorlagen beibehalten."

-- PRESET IMPORT / EXPORT
L["Export Preset"] = "Vorlage exportieren"
L["Import Preset"] = "Vorlage importieren"
L["Import a preset from a text string shared by another player."] = "Importiere eine Vorlage aus einem Textstring, der von einem anderen Spieler geteilt wurde."
L["Import"] = "Importieren"
L["Select All"] = "Alles auswählen"
L["Close"] = "Schließen"
L["Enter a name for the imported preset:"] = "Gib einen Namen für die importierte Vorlage ein:"
L["Imported Preset"] = "Importierte Vorlage"
L["Preset imported: "] = "Vorlage importiert: "
L["Invalid preset string."] = "Ungültiger Vorlagen-String."
L["Not a valid DragonUI preset string."] = "Kein gültiger DragonUI-Vorlagen-String."
L["Failed to export preset."] = "Vorlage konnte nicht exportiert werden."

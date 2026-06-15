--[[
================================================================================
DragonUI_Options - English Locale (Default)
================================================================================
Base locale for the options panel: labels, descriptions, section headers,
dropdown values, print messages, popup text.

When adding new strings:
1. Add L[<your key>] = true here
2. Use L["Your String"] in your options code
3. Add translations to other locale files
================================================================================
]]

local L = LibStub("AceLocale-3.0"):NewLocale("DragonUI_Options", "enUS", true)
if not L then return end

-- ============================================================================
-- GENERAL / PANEL
-- ============================================================================

L["DragonUI"] = true
L["Use the tabs on the left to configure modules, action bars, unit frames, minimap, and more."] = true
L["Editor Mode"] = true
L["KeyBind Mode"] = true
L["Exit Editor Mode"] = true
L["KeyBind Mode Active"] = true
L["Move UI Elements"] = true
L["Cannot open options during combat."] = true
L["Open DragonUI Settings"] = true
L["Open the DragonUI configuration panel."] = true
L["Use /dragonui to open the full settings panel."] = true

-- Quick Actions
L["Quick Actions"] = true
L["Jump to popular settings sections."] = true
L["Action Bar Layout"] = true
L["Configure dark tinting for all UI chrome."] = true
L["Full-width health bar that fills the entire player frame."] = true
L["Add a decorative dragon to your player frame."] = true
L["Heal prediction, absorb shields and animated health loss."] = true
L["Change columns, rows, and buttons shown per action bar."] = true
L["Switch micro menu icons between colored and grayscale style."] = true
L["About"] = true
L["Bringing the retail WoW look to 3.3.5a, inspired by Dragonflight UI."] = true
L["Created and maintained by Neticsoul, with community contributions."] = true

L["Commands: /dragonui, /dui, /pi \226\128\148 /dragonui edit (editor) \226\128\148 /dragonui help"] = true
L["GitHub (select and Ctrl+C to copy):"] = true
L["All"] = true
L["Error:"] = true
L["Error: DragonUI addon not found!"] = true

-- ============================================================================
-- STATIC POPUPS
-- ============================================================================

L["Changing this setting requires a UI reload to apply correctly."] = true
L["Reload UI"] = true
L["Not Now"] = true
L["Reload Now"] = true
L["Cancel"] = true
L["Yes"] = true
L["No"] = true

-- ============================================================================
-- TAB NAMES
-- ============================================================================

L["General"] = true
L["Modules"] = true
L["Action Bars"] = true
L["Additional Bars"] = true
L["Cast Bars"] = true
L["Enhancements"] = true
L["Micro Menu"] = true
L["Minimap"] = true
L["Profiles"] = true
L["Quest Tracker"] = true
L["Unit Frames"] = true
L["XP & Rep Bars"] = true
L["Chat"] = true
L["Bags"] = true
L["Appearance"] = true
L["Left Side Tabs"] = true
L["Place category filter tabs on the left side of the bag frame instead of the right."] = true

-- ============================================================================
-- MODULES TAB
-- ============================================================================

-- Headers & descriptions
L["Module Control"] = true
L["Enable or disable specific DragonUI modules"] = true
L["Toggle individual modules on or off. Disabled modules revert to the default Blizzard UI."] = true
L["Visual enhancements that add Dragonflight-style polish to the UI."] = true
L["Warning: These are individual module controls. The options above may control multiple modules at once. Changes here will be reflected above and vice versa."] = true
L["Warning:"] = true
L["Individual overrides. The grouped toggles above take priority."] = true
L["Advanced - Individual Module Control"] = true

-- Section headers
L["Cast Bars"] = true
L["Other Modules"] = true
L["UI Systems"] = true
L["Enable All Action Bar Modules"] = true
L["Cast Bar"] = true
L["Custom player, target, and focus cast bars"] = true
L["Cooldown text on action buttons"] = true
L["Shaman totem bar positioning and styling"] = true
L["Dragonflight-styled player unit frame"] = true
L["Dragonflight-styled boss target frames"] = true

-- Toggle labels
L["Player Castbar"] = true
L["Target Castbar"] = true
L["Focus Castbar"] = true
L["Action Bars System"] = true
L["Micro Menu & Bags"] = true
L["Cooldown Timers"] = true
L["Minimap System"] = true
L["Buff Frame System"] = true
L["Dark Mode"] = true
L["Range Indicator"] = true
L["Item Quality Borders"] = true
L["Enable Enhanced Tooltips"] = true
L["KeyBind Mode"] = true
L["Quest Tracker"] = true

-- Module toggle descriptions
L["Enable DragonUI player castbar. When disabled, shows default Blizzard castbar."] = true
L["Enable DragonUI player castbar styling."] = true
L["Enable DragonUI target castbar. When disabled, shows default Blizzard castbar."] = true
L["Enable DragonUI target castbar styling."] = true
L["Enable DragonUI focus castbar. When disabled, shows default Blizzard castbar."] = true
L["Enable DragonUI focus castbar styling."] = true
L["Enable the complete DragonUI action bars system. This controls: Main action bars, vehicle interface, stance/shapeshift bars, pet action bars, multicast bars (totems/possess), button styling, and hide Blizzard elements. When disabled, all action bar related features will use default Blizzard interface."] = true
L["Master toggle for the complete action bars system."] = true
L["Includes main bars, vehicle, stance, pet, totem bars, and button styling."] = true
L["Apply DragonUI micro menu and bags system styling and positioning. Includes character button, spellbook, talents, etc. and bag management. When disabled, these elements will use default Blizzard positioning and styling."] = true
L["Micro menu and bags styling."] = true
L["Show cooldown timers on action buttons. When disabled, cooldown timers will be hidden and the system will be completely deactivated."] = true
L["Show cooldown timers on action buttons."] = true
L["Enable DragonUI minimap enhancements including custom styling, positioning, tracking icons, and calendar. When disabled, uses default Blizzard minimap appearance and positioning."] = true
L["Minimap styling, tracking icons, and calendar."] = true
L["Enable DragonUI buff frame with custom styling, positioning, and toggle button functionality. When disabled, uses default Blizzard buff frame appearance and positioning."] = true
L["Buff frame styling and toggle button."] = true
L["Separate Weapon Enchants"] = true
L["Detach weapon enchant icons (poisons, sharpening stones, etc.) from the buff bar into their own independently moveable frame. Position it freely using Editor Mode."] = true

-- Auras tab
L["Auras"] = true
L["Show Toggle Button"] = true
L["Show a collapse/expand button next to the buff icons."] = true
L["Weapon Enchants"] = true
L["Weapon enchant icons include rogue poisons, sharpening stones, wizard oils, and similar temporary weapon enhancements."] = true
L["When enabled, a 'Weapon Enchants' mover appears in Editor Mode that you can drag to any position on screen."] = true
L["Positions"] = true
L["Reset Buff Frame Position"] = true
L["Reset Weapon Enchant Position"] = true
L["Buff frame position reset."] = true
L["Weapon enchant position reset."] = true

L["DragonUI quest tracker positioning and styling."] = true
L["LibKeyBound integration for intuitive hover + key press binding."] = true

-- Toggle keybinding mode description
L["Toggle keybinding mode. Hover over action buttons and press keys to bind them instantly. Press ESC to clear bindings."] = true

-- Enable/disable dynamic descriptions
L["Enable/disable "] = true

-- Dark Mode
L["Dark Mode Intensity"] = true
L["Light (subtle)"] = true
L["Medium (balanced)"] = true
L["Dark (maximum)"] = true
L["Apply darker tinted textures to all UI chrome: action bars, unit frames, minimap, bags, micro menu, and more."] = true
L["Apply darker tinted textures to all UI elements."] = true
L["Darkens UI borders and chrome only: action bar borders, unit frame borders, minimap border, bag slot borders, micro menu, castbar borders, and decorative elements. Icons, portraits, and abilities are never affected."] = true
L["Enable Dark Mode"] = true

-- Dark Mode - Custom Color
L["Custom Color"] = true
L["Override presets with a custom tint color."] = true
L["Tint Color"] = true
L["Intensity"] = true

-- Range Indicator
L["Tint action button icons when target is out of range (red), not enough mana (blue), or unusable (gray)."] = true
L["Tints action button icons based on range and usability: red = out of range, blue = not enough mana, gray = unusable."] = true
L["Enable Range Indicator"] = true
L["Color action button icons when target is out of range or ability is unusable."] = true

-- Item Quality Borders
L["Show colored glow borders on action buttons containing items, colored by item quality (green = uncommon, blue = rare, purple = epic, etc.)."] = true
L["Enable Item Quality Borders"] = true
L["Show quality-colored borders on items in bags, character panel, bank, merchant, and inspect frames."] = true
L["Adds quality-colored glow borders to items in your bags, character panel, bank, merchant, and inspect frames: green = uncommon, blue = rare, purple = epic, orange = legendary."] = true
L["Minimum Quality"] = true
L["Only show colored borders for items at or above this quality level."] = true
L["Poor"] = true
L["Common"] = true
L["Uncommon"] = true
L["Rare"] = true
L["Epic"] = true
L["Legendary"] = true

-- Enhanced Tooltips
L["Enhanced Tooltips"] = true
L["Improves GameTooltip with class-colored borders, class-colored names, target-of-target info, and styled health bars."] = true
L["Activate all tooltip improvements. Sub-options below control individual features."] = true
L["Class-Colored Border"] = true
L["Color the tooltip border by the unit's class (players) or reaction (NPCs)."] = true
L["Class-Colored Name"] = true
L["Color the unit name text in the tooltip by class color (players only)."] = true
L["Target of Target"] = true
L["Add a 'Targeting: <name>' line showing who the unit is targeting."] = true
L["Add a 'Targeting: <name>' line to the tooltip showing who the unit is targeting."] = true
L["Styled Health Bar"] = true
L["Restyle the tooltip health bar with class/reaction colors."] = true
L["Restyle the tooltip health bar with class/reaction colors and slimmer look."] = true
L["Anchor to Cursor"] = true
L["Make the tooltip follow the cursor position instead of the default anchor."] = true

-- Chat Mods
L["Chat Mods"] = true
L["Enable Chat Mods"] = true
L["Enables or disables Chat Mods."] = true
L["Editbox Position"] = true
L["Choose where the chat editbox is positioned."] = true
L["Top"] = true
L["Bottom"] = true
L["Middle"] = true
L["Tab & Button Fade"] = true
L["How visible chat tabs are when not hovered. 0 = fully hidden, 1 = fully visible."] = true
L["Opacity of tabs, buttons and chat background when not hovered. 0 = hidden, 1 = always visible."] = true
L["Chat Style Opacity"] = true
L["Minimum opacity of the custom chat background. At 0 it fades with tabs; above 0 it stays partially visible when idle."] = true
L["Text Box Min Opacity"] = true
L["Minimum opacity of the text input box when idle. At 0 it fades with tabs; above 0 it stays partially visible."] = true
L["Chat Style"] = true
L["Visual style for the chat frame background."] = true
L["Editbox Style"] = true
L["Visual style for the chat input box background."] = true
L["Dark"] = true
L["DragonUI Style"] = true
L["Midnight"] = true

-- Combuctor
L["Combuctor"] = true
L["Enable Combuctor"] = true
L["All-in-one bag replacement with item filtering, search, quality indicators, and bank integration."] = true
L["Combuctor Settings"] = true

-- Bag Sort
L["Bag Sort"] = true
L["Enable Bag Sort"] = true
L["Sort buttons for bags and bank. Sorts items by type, rarity, level, and name."] = true
L["Add sort buttons to bag and bank frames. Also enables /sort and /sortbank slash commands."] = true
L["Sort bags and bank items with buttons"] = true

L["Show 'All' Tab"] = true
L["Show the 'All' category tab that displays all items without filtering."] = true
L["Equipment"] = true
L["Usable"] = true
L["Show Equipment Tab"] = true
L["Show the Equipment category tab for armor and weapons."] = true
L["Show Usable Tab"] = true
L["Show the Usable category tab for consumables and devices."] = true
L["Show Consumable Tab"] = true
L["Show the Consumable category tab."] = true
L["Show Quest Tab"] = true
L["Show the Quest items category tab."] = true
L["Show Trade Goods Tab"] = true
L["Show the Trade Goods category tab (includes gems and recipes)."] = true
L["Show Miscellaneous Tab"] = true
L["Show the Miscellaneous items category tab."] = true
L["Left Side Tabs"] = true
L["Place category filter tabs on the left side of the bag frame instead of the right."] = true
L["Place category filter tabs on the left side of the bank frame instead of the right."] = true
L["Changes require closing and reopening bags to take effect."] = true
L["Subtabs"] = true
L["Configure which bottom subtabs appear within each category tab. Applies to both inventory and bank."] = true
L["Normal"] = true
L["Trade Bags"] = true
L["Show the Normal bags subtab (non-profession bags)."] = true
L["Show the Trade bags subtab (profession bags)."] = true
L["Show the Armor subtab."] = true
L["Show the Weapon subtab."] = true
L["Show the Trinket subtab."] = true
L["Show the Consumable subtab."] = true
L["Show the Devices subtab."] = true
L["Show the Trade Goods subtab."] = true
L["Show the Gem subtab."] = true
L["Show the Recipe subtab."] = true
L["Configure Combuctor bag replacement settings."] = true
L["Category Tabs"] = true
L["Inventory Tabs"] = true
L["Bank Tabs"] = true
L["Inventory"] = true
L["Bank"] = true
L["Choose which category tabs appear on the bag frame. Changes require closing and reopening bags to take effect."] = true
L["Choose which category tabs appear on the inventory bag frame."] = true
L["Choose which category tabs appear on the bank frame."] = true
L["Display"] = true

-- Advanced modules - Fallback display names
L["Main Bars"] = true
L["Vehicle"] = true
L["Stance Bar"] = true
L["Pet Bar"] = true
L["Multicast"] = true
L["Buttons"] = true
L["Hide Blizzard Elements"] = true
L["Buffs"] = true
L["KeyBinding"] = true
L["Cooldowns"] = true

-- Advanced modules - RegisterModule display names (from module files)
L["Micro Menu"] = true
L["Loot Roll"] = true
L["Key Binding"] = true
L["Item Quality"] = true
L["Buff Frame"] = true
L["Hide Blizzard"] = true
L["Tooltip"] = true

-- Advanced modules - RegisterModule descriptions (from module files)
L["Micro menu and bags system styling and positioning"] = true
L["Quest tracker positioning and styling"] = true
L["Enhanced tooltip styling with class colors and health bars"] = true
L["Hide default Blizzard UI elements"] = true
L["Custom minimap styling, positioning, tracking icons and calendar"] = true
L["Main action bars, status bars, scaling and positioning"] = true
L["LibKeyBound integration for intuitive keybinding"] = true
L["Color item borders by quality in bags, character panel, bank, and merchant"] = true
L["Darken UI borders and chrome"] = true
L["Action button styling and enhancements"] = true
L["Custom buff frame styling, positioning and toggle button"] = true
L["Vehicle interface enhancements"] = true
L["Stance/shapeshift bar positioning and styling"] = true
L["Pet action bar positioning and styling"] = true
L["Multicast (totem/possess) bar positioning and styling"] = true
L["Chat Mods"] = true
L["Chat enhancements: hide buttons, editbox position, URL copy, chat copy, link hover, tell target"] = true
L["Combuctor"] = true
L["All-in-one bag replacement with filtering and search"] = true

-- ============================================================================
-- ACTION BARS TAB
-- ============================================================================

-- Sub-tabs
L["Layout"] = true
L["Visibility"] = true

-- Scales section
L["Action Bar Scales"] = true
L["Main Bar Scale"] = true
L["Right Bar Scale"] = true
L["Left Bar Scale"] = true
L["Bottom Left Bar Scale"] = true
L["Bottom Right Bar Scale"] = true
L["Scale for main action bar"] = true
L["Scale for right action bar (MultiBarRight)"] = true
L["Scale for left action bar (MultiBarLeft)"] = true
L["Scale for bottom left action bar (MultiBarBottomLeft)"] = true
L["Scale for bottom right action bar (MultiBarBottomRight)"] = true
L["Reset All Scales"] = true
L["Reset all action bar scales to their default values (0.9)"] = true
L["All action bar scales reset to default values (0.9)"] = true
L["All action bar scales reset to 0.9"] = true

-- Positions section
L["Action Bar Positions"] = true
L["Tip: Use the Move UI Elements button above to reposition action bars with your mouse."] = true
L["Left Bar Horizontal"] = true
L["Make the left secondary bar horizontal instead of vertical."] = true
L["Right Bar Horizontal"] = true
L["Make the right secondary bar horizontal instead of vertical."] = true

-- Button Appearance section
L["Button Appearance"] = true
L["Main Bar Only Background"] = true
L["If checked, only the main action bar buttons will have a background. If unchecked, all action bar buttons will have a background."] = true
L["Only the main action bar buttons will have a background."] = true
L["Hide Main Bar Background"] = true
L["Hide the background texture of the main action bar (makes it completely transparent)"] = true
L["Hide the background texture of the main action bar."] = true

-- Text visibility
L["Text Visibility"] = true
L["Count Text"] = true
L["Show Count"] = true
L["Show Count Text"] = true
L["Hotkey Text"] = true
L["Show Hotkey"] = true
L["Show Hotkey Text"] = true
L["Range Indicator"] = true
L["Show small range indicator point on buttons"] = true
L["Show range indicator dot on buttons."] = true
L["Macro Text"] = true
L["Show Macro Names"] = true
L["Page Numbers"] = true
L["Show Pages"] = true
L["Show Page Numbers"] = true

-- Cooldown text
L["Cooldown Text"] = true
L["Min Duration"] = true
L["Minimum duration for text triggering"] = true
L["Minimum duration for cooldown text to appear."] = true
L["Text Color"] = true
L["Cooldown Text Color"] = true
L["Font Size"] = true
L["Size of cooldown text."] = true

-- Colors
L["Colors"] = true
L["Macro Text Color"] = true
L["Color for macro text"] = true
L["Hotkey Shadow Color"] = true
L["Shadow color for hotkey text"] = true
L["Border Color"] = true
L["Border color for buttons"] = true

-- Gryphons
L["Gryphons"] = true
L["Gryphon Style"] = true
L["Display style for the action bar end-cap gryphons."] = true
L["End-cap ornaments flanking the main action bar."] = true
L["Gryphon previews are hidden while D3D9Ex is active to avoid client crashes."] = true
L["Style"] = true
L["Old"] = true
L["New"] = true
L["Flying"] = true
L["Hide Gryphons"] = true
L["Classic"] = true
L["Dragonflight"] = true
L["Hidden"] = true
L["Dragonflight (Wyvern)"] = true
L["Dragonflight (Gryphon)"] = true

-- Layout section
L["Main Bar Layout"] = true
L["Bottom Left Bar Layout"] = true
L["Bottom Right Bar Layout"] = true
L["Right Bar Layout"] = true
L["Left Bar Layout"] = true
L["Configure the main action bar grid layout. Rows are determined automatically from columns and buttons shown."] = true
L["Columns"] = true
L["Buttons Shown"] = true
L["Quick Presets"] = true
L["Apply layout presets to multiple bars at once."] = true
L["Both 1x12"] = true
L["Both 2x6"] = true
L["Reset All"] = true
L["All bar layouts reset to defaults."] = true

-- Visibility section
L["Bar Visibility"] = true
L["Control when action bars are visible. Bars can show only on hover, only in combat, or both. When no option is checked the bar is always visible."] = true
L["Enable / Disable Bars"] = true
L["Bottom Left Bar"] = true
L["Bottom Right Bar"] = true
L["Right Bar"] = true
L["Left Bar"] = true
L["Main Bar"] = true
L["Show on Hover Only"] = true
L["Show in Combat Only"] = true
L["Hide the main bar until you hover over it."] = true
L["Hide the main bar until you enter combat."] = true

-- ============================================================================
-- ADDITIONAL BARS TAB
-- ============================================================================

L["Bars that appear based on your class and situation."] = true
L["Specialized bars that appear when needed (stance/pet/vehicle/totems)"] = true
L["Auto-show bars: Stance (Warriors/Druids/DKs) • Pet (Hunters/Warlocks/DKs) • Vehicle (All classes) • Totem (Shamans)"] = true

-- Common settings
L["Common Settings"] = true
L["Button Size"] = true
L["Size of buttons for all additional bars"] = true
L["Button Spacing"] = true
L["Space between buttons for all additional bars"] = true

-- Stance Bar
L["Stance Bar"] = true
L["Warriors, Druids, Death Knights"] = true
L["X Position"] = true
L["Y Position"] = true
L["Y Offset"] = true
L["Horizontal position of stance bar from screen center. Negative values move left, positive values move right."] = true

-- Pet Bar
L["Pet Bar"] = true
L["Hunters, Warlocks, Death Knights - Use editor mode to move"] = true
L["Show Empty Slots"] = true
L["Display empty action slots on pet bar"] = true

-- Vehicle Bar
L["Vehicle Bar"] = true
L["All classes (vehicles/special mounts)"] = true
L["Custom Art Style"] = true
L["Use custom vehicle bar art style with health/power bars and themed skin. Requires UI reload to apply."] = true
L["Blizzard Art Style"] = true
L["Use Blizzard vehicle bar art with health/power display. Requires reload."] = true

-- Totem Bar
L["Totem Bar"] = true
L["Totem Bar (Shaman)"] = true
L["Shamans only - Totem multicast bar. Position is controlled via Editor Mode."] = true
L["TIP: Use Editor Mode to position the totem bar (type /dragonui edit)."] = true

-- ============================================================================
-- CAST BARS TAB
-- ============================================================================

L["Player Castbar"] = true
L["Target Castbar"] = true
L["Focus Castbar"] = true

-- Sub-tabs
L["Player"] = true
L["Target"] = true
L["Focus"] = true

-- Common options
L["Width"] = true
L["Width of the cast bar"] = true
L["Height"] = true
L["Height of the cast bar"] = true
L["Scale"] = true
L["Size scale of the cast bar"] = true
L["Show Icon"] = true
L["Show the spell icon next to the cast bar"] = true
L["Show Spell Icon"] = true
L["Show the spell icon next to the target castbar"] = true
L["Icon Size"] = true
L["Size of the spell icon"] = true
L["Text Mode"] = true
L["Choose how to display spell text: Simple (centered spell name only) or Detailed (spell name + time)"] = true
L["Simple (Centered Name Only)"] = true
L["Simple (Name Only)"] = true
L["Simple"] = true
L["Detailed (Name + Time)"] = true
L["Detailed"] = true
L["Time Precision"] = true
L["Decimal places for remaining time."] = true
L["Max Time Precision"] = true
L["Decimal places for total time."] = true
L["Hold Time (Success)"] = true
L["How long the bar stays visible after a successful cast."] = true
L["How long the bar stays after a successful cast."] = true
L["How long to show the castbar after successful completion"] = true
L["Hold Time (Interrupt)"] = true
L["How long the bar stays visible after being interrupted."] = true
L["How long the bar stays after being interrupted."] = true
L["How long to show the castbar after interruption/failure"] = true
L["Auto-Adjust for Auras"] = true
L["Automatically adjust position based on target auras (CRITICAL FEATURE)"] = true
L["Shift castbar when buff/debuff rows are showing."] = true
L["Automatically adjust position based on focus auras"] = true
L["Reset Position"] = true
L["Resets the X and Y position to default."] = true
L["Reset target castbar position to default"] = true
L["Reset focus castbar position to default"] = true
L["Player castbar position reset."] = true
L["Target castbar position reset."] = true
L["Focus castbar position reset."] = true
L["Castbar detached - positioned freely via Editor Mode"] = true
L["Castbar attached - follows Target frame"] = true
L["Castbar attached - follows Focus frame"] = true
L["Re-attach Castbar to Target"] = true
L["Re-attach Castbar to Focus"] = true

-- Width/height descriptions for target/focus
L["Width of the target castbar"] = true
L["Height of the target castbar"] = true
L["Scale of the target castbar"] = true
L["Width of the focus castbar"] = true
L["Height of the focus castbar"] = true
L["Scale of the focus castbar"] = true
L["Show the spell icon next to the focus castbar"] = true
L["Time to show the castbar after successful cast completion"] = true
L["Time to show the castbar after cast interruption"] = true

-- Latency indicator (player only)
L["Latency Indicator"] = true
L["Enable Latency Indicator"] = true
L["Show a safe-zone overlay based on real cast latency."] = true
L["Latency Color"] = true
L["Latency Alpha"] = true
L["Opacity of the latency indicator."] = true

-- ============================================================================
-- ENHANCEMENTS TAB
-- ============================================================================

L["Enhancements"] = true
L["Visual enhancements that add Dragonflight-style polish to the UI. These are optional — disable any you don't want."] = true

-- (Dark Mode, Range Indicator, Item Quality, Tooltips defined above in MODULES section)

-- ============================================================================
-- MICRO MENU TAB
-- ============================================================================

L["Gray Scale Icons"] = true
L["Grayscale Icons"] = true
L["Use grayscale icons instead of colored icons for the micro menu"] = true
L["Use grayscale icons instead of colored icons."] = true
L["Grayscale Icons Settings"] = true
L["Normal Icons Settings"] = true
L["Menu Scale"] = true
L["Icon Spacing"] = true
L["Hide on Vehicle"] = true
L["Hide micromenu and bags if you sit on vehicle"] = true
L["Hide micromenu and bags while in a vehicle."] = true
L["Show Latency Indicator"] = true
L["Show a colored bar below the Help button indicating connection quality (green/yellow/red). Requires UI reload."] = true

-- Bags
L["Bags"] = true
L["Configure the position and scale of the bag bar independently from the micro menu."] = true
L["Bag Bar Scale"] = true

-- XP & Rep Bars
L["XP & Rep Bars (Legacy Offsets)"] = true
L["Main XP & Rep bar options have moved to the XP & Rep Bars tab."] = true
L["These offset options are for advanced positioning adjustments."] = true
L["Both Bars Offset"] = true
L["Y offset when XP & reputation bar are shown"] = true
L["Single Bar Offset"] = true
L["Y offset when XP or reputation bar is shown"] = true
L["No Bar Offset"] = true
L["Y offset when no XP or reputation bar is shown"] = true
L["Rep Bar Above XP Offset"] = true
L["Y offset for reputation bar when XP bar is shown"] = true
L["Rep Bar Offset"] = true
L["Y offset when XP bar is not shown"] = true

-- ============================================================================
-- MINIMAP TAB
-- ============================================================================

L["Basic Settings"] = true
L["Border Alpha"] = true
L["Top border alpha (0 to hide)."] = true
L["Addon Button Skin"] = true
L["Apply DragonUI border styling to addon icons (e.g., bag addons)"] = true
L["Apply DragonUI border styling to addon icons."] = true
L["Addon Button Fade"] = true
L["Addon icons fade out when not hovered."] = true
L["Player Arrow Size"] = true
L["Size of the player arrow on the minimap"] = true
L["New Blip Style"] = true
L["Use new DragonUI object icons on the minimap. When disabled, uses classic Blizzard icons."] = true
L["Use newer-style minimap blip icons."] = true

-- Time & Calendar
L["Time & Calendar"] = true
L["Show Clock"] = true
L["Show/hide the minimap clock"] = true
L["Show Calendar"] = true
L["Show/hide the calendar frame"] = true
L["Clock Font Size"] = true
L["Font size for the clock numbers on the minimap"] = true

-- Display Settings
L["Display Settings"] = true
L["Tracking Icons"] = true
L["Show current tracking icons (old style)."] = true
L["Zoom Buttons"] = true
L["Show zoom buttons (+/-)."] = true
L["Zone Text Size"] = true
L["Zone Text Font Size"] = true
L["Zone text font size on top border"] = true
L["Font size of the zone text above the minimap."] = true

-- Position
L["Position"] = true
L["Reset minimap to default position (top-right corner)"] = true
L["Reset Minimap Position"] = true
L["Minimap position reset to default"] = true
L["Minimap position reset."] = true

-- ============================================================================
-- QUEST TRACKER TAB
-- ============================================================================

L["Configures the quest objective tracker position and behavior."] = true
L["Position and display settings for the objective tracker."] = true
L["Show Header Background"] = true
L["Show/hide the decorative header background texture."] = true
L["Anchor Point"] = true
L["Screen anchor point for the quest tracker."] = true
L["Top Right"] = true
L["Top Left"] = true
L["Bottom Right"] = true
L["Bottom Left"] = true
L["Center"] = true
L["Horizontal position offset"] = true
L["Vertical position offset"] = true
L["Reset quest tracker to default position"] = true
L["Font Size"] = true
L["Font size for quest tracker text"] = true

-- ============================================================================
-- UNIT FRAMES TAB
-- ============================================================================

-- Sub-tabs
L["Pet"] = true
L["ToT / ToF"] = true
L["Party"] = true

-- Common options
L["Global Scale"] = true
L["Global scale for all unit frames"] = true
L["Scale of the player frame"] = true
L["Scale of the target frame"] = true
L["Scale of the focus frame"] = true
L["Scale of the pet frame"] = true
L["Scale of the target of target frame"] = true
L["Scale of the focus of target frame"] = true
L["Scale of party frames"] = true
L["Class Color"] = true
L["Class Color Health"] = true
L["Use class color for health bar"] = true
L["Use class color for health bars in party frames"] = true
L["Class Portrait"] = true
L["Show class icon instead of 3D portrait"] = true
L["Show class icon instead of 3D portrait (only for players)"] = true
L["Class icon instead of 3D model for players."] = true
L["Alternative Class Icons"] = true
L["Use DragonUI alternative class icons instead of Blizzard's class icon atlas."] = true
L["Large Numbers"] = true
L["Format Large Numbers"] = true
L["Format large numbers (1k, 1m)"] = true
L["Text Format"] = true
L["How to display health and mana values"] = true
L["Choose how to display health and mana text"] = true

-- Text format values
L["Current Value Only"] = true
L["Current Value"] = true
L["Percentage Only"] = true
L["Percentage"] = true
L["Both (Numbers + Percentage)"] = true
L["Numbers + %"] = true
L["Current/Max Values"] = true
L["Current / Max"] = true

-- Party text format values
L["Current Value Only (2345)"] = true
L["Formatted Current (2.3k)"] = true
L["Percentage Only (75%)"] = true
L["Percentage + Current (75% | 2.3k)"] = true
L["Percentage + Current/Max"] = true

-- Health/Mana text
L["Always Show Health Text"] = true
L["Show health text always (true) or only on hover (false)"] = true
L["Always show health text on party frames (instead of only on hover)"] = true
L["Always display health text (otherwise only on mouseover)"] = true
L["Always Show Mana Text"] = true
L["Show mana/power text always (true) or only on hover (false)"] = true
L["Always show mana text on party frames (instead of only on hover)"] = true
L["Always display mana/energy/rage text (otherwise only on mouseover)"] = true

-- Player frame specific
L["Player Frame"] = true
L["Dragon Decoration"] = true
L["Add decorative dragon to your player frame for a premium look"] = true
L["None"] = true
L["Elite Dragon (Golden)"] = true
L["Elite (Golden)"] = true
L["RareElite Dragon (Winged)"] = true
L["RareElite (Winged)"] = true
L["Glow Effects"] = true
L["Show Rest Glow"] = true
L["Show a golden glow around the player frame when resting (in an inn or city). Works with all frame modes: normal, elite, fat health bar, and vehicle."] = true
L["Golden glow around the player frame when resting (inn or city). Works with all frame modes."] = true
L["Combat Flash"] = true
L["Show Combat Flash"] = true
L["Pulsing glow effect when entering combat. Works with all frame modes."] = true
L["Combat Flash Opacity"] = true
L["Maximum opacity of the combat flash pulse effect."] = true
L["Always Show Alternate Mana Text"] = true
L["Show mana text always visible (default: hover only)"] = true
L["Alternate Mana (Druid)"] = true
L["Always Show"] = true
L["Druid mana text visible at all times, not just on hover."] = true
L["Alternate Mana Text Format"] = true
L["Choose text format for alternate mana display"] = true
L["Percentage + Current/Max"] = true

-- Fat Health Bar
L["Health Bar Style"] = true
L["Fat Health Bar"] = true
L["Enable"] = true
L["Full-width health bar that fills the entire frame area. Uses modified border texture that removes the inner divider line. Compatible with Dragon Decoration (requires fat variant textures). Note: Automatically disabled during vehicle UI."] = true
L["Full-width health bar. Auto-disabled in vehicles."] = true
L["Hide Mana Bar (Fat Mode)"] = true
L["Hide Mana Bar"] = true
L["Completely hide the mana bar when Fat Health Bar is active."] = true
L["Mana Bar Width (Fat Mode)"] = true
L["Mana Bar Width"] = true
L["Width of the mana bar when Fat Health Bar is active. Movable via Editor Mode."] = true
L["Mana Bar Height (Fat Mode)"] = true
L["Mana Bar Height"] = true
L["Height of the mana bar when Fat Health Bar is active."] = true
L["Mana Bar Texture"] = true
L["Choose the texture style for the power/mana bar. Only applies in Fat Health Bar mode."] = true
L["DragonUI (Default)"] = true
L["Blizzard Classic"] = true
L["Flat Solid"] = true
L["Smooth"] = true
L["Aluminium"] = true
L["LiteStep"] = true

-- Power Bar Colors
L["Power Bar Colors"] = true
L["Mana"] = true
L["Rage"] = true
L["Energy"] = true
-- L["Focus"] = true  -- Already defined above
L["Runic Power"] = true
L["Happiness"] = true
L["Runes"] = true
L["Reset Colors to Default"] = true

-- Target frame
L["Target Frame"] = true
L["Threat Glow"] = true
L["Show threat glow effect"] = true
L["Show Name Background"] = true
L["Show the colored name background behind the target name."] = true

-- Focus frame
L["Focus Frame"] = true
L["Show the colored name background behind the focus name."] = true
L["Show Buff/Debuff on Focus"] = true
L["Uses the native large focus frame mode to show buffs and debuffs on the focus frame."] = true
L["Override Position"] = true
L["Override default positioning"] = true
L["Move the pet frame independently from the player frame."] = true

-- Pet frame
L["Pet Frame"] = true
L["Allows the pet frame to be moved freely. When unchecked, it will be positioned relative to the player frame."] = true
L["Horizontal position (only active if Override is checked)"] = true
L["Vertical position (only active if Override is checked)"] = true

-- Target of Target
L["Target of Target"] = true
L["Follows the Target frame by default. Move it in Editor Mode (/dragonui edit) to detach and position freely."] = true
L["Detached — positioned freely via Editor Mode"] = true
L["Attached — follows Target frame"] = true
L["Re-attach to Target"] = true

-- Target of Focus
L["Target of Focus"] = true
L["Follows the Focus frame by default. Move it in Editor Mode (/dragonui edit) to detach and position freely."] = true
L["Attached — follows Focus frame"] = true
L["Re-attach to Focus"] = true

-- Party Frames
L["Party Frames"] = true
L["Party Frames Configuration"] = true
L["Custom styling for party member frames with automatic health/mana text display and class colors."] = true

-- Boss Frames
L["Boss Frames"] = true
L["Enabled"] = true

L["Orientation"] = true
L["Vertical"] = true
L["Horizontal"] = true
L["Party frame orientation"] = true
L["Vertical Padding"] = true
L["Space between party frames in vertical mode."] = true
L["Horizontal Padding"] = true
L["Space between party frames in horizontal mode."] = true

-- ============================================================================
-- XP & REP BARS TAB
-- ============================================================================

L["Bar Style"] = true
L["XP / Rep Bar Style"] = true
L["DragonflightUI: fully custom bars with rested XP background.\nRetailUI: atlas-based reskin of Blizzard bars.\n\nChanging style requires a UI reload."] = true
L["DragonflightUI"] = true
L["RetailUI"] = true
L["XP bar style changed to "] = true
L["A UI reload is required to apply this change."] = true

-- Size & Scale
L["Size & Scale"] = true
L["Bar Height"] = true
L["Height of the XP and Reputation bars (in pixels)."] = true
L["Experience Bar Scale"] = true
L["Scale of the experience bar."] = true
L["Reputation Bar Scale"] = true
L["Scale of the reputation bar."] = true

-- Rested XP
L["Rested XP"] = true
L["Show Rested XP Background"] = true
L["Display a translucent bar showing the total available rested XP range.\n(DragonflightUI style only)"] = true
L["Show Exhaustion Tick"] = true
L["Show the exhaustion tick indicator on the XP bar, marking where rested XP ends."] = true

-- Text Display
L["Text Display"] = true
L["Always Show Text"] = true
L["Always display XP/Rep text instead of only on hover."] = true
L["Show XP Percentage"] = true
L["Display XP percentage alongside the value text."] = true

-- ============================================================================
-- PROFILES TAB
-- ============================================================================

L["Database not available."] = true
L["Save and switch between different configurations per character."] = true
L["Current Profile"] = true
L["Active: "] = true
L["Switch or Create Profile"] = true
L["Select Profile"] = true
L["New Profile Name"] = true
L["Copy From"] = true
L["Copies all settings from the selected profile into your current one."] = true
L["Copied profile: "] = true
L["Delete Profile"] = true
L["Warning: Deleting a profile is permanent and cannot be undone."] = true
L["Delete"] = true
L["Deleted profile: "] = true
L["Are you sure you want to delete the profile '%s'? This cannot be undone."] = true
L["Reset Current Profile"] = true
L["Restores the current profile to its defaults. This cannot be undone."] = true
L["Reset Profile"] = true
L["All changes will be lost and the UI will be reloaded.\nAre you sure you want to reset your profile?"] = true
L["Profile reset to defaults."] = true

-- UNIT FRAME LAYERS MODULE
L["Unit Frame Layers"] = true
L["Enable Unit Frame Layers"] = true
L["Heal prediction, absorb shields, and animated health loss on unit frames"] = true
L["Heal prediction bars, absorb shields, and animated health loss overlays on unit frames."] = true
L["Show heal prediction, absorb shields, and animated health loss on all unit frames."] = true
L["Animated Health Loss"] = true
L["Show animated red health loss bar on player frame when taking damage."] = true
L["Builder/Spender Feedback"] = true
L["Show mana gain/loss glow feedback on player mana bar (experimental)."] = true

-- LAYOUT PRESETS
L["Layout Presets"] = true
L["Save and restore complete UI layouts. Each preset captures all positions, scales, and settings."] = true
L["No presets saved yet."] = true
L["Save New Preset"] = true
L["Save your current UI layout as a new preset."] = true
L["Preset"] = true
L["Enter a name for this preset:"] = true
L["Save"] = true
L["Load"] = true
L["Load preset '%s'? This will overwrite your current layout settings."] = true
L["Load Preset"] = true
L["Delete preset '%s'? This cannot be undone."] = true
L["Delete Preset"] = true
L["Duplicate Preset"] = true
L["Preset saved: "] = true
L["Preset loaded: "] = true
L["Preset deleted: "] = true
L["Preset duplicated: "] = true
L["Also delete all saved layout presets?"] = true
L["Presets kept."] = true

-- PRESET IMPORT / EXPORT
L["Export Preset"] = true
L["Import Preset"] = true
L["Import a preset from a text string shared by another player."] = true
L["Import"] = true
L["Select All"] = true
L["Close"] = true
L["Enter a name for the imported preset:"] = true
L["Imported Preset"] = true
L["Preset imported: "] = true
L["Invalid preset string."] = true
L["Not a valid DragonUI preset string."] = true
L["Failed to export preset."] = true

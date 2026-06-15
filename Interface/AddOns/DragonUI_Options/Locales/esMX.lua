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

local L = LibStub("AceLocale-3.0"):NewLocale("DragonUI_Options", "esMX")
if not L then return end

-- ============================================================================
-- GENERAL / PANEL
-- ============================================================================

L["DragonUI"] = "DragonUI"
L["Use the tabs on the left to configure modules, action bars, unit frames, minimap, and more."] = "Usa las pestañas de la izquierda para configurar módulos, barras de acción, marcos de unidad, minimapa y más."
L["Editor Mode"] = "Modo Editor"
L["Exit Editor Mode"] = "Salir del Modo Editor"
L["KeyBind Mode Active"] = "Modo de Atajos Activo"
L["Move UI Elements"] = "Mover Elementos de la IU"
L["Cannot open options during combat."] = "No se pueden abrir las opciones durante el combate."
L["Open DragonUI Settings"] = "Abrir Configuración de DragonUI"
L["Open the DragonUI configuration panel."] = "Abrir el panel de configuración de DragonUI."
L["Use /dragonui to open the full settings panel."] = "Usa /dragonui para abrir el panel completo de configuración."

-- Quick Actions
L["Quick Actions"] = "Acciones Rápidas"
L["Jump to popular settings sections."] = "Accede rápido a las secciones más usadas."
L["Action Bar Layout"] = "Disposición de Barras de Acción"
L["Configure dark tinting for all UI chrome."] = "Configurar el oscurecimiento de toda la interfaz."
L["Full-width health bar that fills the entire player frame."] = "Barra de vida ancha que ocupa todo el marco del jugador."
L["Add a decorative dragon to your player frame."] = "Añadir un dragón decorativo al marco del jugador."
L["Heal prediction, absorb shields and animated health loss."] = "Predicción de curación, escudos de absorción y pérdida de vida animada."
L["Change columns, rows, and buttons shown per action bar."] = "Cambiar columnas, filas y botones visibles por barra de acción."
L["Switch micro menu icons between colored and grayscale style."] = "Alternar los iconos del micro menú entre color y escala de grises."
L["About"] = "Acerca de"
L["Bringing the retail WoW look to 3.3.5a, inspired by Dragonflight UI."] = "Trayendo el aspecto del WoW retail a 3.3.5a, inspirado en Dragonflight UI."
L["Created and maintained by Neticsoul, with community contributions."] = "Creado y mantenido por Neticsoul, con contribuciones de la comunidad."

L["Commands: /dragonui, /dui, /pi \226\128\148 /dragonui edit (editor) \226\128\148 /dragonui help"] = "Comandos: /dragonui, /dui, /pi \226\128\148 /dragonui edit (editor) \226\128\148 /dragonui help"
L["GitHub (select and Ctrl+C to copy):"] = "GitHub (selecciona y Ctrl+C para copiar):"
L["All"] = "Todo"
L["Error:"] = "Error:"
L["Error: DragonUI addon not found!"] = "Error: ¡No se encontró el addon DragonUI!"

-- ============================================================================
-- STATIC POPUPS
-- ============================================================================

L["Changing this setting requires a UI reload to apply correctly."] = "Cambiar esta opción requiere recargar la IU para aplicarse correctamente."
L["Reload UI"] = "Recargar IU"
L["Not Now"] = "Ahora No"
L["Reload Now"] = "Recargar Ahora"
L["Cancel"] = "Cancelar"
L["Yes"] = "Sí"
L["No"] = "No"

-- ============================================================================
-- TAB NAMES
-- ============================================================================

L["General"] = "General"
L["Modules"] = "Módulos"
L["Action Bars"] = "Barras de Acción"
L["Additional Bars"] = "Barras Adicionales"
L["Minimap"] = "Minimapa"
L["Profiles"] = "Perfiles"
L["Unit Frames"] = "Marcos de Unidad"
L["XP & Rep Bars"] = "Barras de XP y Rep"
L["Chat"] = "Chat"
L["Appearance"] = "Apariencia"

-- ============================================================================
-- MODULES TAB
-- ============================================================================

-- Headers & descriptions
L["Module Control"] = "Control de Módulos"
L["Enable or disable specific DragonUI modules"] = "Activar o desactivar módulos específicos de DragonUI"
L["Toggle individual modules on or off. Disabled modules revert to the default Blizzard UI."] = "Activa o desactiva módulos individuales. Los módulos desactivados vuelven a la IU predeterminada de Blizzard."
L["Visual enhancements that add Dragonflight-style polish to the UI."] = "Mejoras visuales que añaden el estilo Dragonflight a la IU."
L["Warning: These are individual module controls. The options above may control multiple modules at once. Changes here will be reflected above and vice versa."] = "Aviso: Estos son controles de módulos individuales. Las opciones de arriba pueden controlar varios módulos a la vez. Los cambios aquí se reflejan arriba y viceversa."
L["Warning:"] = "Aviso:"
L["Individual overrides. The grouped toggles above take priority."] = "Controles individuales. Los toggles agrupados de arriba tienen prioridad."
L["Advanced - Individual Module Control"] = "Avanzado - Control Individual de Módulos"

-- Section headers
L["Cast Bars"] = "Barras de Lanzamiento"
L["Other Modules"] = "Otros Módulos"
L["UI Systems"] = "Sistemas de IU"
L["Enable All Action Bar Modules"] = "Activar Todos los Módulos de Barras"
L["Cast Bar"] = "Barra de Lanzamiento"
L["Custom player, target, and focus cast bars"] = "Barras de lanzamiento personalizadas para jugador, objetivo y foco"
L["Cooldown text on action buttons"] = "Texto de reutilización en los botones de acción"
L["Shaman totem bar positioning and styling"] = "Posicionamiento y estilo de la barra de tótems del chamán"
L["Dragonflight-styled player unit frame"] = "Marco de unidad del jugador con estilo Dragonflight"
L["Dragonflight-styled boss target frames"] = "Marcos de objetivo de jefe con estilo Dragonflight"

-- Toggle labels
L["Action Bars System"] = "Sistema de Barras de Acción"
L["Micro Menu & Bags"] = "Micro Menú y Bolsas"
L["Cooldown Timers"] = "Temporizadores de Reutilización"
L["Minimap System"] = "Sistema del Minimapa"
L["Buff Frame System"] = "Sistema de Marco de Beneficios"
L["Dark Mode"] = "Modo Oscuro"
L["Item Quality Borders"] = "Bordes de Calidad de Objetos"
L["Enable Enhanced Tooltips"] = "Activar Tooltips Mejorados"
L["KeyBind Mode"] = "Modo de Atajos"
L["Quest Tracker"] = "Rastreador de Misiones"

-- Module toggle descriptions
L["Enable DragonUI player castbar. When disabled, shows default Blizzard castbar."] = "Activar la barra de lanzamiento del jugador de DragonUI. Al desactivar, muestra la barra predeterminada de Blizzard."
L["Enable DragonUI player castbar styling."] = "Activar el estilo de barra de lanzamiento del jugador de DragonUI."
L["Enable DragonUI target castbar. When disabled, shows default Blizzard castbar."] = "Activar la barra de lanzamiento del objetivo de DragonUI. Al desactivar, muestra la barra predeterminada de Blizzard."
L["Enable DragonUI target castbar styling."] = "Activar el estilo de barra de lanzamiento del objetivo de DragonUI."
L["Enable DragonUI focus castbar. When disabled, shows default Blizzard castbar."] = "Activar la barra de lanzamiento del foco de DragonUI. Al desactivar, muestra la barra predeterminada de Blizzard."
L["Enable DragonUI focus castbar styling."] = "Activar el estilo de barra de lanzamiento del foco de DragonUI."
L["Enable the complete DragonUI action bars system. This controls: Main action bars, vehicle interface, stance/shapeshift bars, pet action bars, multicast bars (totems/possess), button styling, and hide Blizzard elements. When disabled, all action bar related features will use default Blizzard interface."] = "Activar el sistema completo de barras de acción de DragonUI. Controla: Barras de acción principales, interfaz de vehículo, barras de postura/forma, barras de mascota, barras multicast (tótems/posesión), estilo de botones y ocultación de elementos de Blizzard. Al desactivar, todas las funciones de barras usan la interfaz predeterminada de Blizzard."
L["Master toggle for the complete action bars system."] = "Control maestro del sistema completo de barras de acción."
L["Includes main bars, vehicle, stance, pet, totem bars, and button styling."] = "Incluye barras principales, vehículo, postura, mascota, tótems y estilo de botones."
L["Apply DragonUI micro menu and bags system styling and positioning. Includes character button, spellbook, talents, etc. and bag management. When disabled, these elements will use default Blizzard positioning and styling."] = "Aplicar el estilo y posicionamiento del micro menú y bolsas de DragonUI. Incluye botón de personaje, libro de hechizos, talentos, etc. y gestión de bolsas. Al desactivar, estos elementos usan el posicionamiento y estilo predeterminado de Blizzard."
L["Micro menu and bags styling."] = "Estilo del micro menú y bolsas."
L["Show cooldown timers on action buttons. When disabled, cooldown timers will be hidden and the system will be completely deactivated."] = "Mostrar temporizadores de reutilización en botones de acción. Al desactivar, los temporizadores se ocultarán y el sistema se desactivará completamente."
L["Show cooldown timers on action buttons."] = "Mostrar temporizadores de reutilización en botones de acción."
L["Enable DragonUI minimap enhancements including custom styling, positioning, tracking icons, and calendar. When disabled, uses default Blizzard minimap appearance and positioning."] = "Activar mejoras del minimapa de DragonUI incluyendo estilo personalizado, posicionamiento, iconos de rastreo y calendario. Al desactivar, usa la apariencia y posición predeterminada de Blizzard."
L["Minimap styling, tracking icons, and calendar."] = "Estilo del minimapa, iconos de rastreo y calendario."
L["Enable DragonUI buff frame with custom styling, positioning, and toggle button functionality. When disabled, uses default Blizzard buff frame appearance and positioning."] = "Activar marco de beneficios de DragonUI con estilo personalizado, posicionamiento y funcionalidad de botón. Al desactivar, usa la apariencia y posición predeterminada de Blizzard."
L["Buff frame styling and toggle button."] = "Estilo del marco de beneficios y botón de alternancia."
L["Separate Weapon Enchants"] = "Separar Encantamientos de Arma"
L["Detach weapon enchant icons (poisons, sharpening stones, etc.) from the buff bar into their own independently moveable frame. Position it freely using Editor Mode."] = "Separar los iconos de encantamientos de arma (venenos, piedras de afilar, etc.) de la barra de beneficios en un marco independiente y movible. Posiciónalo libremente usando el Modo Editor."

-- Auras tab
L["Auras"] = "Auras"
L["Show Toggle Button"] = "Mostrar Botón de Alternancia"
L["Show a collapse/expand button next to the buff icons."] = "Mostrar un botón para colapsar/expandir junto a los iconos de beneficios."
L["Weapon Enchants"] = "Encantamientos de Arma"
L["Weapon enchant icons include rogue poisons, sharpening stones, wizard oils, and similar temporary weapon enhancements."] = "Los iconos de encantamientos de arma incluyen venenos de pícaro, piedras de afilar, aceites de mago y mejoras temporales similares."
L["When enabled, a 'Weapon Enchants' mover appears in Editor Mode that you can drag to any position on screen."] = "Al activar, aparece un marco 'Encantamientos de Arma' en el Modo Editor que puedes arrastrar a cualquier posición de la pantalla."
L["Positions"] = "Posiciones"
L["Reset Buff Frame Position"] = "Reiniciar Posición de Beneficios"
L["Reset Weapon Enchant Position"] = "Reiniciar Posición de Encantamientos"
L["Buff frame position reset."] = "Posición del marco de beneficios reiniciada."
L["Weapon enchant position reset."] = "Posición de encantamientos de arma reiniciada."

L["DragonUI quest tracker positioning and styling."] = "Posicionamiento y estilo del rastreador de misiones de DragonUI."
L["LibKeyBound integration for intuitive hover + key press binding."] = "Integración con LibKeyBound para asignación intuitiva: pasar el cursor + pulsar tecla."

-- Toggle keybinding mode description
L["Toggle keybinding mode. Hover over action buttons and press keys to bind them instantly. Press ESC to clear bindings."] = "Alternar modo de asignación de teclas. Pasa el cursor sobre los botones de acción y pulsa teclas para asignarlas al instante. Pulsa ESC para borrar asignaciones."

-- Enable/disable dynamic descriptions
L["Enable/disable "] = "Activar/desactivar "

-- Dark Mode
L["Dark Mode Intensity"] = "Intensidad del Modo Oscuro"
L["Light (subtle)"] = "Claro (sutil)"
L["Medium (balanced)"] = "Medio (equilibrado)"
L["Dark (maximum)"] = "Oscuro (máximo)"
L["Apply darker tinted textures to all UI chrome: action bars, unit frames, minimap, bags, micro menu, and more."] = "Aplicar texturas oscurecidas a todos los elementos de la IU: barras de acción, marcos de unidad, minimapa, bolsas, micro menú y más."
L["Apply darker tinted textures to all UI elements."] = "Aplicar texturas oscurecidas a todos los elementos de la IU."
L["Darkens UI borders and chrome only: action bar borders, unit frame borders, minimap border, bag slot borders, micro menu, castbar borders, and decorative elements. Icons, portraits, and abilities are never affected."] = "Oscurece solo los bordes y marcos de la IU: bordes de barras de acción, marcos de unidad, borde del minimapa, bordes de bolsas, micro menú, bordes de barras de lanzamiento y elementos decorativos. Los iconos, retratos y habilidades nunca se ven afectados."
L["Enable Dark Mode"] = "Activar Modo Oscuro"

-- Dark Mode - Custom Color
L["Custom Color"] = "Color Personalizado"
L["Override presets with a custom tint color."] = "Anular los preajustes con un color de tinte personalizado."
L["Tint Color"] = "Color de Tinte"
L["Intensity"] = "Intensidad"

-- Range Indicator
L["Tint action button icons when target is out of range (red), not enough mana (blue), or unusable (gray)."] = "Tintar iconos de botones de acción cuando el objetivo está fuera de alcance (rojo), sin suficiente maná (azul) o inutilizable (gris)."
L["Tints action button icons based on range and usability: red = out of range, blue = not enough mana, gray = unusable."] = "Tinta los iconos de botones de acción según alcance y usabilidad: rojo = fuera de alcance, azul = sin maná, gris = inutilizable."
L["Enable Range Indicator"] = "Activar Indicador de Alcance"
L["Color action button icons when target is out of range or ability is unusable."] = "Colorear iconos de botones de acción cuando el objetivo está fuera de alcance o la habilidad es inutilizable."

-- Item Quality Borders
L["Show colored glow borders on action buttons containing items, colored by item quality (green = uncommon, blue = rare, purple = epic, etc.)."] = "Mostrar bordes brillantes de color en botones de acción con objetos, coloreados por calidad (verde = poco común, azul = raro, morado = épico, etc.)."
L["Enable Item Quality Borders"] = "Activar Bordes de Calidad de Objetos"
L["Show quality-colored borders on items in bags, character panel, bank, merchant, and inspect frames."] = "Mostrar bordes de color por calidad en objetos de bolsas, panel de personaje, banco, mercader y marco de inspección."
L["Adds quality-colored glow borders to items in your bags, character panel, bank, merchant, and inspect frames: green = uncommon, blue = rare, purple = epic, orange = legendary."] = "Añade bordes brillantes de calidad a objetos en bolsas, panel de personaje, banco, mercader y marco de inspección: verde = poco común, azul = raro, morado = épico, naranja = legendario."
L["Minimum Quality"] = "Calidad Mínima"
L["Only show colored borders for items at or above this quality level."] = "Solo mostrar bordes de color para objetos de esta calidad o superior."
L["Poor"] = "Pobre"
L["Common"] = "Común"
L["Uncommon"] = "Poco Común"
L["Rare"] = "Raro"
L["Epic"] = "Épico"
L["Legendary"] = "Legendario"

-- Enhanced Tooltips
L["Enhanced Tooltips"] = "Tooltips Mejorados"
L["Improves GameTooltip with class-colored borders, class-colored names, target-of-target info, and styled health bars."] = "Mejora el tooltip con bordes de color de clase, nombres coloreados, info de objetivo del objetivo y barras de vida estilizadas."
L["Activate all tooltip improvements. Sub-options below control individual features."] = "Activar todas las mejoras de tooltips. Las sub-opciones controlan funciones individuales."
L["Class-Colored Border"] = "Borde con Color de Clase"
L["Color the tooltip border by the unit's class (players) or reaction (NPCs)."] = "Colorear el borde del tooltip según la clase de la unidad (jugadores) o reacción (NPCs)."
L["Class-Colored Name"] = "Nombre con Color de Clase"
L["Color the unit name text in the tooltip by class color (players only)."] = "Colorear el nombre de la unidad en el tooltip con el color de clase (solo jugadores)."
L["Add a 'Targeting: <name>' line showing who the unit is targeting."] = "Añadir una línea 'Objetivo: <nombre>' mostrando a quién apunta la unidad."
L["Add a 'Targeting: <name>' line to the tooltip showing who the unit is targeting."] = "Añadir una línea 'Objetivo: <nombre>' al tooltip mostrando a quién apunta la unidad."
L["Styled Health Bar"] = "Barra de Vida Estilizada"
L["Restyle the tooltip health bar with class/reaction colors."] = "Reestilizar la barra de vida del tooltip con colores de clase/reacción."
L["Restyle the tooltip health bar with class/reaction colors and slimmer look."] = "Reestilizar la barra de vida del tooltip con colores de clase/reacción y aspecto más delgado."
L["Anchor to Cursor"] = "Anclar al Cursor"
L["Make the tooltip follow the cursor position instead of the default anchor."] = "Hacer que el tooltip siga la posición del cursor en lugar del anclaje predeterminado."

-- Chat Mods
L["Enable Chat Mods"] = "Activar Mods de Chat"
L["Enables or disables Chat Mods."] = "Activa o desactiva los mods de chat."
L["Editbox Position"] = "Posición del Editbox"
L["Choose where the chat editbox is positioned."] = "Elegir dónde se posiciona el editbox del chat."
L["Top"] = "Arriba"
L["Bottom"] = "Abajo"
L["Middle"] = "Centro"
L["Tab & Button Fade"] = "Desvanecimiento de pestañas y botones"
L["How visible chat tabs are when not hovered. 0 = fully hidden, 1 = fully visible."] = "Visibilidad de las pestañas del chat sin hover. 0 = completamente ocultas, 1 = completamente visibles."
L["Chat Style Opacity"] = "Opacidad del estilo del chat"
L["Minimum opacity of the custom chat background. At 0 it fades with tabs; above 0 it stays partially visible when idle."] = "Opacidad mínima del fondo personalizado del chat. En 0 se desvanece con las pestañas; por encima permanece parcialmente visible en reposo."
L["Text Box Min Opacity"] = "Opacidad mín. del cuadro de texto"
L["Minimum opacity of the text input box when idle. At 0 it fades with tabs; above 0 it stays partially visible."] = "Opacidad mínima del cuadro de texto en reposo. En 0 se desvanece con las pestañas; por encima permanece parcialmente visible."
L["Chat Style"] = "Estilo del chat"
L["Visual style for the chat frame background."] = "Estilo visual del fondo del marco del chat."
L["Editbox Style"] = "Estilo del editbox"
L["Visual style for the chat input box background."] = "Estilo visual del fondo del cuadro de entrada del chat."
L["Dark"] = "Oscuro"
L["DragonUI Style"] = "Estilo DragonUI"
L["Midnight"] = "Medianoche"

-- Combuctor
L["Enable Combuctor"] = "Activar Combuctor"
L["All-in-one bag replacement with item filtering, search, quality indicators, and bank integration."] = "Reemplazo de bolsas todo-en-uno con filtrado de objetos, búsqueda, indicadores de calidad e integración con el banco."
L["Combuctor Settings"] = "Ajustes de Combuctor"

-- Bag Sort
L["Bag Sort"] = "Ordenar Bolsas"
L["Enable Bag Sort"] = "Activar Ordenar Bolsas"
L["Sort buttons for bags and bank. Sorts items by type, rarity, level, and name."] = "Botones para ordenar bolsas y banco. Ordena objetos por tipo, rareza, nivel y nombre."
L["Add sort buttons to bag and bank frames. Also enables /sort and /sortbank slash commands."] = "Añade botones de ordenar a las bolsas y al banco. También habilita los comandos /sort y /sortbank."
L["Sort bags and bank items with buttons"] = "Ordenar bolsas y banco con botones"

L["Show 'All' Tab"] = "Mostrar pestaña 'Todo'"
L["Show the 'All' category tab that displays all items without filtering."] = "Mostrar la pestaña de categoría 'Todo' que muestra todos los objetos sin filtrar."
L["Show Equipment Tab"] = "Mostrar pestaña de Equipo"
L["Show the Equipment category tab for armor and weapons."] = "Mostrar la pestaña de categoría de Equipo para armaduras y armas."
L["Show Usable Tab"] = "Mostrar pestaña de Usables"
L["Show the Usable category tab for consumables and devices."] = "Mostrar la pestaña de categoría de Usables para consumibles y dispositivos."
L["Show Consumable Tab"] = "Mostrar pestaña de Consumibles"
L["Show the Consumable category tab."] = "Mostrar la pestaña de categoría de Consumibles."
L["Show Quest Tab"] = "Mostrar pestaña de Misiones"
L["Show the Quest items category tab."] = "Mostrar la pestaña de categoría de objetos de misión."
L["Show Trade Goods Tab"] = "Mostrar pestaña de Comercio"
L["Show the Trade Goods category tab (includes gems and recipes)."] = "Mostrar la pestaña de categoría de Comercio (incluye gemas y recetas)."
L["Show Miscellaneous Tab"] = "Mostrar pestaña de Miscelánea"
L["Show the Miscellaneous items category tab."] = "Mostrar la pestaña de categoría de objetos misceláneos."
L["Left Side Tabs"] = "Pestañas a la Izquierda"
L["Place category filter tabs on the left side of the bag frame instead of the right."] = "Colocar las pestañas de filtro de categoría en el lado izquierdo del marco de bolsas en lugar del derecho."
L["Place category filter tabs on the left side of the bank frame instead of the right."] = "Coloca las pestañas de filtro de categoría en el lado izquierdo del marco del banco en lugar del derecho."
L["Changes require closing and reopening bags to take effect."] = "Los cambios requieren cerrar y volver a abrir las bolsas para aplicarse."
L["Subtabs"] = "Subpestañas"
L["Configure which bottom subtabs appear within each category tab. Applies to both inventory and bank."] = "Configura qué subpestañas inferiores aparecen dentro de cada pestaña de categoría. Se aplica tanto al inventario como al banco."
L["Normal"] = "Normal"
L["Trade Bags"] = "Bolsas de Profesión"
L["Show the Normal bags subtab (non-profession bags)."] = "Mostrar la subpestaña de bolsas normales (no profesionales)."
L["Show the Trade bags subtab (profession bags)."] = "Mostrar la subpestaña de bolsas de profesión."
L["Show the Armor subtab."] = "Mostrar la subpestaña de Armadura."
L["Show the Weapon subtab."] = "Mostrar la subpestaña de Armas."
L["Show the Trinket subtab."] = "Mostrar la subpestaña de Abalorios."
L["Show the Consumable subtab."] = "Mostrar la subpestaña de Consumibles."
L["Show the Devices subtab."] = "Mostrar la subpestaña de Dispositivos."
L["Show the Trade Goods subtab."] = "Mostrar la subpestaña de Comercio."
L["Show the Gem subtab."] = "Mostrar la subpestaña de Gemas."
L["Show the Recipe subtab."] = "Mostrar la subpestaña de Recetas."
L["Configure Combuctor bag replacement settings."] = "Configura los ajustes de reemplazo de bolsas de Combuctor."
L["Category Tabs"] = "Pestañas de Categoría"
L["Inventory Tabs"] = "Pestañas del Inventario"
L["Bank Tabs"] = "Pestañas del Banco"
L["Inventory"] = "Inventario"
L["Bank"] = "Banco"
L["Choose which category tabs appear on the bag frame. Changes require closing and reopening bags to take effect."] = "Elige qué pestañas de categoría aparecen en el marco de bolsas. Los cambios requieren cerrar y volver a abrir las bolsas para aplicarse."
L["Choose which category tabs appear on the inventory bag frame."] = "Elige qué pestañas de categoría aparecen en el marco de la mochila."
L["Choose which category tabs appear on the bank frame."] = "Elige qué pestañas de categoría aparecen en el marco del banco."
L["Display"] = "Mostrar"

-- Advanced modules - Fallback display names
L["Main Bars"] = "Barras Principales"
L["Vehicle"] = "Vehículo"
L["Multicast"] = "Multicast"
L["Buttons"] = "Botones"
L["Hide Blizzard Elements"] = "Ocultar Elementos de Blizzard"
L["Buffs"] = "Beneficios"
L["KeyBinding"] = "Atajos de Tecla"
L["Cooldowns"] = "Temporizadores"

-- Advanced modules - RegisterModule display names (from module files)
L["Micro Menu"] = "Micro Menú"
L["Loot Roll"] = "Tirada de Botín"
L["Key Binding"] = "Atajos de Tecla"
L["Item Quality"] = "Calidad de Objetos"
L["Buff Frame"] = "Marco de Beneficios"
L["Hide Blizzard"] = "Ocultar Blizzard"
L["Tooltip"] = "Tooltip"

-- Advanced modules - RegisterModule descriptions (from module files)
L["Micro menu and bags system styling and positioning"] = "Estilo y posición del micro menú y bolsas"
L["Quest tracker positioning and styling"] = "Posición y estilo del rastreador de misiones"
L["Enhanced tooltip styling with class colors and health bars"] = "Tooltip mejorado con colores de clase y barras de vida"
L["Hide default Blizzard UI elements"] = "Ocultar elementos de IU predeterminados de Blizzard"
L["Custom minimap styling, positioning, tracking icons and calendar"] = "Estilo, posición, iconos de rastreo y calendario del minimapa"
L["Main action bars, status bars, scaling and positioning"] = "Barras de acción, barras de estado, escala y posición"
L["LibKeyBound integration for intuitive keybinding"] = "Integración LibKeyBound para atajos intuitivos"
L["Color item borders by quality in bags, character panel, bank, and merchant"] = "Colorear bordes de objetos por calidad en bolsas, personaje, banco y mercader"
L["Darken UI borders and chrome"] = "Oscurecer bordes y marcos de la IU"
L["Action button styling and enhancements"] = "Estilo y mejoras de botones de acción"
L["Custom buff frame styling, positioning and toggle button"] = "Estilo, posición y botón del marco de beneficios"
L["Vehicle interface enhancements"] = "Mejoras de interfaz de vehículo"
L["Stance/shapeshift bar positioning and styling"] = "Posición y estilo de barra de postura/forma"
L["Pet action bar positioning and styling"] = "Posición y estilo de barra de mascota"
L["Multicast (totem/possess) bar positioning and styling"] = "Posición y estilo de barra multicast (tótems/posesión)"
L["Chat Mods"] = "Mods de Chat"
L["Chat enhancements: hide buttons, editbox position, URL copy, chat copy, link hover, tell target"] = "Mejoras de chat: ocultar botones, posición de caja de texto, copiar URL, copiar chat, enlaces al pasar el cursor y susurrar al objetivo"
L["Combuctor"] = "Combuctor"
L["All-in-one bag replacement with filtering and search"] = "Reemplazo de bolsas todo en uno con filtros y búsqueda"

-- ============================================================================
-- ACTION BARS TAB
-- ============================================================================

-- Sub-tabs
L["Layout"] = "Distribución"
L["Visibility"] = "Visibilidad"

-- Scales section
L["Action Bar Scales"] = "Escalas de Barras de Acción"
L["Main Bar Scale"] = "Escala de Barra Principal"
L["Right Bar Scale"] = "Escala de Barra Derecha"
L["Left Bar Scale"] = "Escala de Barra Izquierda"
L["Bottom Left Bar Scale"] = "Escala de Barra Inferior Izquierda"
L["Bottom Right Bar Scale"] = "Escala de Barra Inferior Derecha"
L["Scale for main action bar"] = "Escala de la barra de acción principal"
L["Scale for right action bar (MultiBarRight)"] = "Escala de la barra de acción derecha (MultiBarRight)"
L["Scale for left action bar (MultiBarLeft)"] = "Escala de la barra de acción izquierda (MultiBarLeft)"
L["Scale for bottom left action bar (MultiBarBottomLeft)"] = "Escala de la barra de acción inferior izquierda (MultiBarBottomLeft)"
L["Scale for bottom right action bar (MultiBarBottomRight)"] = "Escala de la barra de acción inferior derecha (MultiBarBottomRight)"
L["Reset All Scales"] = "Restablecer Todas las Escalas"
L["Reset all action bar scales to their default values (0.9)"] = "Restablecer todas las escalas de barras de acción a sus valores predeterminados (0.9)"
L["All action bar scales reset to default values (0.9)"] = "Todas las escalas de barras de acción restablecidas a los valores predeterminados (0.9)"
L["All action bar scales reset to 0.9"] = "Todas las escalas de barras de acción restablecidas a 0.9"

-- Positions section
L["Action Bar Positions"] = "Posiciones de Barras de Acción"
L["Tip: Use the Move UI Elements button above to reposition action bars with your mouse."] = "Consejo: Usa el botón Mover Elementos de la IU de arriba para reposicionar las barras con el ratón."
L["Left Bar Horizontal"] = "Barra Izquierda Horizontal"
L["Make the left secondary bar horizontal instead of vertical."] = "Hacer la barra secundaria izquierda horizontal en lugar de vertical."
L["Right Bar Horizontal"] = "Barra Derecha Horizontal"
L["Make the right secondary bar horizontal instead of vertical."] = "Hacer la barra secundaria derecha horizontal en lugar de vertical."

-- Button Appearance section
L["Button Appearance"] = "Apariencia de Botones"
L["Main Bar Only Background"] = "Fondo Solo en Barra Principal"
L["If checked, only the main action bar buttons will have a background. If unchecked, all action bar buttons will have a background."] = "Si se marca, solo los botones de la barra principal tendrán fondo. Si se desmarca, todos los botones de barra de acción tendrán fondo."
L["Only the main action bar buttons will have a background."] = "Solo los botones de la barra de acción principal tendrán fondo."
L["Hide Main Bar Background"] = "Ocultar Fondo de Barra Principal"
L["Hide the background texture of the main action bar (makes it completely transparent)"] = "Ocultar la textura de fondo de la barra de acción principal (la hace completamente transparente)"
L["Hide the background texture of the main action bar."] = "Ocultar la textura de fondo de la barra de acción principal."

-- Text visibility
L["Text Visibility"] = "Visibilidad de Texto"
L["Count Text"] = "Texto de Cantidad"
L["Show Count"] = "Mostrar Cantidad"
L["Show Count Text"] = "Mostrar Texto de Cantidad"
L["Hotkey Text"] = "Texto de Atajo"
L["Show Hotkey"] = "Mostrar Atajo"
L["Show Hotkey Text"] = "Mostrar Texto de Atajo"
L["Range Indicator"] = "Indicador de Alcance"
L["Show small range indicator point on buttons"] = "Mostrar pequeño indicador de alcance en los botones"
L["Show range indicator dot on buttons."] = "Mostrar punto indicador de alcance en los botones."
L["Macro Text"] = "Texto de Macro"
L["Show Macro Names"] = "Mostrar Nombres de Macro"
L["Page Numbers"] = "Números de Página"
L["Show Pages"] = "Mostrar Páginas"
L["Show Page Numbers"] = "Mostrar Números de Página"

-- Cooldown text
L["Cooldown Text"] = "Texto de Reutilización"
L["Min Duration"] = "Duración Mínima"
L["Minimum duration for text triggering"] = "Duración mínima para activar el texto"
L["Minimum duration for cooldown text to appear."] = "Duración mínima para que aparezca el texto de reutilización."
L["Text Color"] = "Color del Texto"
L["Cooldown Text Color"] = "Color del Texto de Reutilización"
L["Size of cooldown text."] = "Tamaño del texto de reutilización."

-- Colors
L["Colors"] = "Colores"
L["Macro Text Color"] = "Color de Texto de Macro"
L["Color for macro text"] = "Color para el texto de macro"
L["Hotkey Shadow Color"] = "Color de Sombra del Atajo"
L["Shadow color for hotkey text"] = "Color de sombra para el texto de atajo"
L["Border Color"] = "Color del Borde"
L["Border color for buttons"] = "Color del borde de los botones"

-- Gryphons
L["Gryphons"] = "Grifos"
L["Gryphon Style"] = "Estilo de Grifo"
L["Display style for the action bar end-cap gryphons."] = "Estilo de visualización de los grifos laterales de la barra de acción."
L["End-cap ornaments flanking the main action bar."] = "Ornamentos laterales que flanquean la barra de acción principal."
L["Gryphon previews are hidden while D3D9Ex is active to avoid client crashes."] = "Las previsualizaciones de grifos se ocultan mientras D3D9Ex está activo para evitar cierres del cliente."
L["Style"] = "Estilo"
L["Old"] = "Antiguo"
L["New"] = "Nuevo"
L["Flying"] = "Volando"
L["Hide Gryphons"] = "Ocultar Grifos"
L["Classic"] = "Clásico"
L["Dragonflight"] = "Dragonflight"
L["Hidden"] = "Oculto"
L["Dragonflight (Wyvern)"] = "Dragonflight (Wyvern)"
L["Dragonflight (Gryphon)"] = "Dragonflight (Grifo)"

-- Layout section
L["Main Bar Layout"] = "Distribución de Barra Principal"
L["Bottom Left Bar Layout"] = "Distribución de Barra Inferior Izquierda"
L["Bottom Right Bar Layout"] = "Distribución de Barra Inferior Derecha"
L["Right Bar Layout"] = "Distribución de Barra Derecha"
L["Left Bar Layout"] = "Distribución de Barra Izquierda"
L["Configure the main action bar grid layout. Rows are determined automatically from columns and buttons shown."] = "Configurar la distribución de la barra de acción principal. Las filas se determinan automáticamente a partir de las columnas y botones mostrados."
L["Columns"] = "Columnas"
L["Buttons Shown"] = "Botones Mostrados"
L["Quick Presets"] = "Preajustes Rápidos"
L["Apply layout presets to multiple bars at once."] = "Aplicar preajustes de distribución a varias barras a la vez."
L["Both 1x12"] = "Ambas 1x12"
L["Both 2x6"] = "Ambas 2x6"
L["Reset All"] = "Restablecer Todo"
L["All bar layouts reset to defaults."] = "Todas las distribuciones de barras restablecidas a valores predeterminados."

-- Visibility section
L["Bar Visibility"] = "Visibilidad de Barras"
L["Control when action bars are visible. Bars can show only on hover, only in combat, or both. When no option is checked the bar is always visible."] = "Controla cuándo son visibles las barras de acción. Las barras pueden mostrarse solo al pasar el cursor, solo en combate, o ambos. Si no se marca ninguna opción, la barra es siempre visible."
L["Enable / Disable Bars"] = "Activar / Desactivar Barras"
L["Bottom Left Bar"] = "Barra Inferior Izquierda"
L["Bottom Right Bar"] = "Barra Inferior Derecha"
L["Right Bar"] = "Barra Derecha"
L["Left Bar"] = "Barra Izquierda"
L["Main Bar"] = "Barra Principal"
L["Show on Hover Only"] = "Mostrar Solo al Pasar el Cursor"
L["Show in Combat Only"] = "Mostrar Solo en Combate"
L["Hide the main bar until you hover over it."] = "Ocultar la barra principal hasta que pases el cursor."
L["Hide the main bar until you enter combat."] = "Ocultar la barra principal hasta que entres en combate."

-- ============================================================================
-- ADDITIONAL BARS TAB
-- ============================================================================

L["Bars that appear based on your class and situation."] = "Barras que aparecen según tu clase y situación."
L["Specialized bars that appear when needed (stance/pet/vehicle/totems)"] = "Barras especializadas que aparecen cuando se necesitan (postura/mascota/vehículo/tótems)"
L["Auto-show bars: Stance (Warriors/Druids/DKs) • Pet (Hunters/Warlocks/DKs) • Vehicle (All classes) • Totem (Shamans)"] = "Barras automáticas: Postura (Guerreros/Druidas/CMs) • Mascota (Cazadores/Brujos/CMs) • Vehículo (Todas las clases) • Tótem (Chamanes)"

-- Common settings
L["Common Settings"] = "Configuración Común"
L["Button Size"] = "Tamaño de Botón"
L["Size of buttons for all additional bars"] = "Tamaño de botones para todas las barras adicionales"
L["Button Spacing"] = "Espaciado de Botones"
L["Space between buttons for all additional bars"] = "Espacio entre botones para todas las barras adicionales"

-- Stance Bar
L["Stance Bar"] = "Barra de Postura"
L["Warriors, Druids, Death Knights"] = "Guerreros, Druidas, Caballeros de la Muerte"
L["X Position"] = "Posición X"
L["Y Position"] = "Posición Y"
L["Y Offset"] = "Desplazamiento Y"
L["Horizontal position of stance bar from screen center. Negative values move left, positive values move right."] = "Posición horizontal de la barra de postura desde el centro de la pantalla. Valores negativos mueven a la izquierda, positivos a la derecha."

-- Pet Bar
L["Pet Bar"] = "Barra de Mascota"
L["Hunters, Warlocks, Death Knights - Use editor mode to move"] = "Cazadores, Brujos, Caballeros de la Muerte - Usa el modo editor para mover"
L["Show Empty Slots"] = "Mostrar Espacios Vacíos"
L["Display empty action slots on pet bar"] = "Mostrar espacios de acción vacíos en la barra de mascota"

-- Vehicle Bar
L["Vehicle Bar"] = "Barra de Vehículo"
L["All classes (vehicles/special mounts)"] = "Todas las clases (vehículos/monturas especiales)"
L["Custom Art Style"] = "Estilo Artístico Personalizado"
L["Use custom vehicle bar art style with health/power bars and themed skin. Requires UI reload to apply."] = "Usar estilo artístico personalizado para la barra de vehículo con barras de vida/poder y skin temática. Requiere recargar la IU."
L["Blizzard Art Style"] = "Estilo Artístico de Blizzard"
L["Use Blizzard vehicle bar art with health/power display. Requires reload."] = "Usar el arte de barra de vehículo de Blizzard con indicador de vida/poder. Requiere recargar."

-- Totem Bar
L["Totem Bar"] = "Barra de Tótems"
L["Totem Bar (Shaman)"] = "Barra de Tótems (Chamán)"
L["Shamans only - Totem multicast bar. Position is controlled via Editor Mode."] = "Solo chamanes - Barra multicast de tótems. La posición se controla mediante el Modo Editor."
L["TIP: Use Editor Mode to position the totem bar (type /dragonui edit)."] = "CONSEJO: Usa el Modo Editor para posicionar la barra de tótems (escribe /dragonui edit)."

-- ============================================================================
-- CAST BARS TAB
-- ============================================================================

L["Player Castbar"] = "Barra de Lanzamiento del Jugador"
L["Target Castbar"] = "Barra de Lanzamiento del Objetivo"
L["Focus Castbar"] = "Barra de Lanzamiento del Foco"

-- Sub-tabs
L["Player"] = "Jugador"
L["Target"] = "Objetivo"
L["Focus"] = "Foco"

-- Common options
L["Width"] = "Ancho"
L["Width of the cast bar"] = "Ancho de la barra de lanzamiento"
L["Height"] = "Alto"
L["Height of the cast bar"] = "Alto de la barra de lanzamiento"
L["Scale"] = "Escala"
L["Size scale of the cast bar"] = "Escala de tamaño de la barra de lanzamiento"
L["Show Icon"] = "Mostrar Icono"
L["Show the spell icon next to the cast bar"] = "Mostrar el icono del hechizo junto a la barra de lanzamiento"
L["Show Spell Icon"] = "Mostrar Icono del Hechizo"
L["Show the spell icon next to the target castbar"] = "Mostrar el icono del hechizo junto a la barra de lanzamiento del objetivo"
L["Icon Size"] = "Tamaño del Icono"
L["Size of the spell icon"] = "Tamaño del icono del hechizo"
L["Text Mode"] = "Modo de Texto"
L["Choose how to display spell text: Simple (centered spell name only) or Detailed (spell name + time)"] = "Elige cómo mostrar el texto del hechizo: Simple (solo nombre centrado) o Detallado (nombre + tiempo)"
L["Simple (Centered Name Only)"] = "Simple (Solo Nombre Centrado)"
L["Simple (Name Only)"] = "Simple (Solo Nombre)"
L["Simple"] = "Simple"
L["Detailed (Name + Time)"] = "Detallado (Nombre + Tiempo)"
L["Detailed"] = "Detallado"
L["Time Precision"] = "Precisión de Tiempo"
L["Decimal places for remaining time."] = "Decimales para el tiempo restante."
L["Max Time Precision"] = "Precisión de Tiempo Máximo"
L["Decimal places for total time."] = "Decimales para el tiempo total."
L["Hold Time (Success)"] = "Tiempo de Retención (Éxito)"
L["How long the bar stays visible after a successful cast."] = "Cuánto tiempo la barra permanece visible tras un lanzamiento exitoso."
L["How long the bar stays after a successful cast."] = "Cuánto tiempo la barra permanece tras un lanzamiento exitoso."
L["How long to show the castbar after successful completion"] = "Cuánto tiempo mostrar la barra tras completar exitosamente"
L["Hold Time (Interrupt)"] = "Tiempo de Retención (Interrupción)"
L["How long the bar stays visible after being interrupted."] = "Cuánto tiempo la barra permanece visible tras ser interrumpida."
L["How long the bar stays after being interrupted."] = "Cuánto tiempo la barra permanece tras ser interrumpida."
L["How long to show the castbar after interruption/failure"] = "Cuánto tiempo mostrar la barra tras interrupción/fallo"
L["Auto-Adjust for Auras"] = "Ajuste Automático por Auras"
L["Automatically adjust position based on target auras (CRITICAL FEATURE)"] = "Ajustar automáticamente la posición según las auras del objetivo (FUNCIÓN CRÍTICA)"
L["Shift castbar when buff/debuff rows are showing."] = "Desplazar la barra de lanzamiento cuando se muestran filas de beneficios/perjuicios."
L["Automatically adjust position based on focus auras"] = "Ajustar automáticamente la posición según las auras del foco"
L["Reset Position"] = "Restablecer Posición"
L["Resets the X and Y position to default."] = "Restablece la posición X e Y a los valores predeterminados."
L["Reset target castbar position to default"] = "Restablecer la posición de la barra de lanzamiento del objetivo"
L["Reset focus castbar position to default"] = "Restablecer la posición de la barra de lanzamiento del foco"
L["Player castbar position reset."] = "Posición de la barra del jugador restablecida."
L["Target castbar position reset."] = "Posición de la barra del objetivo restablecida."
L["Focus castbar position reset."] = "Posición de la barra del foco restablecida."
L["Castbar detached - positioned freely via Editor Mode"] = "Barra de lanzamiento desacoplada - posicion libre con Modo Editor"
L["Castbar attached - follows Target frame"] = "Barra de lanzamiento acoplada - sigue al marco de Objetivo"
L["Castbar attached - follows Focus frame"] = "Barra de lanzamiento acoplada - sigue al marco de Foco"
L["Re-attach Castbar to Target"] = "Volver a acoplar barra al Objetivo"
L["Re-attach Castbar to Focus"] = "Volver a acoplar barra al Foco"

-- Width/height descriptions for target/focus
L["Width of the target castbar"] = "Ancho de la barra de lanzamiento del objetivo"
L["Height of the target castbar"] = "Alto de la barra de lanzamiento del objetivo"
L["Scale of the target castbar"] = "Escala de la barra de lanzamiento del objetivo"
L["Width of the focus castbar"] = "Ancho de la barra de lanzamiento del foco"
L["Height of the focus castbar"] = "Alto de la barra de lanzamiento del foco"
L["Scale of the focus castbar"] = "Escala de la barra de lanzamiento del foco"
L["Show the spell icon next to the focus castbar"] = "Mostrar el icono del hechizo junto a la barra del foco"
L["Time to show the castbar after successful cast completion"] = "Tiempo para mostrar la barra tras completar exitosamente"
L["Time to show the castbar after cast interruption"] = "Tiempo para mostrar la barra tras interrupción"

-- Latency indicator (player only)
L["Latency Indicator"] = "Indicador de Latencia"
L["Enable Latency Indicator"] = "Activar Indicador de Latencia"
L["Show a safe-zone overlay based on real cast latency."] = "Muestra una zona segura basada en la latencia real del casteo."
L["Latency Color"] = "Color de Latencia"
L["Latency Alpha"] = "Opacidad de Latencia"
L["Opacity of the latency indicator."] = "Opacidad del indicador de latencia."

-- ============================================================================
-- ENHANCEMENTS TAB
-- ============================================================================

L["Enhancements"] = "Mejoras"
L["Visual enhancements that add Dragonflight-style polish to the UI. These are optional — disable any you don't want."] = "Mejoras visuales que añaden el estilo Dragonflight a la IU. Son opcionales — desactiva las que no quieras."

-- (Dark Mode, Range Indicator, Item Quality, Tooltips defined above in MODULES section)

-- ============================================================================
-- MICRO MENU TAB
-- ============================================================================

L["Gray Scale Icons"] = "Iconos en Escala de Grises"
L["Grayscale Icons"] = "Iconos en Escala de Grises"
L["Use grayscale icons instead of colored icons for the micro menu"] = "Usar iconos en escala de grises en lugar de iconos a color para el micro menú"
L["Use grayscale icons instead of colored icons."] = "Usar iconos en escala de grises en lugar de iconos a color."
L["Grayscale Icons Settings"] = "Configuración de Iconos en Escala de Grises"
L["Normal Icons Settings"] = "Configuración de Iconos Normales"
L["Menu Scale"] = "Escala del Menú"
L["Icon Spacing"] = "Espaciado de Iconos"
L["Hide on Vehicle"] = "Ocultar en Vehículo"
L["Hide micromenu and bags if you sit on vehicle"] = "Ocultar el micro menú y bolsas al subir a un vehículo"
L["Hide micromenu and bags while in a vehicle."] = "Ocultar el micro menú y bolsas mientras estás en un vehículo."
L["Show Latency Indicator"] = "Mostrar Indicador de Latencia"
L["Show a colored bar below the Help button indicating connection quality (green/yellow/red). Requires UI reload."] = "Mostrar una barra de color debajo del botón de Ayuda indicando la calidad de conexión (verde/amarillo/rojo). Requiere recargar la IU."

-- Bags
L["Bags"] = "Bolsas"
L["Configure the position and scale of the bag bar independently from the micro menu."] = "Configurar la posición y escala de la barra de bolsas independientemente del micro menú."
L["Bag Bar Scale"] = "Escala de Barra de Bolsas"

-- XP & Rep Bars
L["XP & Rep Bars (Legacy Offsets)"] = "Barras de XP y Rep (Desfases Legado)"
L["Main XP & Rep bar options have moved to the XP & Rep Bars tab."] = "Las opciones principales de barras de XP y Rep se han movido a la pestaña Barras de XP y Rep."
L["These offset options are for advanced positioning adjustments."] = "Estas opciones de desfase son para ajustes avanzados de posicionamiento."
L["Both Bars Offset"] = "Desfase de Ambas Barras"
L["Y offset when XP & reputation bar are shown"] = "Desfase Y cuando se muestran las barras de XP y reputación"
L["Single Bar Offset"] = "Desfase de Barra Única"
L["Y offset when XP or reputation bar is shown"] = "Desfase Y cuando se muestra la barra de XP o reputación"
L["No Bar Offset"] = "Desfase Sin Barras"
L["Y offset when no XP or reputation bar is shown"] = "Desfase Y cuando no se muestra ninguna barra de XP o reputación"
L["Rep Bar Above XP Offset"] = "Desfase Barra de Rep Sobre XP"
L["Y offset for reputation bar when XP bar is shown"] = "Desfase Y para la barra de reputación cuando se muestra la barra de XP"
L["Rep Bar Offset"] = "Desfase de Barra de Reputación"
L["Y offset when XP bar is not shown"] = "Desfase Y cuando no se muestra la barra de XP"

-- ============================================================================
-- MINIMAP TAB
-- ============================================================================

L["Basic Settings"] = "Configuración Básica"
L["Border Alpha"] = "Alfa del Borde"
L["Top border alpha (0 to hide)."] = "Alfa del borde superior (0 para ocultar)."
L["Addon Button Skin"] = "Skin de Botones de Addon"
L["Apply DragonUI border styling to addon icons (e.g., bag addons)"] = "Aplicar estilo de borde de DragonUI a iconos de addons (ej., addons de bolsas)"
L["Apply DragonUI border styling to addon icons."] = "Aplicar estilo de borde de DragonUI a iconos de addons."
L["Addon Button Fade"] = "Desvanecimiento de Botones de Addon"
L["Addon icons fade out when not hovered."] = "Los iconos de addons se desvanecen cuando no se pasa el cursor."
L["Player Arrow Size"] = "Tamaño de Flecha del Jugador"
L["Size of the player arrow on the minimap"] = "Tamaño de la flecha del jugador en el minimapa"
L["New Blip Style"] = "Nuevo Estilo de Puntos"
L["Use new DragonUI object icons on the minimap. When disabled, uses classic Blizzard icons."] = "Usar nuevos iconos de objetos de DragonUI en el minimapa. Al desactivar, usa los iconos clásicos de Blizzard."
L["Use newer-style minimap blip icons."] = "Usar iconos de puntos del minimapa de estilo más nuevo."

-- Time & Calendar
L["Time & Calendar"] = "Hora y Calendario"
L["Show Clock"] = "Mostrar Reloj"
L["Show/hide the minimap clock"] = "Mostrar/ocultar el reloj del minimapa"
L["Show Calendar"] = "Mostrar Calendario"
L["Show/hide the calendar frame"] = "Mostrar/ocultar el marco del calendario"
L["Clock Font Size"] = "Tamaño de Fuente del Reloj"
L["Font size for the clock numbers on the minimap"] = "Tamaño de fuente para los números del reloj en el minimapa"

-- Display Settings
L["Display Settings"] = "Configuración de Visualización"
L["Tracking Icons"] = "Iconos de Rastreo"
L["Show current tracking icons (old style)."] = "Mostrar iconos de rastreo actuales (estilo antiguo)."
L["Zoom Buttons"] = "Botones de Zoom"
L["Show zoom buttons (+/-)."] = "Mostrar botones de zoom (+/-)."
L["Zone Text Size"] = "Tamaño de Texto de Zona"
L["Zone Text Font Size"] = "Tamaño de Fuente de Texto de Zona"
L["Zone text font size on top border"] = "Tamaño de fuente del texto de zona en el borde superior"
L["Font size of the zone text above the minimap."] = "Tamaño de fuente del texto de zona sobre el minimapa."

-- Position
L["Position"] = "Posición"
L["Reset minimap to default position (top-right corner)"] = "Restablecer el minimapa a la posición predeterminada (esquina superior derecha)"
L["Reset Minimap Position"] = "Restablecer Posición del Minimapa"
L["Minimap position reset to default"] = "Posición del minimapa restablecida a la predeterminada"
L["Minimap position reset."] = "Posición del minimapa restablecida."

-- ============================================================================
-- QUEST TRACKER TAB
-- ============================================================================

L["Configures the quest objective tracker position and behavior."] = "Configura la posición y comportamiento del rastreador de objetivos de misión."
L["Position and display settings for the objective tracker."] = "Configuración de posición y visualización del rastreador de objetivos."
L["Show Header Background"] = "Mostrar Fondo del Encabezado"
L["Show/hide the decorative header background texture."] = "Mostrar/ocultar la textura decorativa del fondo del encabezado."
L["Anchor Point"] = "Punto de Anclaje"
L["Screen anchor point for the quest tracker."] = "Punto de anclaje en pantalla para el rastreador de misiones."
L["Top Right"] = "Superior Derecha"
L["Top Left"] = "Superior Izquierda"
L["Bottom Right"] = "Inferior Derecha"
L["Bottom Left"] = "Inferior Izquierda"
L["Center"] = "Centro"
L["Horizontal position offset"] = "Desfase de posición horizontal"
L["Vertical position offset"] = "Desfase de posición vertical"
L["Reset quest tracker to default position"] = "Restablecer el rastreador de misiones a la posición predeterminada"
L["Font Size"] = "Tamaño de Fuente"
L["Font size for quest tracker text"] = "Tamaño de fuente para el texto del rastreador de misiones"

-- ============================================================================
-- UNIT FRAMES TAB
-- ============================================================================

-- Sub-tabs
L["Pet"] = "Mascota"
L["ToT / ToF"] = "OdO / OdF"
L["Party"] = "Grupo"

-- Common options
L["Global Scale"] = "Escala Global"
L["Global scale for all unit frames"] = "Escala global para todos los marcos de unidad"
L["Scale of the player frame"] = "Escala del marco del jugador"
L["Scale of the target frame"] = "Escala del marco del objetivo"
L["Scale of the focus frame"] = "Escala del marco del foco"
L["Scale of the pet frame"] = "Escala del marco de la mascota"
L["Scale of the target of target frame"] = "Escala del marco del objetivo del objetivo"
L["Scale of the focus of target frame"] = "Escala del marco del objetivo del foco"
L["Scale of party frames"] = "Escala de los marcos de grupo"
L["Class Color"] = "Color de Clase"
L["Class Color Health"] = "Vida con Color de Clase"
L["Use class color for health bar"] = "Usar color de clase para la barra de vida"
L["Use class color for health bars in party frames"] = "Usar color de clase para las barras de vida en marcos de grupo"
L["Class Portrait"] = "Retrato de Clase"
L["Show class icon instead of 3D portrait"] = "Mostrar icono de clase en lugar de retrato 3D"
L["Show class icon instead of 3D portrait (only for players)"] = "Mostrar icono de clase en lugar de retrato 3D (solo para jugadores)"
L["Class icon instead of 3D model for players."] = "Icono de clase en lugar de modelo 3D para jugadores."
L["Alternative Class Icons"] = "Iconos de clase alternativos"
L["Use DragonUI alternative class icons instead of Blizzard's class icon atlas."] = "Usar los iconos de clase alternativos de DragonUI en lugar del atlas de iconos de clase de Blizzard."
L["Large Numbers"] = "Números Grandes"
L["Format Large Numbers"] = "Formatear Números Grandes"
L["Format large numbers (1k, 1m)"] = "Formatear números grandes (1k, 1m)"
L["Text Format"] = "Formato de Texto"
L["How to display health and mana values"] = "Cómo mostrar los valores de vida y maná"
L["Choose how to display health and mana text"] = "Elegir cómo mostrar el texto de vida y maná"

-- Text format values
L["Current Value Only"] = "Solo Valor Actual"
L["Current Value"] = "Valor Actual"
L["Percentage Only"] = "Solo Porcentaje"
L["Percentage"] = "Porcentaje"
L["Both (Numbers + Percentage)"] = "Ambos (Números + Porcentaje)"
L["Numbers + %"] = "Números + %"
L["Current/Max Values"] = "Valores Actual/Máx"
L["Current / Max"] = "Actual / Máx"

-- Party text format values
L["Current Value Only (2345)"] = "Solo Valor Actual (2345)"
L["Formatted Current (2.3k)"] = "Valor Formateado (2.3k)"
L["Percentage Only (75%)"] = "Solo Porcentaje (75%)"
L["Percentage + Current (75% | 2.3k)"] = "Porcentaje + Actual (75% | 2.3k)"

-- Health/Mana text
L["Always Show Health Text"] = "Siempre Mostrar Texto de Vida"
L["Show health text always (true) or only on hover (false)"] = "Mostrar texto de vida siempre (verdadero) o solo al pasar el cursor (falso)"
L["Always show health text on party frames (instead of only on hover)"] = "Mostrar siempre el texto de vida en marcos de grupo (en lugar de solo al pasar el cursor)"
L["Always display health text (otherwise only on mouseover)"] = "Mostrar siempre el texto de vida (de lo contrario solo al pasar el cursor)"
L["Always Show Mana Text"] = "Siempre Mostrar Texto de Maná"
L["Show mana/power text always (true) or only on hover (false)"] = "Mostrar texto de maná/poder siempre (verdadero) o solo al pasar el cursor (falso)"
L["Always show mana text on party frames (instead of only on hover)"] = "Mostrar siempre el texto de maná en marcos de grupo (en lugar de solo al pasar el cursor)"
L["Always display mana/energy/rage text (otherwise only on mouseover)"] = "Mostrar siempre texto de maná/energía/ira (de lo contrario solo al pasar el cursor)"

-- Player frame specific
L["Player Frame"] = "Marco del Jugador"
L["Dragon Decoration"] = "Decoración de Dragón"
L["Add decorative dragon to your player frame for a premium look"] = "Añadir dragón decorativo a tu marco de jugador para un aspecto premium"
L["None"] = "Ninguno"
L["Elite Dragon (Golden)"] = "Dragón Élite (Dorado)"
L["Elite (Golden)"] = "Élite (Dorado)"
L["RareElite Dragon (Winged)"] = "Dragón RaroÉlite (Alado)"
L["RareElite (Winged)"] = "RaroÉlite (Alado)"
L["Glow Effects"] = "Efectos de Brillo"
L["Show Rest Glow"] = "Mostrar Brillo de Descanso"
L["Show a golden glow around the player frame when resting (in an inn or city). Works with all frame modes: normal, elite, fat health bar, and vehicle."] = "Mostrar un brillo dorado alrededor del marco del jugador al descansar (en una posada o ciudad). Funciona con todos los modos: normal, élite, barra de vida ancha y vehículo."
L["Golden glow around the player frame when resting (inn or city). Works with all frame modes."] = "Brillo dorado alrededor del marco del jugador al descansar (posada o ciudad). Funciona con todos los modos."
L["Combat Flash"] = "Flash de Combate"
L["Show Combat Flash"] = "Mostrar Flash de Combate"
L["Pulsing glow effect when entering combat. Works with all frame modes."] = "Efecto de brillo pulsante al entrar en combate. Funciona con todos los modos de marco."
L["Combat Flash Opacity"] = "Opacidad del Flash de Combate"
L["Maximum opacity of the combat flash pulse effect."] = "Opacidad máxima del efecto de pulso del flash de combate."
L["Always Show Alternate Mana Text"] = "Siempre Mostrar Texto de Maná Alternativo"
L["Show mana text always visible (default: hover only)"] = "Mostrar texto de maná siempre visible (predeterminado: solo al pasar el cursor)"
L["Alternate Mana (Druid)"] = "Maná Alternativo (Druida)"
L["Always Show"] = "Siempre Mostrar"
L["Druid mana text visible at all times, not just on hover."] = "Texto de maná de druida visible en todo momento, no solo al pasar el cursor."
L["Alternate Mana Text Format"] = "Formato de Texto de Maná Alternativo"
L["Choose text format for alternate mana display"] = "Elegir formato de texto para la visualización de maná alternativo"
L["Percentage + Current/Max"] = "Porcentaje + Actual/Máx"

-- Fat Health Bar
L["Health Bar Style"] = "Estilo de Barra de Vida"
L["Fat Health Bar"] = "Barra de Vida Ancha"
L["Enable"] = "Activar"
L["Full-width health bar that fills the entire frame area. Uses modified border texture that removes the inner divider line. Compatible with Dragon Decoration (requires fat variant textures). Note: Automatically disabled during vehicle UI."] = "Barra de vida de ancho completo que llena toda el área del marco. Usa textura de borde modificada que elimina la línea divisoria interior. Compatible con la Decoración de Dragón (requiere texturas de variante ancha). Nota: Se desactiva automáticamente durante la IU de vehículo."
L["Full-width health bar. Auto-disabled in vehicles."] = "Barra de vida de ancho completo. Se desactiva automáticamente en vehículos."
L["Hide Mana Bar (Fat Mode)"] = "Ocultar Barra de Maná (Modo Ancho)"
L["Hide Mana Bar"] = "Ocultar Barra de Maná"
L["Completely hide the mana bar when Fat Health Bar is active."] = "Ocultar completamente la barra de maná cuando la Barra de Vida Ancha está activa."
L["Mana Bar Width (Fat Mode)"] = "Ancho de Barra de Maná (Modo Ancho)"
L["Mana Bar Width"] = "Ancho de Barra de Maná"
L["Width of the mana bar when Fat Health Bar is active. Movable via Editor Mode."] = "Ancho de la barra de maná cuando la Barra de Vida Ancha está activa. Movible mediante el Modo Editor."
L["Mana Bar Height (Fat Mode)"] = "Alto de Barra de Maná (Modo Ancho)"
L["Mana Bar Height"] = "Alto de Barra de Maná"
L["Height of the mana bar when Fat Health Bar is active."] = "Alto de la barra de maná cuando la Barra de Vida Ancha está activa."
L["Mana Bar Texture"] = "Textura de Barra de Maná"
L["Choose the texture style for the power/mana bar. Only applies in Fat Health Bar mode."] = "Elegir el estilo de textura para la barra de poder/maná. Solo se aplica en modo Barra de Vida Ancha."
L["DragonUI (Default)"] = "DragonUI (Predeterminado)"
L["Blizzard Classic"] = "Blizzard Clásico"
L["Flat Solid"] = "Sólido Plano"
L["Smooth"] = "Suave"
L["Aluminium"] = "Aluminio"
L["LiteStep"] = "LiteStep"

-- Power Bar Colors
L["Power Bar Colors"] = "Colores de Barra de Poder"
L["Mana"] = "Maná"
L["Rage"] = "Ira"
L["Energy"] = "Energía"
-- L["Focus"] = true  -- Already defined above
L["Runic Power"] = "Poder Rúnico"
L["Happiness"] = "Felicidad"
L["Runes"] = "Runas"
L["Reset Colors to Default"] = "Restablecer Colores por Defecto"

-- Target frame
L["Target Frame"] = "Marco del Objetivo"
L["Threat Glow"] = "Brillo de Amenaza"
L["Show threat glow effect"] = "Mostrar efecto de brillo de amenaza"
L["Show Name Background"] = "Mostrar Fondo del Nombre"
L["Show the colored name background behind the target name."] = "Muestra el fondo de color detrás del nombre del objetivo."

-- Focus frame
L["Focus Frame"] = "Marco del Foco"
L["Show the colored name background behind the focus name."] = "Muestra el fondo de color detrás del nombre del foco."
L["Show Buff/Debuff on Focus"] = "Mostrar buffs/debuffs en el foco"
L["Uses the native large focus frame mode to show buffs and debuffs on the focus frame."] = "Usa el modo nativo de marco de foco grande para mostrar buffs y debuffs en el marco de foco."
L["Override Position"] = "Anular Posición"
L["Override default positioning"] = "Anular el posicionamiento predeterminado"
L["Move the pet frame independently from the player frame."] = "Mover el marco de mascota independientemente del marco del jugador."

-- Pet frame
L["Pet Frame"] = "Marco de Mascota"
L["Allows the pet frame to be moved freely. When unchecked, it will be positioned relative to the player frame."] = "Permite mover el marco de mascota libremente. Si se desmarca, se posicionará relativamente al marco del jugador."
L["Horizontal position (only active if Override is checked)"] = "Posición horizontal (solo activo si Anular está marcado)"
L["Vertical position (only active if Override is checked)"] = "Posición vertical (solo activo si Anular está marcado)"

-- Target of Target
L["Target of Target"] = "Objetivo del Objetivo"
L["Follows the Target frame by default. Move it in Editor Mode (/dragonui edit) to detach and position freely."] = "Sigue al marco del Objetivo por defecto. Muévelo en el Modo Editor (/dragonui edit) para desanclar y posicionar libremente."
L["Detached — positioned freely via Editor Mode"] = "Desanclado — posicionado libremente mediante el Modo Editor"
L["Attached — follows Target frame"] = "Anclado — sigue al marco del Objetivo"
L["Re-attach to Target"] = "Re-anclar al Objetivo"

-- Target of Focus
L["Target of Focus"] = "Objetivo del Foco"
L["Follows the Focus frame by default. Move it in Editor Mode (/dragonui edit) to detach and position freely."] = "Sigue al marco del Foco por defecto. Muévelo en el Modo Editor (/dragonui edit) para desanclar y posicionar libremente."
L["Attached — follows Focus frame"] = "Anclado — sigue al marco del Foco"
L["Re-attach to Focus"] = "Re-anclar al Foco"

-- Party Frames
L["Party Frames"] = "Marcos de Grupo"
L["Party Frames Configuration"] = "Configuración de Marcos de Grupo"
L["Custom styling for party member frames with automatic health/mana text display and class colors."] = "Estilo personalizado para marcos de miembros de grupo con texto automático de vida/maná y colores de clase."

-- Boss Frames
L["Boss Frames"] = "Marcos de Jefe"
L["Enabled"] = "Activado"

L["Orientation"] = "Orientación"
L["Vertical"] = "Vertical"
L["Horizontal"] = "Horizontal"
L["Party frame orientation"] = "Orientación de marcos de grupo"
L["Vertical Padding"] = "Espaciado Vertical"
L["Space between party frames in vertical mode."] = "Espacio entre marcos de grupo en modo vertical."
L["Horizontal Padding"] = "Espaciado Horizontal"
L["Space between party frames in horizontal mode."] = "Espacio entre marcos de grupo en modo horizontal."

-- ============================================================================
-- XP & REP BARS TAB
-- ============================================================================

L["Bar Style"] = "Estilo de Barra"
L["XP / Rep Bar Style"] = "Estilo de Barra de XP / Rep"
L["DragonflightUI: fully custom bars with rested XP background.\nRetailUI: atlas-based reskin of Blizzard bars.\n\nChanging style requires a UI reload."] = "DragonflightUI: barras completamente personalizadas con fondo de XP descansada.\nRetailUI: reskin basado en atlas de las barras de Blizzard.\n\nCambiar el estilo requiere recargar la IU."
L["DragonflightUI"] = "DragonflightUI"
L["RetailUI"] = "RetailUI"
L["XP bar style changed to "] = "Estilo de barra de XP cambiado a "
L["A UI reload is required to apply this change."] = "Se requiere recargar la IU para aplicar este cambio."

-- Size & Scale
L["Size & Scale"] = "Tamaño y Escala"
L["Bar Height"] = "Altura de Barra"
L["Height of the XP and Reputation bars (in pixels)."] = "Altura de las barras de XP y Reputación (en píxeles)."
L["Experience Bar Scale"] = "Escala de Barra de Experiencia"
L["Scale of the experience bar."] = "Escala de la barra de experiencia."
L["Reputation Bar Scale"] = "Escala de Barra de Reputación"
L["Scale of the reputation bar."] = "Escala de la barra de reputación."

-- Rested XP
L["Rested XP"] = "XP Descansada"
L["Show Rested XP Background"] = "Mostrar Fondo de XP Descansada"
L["Display a translucent bar showing the total available rested XP range.\n(DragonflightUI style only)"] = "Mostrar una barra translúcida con el rango total de XP descansada disponible.\n(Solo estilo DragonflightUI)"
L["Show Exhaustion Tick"] = "Mostrar Marca de Agotamiento"
L["Show the exhaustion tick indicator on the XP bar, marking where rested XP ends."] = "Mostrar el indicador de agotamiento en la barra de XP, marcando dónde termina la XP descansada."

-- Text Display
L["Text Display"] = "Visualización de Texto"
L["Always Show Text"] = "Siempre Mostrar Texto"
L["Always display XP/Rep text instead of only on hover."] = "Mostrar siempre el texto de XP/Reputación en lugar de solo al pasar el cursor."
L["Show XP Percentage"] = "Mostrar Porcentaje de XP"
L["Display XP percentage alongside the value text."] = "Mostrar el porcentaje de XP junto al texto de valor."

-- ============================================================================
-- PROFILES TAB
-- ============================================================================

L["Database not available."] = "Base de datos no disponible."
L["Save and switch between different configurations per character."] = "Guardar y cambiar entre diferentes configuraciones por personaje."
L["Current Profile"] = "Perfil Actual"
L["Active: "] = "Activo: "
L["Switch or Create Profile"] = "Cambiar o Crear Perfil"
L["Select Profile"] = "Seleccionar Perfil"
L["New Profile Name"] = "Nombre del Nuevo Perfil"
L["Copy From"] = "Copiar Desde"
L["Copies all settings from the selected profile into your current one."] = "Copia todas las configuraciones del perfil seleccionado al actual."
L["Copied profile: "] = "Perfil copiado: "
L["Delete Profile"] = "Eliminar Perfil"
L["Warning: Deleting a profile is permanent and cannot be undone."] = "Aviso: Eliminar un perfil es permanente y no se puede deshacer."
L["Delete"] = "Eliminar"
L["Deleted profile: "] = "Perfil eliminado: "
L["Are you sure you want to delete the profile '%s'? This cannot be undone."] = "¿Estás seguro de que quieres eliminar el perfil '%s'? Esto no se puede deshacer."
L["Reset Current Profile"] = "Restablecer Perfil Actual"
L["Restores the current profile to its defaults. This cannot be undone."] = "Restaura el perfil actual a sus valores predeterminados. Esto no se puede deshacer."
L["Reset Profile"] = "Restablecer Perfil"
L["All changes will be lost and the UI will be reloaded.\nAre you sure you want to reset your profile?"] = "Todos los cambios se perderán y la IU se recargará.\n¿Estás seguro de que quieres restablecer tu perfil?"
L["Profile reset to defaults."] = "Perfil restablecido a los valores predeterminados."

-- UNIT FRAME LAYERS MODULE
L["Unit Frame Layers"] = "Capas de Marcos de Unidad"
L["Enable Unit Frame Layers"] = "Activar Capas de Marcos de Unidad"
L["Heal prediction, absorb shields, and animated health loss on unit frames"] = "Predicción de sanación, escudos de absorción y pérdida de salud animada en marcos de unidad"
L["Heal prediction bars, absorb shields, and animated health loss overlays on unit frames."] = "Barras de predicción de sanación, escudos de absorción y capas de pérdida de salud animada en marcos de unidad."
L["Show heal prediction, absorb shields, and animated health loss on all unit frames."] = "Mostrar predicción de sanación, escudos de absorción y pérdida de salud animada en todos los marcos de unidad."
L["Animated Health Loss"] = "Pérdida de Vida Animada"
L["Show animated red health loss bar on player frame when taking damage."] = "Mostrar barra roja animada de pérdida de salud en el marco del jugador al recibir daño."
L["Builder/Spender Feedback"] = "Retroalimentación de Generadores/Gastadores"
L["Show mana gain/loss glow feedback on player mana bar (experimental)."] = "Mostrar brillo de ganancia/pérdida de maná en la barra de maná del jugador (experimental)."

-- LAYOUT PRESETS
L["Layout Presets"] = "Preajustes de Diseño"
L["Save and restore complete UI layouts. Each preset captures all positions, scales, and settings."] = "Guarda y restaura diseños completos de interfaz. Cada preajuste captura todas las posiciones, escalas y configuraciones."
L["No presets saved yet."] = "Aún no hay preajustes guardados."
L["Save New Preset"] = "Guardar Nuevo Preajuste"
L["Save your current UI layout as a new preset."] = "Guarda tu diseño de interfaz actual como un nuevo preajuste."
L["Preset"] = "Preajuste"
L["Enter a name for this preset:"] = "Introduce un nombre para este preajuste:"
L["Save"] = "Guardar"
L["Load"] = "Cargar"
L["Load preset '%s'? This will overwrite your current layout settings."] = "¿Cargar preajuste '%s'? Esto sobrescribirá tu configuración de diseño actual."
L["Load Preset"] = "Cargar Preajuste"
L["Delete preset '%s'? This cannot be undone."] = "¿Eliminar preajuste '%s'? Esto no se puede deshacer."
L["Delete Preset"] = "Eliminar Preajuste"
L["Duplicate Preset"] = "Duplicar Preajuste"
L["Preset saved: "] = "Preajuste guardado: "
L["Preset loaded: "] = "Preajuste cargado: "
L["Preset deleted: "] = "Preajuste eliminado: "
L["Preset duplicated: "] = "Preajuste duplicado: "
L["Also delete all saved layout presets?"] = "¿Eliminar también todos los preajustes de diseño guardados?"
L["Presets kept."] = "Preajustes conservados."

-- PRESET IMPORT / EXPORT
L["Export Preset"] = "Exportar Preajuste"
L["Import Preset"] = "Importar Preajuste"
L["Import a preset from a text string shared by another player."] = "Importa un preajuste desde un texto compartido por otro jugador."
L["Import"] = "Importar"
L["Select All"] = "Seleccionar Todo"
L["Close"] = "Cerrar"
L["Enter a name for the imported preset:"] = "Introduce un nombre para el preajuste importado:"
L["Imported Preset"] = "Preajuste Importado"
L["Preset imported: "] = "Preajuste importado: "
L["Invalid preset string."] = "Texto de preajuste no válido."
L["Not a valid DragonUI preset string."] = "No es un texto de preajuste DragonUI válido."
L["Failed to export preset."] = "Error al exportar el preajuste."

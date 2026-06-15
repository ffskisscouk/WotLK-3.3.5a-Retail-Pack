--[[
================================================================================
DragonUI_Options - 繁體中文本地化檔案
================================================================================
選項面板基礎本地化：標籤、描述、分區標題、下拉選單值、列印資訊、彈出文字。

新增字串時：
1. 在此處新增 L[<你的鍵>] = true
2. 在選項程式碼中使用 L["你的字串"]
3. 為其他本地化檔案新增翻譯
================================================================================
]]

local L = LibStub("AceLocale-3.0"):NewLocale("DragonUI_Options", "zhTW")
if not L then return end

-- ============================================================================
-- 通用 / 面板
-- ============================================================================

L["DragonUI"] = "DragonUI"
L["Use the tabs on the left to configure modules, action bars, unit frames, minimap, and more."] = "使用左側標籤頁配置模組、動作條、單位框架、小地圖等。"
L["Editor Mode"] = "編輯模式"
L["Exit Editor Mode"] = "退出編輯模式"
L["KeyBind Mode Active"] = "按鍵繫結模式已啟用"
L["Move UI Elements"] = "移動介面元素"
L["Cannot open options during combat."] = "戰鬥中無法開啟選項。"
L["Open DragonUI Settings"] = "開啟DragonUI設定"
L["Open the DragonUI configuration panel."] = "開啟DragonUI配置面板。"
L["Use /dragonui to open the full settings panel."] = "輸入 /dragonui 以開啟完整設定面板。"

-- 快速操作
L["Quick Actions"] = "快速設定"
L["Jump to popular settings sections."] = "快速跳轉到常用設定分割槽。"
L["Action Bar Layout"] = "動作條佈局"
L["Configure dark tinting for all UI chrome."] = "為所有介面裝飾元素配置深色著色。"
L["Full-width health bar that fills the entire player frame."] = "填滿整個玩家框架的寬體生命條。"
L["Add a decorative dragon to your player frame."] = "為你的玩家框架新增裝飾性的龍。"
L["Heal prediction, absorb shields and animated health loss."] = "治療預估、吸收護盾和動態生命值損失。"
L["Change columns, rows, and buttons shown per action bar."] = "更改每個動作條顯示的列、行和按鈕數量。"
L["Switch micro menu icons between colored and grayscale style."] = "在彩色和灰度風格之間切換微型選單圖示。"
L["About"] = "關於"
L["Bringing the retail WoW look to 3.3.5a, inspired by Dragonflight UI."] = "受巨龍時代UI啟發，為3.3.5a版本帶來正式服《魔獸世界》的外觀。"
L["Created and maintained by Neticsoul, with community contributions."] = "由Neticsoul建立和維護，並有社群貢獻。"

L["Commands: /dragonui, /dui, /pi — /dragonui edit (editor) — /dragonui help"] = "命令：/dragonui, /dui, /pi — /dragonui edit (編輯) — /dragonui help"
L["GitHub (select and Ctrl+C to copy):"] = "GitHub (選中後按Ctrl+C複製)："
L["All"] = "全部"
L["Error:"] = "錯誤："
L["Error: DragonUI addon not found!"] = "錯誤：未找到DragonUI外掛！"

-- ============================================================================
-- 靜態彈出框
-- ============================================================================

L["Changing this setting requires a UI reload to apply correctly."] = "更改此設定需要重新載入介面才能正確應用。"
L["Reload UI"] = "重新載入介面"
L["Not Now"] = "以後再說"
L["Reload Now"] = "立即過載"
L["Cancel"] = "取消"
L["Yes"] = "是"
L["No"] = "否"

-- ============================================================================
-- 標籤頁名稱
-- ============================================================================

L["General"] = "通用"
L["Modules"] = "模組"
L["Action Bars"] = "動作條"
L["Additional Bars"] = "附加動作條"
L["Minimap"] = "小地圖"
L["Profiles"] = "配置檔案"
L["Unit Frames"] = "單位框架"
L["XP & Rep Bars"] = "經驗值 & 聲望條"
L["Chat"] = "聊天"
L["Appearance"] = "\u5916\u89c0"


-- ============================================================================
-- 模組標籤頁
-- ============================================================================

-- 標題和描述
L["Module Control"] = "模組控制"
L["Enable or disable specific DragonUI modules"] = "啟用或禁用特定的DragonUI模組"
L["Toggle individual modules on or off. Disabled modules revert to the default Blizzard UI."] = "切換單個模組的啟用/禁用。禁用的模組將恢復為預設的暴雪介面。"
L["Visual enhancements that add Dragonflight-style polish to the UI."] = "為介面新增巨龍時代風格潤色的視覺增強功能。"
L["Warning: These are individual module controls. The options above may control multiple modules at once. Changes here will be reflected above and vice versa."] = "警告：這是單個模組的控制。上方的選項可能同時控制多個模組。此處的更改會反映在上方，反之亦然。"
L["Warning:"] = "警告："
L["Individual overrides. The grouped toggles above take priority."] = "單個模組的覆蓋設定。上方的分組開關具有優先順序。"
L["Advanced - Individual Module Control"] = "高階 - 單個模組控制"

-- 分割槽標題
L["Cast Bars"] = "施法條"
L["Other Modules"] = "其他模組"
L["UI Systems"] = "介面系統"
L["Enable All Action Bar Modules"] = "啟用所有動作條模組"
L["Cast Bar"] = "施法條"
L["Custom player, target, and focus cast bars"] = "自定義玩家、目標和焦點的施法條"
L["Cooldown text on action buttons"] = "動作按鈕上的冷卻時間文字"
L["Shaman totem bar positioning and styling"] = "薩滿圖騰條的位置和樣式"
L["Dragonflight-styled player unit frame"] = "巨龍時代風格的玩家單位框架"
L["Dragonflight-styled boss target frames"] = "巨龍時代風格的團隊首領目標框架"

-- 開關標籤
L["Action Bars System"] = "動作條系統"
L["Micro Menu & Bags"] = "微型選單和揹包"
L["Cooldown Timers"] = "冷卻計時器"
L["Minimap System"] = "小地圖系統"
L["Buff Frame System"] = "增益效果框體系統"
L["Dark Mode"] = "暗色模式"
L["Item Quality Borders"] = "物品品質邊框"
L["Enable Enhanced Tooltips"] = "啟用增強型滑鼠提示"
L["KeyBind Mode"] = "按鍵繫結模式"
L["Quest Tracker"] = "任務追蹤器"

-- 模組開關描述
L["Enable DragonUI player castbar. When disabled, shows default Blizzard castbar."] = "啟用DragonUI玩家施法條。禁用時，顯示預設的暴雪施法條。"
L["Enable DragonUI player castbar styling."] = "啟用DragonUI玩家施法條樣式。"
L["Enable DragonUI target castbar. When disabled, shows default Blizzard castbar."] = "啟用DragonUI目標施法條。禁用時，顯示預設的暴雪施法條。"
L["Enable DragonUI target castbar styling."] = "啟用DragonUI目標施法條樣式。"
L["Enable DragonUI focus castbar. When disabled, shows default Blizzard castbar."] = "啟用DragonUI焦點施法條。禁用時，顯示預設的暴雪施法條。"
L["Enable DragonUI focus castbar styling."] = "啟用DragonUI焦點施法條樣式。"
L["Enable the complete DragonUI action bars system. This controls: Main action bars, vehicle interface, stance/shapeshift bars, pet action bars, multicast bars (totems/possess), button styling, and hide Blizzard elements. When disabled, all action bar related features will use default Blizzard interface."] = "啟用完整的DragonUI動作條系統。控制內容包括：主動作條、載具介面、姿態/變形條、寵物動作條、多目標條（圖騰/控制）、按鈕樣式，以及隱藏暴雪元素。禁用時，所有動作條相關功能將使用預設的暴雪介面。"
L["Master toggle for the complete action bars system."] = "動作條系統的總開關。"
L["Includes main bars, vehicle, stance, pet, totem bars, and button styling."] = "包括主動作條、載具、姿態、寵物、圖騰條和按鈕樣式。"
L["Apply DragonUI micro menu and bags system styling and positioning. Includes character button, spellbook, talents, etc. and bag management. When disabled, these elements will use default Blizzard positioning and styling."] = "應用DragonUI微型選單和揹包系統的樣式和位置。包括角色按鈕、法術書、天賦等以及揹包管理。禁用時，這些元素將使用預設的暴雪位置和樣式。"
L["Micro menu and bags styling."] = "微型選單和揹包樣式。"
L["Show cooldown timers on action buttons. When disabled, cooldown timers will be hidden and the system will be completely deactivated."] = "在動作按鈕上顯示冷卻計時器。禁用時，冷卻計時器將被隱藏，系統將完全停用。"
L["Show cooldown timers on action buttons."] = "在動作條上顯示冷卻時間數字。"
L["Enable DragonUI minimap enhancements including custom styling, positioning, tracking icons, and calendar. When disabled, uses default Blizzard minimap appearance and positioning."] = "啟用DragonUI小地圖增強功能，包括自定義樣式、位置、追蹤圖示和日曆。禁用時，使用預設的暴雪小地圖外觀和位置。"
L["Minimap styling, tracking icons, and calendar."] = "小地圖樣式、追蹤圖示和日曆。"
L["Enable DragonUI buff frame with custom styling, positioning, and toggle button functionality. When disabled, uses default Blizzard buff frame appearance and positioning."] = "啟用具有自定義樣式、位置和切換按鈕功能的DragonUI增益效果框體。禁用時，使用預設的暴雪增益效果框體外觀和位置。"
L["Buff frame styling and toggle button."] = "增益效果框體樣式和切換按鈕。"
L["Auras"] = "光環"
L["Show Toggle Button"] = "顯示切換按鈕"
L["Show a collapse/expand button next to the buff icons."] = "在增益圖示旁顯示收合/展開按鈕。"
L["Separate Weapon Enchants"] = "分離武器附魔"
L["Detach weapon enchant icons (poisons, sharpening stones, etc.) from the buff bar into their own independently moveable frame. Position it freely using Editor Mode."] = "將武器附魔圖示（毒藥、磨刀石等）從增益效果條分離到它們自己獨立可移動的框體中。使用編輯模式自由放置。"
L["Weapon Enchants"] = "武器附魔"
L["Weapon enchant icons include rogue poisons, sharpening stones, wizard oils, and similar temporary weapon enhancements."] = "武器附魔圖示包括：盜賊毒藥、磨刀石、巫師之油及其他類似的臨時武器強化效果。"
L["When enabled, a 'Weapon Enchants' mover appears in Editor Mode that you can drag to any position on screen."] = "啟用後，編輯模式中會出現“武器附魔”移動器，可將其拖拽到螢幕任何位置。"
L["Positions"] = "位置"
L["Reset Buff Frame Position"] = "重置增益效果框體位置"
L["Reset Weapon Enchant Position"] = "重置武器附魔位置"
L["Buff frame position reset."] = "增益效果框體位置已重置。"
L["Weapon enchant position reset."] = "武器附魔位置已重置。"

L["DragonUI quest tracker positioning and styling."] = "DragonUI任務追蹤器的位置和樣式設定。"
L["LibKeyBound integration for intuitive hover + key press binding."] = "滑鼠懸停+按鍵繫結的直觀按鍵繫結（LibKeyBound）功能。"

-- 切換按鍵繫結模式描述
L["Toggle keybinding mode. Hover over action buttons and press keys to bind them instantly. Press ESC to clear bindings."] = "切換按鍵繫結模式。將滑鼠懸停在動作按鈕上並按鍵盤按鍵即可立即繫結。按ESC鍵清除繫結。"

-- 啟用/禁用動態描述
L["Enable/disable "] = "啟用/禁用："

-- 暗色模式
L["Dark Mode Intensity"] = "暗色模式強度"
L["Light (subtle)"] = "淺（輕微）"
L["Medium (balanced)"] = "中（均衡）"
L["Dark (maximum)"] = "深（最大）"
L["Apply darker tinted textures to all UI chrome: action bars, unit frames, minimap, bags, micro menu, and more."] = "對所有介面裝飾元素應用深色紋理：動作條、單位框架、小地圖、揹包、微型選單等。"
L["Apply darker tinted textures to all UI elements."] = "對所有介面元素應用深色著色。"
L["Darkens UI borders and chrome only: action bar borders, unit frame borders, minimap border, bag slot borders, micro menu, castbar borders, and decorative elements. Icons, portraits, and abilities are never affected."] = "僅使介面邊框和裝飾變暗：動作條邊框、單位框架邊框、小地圖邊框、揹包格子邊框、微型選單、施法條邊框和裝飾元素。圖示、頭像和技能不受影響。"
L["Enable Dark Mode"] = "啟用暗色模式"

-- 暗色模式 - 自定義顏色
L["Custom Color"] = "自定義顏色"
L["Override presets with a custom tint color."] = "使用自定義色調顏色覆蓋預設。"
L["Tint Color"] = "色調選擇"
L["Intensity"] = "明暗濃度"

-- 距離指示器
L["Tint action button icons when target is out of range (red), not enough mana (blue), or unusable (gray)."] = "當目標超出範圍（紅色）、法力不足（藍色）或無法使用時（灰色），為動作按鈕圖示著色。"
L["Tints action button icons based on range and usability: red = out of range, blue = not enough mana, gray = unusable."] = "根據距離和使用情況為動作按鈕圖示著色：紅色=超出範圍，藍色=法力不足，灰色=不可用。"
L["Enable Range Indicator"] = "啟用距離指示器"
L["Color action button icons when target is out of range or ability is unusable."] = "當目標超出範圍或技能無法使用時，為動作條圖示著色。"

-- 物品品質邊框
L["Show colored glow borders on action buttons containing items, colored by item quality (green = uncommon, blue = rare, purple = epic, etc.)."] = "在包含物品的動作按鈕上顯示按物品品質著色的發光邊框（綠色=優秀，藍色=精良，紫色=史詩等）。"
L["Enable Item Quality Borders"] = "啟用物品品質邊框"
L["Show quality-colored borders on items in bags, character panel, bank, merchant, and inspect frames."] = "在揹包、角色面板、銀行、商人視窗和觀察視窗中的物品上顯示按品質著色的邊框。"
L["Adds quality-colored glow borders to items in your bags, character panel, bank, merchant, and inspect frames: green = uncommon, blue = rare, purple = epic, orange = legendary."] = "為揹包、角色面板、銀行、商人和觀察視窗中的物品新增按品質著色的發光邊框：綠色=優秀，藍色=精良，紫色=史詩，橙色=傳說。"
L["Minimum Quality"] = "最低品質"
L["Only show colored borders for items at or above this quality level."] = "僅為此品質等級及以上的物品顯示彩色邊框。"
L["Poor"] = "粗糙"
L["Common"] = "普通"
L["Uncommon"] = "優秀"
L["Rare"] = "精良"
L["Epic"] = "史詩"
L["Legendary"] = "傳說"

-- 增強型滑鼠提示
L["Enhanced Tooltips"] = "增強型滑鼠提示"
L["Improves GameTooltip with class-colored borders, class-colored names, target-of-target info, and styled health bars."] = "改進遊戲內滑鼠提示：職業顏色邊框、職業顏色名稱、目標的目標資訊以及樣式化的生命條。"
L["Activate all tooltip improvements. Sub-options below control individual features."] = "啟用所有滑鼠提示改進功能。下方子選項控制單個功能。"
L["Class-Colored Border"] = "職業顏色邊框"
L["Color the tooltip border by the unit's class (players) or reaction (NPCs)."] = "根據單位職業（玩家）或關係（NPC）為滑鼠提示邊框著色。"
L["Class-Colored Name"] = "職業顏色名稱"
L["Color the unit name text in the tooltip by class color (players only)."] = "在滑鼠提示中，根據職業顏色顯示單位名稱文字（僅限玩家）。"
L["Add a 'Targeting: <name>' line showing who the unit is targeting."] = "新增一行“目標：<名字>”以顯示該單位的目標是誰。"
L["Add a 'Targeting: <name>' line to the tooltip showing who the unit is targeting."] = "在滑鼠提示中新增一行“目標：<名字>”，顯示該單位的目標。"
L["Styled Health Bar"] = "樣式化生命條"
L["Restyle the tooltip health bar with class/reaction colors."] = "使用職業/關係顏色重新設計滑鼠提示生命條樣式。"
L["Restyle the tooltip health bar with class/reaction colors and slimmer look."] = "使用職業/關係顏色和更纖細的外觀重新設計滑鼠提示生命條。"
L["Anchor to Cursor"] = "錨定到游標"
L["Make the tooltip follow the cursor position instead of the default anchor."] = "使滑鼠提示跟隨游標位置，而不是預設的錨點。"

-- 聊天修改
L["Enable Chat Mods"] = "啟用聊天功能修改"
L["Enables or disables Chat Mods."] = "啟用或停用聊天功能修改。"
L["Editbox Position"] = "輸入框位置"
L["Choose where the chat editbox is positioned."] = "選擇聊天輸入框的擺放位置。"
L["Top"] = "頂部"
L["Bottom"] = "底部"
L["Middle"] = "中間"
L["Tab & Button Fade"] = "標籤與按鈕淡出"
L["How visible chat tabs are when not hovered. 0 = fully hidden, 1 = fully visible."] = "未懸停時聊天分頁的可見度。0 = 完全隱藏，1 = 完全可見。"
L["Chat Style Opacity"] = "聊天樣式透明度"
L["Minimum opacity of the custom chat background. At 0 it fades with tabs; above 0 it stays partially visible when idle."] = "自訂聊天背景的最小透明度。0時與標籤同步淡出；超出0則閒置時仍部分可見。"
L["Text Box Min Opacity"] = "輸入框最小透明度"
L["Minimum opacity of the text input box when idle. At 0 it fades with tabs; above 0 it stays partially visible."] = "閒置時文字輸入框的最小透明度。0時與標籤同步淡出；超出0則仍部分可見。"
L["Chat Style"] = "\u804a\u5929\u6a23\u5f0f"
L["Visual style for the chat frame background."] = "\u804a\u5929\u6846\u80cc\u666f\u7684\u8996\u89ba\u6a23\u5f0f\u3002"
L["Editbox Style"] = "輸入框樣式"
L["Visual style for the chat input box background."] = "聊天輸入框背景的視覺樣式。"
L["Dark"] = "\u6697\u8272"
L["DragonUI Style"] = "DragonUI \u6a23\u5f0f"
L["Midnight"] = "\u5b50\u591c"


-- 揹包整合 (Combuctor)
L["Enable Combuctor"] = "啟用揹包整合 (Combuctor)"
L["All-in-one bag replacement with item filtering, search, quality indicators, and bank integration."] = "具有物品過濾、搜尋、品質指示器和銀行整合功能的一體化揹包替代外掛。"
L["Combuctor Settings"] = "Combuctor設定"

-- 揹包整理
L["Bag Sort"] = "揹包整理"
L["Enable Bag Sort"] = "啟用揹包整理"
L["Sort buttons for bags and bank. Sorts items by type, rarity, level, and name."] = "揹包和銀行的整理按鈕。按型別、稀有度、等級和名稱排序物品。"
L["Add sort buttons to bag and bank frames. Also enables /sort and /sortbank slash commands."] = "為揹包和銀行視窗新增整理按鈕。同時啟用 /sort 和 /sortbank 命令。"
L["Sort bags and bank items with buttons"] = "透過按鈕整理揹包和銀行物品"

L["Show 'All' Tab"] = "顯示“全部”標籤頁"
L["Show the 'All' category tab that displays all items without filtering."] = "顯示不過濾、展示所有物品的“全部”分類標籤頁。"
L["Equipment"] = "裝備"
L["Usable"] = "消耗品"
L["Show Equipment Tab"] = "顯示裝備標籤頁"
L["Show the Equipment category tab for armor and weapons."] = "顯示護甲和武器的裝備分類標籤頁。"
L["Show Usable Tab"] = "顯示消耗品標籤頁"
L["Show the Usable category tab for consumables and devices."] = "顯示消耗品和裝置的“消耗品”分類標籤頁。"
L["Show Consumable Tab"] = "顯示消耗品標籤頁"
L["Show the Consumable category tab."] = "顯示消耗品分類標籤頁。"
L["Show Quest Tab"] = "顯示任務標籤頁"
L["Show the Quest items category tab."] = "顯示任務物品分類標籤頁。"
L["Show Trade Goods Tab"] = "顯示商品標籤頁"
L["Show the Trade Goods category tab (includes gems and recipes)."] = "顯示商品（包括寶石和配方）分類標籤頁。"
L["Show Miscellaneous Tab"] = "顯示其他標籤頁"
L["Show the Miscellaneous items category tab."] = "顯示其他物品分類標籤頁。"
L["Left Side Tabs"] = "左側標籤頁"
L["Place category filter tabs on the left side of the bag frame instead of the right."] = "將分類過濾標籤頁放在揹包視窗的左側而非右側。"
L["Place category filter tabs on the left side of the bank frame instead of the right."] = "將分類過濾標籤頁放在銀行視窗的左側而非右側。"
L["Changes require closing and reopening bags to take effect."] = "更改需要關閉並重新開啟揹包才能生效。"
L["Subtabs"] = "子標籤頁"
L["Configure which bottom subtabs appear within each category tab. Applies to both inventory and bank."] = "配置每個分類標籤頁內顯示哪些底部的子標籤頁。同時適用於揹包和銀行。"
L["Normal"] = "普通"
L["Trade Bags"] = "專業揹包"
L["Show the Normal bags subtab (non-profession bags)."] = "顯示普通揹包（非專業揹包）子標籤頁。"
L["Show the Trade bags subtab (profession bags)."] = "顯示專業揹包子標籤頁。"
L["Show the Armor subtab."] = "顯示護甲子標籤頁。"
L["Show the Weapon subtab."] = "顯示武器子標籤頁。"
L["Show the Trinket subtab."] = "顯示飾品子標籤頁。"
L["Show the Consumable subtab."] = "顯示消耗品子標籤頁。"
L["Show the Devices subtab."] = "顯示裝置子標籤頁。"
L["Show the Trade Goods subtab."] = "顯示商品子標籤頁。"
L["Show the Gem subtab."] = "顯示寶石子標籤頁。"
L["Show the Recipe subtab."] = "顯示配方子標籤頁。"
L["Configure Combuctor bag replacement settings."] = "配置揹包整合 (Combuctor) 替代設定。"
L["Category Tabs"] = "分類標籤頁"
L["Inventory Tabs"] = "揹包標籤頁"
L["Bank Tabs"] = "銀行標籤頁"
L["Inventory"] = "揹包"
L["Bank"] = "銀行"
L["Choose which category tabs appear on the bag frame. Changes require closing and reopening bags to take effect."] = "選擇在揹包視窗上顯示哪些分類標籤頁。更改需要關閉並重新開啟揹包才能生效。"
L["Choose which category tabs appear on the inventory bag frame."] = "選擇在揹包視窗上顯示哪些分類標籤頁。"
L["Choose which category tabs appear on the bank frame."] = "選擇在銀行視窗上顯示哪些分類標籤頁。"
L["Display"] = "顯示"

-- 高階模組 - 備用顯示名稱
L["Main Bars"] = "主動作條"
L["Vehicle"] = "載具"
L["Multicast"] = "多目標施法"
L["Buttons"] = "按鈕"
L["Hide Blizzard Elements"] = "隱藏暴雪預設元素"
L["Buffs"] = "增益效果"
L["KeyBinding"] = "按鍵繫結"
L["Cooldowns"] = "冷卻時間"

-- 高階模組 - RegisterModule 顯示名稱（來自模組檔案）
L["Micro Menu"] = "微型選單"
L["Loot Roll"] = "擲骰"
L["Key Binding"] = "按鍵繫結"
L["Item Quality"] = "物品品質"
L["Buff Frame"] = "增益效果框體"
L["Hide Blizzard"] = "隱藏原始介面"
L["Tooltip"] = "滑鼠提示"

-- 高階模組 - RegisterModule 描述（來自模組檔案）
L["Micro menu and bags system styling and positioning"] = "微型選單和揹包系統的樣式/位置設定"
L["Quest tracker positioning and styling"] = "任務追蹤器位置和樣式設定"
L["Enhanced tooltip styling with class colors and health bars"] = "帶有職業顏色和生命條的增強型滑鼠提示樣式"
L["Hide default Blizzard UI elements"] = "隱藏預設的暴雪介面元素"
L["Custom minimap styling, positioning, tracking icons and calendar"] = "自定義小地圖樣式、位置、追蹤圖示和日曆"
L["Main action bars, status bars, scaling and positioning"] = "主動作條、狀態條、縮放和位置"
L["LibKeyBound integration for intuitive keybinding"] = "用於直觀按鍵繫結的LibKeyBound整合"
L["Color item borders by quality in bags, character panel, bank, and merchant"] = "在揹包、角色面板、銀行、商人視窗按物品品質為邊框著色"
L["Darken UI borders and chrome"] = "使介面邊框和裝飾變暗"
L["Action button styling and enhancements"] = "動作按鈕樣式和增強功能"
L["Custom buff frame styling, positioning and toggle button"] = "自定義增益效果框體樣式、位置和切換按鈕"
L["Vehicle interface enhancements"] = "載具介面增強功能"
L["Stance/shapeshift bar positioning and styling"] = "姿態/變形條位置和樣式設定"
L["Pet action bar positioning and styling"] = "寵物動作條位置和樣式設定"
L["Multicast (totem/possess) bar positioning and styling"] = "多目標施法（圖騰/控制）條位置和樣式設定"
L["Chat Mods"] = "聊天功能修改"
L["Chat enhancements: hide buttons, editbox position, URL copy, chat copy, link hover, tell target"] = "聊天增強：隱藏按鈕、輸入框位置、URL/聊天覆制、連結懸停提示、/告訴目標"
L["Combuctor"] = "揹包整合 (Combuctor)"
L["All-in-one bag replacement with filtering and search"] = "具有過濾和搜尋功能的一體化揹包替代"

-- ============================================================================
-- 動作條標籤頁
-- ============================================================================

-- 子標籤頁
L["Layout"] = "佈局"
L["Visibility"] = "可見性"

-- 縮放比例部分
L["Action Bar Scales"] = "動作條縮放比例"
L["Main Bar Scale"] = "主動作條縮放"
L["Right Bar Scale"] = "右側動作條縮放"
L["Left Bar Scale"] = "左側動作條縮放"
L["Bottom Left Bar Scale"] = "左下動作條縮放"
L["Bottom Right Bar Scale"] = "右下動作條縮放"
L["Scale for main action bar"] = "主動作條縮放"
L["Scale for right action bar (MultiBarRight)"] = "右側動作條縮放 (MultiBarRight)"
L["Scale for left action bar (MultiBarLeft)"] = "左側動作條縮放 (MultiBarLeft)"
L["Scale for bottom left action bar (MultiBarBottomLeft)"] = "左下動作條縮放 (MultiBarBottomLeft)"
L["Scale for bottom right action bar (MultiBarBottomRight)"] = "右下動作條縮放 (MultiBarBottomRight)"
L["Reset All Scales"] = "重置所有縮放比例"
L["Reset all action bar scales to their default values (0.9)"] = "將所有動作條縮放比例重置為其預設值(0.9)"
L["All action bar scales reset to default values (0.9)"] = "所有動作條縮放比例已重置為預設值(0.9)"
L["All action bar scales reset to 0.9"] = "所有動作條縮放比例重置為0.9"

-- 位置部分
L["Action Bar Positions"] = "動作條位置"
L["Tip: Use the Move UI Elements button above to reposition action bars with your mouse."] = "提示：使用上方的“移動介面元素”按鈕，用滑鼠重新定位動作條。"
L["Left Bar Horizontal"] = "左側條水平放置"
L["Make the left secondary bar horizontal instead of vertical."] = "將左側輔助動作條改為水平放置，而非垂直。"
L["Right Bar Horizontal"] = "右側條水平放置"
L["Make the right secondary bar horizontal instead of vertical."] = "將右側輔助動作條改為水平放置，而非垂直。"

-- 按鈕外觀部分
L["Button Appearance"] = "按鈕外觀"
L["Main Bar Only Background"] = "僅主動作條顯示背景"
L["If checked, only the main action bar buttons will have a background. If unchecked, all action bar buttons will have a background."] = "如果勾選，則只有主動作條的按鈕會有背景。如果不勾選，則所有動作條按鈕都有背景。"
L["Only the main action bar buttons will have a background."] = "僅主動作條的按鈕顯示背景。"
L["Hide Main Bar Background"] = "隱藏主動作條背景"
L["Hide the background texture of the main action bar (makes it completely transparent)"] = "隱藏主動作條的背景紋理（使其完全透明）"
L["Hide the background texture of the main action bar."] = "隱藏主動作條的背景紋理。"

-- 文字可見性
L["Text Visibility"] = "文字可見性"
L["Count Text"] = "數量文字"
L["Show Count"] = "顯示數量"
L["Show Count Text"] = "顯示疊加次數文字"
L["Hotkey Text"] = "按鍵文字"
L["Show Hotkey"] = "顯示按鍵"
L["Show Hotkey Text"] = "顯示按鍵文字"
L["Range Indicator"] = "距離指示器"
L["Show small range indicator point on buttons"] = "在按鈕上顯示小的距離指示點"
L["Show range indicator dot on buttons."] = "在按鈕上顯示距離指示點。"
L["Macro Text"] = "宏文字"
L["Show Macro Names"] = "顯示宏名稱"
L["Page Numbers"] = "頁面編號"
L["Show Pages"] = "顯示頁面"
L["Show Page Numbers"] = "顯示頁面編號"

-- 冷卻文字
L["Cooldown Text"] = "冷卻文字"
L["Min Duration"] = "最短持續時間"
L["Minimum duration for text triggering"] = "觸發文字顯示的最短持續時間"
L["Minimum duration for cooldown text to appear."] = "冷卻文字出現的最短持續時間設定。"
L["Text Color"] = "文字顏色"
L["Cooldown Text Color"] = "冷卻文字顏色"
L["Size of cooldown text."] = "冷卻文字的大小。"

-- 顏色
L["Colors"] = "顏色"
L["Macro Text Color"] = "宏文字顏色"
L["Color for macro text"] = "宏文字的顏色"
L["Hotkey Shadow Color"] = "按鍵陰影顏色"
L["Shadow color for hotkey text"] = "按鍵文字的陰影顏色"
L["Border Color"] = "邊框顏色"
L["Border color for buttons"] = "按鈕的邊框顏色"

-- 獅鷲裝飾
L["Gryphons"] = "獅鷲裝飾"
L["Gryphon Style"] = "獅鷲樣式"
L["Display style for the action bar end-cap gryphons."] = "動作條兩端的獅鷲裝飾的顯示樣式。"
L["End-cap ornaments flanking the main action bar."] = "主動作條兩端的裝飾紋樣。"
L["Gryphon previews are hidden while D3D9Ex is active to avoid client crashes."] = "啟用 D3D9Ex 時會隱藏獅鷲預覽，以避免客戶端當機。"
L["Style"] = "樣式"
L["Old"] = "舊樣式"
L["New"] = "新樣式"
L["Flying"] = "飛行"
L["Hide Gryphons"] = "隱藏獅鷲"
L["Classic"] = "經典"
L["Dragonflight"] = "巨龍時代"
L["Hidden"] = "隱藏"
L["Dragonflight (Wyvern)"] = "巨龍時代 (雙足飛龍)"
L["Dragonflight (Gryphon)"] = "巨龍時代 (獅鷲)"

-- 佈區域性分
L["Main Bar Layout"] = "主動作條佈局"
L["Bottom Left Bar Layout"] = "左下動作條佈局"
L["Bottom Right Bar Layout"] = "右下動作條佈局"
L["Right Bar Layout"] = "右側動作條佈局"
L["Left Bar Layout"] = "左側動作條佈局"
L["Configure the main action bar grid layout. Rows are determined automatically from columns and buttons shown."] = "配置主動作條網格佈局。行數根據列數和顯示的按鈕數自動確定。"
L["Columns"] = "列數"
L["Buttons Shown"] = "顯示的按鈕數"
L["Quick Presets"] = "快速預設"
L["Apply layout presets to multiple bars at once."] = "將佈局預設同時應用於多個動作條。"
L["Both 1x12"] = "均為 1x12"
L["Both 2x6"] = "均為 2x6"
L["Reset All"] = "全部重置"
L["All bar layouts reset to defaults."] = "所有動作條佈局已重置為預設值。"

-- 可見性部分
L["Bar Visibility"] = "動作條可見性"
L["Control when action bars are visible. Bars can show only on hover, only in combat, or both. When no option is checked the bar is always visible."] = "控制動作條的顯示條件。動作條可以僅在滑鼠懸停時顯示、僅在戰鬥中顯示，或兩者皆可。未選擇任何選項時，動作條始終可見。"
L["Enable / Disable Bars"] = "啟用 / 禁用動作條"
L["Bottom Left Bar"] = "左下動作條"
L["Bottom Right Bar"] = "右下動作條"
L["Right Bar"] = "右側動作條"
L["Left Bar"] = "左側動作條"
L["Main Bar"] = "主動作條"
L["Show on Hover Only"] = "僅滑鼠懸停時顯示"
L["Show in Combat Only"] = "僅戰鬥中顯示"
L["Hide the main bar until you hover over it."] = "僅在滑鼠懸停時顯示主動作條。"
L["Hide the main bar until you enter combat."] = "僅在進入戰鬥時顯示主動作條。"

-- ============================================================================
-- 附加動作條標籤頁
-- ============================================================================

L["Bars that appear based on your class and situation."] = "根據你的職業和情況出現的動作條。"
L["Specialized bars that appear when needed (stance/pet/vehicle/totems)"] = "需要時出現的特殊動作條（姿態/寵物/載具/圖騰）"
L["Auto-show bars: Stance (Warriors/Druids/DKs) • Pet (Hunters/Warlocks/DKs) • Vehicle (All classes) • Totem (Shamans)"] = "自動顯示的動作條：姿態（戰士/德魯伊/死亡騎士）• 寵物（獵人/術士/死亡騎士）• 載具（全職業）• 圖騰（薩滿）"

-- 通用設定
L["Common Settings"] = "通用設定"
L["Button Size"] = "按鈕大小"
L["Size of buttons for all additional bars"] = "所有附加動作條的按鈕大小"
L["Button Spacing"] = "按鈕間距"
L["Space between buttons for all additional bars"] = "所有附加動作條的按鈕間距"

-- 姿態條
L["Stance Bar"] = "姿態條"
L["Warriors, Druids, Death Knights"] = "戰士、德魯伊、死亡騎士"
L["X Position"] = "水平位置"
L["Y Position"] = "垂直位置"
L["Y Offset"] = "Y軸偏移"
L["Horizontal position of stance bar from screen center. Negative values move left, positive values move right."] = "姿態條相對於螢幕中心的水平位置。負值向左移動，正值向右移動。"

-- 寵物動作條
L["Pet Bar"] = "寵物動作條"
L["Hunters, Warlocks, Death Knights - Use editor mode to move"] = "獵人、術士、死亡騎士 - 使用編輯模式移動"
L["Show Empty Slots"] = "顯示空技能槽"
L["Display empty action slots on pet bar"] = "在寵物動作條上顯示空的技能槽"

-- 載具動作條
L["Vehicle Bar"] = "載具動作條"
L["All classes (vehicles/special mounts)"] = "全職業（載具/特殊坐騎）"
L["Custom Art Style"] = "自定義藝術風格"
L["Use custom vehicle bar art style with health/power bars and themed skin. Requires UI reload to apply."] = "使用帶有生命值/能量條和主題皮膚的自定義載具條藝術風格。需要重新載入介面才能應用。"
L["Blizzard Art Style"] = "暴雪藝術風格"
L["Use Blizzard vehicle bar art with health/power display. Requires reload."] = "使用帶有生命值/能量顯示的暴雪預設載具條藝術風格（需要過載介面）。"

-- 圖騰條
L["Totem Bar"] = "圖騰條"
L["Totem Bar (Shaman)"] = "圖騰條（薩滿）"
L["Shamans only - Totem multicast bar. Position is controlled via Editor Mode."] = "僅限薩滿 - 圖騰多目標施法條。位置透過編輯模式控制。"
L["TIP: Use Editor Mode to position the totem bar (type /dragonui edit)."] = "提示：使用編輯模式來定點陣圖騰條（輸入 /dragonui edit）。"

-- ============================================================================
-- 施法條標籤頁
-- ============================================================================

L["Player Castbar"] = "玩家施法條"
L["Target Castbar"] = "目標施法條"
L["Focus Castbar"] = "焦點施法條"

-- 子標籤頁
L["Player"] = "玩家"
L["Target"] = "目標"
L["Focus"] = "焦點"

-- 通用選項
L["Width"] = "寬度"
L["Width of the cast bar"] = "施法條的寬度"
L["Height"] = "高度"
L["Height of the cast bar"] = "施法條的高度"
L["Scale"] = "縮放比例"
L["Size scale of the cast bar"] = "施法條的縮放比例"
L["Show Icon"] = "顯示圖示"
L["Show the spell icon next to the cast bar"] = "在施法條旁邊顯示法術圖示"
L["Show Spell Icon"] = "顯示法術圖示"
L["Show the spell icon next to the target castbar"] = "在目標施法條旁邊顯示法術圖示"
L["Icon Size"] = "圖示大小"
L["Size of the spell icon"] = "法術圖示的大小"
L["Text Mode"] = "文字模式"
L["Choose how to display spell text: Simple (centered spell name only) or Detailed (spell name + time)"] = "選擇法術文字的顯示方式：簡單（僅居中顯示法術名稱）或詳細（法術名稱 + 時間）"
L["Simple (Centered Name Only)"] = "簡單（僅居中顯示名稱）"
L["Simple (Name Only)"] = "簡單（僅顯示名稱）"
L["Simple"] = "簡單"
L["Detailed (Name + Time)"] = "詳細（名稱 + 時間）"
L["Detailed"] = "詳細"
L["Time Precision"] = "時間精度"
L["Decimal places for remaining time."] = "剩餘時間的小數點位數。"
L["Max Time Precision"] = "最大時間精度"
L["Decimal places for total time."] = "總時間的小數點位數。"
L["Hold Time (Success)"] = "保持時間（成功）"
L["How long the bar stays visible after a successful cast."] = "成功施法後施法條保持可見的時間。"
L["How long the bar stays after a successful cast."] = "施法成功後施法條保持的時間。"
L["How long to show the castbar after successful completion"] = "施法成功完成後施法條顯示的時間"
L["Hold Time (Interrupt)"] = "保持時間（打斷）"
L["How long the bar stays visible after being interrupted."] = "施法被打斷後施法條保持可見的時間。"
L["How long the bar stays after being interrupted."] = "施法被打斷後施法條保持的時間。"
L["How long to show the castbar after interruption/failure"] = "施法被打斷/失敗後施法條顯示的時間"
L["Auto-Adjust for Auras"] = "根據光環自動調整位置"
L["Automatically adjust position based on target auras (CRITICAL FEATURE)"] = "根據目標身上的光環自動調整位置（關鍵功能）"
L["Shift castbar when buff/debuff rows are showing."] = "當增益/減益效果行顯示時，移動施法條位置。"
L["Automatically adjust position based on focus auras"] = "根據焦點目標身上的光環自動調整位置"
L["Reset Position"] = "重置位置"
L["Resets the X and Y position to default."] = "將X和Y位置重置為預設值。"
L["Reset target castbar position to default"] = "將目標施法條位置重置為預設值"
L["Reset focus castbar position to default"] = "將焦點施法條位置重置為預設值"
L["Player castbar position reset."] = "玩家施法條位置已重置。"
L["Target castbar position reset."] = "目標施法條位置已重置。"
L["Focus castbar position reset."] = "焦點施法條位置已重置。"
L["Castbar detached - positioned freely via Editor Mode"] = "施法條已分離 - 可在編輯模式中自由定位"
L["Castbar attached - follows Target frame"] = "施法條已附著 - 跟隨目標框架"
L["Castbar attached - follows Focus frame"] = "施法條已附著 - 跟隨焦點框架"
L["Re-attach Castbar to Target"] = "將施法條重新附著到目標"
L["Re-attach Castbar to Focus"] = "將施法條重新附著到焦點"

-- 目標/焦點施法條的寬度/高度描述
L["Width of the target castbar"] = "目標施法條的寬度"
L["Height of the target castbar"] = "目標施法條的高度"
L["Scale of the target castbar"] = "目標施法條的縮放比例"
L["Width of the focus castbar"] = "焦點施法條的寬度"
L["Height of the focus castbar"] = "焦點施法條的高度"
L["Scale of the focus castbar"] = "焦點施法條的縮放比例"
L["Show the spell icon next to the focus castbar"] = "在焦點施法條旁邊顯示法術圖示"
L["Time to show the castbar after successful cast completion"] = "施法成功完成後施法條顯示的時間"
L["Time to show the castbar after cast interruption"] = "施法被打斷後施法條顯示的時間"

-- Latency indicator (player only)
L["Latency Indicator"] = "延遲指示器"
L["Enable Latency Indicator"] = "啟用延遲指示器"
L["Show a safe-zone overlay based on real cast latency."] = "基於實際施法延遲顯示安全區域。"
L["Latency Color"] = "延遲顏色"
L["Latency Alpha"] = "延遲透明度"
L["Opacity of the latency indicator."] = "延遲指示器的透明度。"

-- ============================================================================
-- 增強功能標籤頁
-- ============================================================================

L["Enhancements"] = "增強功能"
L["Visual enhancements that add Dragonflight-style polish to the UI. These are optional — disable any you don't want."] = "為介面新增巨龍時代風格潤色的視覺增強功能。這些是可選的——可禁用任何你不想要的功能。"

-- （暗色模式、距離指示器、物品品質、滑鼠提示已在模組部分定義）

-- ============================================================================
-- 微型選單標籤頁
-- ============================================================================

L["Gray Scale Icons"] = "灰度圖示"
L["Grayscale Icons"] = "灰度圖示"
L["Use grayscale icons instead of colored icons for the micro menu"] = "為微型選單使用灰度圖示而非彩色圖示"
L["Use grayscale icons instead of colored icons."] = "使用灰度圖示而非彩色圖示。"
L["Grayscale Icons Settings"] = "灰度圖示設定"
L["Normal Icons Settings"] = "普通圖示設定"
L["Menu Scale"] = "選單縮放"
L["Icon Spacing"] = "圖示間距"
L["Hide on Vehicle"] = "在載具上時隱藏"
L["Hide micromenu and bags if you sit on vehicle"] = "如果你在載具上，則隱藏微型選單和揹包"
L["Hide micromenu and bags while in a vehicle."] = "在載具上時隱藏微型選單和揹包。"
L["Show Latency Indicator"] = "顯示延遲指示器"
L["Show a colored bar below the Help button indicating connection quality (green/yellow/red). Requires UI reload."] = "在幫助按鈕下方顯示指示連線質量的彩色條（綠色/黃色/紅色）。需要重新載入介面。"

-- 揹包
L["Bags"] = "揹包"
L["Configure the position and scale of the bag bar independently from the micro menu."] = "獨立於微型選單配置揹包欄的位置和縮放。"
L["Bag Bar Scale"] = "揹包欄縮放"

-- 經驗值和聲望條
L["XP & Rep Bars (Legacy Offsets)"] = "經驗值和聲望條（舊版偏移量）"
L["Main XP & Rep bar options have moved to the XP & Rep Bars tab."] = "主要的經驗值和聲望條選項已移至“經驗值和聲望條”標籤頁。"
L["These offset options are for advanced positioning adjustments."] = "這些偏移量選項用於高階位置微調。"
L["Both Bars Offset"] = "雙條偏移量"
L["Y offset when XP & reputation bar are shown"] = "當經驗值和聲望條都顯示時的Y軸偏移量"
L["Single Bar Offset"] = "單條偏移量"
L["Y offset when XP or reputation bar is shown"] = "當經驗值或聲望條顯示時的Y軸偏移量"
L["No Bar Offset"] = "無條偏移量"
L["Y offset when no XP or reputation bar is shown"] = "當經驗值或聲望條均不顯示時的Y軸偏移量"
L["Rep Bar Above XP Offset"] = "經驗條上方的聲望條偏移量"
L["Y offset for reputation bar when XP bar is shown"] = "當經驗條顯示時聲望條的Y軸偏移量"
L["Rep Bar Offset"] = "聲望條偏移量"
L["Y offset when XP bar is not shown"] = "當經驗條不顯示時的Y軸偏移量"

-- ============================================================================
-- 小地圖示籤頁
-- ============================================================================

L["Basic Settings"] = "基本設定"
L["Border Alpha"] = "邊框透明度"
L["Top border alpha (0 to hide)."] = "頂部邊框的透明度（0為完全隱藏）。"
L["Addon Button Skin"] = "外掛按鈕皮膚"
L["Apply DragonUI border styling to addon icons (e.g., bag addons)"] = "為外掛圖示（例如揹包外掛）應用DragonUI邊框樣式"
L["Apply DragonUI border styling to addon icons."] = "為外掛圖示應用DragonUI邊框樣式。"
L["Addon Button Fade"] = "外掛按鈕淡出"
L["Addon icons fade out when not hovered."] = "外掛圖示在未懸停時淡出。"
L["Player Arrow Size"] = "玩家箭頭大小"
L["Size of the player arrow on the minimap"] = "小地圖上玩家箭頭的大小"
L["New Blip Style"] = "新圖示樣式"
L["Use new DragonUI object icons on the minimap. When disabled, uses classic Blizzard icons."] = "在小地圖上使用新的DragonUI物件圖示。禁用時，使用經典的暴雪圖示。"
L["Use newer-style minimap blip icons."] = "使用新樣式的小地圖圖示。"

-- 時間與日曆
L["Time & Calendar"] = "時間與日曆"
L["Show Clock"] = "顯示時鐘"
L["Show/hide the minimap clock"] = "顯示/隱藏小地圖時鐘"
L["Show Calendar"] = "顯示日曆"
L["Show/hide the calendar frame"] = "顯示/隱藏日曆框架"
L["Clock Font Size"] = "時鐘字型大小"
L["Font size for the clock numbers on the minimap"] = "小地圖上時鐘數字的字型大小"

-- 顯示設定
L["Display Settings"] = "顯示設定"
L["Tracking Icons"] = "追蹤圖示"
L["Show current tracking icons (old style)."] = "顯示當前的追蹤圖示（舊樣式）。"
L["Zoom Buttons"] = "縮放按鈕"
L["Show zoom buttons (+/-)."] = "顯示縮放按鈕 (+/-)。"
L["Zone Text Size"] = "區域文字大小"
L["Zone Text Font Size"] = "區域文字字型大小"
L["Zone text font size on top border"] = "頂部邊框上區域文字的字型大小"
L["Font size of the zone text above the minimap."] = "小地圖上方區域文字的字型大小設定。"

-- 位置
L["Position"] = "位置"
L["Reset minimap to default position (top-right corner)"] = "將小地圖重置到預設位置（右上角）"
L["Reset Minimap Position"] = "重置小地圖位置"
L["Minimap position reset to default"] = "小地圖位置已重置為預設值"
L["Minimap position reset."] = "小地圖位置已重置。"

-- ============================================================================
-- 任務追蹤器標籤頁
-- ============================================================================

L["Configures the quest objective tracker position and behavior."] = "配置任務目標追蹤器的位置和行為。"
L["Position and display settings for the objective tracker."] = "任務追蹤器的位置和顯示設定。"
L["Show Header Background"] = "顯示標題背景"
L["Show/hide the decorative header background texture."] = "顯示/隱藏裝飾性的標題背景紋理。"
L["Anchor Point"] = "錨點"
L["Screen anchor point for the quest tracker."] = "任務追蹤器的螢幕錨點。"
L["Top Right"] = "右上"
L["Top Left"] = "左上"
L["Bottom Right"] = "右下"
L["Bottom Left"] = "左下"
L["Center"] = "中央"
L["Horizontal position offset"] = "水平位置偏移量"
L["Vertical position offset"] = "垂直位置偏移量"
L["Reset quest tracker to default position"] = "將任務追蹤器重置為預設位置"
L["Font Size"] = "字型大小"
L["Font size for quest tracker text"] = "任務追蹤器文字的字型大小設定"

-- ============================================================================
-- 單位框架標籤頁
-- ============================================================================

-- 子標籤頁
L["Pet"] = "寵物"
L["ToT / ToF"] = "目標的目標 / 焦點的目標"
L["Party"] = "小隊"

-- 通用選項
L["Global Scale"] = "全域性縮放"
L["Global scale for all unit frames"] = "所有單位框架的全域性縮放"
L["Scale of the player frame"] = "玩家框架的縮放"
L["Scale of the target frame"] = "目標框架的縮放"
L["Scale of the focus frame"] = "焦點框架的縮放"
L["Scale of the pet frame"] = "寵物框架的縮放"
L["Scale of the target of target frame"] = "目標的目標框架的縮放"
L["Scale of the focus of target frame"] = "焦點的目標框架的縮放"
L["Scale of party frames"] = "小隊框架的縮放"
L["Class Color"] = "職業顏色"
L["Class Color Health"] = "生命條職業顏色"
L["Use class color for health bar"] = "生命條使用職業顏色"
L["Use class color for health bars in party frames"] = "小隊框架的生命條使用職業顏色"
L["Class Portrait"] = "職業頭像"
L["Show class icon instead of 3D portrait"] = "顯示職業圖示而非3D頭像"
L["Show class icon instead of 3D portrait (only for players)"] = "顯示職業圖示而非3D頭像（僅限玩家）"
L["Class icon instead of 3D model for players."] = "玩家頭像使用職業圖示而非3D模型。"
L["Alternative Class Icons"] = "替代職業圖示"
L["Use DragonUI alternative class icons instead of Blizzard's class icon atlas."] = "使用 DragonUI 的替代職業圖示，而不是 Blizzard 的職業圖示圖集。"
L["Large Numbers"] = "大數字縮寫"
L["Format Large Numbers"] = "大數字縮寫格式"
L["Format large numbers (1k, 1m)"] = "大數字縮寫格式 (1k, 1m)"
L["Text Format"] = "文字格式"
L["How to display health and mana values"] = "生命值和法力值的顯示方式"
L["Choose how to display health and mana text"] = "選擇生命值和法力值文字的顯示方式"

-- 文字格式值
L["Current Value Only"] = "僅當前值"
L["Current Value"] = "當前值"
L["Percentage Only"] = "僅百分比"
L["Percentage"] = "百分比"
L["Both (Numbers + Percentage)"] = "兩者（數值 + 百分比）"
L["Numbers + %"] = "數值 + %"
L["Current/Max Values"] = "當前/最大值"
L["Current / Max"] = "當前 / 最大"

-- 小隊文字格式值
L["Current Value Only (2345)"] = "僅當前值 (2345)"
L["Formatted Current (2.3k)"] = "縮寫的當前值 (2.3k)"
L["Percentage Only (75%)"] = "僅百分比 (75%)"
L["Percentage + Current (75% | 2.3k)"] = "百分比 + 當前值 (75% | 2.3k)"

-- 生命值/法力值文字
L["Always Show Health Text"] = "始終顯示生命值文字"
L["Show health text always (true) or only on hover (false)"] = "始終顯示生命值文字（是）或僅在懸停時顯示（否）"
L["Always show health text on party frames (instead of only on hover)"] = "在小隊框架上始終顯示生命值文字（而不僅是懸停時）"
L["Always display health text (otherwise only on mouseover)"] = "始終顯示生命值文字（預設：僅滑鼠懸停時顯示）"
L["Always Show Mana Text"] = "始終顯示法力值文字"
L["Show mana/power text always (true) or only on hover (false)"] = "始終顯示法力值/能量文字（是）或僅在懸停時顯示（否）"
L["Always show mana text on party frames (instead of only on hover)"] = "在小隊框架上始終顯示法力值文字（而不僅是懸停時）"
L["Always display mana/energy/rage text (otherwise only on mouseover)"] = "始終顯示法力值/能量/怒氣文字（預設：僅滑鼠懸停時顯示）"

-- 玩家框架特定選項
L["Player Frame"] = "玩家框架"
L["Dragon Decoration"] = "龍形裝飾"
L["Add decorative dragon to your player frame for a premium look"] = "為你的玩家框架新增裝飾性的龍，以獲得高階外觀"
L["None"] = "無"
L["Elite Dragon (Golden)"] = "精英龍（金色）"
L["Elite (Golden)"] = "精英（金色）"
L["RareElite Dragon (Winged)"] = "稀有精英龍（有翼）"
L["RareElite (Winged)"] = "稀有精英（有翼）"
L["Glow Effects"] = "發光效果"
L["Show Rest Glow"] = "顯示休息時發光效果"
L["Show a golden glow around the player frame when resting (in an inn or city). Works with all frame modes: normal, elite, fat health bar, and vehicle."] = "休息時（在旅店或城市中）在玩家框架周圍顯示金色發光效果。適用於所有框架模式：普通、精英、寬體生命條和載具。"
L["Golden glow around the player frame when resting (inn or city). Works with all frame modes."] = "休息時（在旅店或城市中）在玩家框架周圍顯示金色發光效果。適用於所有框架模式。"
L["Combat Flash"] = "戰鬥閃光"
L["Show Combat Flash"] = "顯示戰鬥閃光"
L["Pulsing glow effect when entering combat. Works with all frame modes."] = "進入戰鬥時的脈衝發光效果。適用於所有框架模式。"
L["Combat Flash Opacity"] = "戰鬥閃光不透明度"
L["Maximum opacity of the combat flash pulse effect."] = "戰鬥閃光脈衝效果的最大不透明度。"
L["Always Show Alternate Mana Text"] = "始終顯示備用法力文字"
L["Show mana text always visible (default: hover only)"] = "始終顯示法力值文字（預設：僅懸停時顯示）"
L["Alternate Mana (Druid)"] = "備用法力（德魯伊）"
L["Always Show"] = "始終顯示"
L["Druid mana text visible at all times, not just on hover."] = "德魯伊的法力值文字始終可見，而不僅是懸停時。"
L["Alternate Mana Text Format"] = "備用法力文字格式"
L["Choose text format for alternate mana display"] = "選擇備用法力顯示的文字格式"
L["Percentage + Current/Max"] = "百分比 + 當前/最大值"

-- 寬體生命條
L["Health Bar Style"] = "生命條樣式"
L["Fat Health Bar"] = "寬體生命條"
L["Enable"] = "啟用"
L["Full-width health bar that fills the entire frame area. Uses modified border texture that removes the inner divider line. Compatible with Dragon Decoration (requires fat variant textures). Note: Automatically disabled during vehicle UI."] = "填充整個框架區域的寬體生命條。使用移除了內部分隔線的修改邊框紋理。與龍形裝飾相容（需要寬體變體紋理）。注意：在載具介面期間會自動禁用。"
L["Full-width health bar. Auto-disabled in vehicles."] = "寬體生命條。乘坐載具時自動禁用。"
L["Hide Mana Bar (Fat Mode)"] = "隱藏法力條（寬體模式）"
L["Hide Mana Bar"] = "隱藏法力條"
L["Completely hide the mana bar when Fat Health Bar is active."] = "當寬體生命條啟用時，完全隱藏法力條。"
L["Mana Bar Width (Fat Mode)"] = "法力條寬度（寬體模式）"
L["Mana Bar Width"] = "法力條寬度"
L["Width of the mana bar when Fat Health Bar is active. Movable via Editor Mode."] = "寬體生命條啟用時，法力條的寬度。可透過編輯模式移動。"
L["Mana Bar Height (Fat Mode)"] = "法力條高度（寬體模式）"
L["Mana Bar Height"] = "法力條高度"
L["Height of the mana bar when Fat Health Bar is active."] = "寬體生命條啟用時，法力條的高度。"
L["Mana Bar Texture"] = "法力條紋理"
L["Choose the texture style for the power/mana bar. Only applies in Fat Health Bar mode."] = "選擇能量/法力條的紋理樣式。僅適用於寬體生命條模式。"
L["DragonUI (Default)"] = "DragonUI（預設）"
L["Blizzard Classic"] = "暴雪經典"
L["Flat Solid"] = "純色扁平"
L["Smooth"] = "平滑"
L["Aluminium"] = "鋁製"
L["LiteStep"] = "輕步"

-- 能量條顏色
L["Power Bar Colors"] = "能量條顏色"
L["Mana"] = "法力"
L["Rage"] = "怒氣"
L["Energy"] = "能量"
L["Runic Power"] = "符文能量"
L["Happiness"] = "快樂值"
L["Runes"] = "符文"
L["Reset Colors to Default"] = "重置顏色為預設值"

-- 目標框架
L["Target Frame"] = "目標框架"
L["Threat Glow"] = "仇恨發光效果"
L["Show threat glow effect"] = "顯示仇恨發光效果"
L["Show Name Background"] = "顯示名稱背景"
L["Show the colored name background behind the target name."] = "在目標名稱後面顯示有顏色的名稱背景。"

-- 焦點框架
L["Focus Frame"] = "焦點框架"
L["Show the colored name background behind the focus name."] = "在焦點名稱後面顯示有顏色的名稱背景。"
L["Show Buff/Debuff on Focus"] = "在焦點上顯示增益/減益"
L["Uses the native large focus frame mode to show buffs and debuffs on the focus frame."] = "使用原生的大型焦點框架模式，在焦點框架上顯示增益和減益。"
L["Override Position"] = "覆蓋預設位置"
L["Override default positioning"] = "覆蓋預設位置設定"
L["Move the pet frame independently from the player frame."] = "將寵物框架與玩家框架分開移動。"

-- 寵物框架
L["Pet Frame"] = "寵物框架"
L["Allows the pet frame to be moved freely. When unchecked, it will be positioned relative to the player frame."] = "允許寵物框架自由移動。不勾選時，它將相對於玩家框架定位。"
L["Horizontal position (only active if Override is checked)"] = "水平位置（僅在“覆蓋預設位置”勾選時生效）"
L["Vertical position (only active if Override is checked)"] = "垂直位置（僅在“覆蓋預設位置”勾選時生效）"

-- 目標的目標
L["Target of Target"] = "目標的目標"
L["Follows the Target frame by default. Move it in Editor Mode (/dragonui edit) to detach and position freely."] = "預設跟隨目標框架。在編輯模式（/dragonui edit）中移動它可使其分離並自由定位。"
L["Detached — positioned freely via Editor Mode"] = "已分離 — 透過編輯模式自由定位"
L["Attached — follows Target frame"] = "已附加 — 跟隨目標框架"
L["Re-attach to Target"] = "重新附加到目標框架"

-- 焦點的目標
L["Target of Focus"] = "焦點的目標"
L["Follows the Focus frame by default. Move it in Editor Mode (/dragonui edit) to detach and position freely."] = "預設跟隨焦點框架。在編輯模式（/dragonui edit）中移動它可使其分離並自由定位。"
L["Attached — follows Focus frame"] = "已附加 — 跟隨焦點框架"
L["Re-attach to Focus"] = "重新附加到焦點框架"

-- 小隊框架
L["Party Frames"] = "小隊框架"
L["Party Frames Configuration"] = "小隊框架配置"
L["Custom styling for party member frames with automatic health/mana text display and class colors."] = "具有自動生命值/法力值文字顯示和職業顏色的自定義小隊成員框架樣式。"

-- 首領框架
L["Boss Frames"] = "首領框架"
L["Enabled"] = "已啟用"

L["Orientation"] = "排列方向"
L["Vertical"] = "垂直"
L["Horizontal"] = "水平"
L["Party frame orientation"] = "小隊框架排列方向"
L["Vertical Padding"] = "垂直間距"
L["Space between party frames in vertical mode."] = "垂直排列模式下，小隊框架之間的間距。"
L["Horizontal Padding"] = "水平間距"
L["Space between party frames in horizontal mode."] = "水平排列模式下，小隊框架之間的間距。"

-- ============================================================================
-- 經驗值和聲望條標籤頁
-- ============================================================================

L["Bar Style"] = "條樣式"
L["XP / Rep Bar Style"] = "經驗值 / 聲望條樣式"
L["DragonflightUI: fully custom bars with rested XP background.\nRetailUI: atlas-based reskin of Blizzard bars.\n\nChanging style requires a UI reload."] = "DragonflightUI：帶有休息經驗值背景的完全自定義條。\nRetailUI：基於圖集的暴雪條重製版。\n\n更改樣式需要重新載入介面。"
L["DragonflightUI"] = "巨龍時代UI"
L["RetailUI"] = "正式服UI"
L["XP bar style changed to "] = "經驗條樣式更改為："
L["A UI reload is required to apply this change."] = "需要重新載入介面以應用此更改。"

-- 大小和縮放
L["Size & Scale"] = "大小和縮放"
L["Bar Height"] = "條高度"
L["Height of the XP and Reputation bars (in pixels)."] = "經驗值和聲望條的高度（以畫素為單位）。"
L["Experience Bar Scale"] = "經驗條縮放"
L["Scale of the experience bar."] = "經驗條的縮放比例。"
L["Reputation Bar Scale"] = "聲望條縮放"
L["Scale of the reputation bar."] = "聲望條的縮放比例。"

-- 休息經驗值
L["Rested XP"] = "休息經驗值"
L["Show Rested XP Background"] = "顯示休息經驗值背景"
L["Display a translucent bar showing the total available rested XP range.\n(DragonflightUI style only)"] = "顯示一個半透明條，指示可用的總休息經驗值範圍。\n（僅限巨龍時代UI樣式）"
L["Show Exhaustion Tick"] = "顯示休息狀態分界線"
L["Show the exhaustion tick indicator on the XP bar, marking where rested XP ends."] = "在經驗條上顯示休息狀態分界線指示器，標記休息經驗值結束的位置。"

-- 文字顯示
L["Text Display"] = "文字顯示"
L["Always Show Text"] = "始終顯示文字"
L["Always display XP/Rep text instead of only on hover."] = "始終顯示經驗值/聲望文字，而不僅是滑鼠懸停時。"
L["Show XP Percentage"] = "顯示經驗值百分比"
L["Display XP percentage alongside the value text."] = "在數值文字旁邊顯示經驗值百分比。"

-- ============================================================================
-- 配置檔案標籤頁
-- ============================================================================

L["Database not available."] = "資料庫不可用。"
L["Save and switch between different configurations per character."] = "為每個角色儲存和切換不同的配置。"
L["Current Profile"] = "當前配置檔案"
L["Active: "] = "啟用的配置檔案："
L["Switch or Create Profile"] = "切換或建立配置檔案"
L["Select Profile"] = "選擇配置檔案"
L["New Profile Name"] = "新配置檔名"
L["Copy From"] = "從何處複製"
L["Copies all settings from the selected profile into your current one."] = "將所選配置檔案的所有設定複製到當前配置檔案中。"
L["Copied profile: "] = "已複製的配置檔案："
L["Delete Profile"] = "刪除配置檔案"
L["Warning: Deleting a profile is permanent and cannot be undone."] = "警告：刪除配置檔案是永久性的，無法撤銷。"
L["Delete"] = "刪除"
L["Deleted profile: "] = "已刪除的配置檔案："
L["Are you sure you want to delete the profile '%s'? This cannot be undone."] = "你確定要刪除配置檔案 '%s' 嗎？此操作無法撤銷。"
L["Reset Current Profile"] = "重置當前配置檔案"
L["Restores the current profile to its defaults. This cannot be undone."] = "將當前配置檔案恢復到其預設設定。此操作無法撤銷。"
L["Reset Profile"] = "重置配置檔案"
L["All changes will be lost and the UI will be reloaded.\nAre you sure you want to reset your profile?"] = "所有更改都將丟失，並且介面將重新載入。\n你確定要重置你的配置檔案嗎？"
L["Profile reset to defaults."] = "配置檔案已重置為預設值。"

-- 單位框架層模組
L["Unit Frame Layers"] = "單位框架層"
L["Enable Unit Frame Layers"] = "啟用單位框架層"
L["Heal prediction, absorb shields, and animated health loss on unit frames"] = "單位框架上的治療預估、吸收護盾和動態生命值損失"
L["Heal prediction bars, absorb shields, and animated health loss overlays on unit frames."] = "單位框架上的治療預估條、吸收護盾和動態生命值損失覆蓋層。"
L["Show heal prediction, absorb shields, and animated health loss on all unit frames."] = "在所有單位框架上顯示治療預估、吸收護盾和動態生命值損失。"
L["Animated Health Loss"] = "動態生命值損失"
L["Show animated red health loss bar on player frame when taking damage."] = "受到傷害時，在玩家框架上顯示紅色的動態生命值損失條。"
L["Builder/Spender Feedback"] = "資源獲取/消耗反饋"
L["Show mana gain/loss glow feedback on player mana bar (experimental)."] = "在玩家法力條上顯示法力獲取/消耗的發光反饋（實驗性）。"

-- LAYOUT PRESETS
L["Layout Presets"] = "佈局預設"
L["Save and restore complete UI layouts. Each preset captures all positions, scales, and settings."] = "儲存和恢復完整的介面佈局。每個預設包含所有位置、縮放和設定。"
L["No presets saved yet."] = "尚未儲存任何預設。"
L["Save New Preset"] = "儲存新預設"
L["Save your current UI layout as a new preset."] = "將當前介面佈局儲存為新預設。"
L["Preset"] = "預設"
L["Enter a name for this preset:"] = "輸入此預設的名稱："
L["Save"] = "儲存"
L["Load"] = "載入"
L["Load preset '%s'? This will overwrite your current layout settings."] = "載入預設 '%s'？這將覆蓋您當前的佈局設定。"
L["Load Preset"] = "載入預設"
L["Delete preset '%s'? This cannot be undone."] = "刪除預設 '%s'？此操作無法撤銷。"
L["Delete Preset"] = "刪除預設"
L["Duplicate Preset"] = "複製預設"
L["Preset saved: "] = "預設已儲存: "
L["Preset loaded: "] = "預設已載入: "
L["Preset deleted: "] = "預設已刪除: "
L["Preset duplicated: "] = "預設已複製: "
L["Also delete all saved layout presets?"] = "是否同時刪除所有已儲存的佈局預設？"
L["Presets kept."] = "預設已保留。"

-- PRESET IMPORT / EXPORT
L["Export Preset"] = "匯出預設"
L["Import Preset"] = "匯入預設"
L["Import a preset from a text string shared by another player."] = "從其他玩家分享的文字中匯入預設。"
L["Import"] = "匯入"
L["Select All"] = "全選"
L["Close"] = "關閉"
L["Enter a name for the imported preset:"] = "為匯入的預設輸入名稱："
L["Imported Preset"] = "匯入的預設"
L["Preset imported: "] = "預設已匯入: "
L["Invalid preset string."] = "無效的預設字串。"
L["Not a valid DragonUI preset string."] = "不是有效的 DragonUI 預設字串。"
L["Failed to export preset."] = "匯出預設失敗。"

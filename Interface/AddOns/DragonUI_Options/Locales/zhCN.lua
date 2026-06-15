--[[
================================================================================
DragonUI_Options - 简体中文本地化文件
================================================================================
选项面板基础本地化：标签、描述、分区标题、下拉菜单值、打印信息、弹出文本。

添加新字符串时：
1. 在此处添加 L[<你的键>] = true
2. 在选项代码中使用 L["你的字符串"]
3. 为其他本地化文件添加翻译
================================================================================
]]

local L = LibStub("AceLocale-3.0"):NewLocale("DragonUI_Options", "zhCN")
if not L then return end

-- ============================================================================
-- 通用 / 面板
-- ============================================================================

L["DragonUI"] = "DragonUI"
L["Use the tabs on the left to configure modules, action bars, unit frames, minimap, and more."] = "使用左侧标签页配置模块、动作条、单位框架、小地图等。"
L["Editor Mode"] = "编辑模式"
L["Exit Editor Mode"] = "退出编辑模式"
L["KeyBind Mode Active"] = "按键绑定模式已激活"
L["Move UI Elements"] = "移动界面元素"
L["Cannot open options during combat."] = "战斗中无法打开选项。"
L["Open DragonUI Settings"] = "打开DragonUI设置"
L["Open the DragonUI configuration panel."] = "打开DragonUI配置面板。"
L["Use /dragonui to open the full settings panel."] = "输入 /dragonui 以打开完整设置面板。"

-- 快速操作
L["Quick Actions"] = "快速设置"
L["Jump to popular settings sections."] = "快速跳转到常用设置分区。"
L["Action Bar Layout"] = "动作条布局"
L["Configure dark tinting for all UI chrome."] = "为所有界面装饰元素配置深色着色。"
L["Full-width health bar that fills the entire player frame."] = "填满整个玩家框架的宽体生命条。"
L["Add a decorative dragon to your player frame."] = "为你的玩家框架添加装饰性的龙。"
L["Heal prediction, absorb shields and animated health loss."] = "治疗预估、吸收护盾和动态生命值损失。"
L["Change columns, rows, and buttons shown per action bar."] = "更改每个动作条显示的列、行和按钮数量。"
L["Switch micro menu icons between colored and grayscale style."] = "在彩色和灰度风格之间切换微型菜单图标。"
L["About"] = "关于"
L["Bringing the retail WoW look to 3.3.5a, inspired by Dragonflight UI."] = "受巨龙时代UI启发，为3.3.5a版本带来正式服《魔兽世界》的外观。"
L["Created and maintained by Neticsoul, with community contributions."] = "由Neticsoul创建和维护，并有社区贡献。"

L["Commands: /dragonui, /dui, /pi — /dragonui edit (editor) — /dragonui help"] = "命令：/dragonui, /dui, /pi — /dragonui edit (编辑) — /dragonui help"
L["GitHub (select and Ctrl+C to copy):"] = "GitHub (选中后按Ctrl+C复制)："
L["All"] = "全部"
L["Error:"] = "错误："
L["Error: DragonUI addon not found!"] = "错误：未找到DragonUI插件！"

-- ============================================================================
-- 静态弹出框
-- ============================================================================

L["Changing this setting requires a UI reload to apply correctly."] = "更改此设置需要重新加载界面才能正确应用。"
L["Reload UI"] = "重新加载界面"
L["Not Now"] = "以后再说"
L["Reload Now"] = "立即重载"
L["Cancel"] = "取消"
L["Yes"] = "是"
L["No"] = "否"

-- ============================================================================
-- 标签页名称
-- ============================================================================

L["General"] = "通用"
L["Modules"] = "模块"
L["Action Bars"] = "动作条"
L["Additional Bars"] = "附加动作条"
L["Minimap"] = "小地图"
L["Profiles"] = "配置文件"
L["Unit Frames"] = "单位框架"
L["XP & Rep Bars"] = "经验值 & 声望条"
L["Chat"] = "聊天"
L["Appearance"] = "\u5916\u89c2"

-- ============================================================================
-- 模块标签页
-- ============================================================================

-- 标题和描述
L["Module Control"] = "模块控制"
L["Enable or disable specific DragonUI modules"] = "启用或禁用特定的DragonUI模块"
L["Toggle individual modules on or off. Disabled modules revert to the default Blizzard UI."] = "切换单个模块的启用/禁用。禁用的模块将恢复为默认的暴雪界面。"
L["Visual enhancements that add Dragonflight-style polish to the UI."] = "为界面添加巨龙时代风格润色的视觉增强功能。"
L["Warning: These are individual module controls. The options above may control multiple modules at once. Changes here will be reflected above and vice versa."] = "警告：这是单个模块的控制。上方的选项可能同时控制多个模块。此处的更改会反映在上方，反之亦然。"
L["Warning:"] = "警告："
L["Individual overrides. The grouped toggles above take priority."] = "单个模块的覆盖设置。上方的分组开关具有优先级。"
L["Advanced - Individual Module Control"] = "高级 - 单个模块控制"

-- 分区标题
L["Cast Bars"] = "施法条"
L["Other Modules"] = "其他模块"
L["UI Systems"] = "界面系统"
L["Enable All Action Bar Modules"] = "启用所有动作条模块"
L["Cast Bar"] = "施法条"
L["Custom player, target, and focus cast bars"] = "自定义玩家、目标和焦点的施法条"
L["Cooldown text on action buttons"] = "动作按钮上的冷却时间文本"
L["Shaman totem bar positioning and styling"] = "萨满图腾条的位置和样式"
L["Dragonflight-styled player unit frame"] = "巨龙时代风格的玩家单位框架"
L["Dragonflight-styled boss target frames"] = "巨龙时代风格的团队首领目标框架"

-- 开关标签
L["Action Bars System"] = "动作条系统"
L["Micro Menu & Bags"] = "微型菜单和背包"
L["Cooldown Timers"] = "冷却计时器"
L["Minimap System"] = "小地图系统"
L["Buff Frame System"] = "增益效果框体系统"
L["Dark Mode"] = "暗色模式"
L["Item Quality Borders"] = "物品品质边框"
L["Enable Enhanced Tooltips"] = "启用增强型鼠标提示"
L["KeyBind Mode"] = "按键绑定模式"
L["Quest Tracker"] = "任务追踪器"

-- 模块开关描述
L["Enable DragonUI player castbar. When disabled, shows default Blizzard castbar."] = "启用DragonUI玩家施法条。禁用时，显示默认的暴雪施法条。"
L["Enable DragonUI player castbar styling."] = "启用DragonUI玩家施法条样式。"
L["Enable DragonUI target castbar. When disabled, shows default Blizzard castbar."] = "启用DragonUI目标施法条。禁用时，显示默认的暴雪施法条。"
L["Enable DragonUI target castbar styling."] = "启用DragonUI目标施法条样式。"
L["Enable DragonUI focus castbar. When disabled, shows default Blizzard castbar."] = "启用DragonUI焦点施法条。禁用时，显示默认的暴雪施法条。"
L["Enable DragonUI focus castbar styling."] = "启用DragonUI焦点施法条样式。"
L["Enable the complete DragonUI action bars system. This controls: Main action bars, vehicle interface, stance/shapeshift bars, pet action bars, multicast bars (totems/possess), button styling, and hide Blizzard elements. When disabled, all action bar related features will use default Blizzard interface."] = "启用完整的DragonUI动作条系统。控制内容包括：主动作条、载具界面、姿态/变形条、宠物动作条、多目标条（图腾/控制）、按钮样式，以及隐藏暴雪元素。禁用时，所有动作条相关功能将使用默认的暴雪界面。"
L["Master toggle for the complete action bars system."] = "动作条系统的总开关。"
L["Includes main bars, vehicle, stance, pet, totem bars, and button styling."] = "包括主动作条、载具、姿态、宠物、图腾条和按钮样式。"
L["Apply DragonUI micro menu and bags system styling and positioning. Includes character button, spellbook, talents, etc. and bag management. When disabled, these elements will use default Blizzard positioning and styling."] = "应用DragonUI微型菜单和背包系统的样式和位置。包括角色按钮、法术书、天赋等以及背包管理。禁用时，这些元素将使用默认的暴雪位置和样式。"
L["Micro menu and bags styling."] = "微型菜单和背包样式。"
L["Show cooldown timers on action buttons. When disabled, cooldown timers will be hidden and the system will be completely deactivated."] = "在动作按钮上显示冷却计时器。禁用时，冷却计时器将被隐藏，系统将完全停用。"
L["Show cooldown timers on action buttons."] = "在动作条上显示冷却时间数字。"
L["Enable DragonUI minimap enhancements including custom styling, positioning, tracking icons, and calendar. When disabled, uses default Blizzard minimap appearance and positioning."] = "启用DragonUI小地图增强功能，包括自定义样式、位置、追踪图标和日历。禁用时，使用默认的暴雪小地图外观和位置。"
L["Minimap styling, tracking icons, and calendar."] = "小地图样式、追踪图标和日历。"
L["Enable DragonUI buff frame with custom styling, positioning, and toggle button functionality. When disabled, uses default Blizzard buff frame appearance and positioning."] = "启用具有自定义样式、位置和切换按钮功能的DragonUI增益效果框体。禁用时，使用默认的暴雪增益效果框体外觀和位置。"
L["Buff frame styling and toggle button."] = "增益效果框体样式和切换按钮。"
L["Auras"] = "光环"
L["Show Toggle Button"] = "显示切换按钮"
L["Show a collapse/expand button next to the buff icons."] = "在增益图标旁显示折叠/展开按钮。"
L["Separate Weapon Enchants"] = "分离武器附魔"
L["Detach weapon enchant icons (poisons, sharpening stones, etc.) from the buff bar into their own independently moveable frame. Position it freely using Editor Mode."] = "将武器附魔图标（毒药、磨刀石等）从增益效果条分离到它们自己独立可移动的框体中。使用编辑模式自由放置。"
L["Weapon Enchants"] = "武器附魔"
L["Weapon enchant icons include rogue poisons, sharpening stones, wizard oils, and similar temporary weapon enhancements."] = "武器附魔图标包括：盗贼毒药、磨刀石、巫师之油及其他类似的临时武器强化效果。"
L["When enabled, a 'Weapon Enchants' mover appears in Editor Mode that you can drag to any position on screen."] = "启用后，编辑模式中会出现“武器附魔”移动器，可将其拖拽到屏幕任何位置。"
L["Positions"] = "位置"
L["Reset Buff Frame Position"] = "重置增益效果框体位置"
L["Reset Weapon Enchant Position"] = "重置武器附魔位置"
L["Buff frame position reset."] = "增益效果框体位置已重置。"
L["Weapon enchant position reset."] = "武器附魔位置已重置。"

L["DragonUI quest tracker positioning and styling."] = "DragonUI任务追踪器的位置和样式设置。"
L["LibKeyBound integration for intuitive hover + key press binding."] = "鼠标悬停+按键绑定的直观按键绑定（LibKeyBound）功能。"

-- 切换按键绑定模式描述
L["Toggle keybinding mode. Hover over action buttons and press keys to bind them instantly. Press ESC to clear bindings."] = "切换按键绑定模式。将鼠标悬停在动作按钮上并按键盘按键即可立即绑定。按ESC键清除绑定。"

-- 启用/禁用动态描述
L["Enable/disable "] = "启用/禁用："

-- 暗色模式
L["Dark Mode Intensity"] = "暗色模式强度"
L["Light (subtle)"] = "浅（轻微）"
L["Medium (balanced)"] = "中（均衡）"
L["Dark (maximum)"] = "深（最大）"
L["Apply darker tinted textures to all UI chrome: action bars, unit frames, minimap, bags, micro menu, and more."] = "对所有界面装饰元素应用深色纹理：动作条、单位框架、小地图、背包、微型菜单等。"
L["Apply darker tinted textures to all UI elements."] = "对所有界面元素应用深色着色。"
L["Darkens UI borders and chrome only: action bar borders, unit frame borders, minimap border, bag slot borders, micro menu, castbar borders, and decorative elements. Icons, portraits, and abilities are never affected."] = "仅使界面边框和装饰变暗：动作条边框、单位框架边框、小地图边框、背包格子边框、微型菜单、施法条边框和装饰元素。图标、头像和技能不受影响。"
L["Enable Dark Mode"] = "启用暗色模式"

-- 暗色模式 - 自定义颜色
L["Custom Color"] = "自定义颜色"
L["Override presets with a custom tint color."] = "使用自定义色调颜色覆盖预设。"
L["Tint Color"] = "色调选择"
L["Intensity"] = "明暗浓度"

-- 距离指示器
L["Tint action button icons when target is out of range (red), not enough mana (blue), or unusable (gray)."] = "当目标超出范围（红色）、法力不足（蓝色）或无法使用时（灰色），为动作按钮图标着色。"
L["Tints action button icons based on range and usability: red = out of range, blue = not enough mana, gray = unusable."] = "根据距离和使用情况为动作按钮图标着色：红色=超出范围，蓝色=法力不足，灰色=不可用。"
L["Enable Range Indicator"] = "启用距离指示器"
L["Color action button icons when target is out of range or ability is unusable."] = "当目标超出范围或技能无法使用时，为动作条图标着色。"

-- 物品品质边框
L["Show colored glow borders on action buttons containing items, colored by item quality (green = uncommon, blue = rare, purple = epic, etc.)."] = "在包含物品的动作按钮上显示按物品品质着色的发光边框（绿色=优秀，蓝色=精良，紫色=史诗等）。"
L["Enable Item Quality Borders"] = "启用物品品质边框"
L["Show quality-colored borders on items in bags, character panel, bank, merchant, and inspect frames."] = "在背包、角色面板、银行、商人窗口和观察窗口中的物品上显示按品质着色的边框。"
L["Adds quality-colored glow borders to items in your bags, character panel, bank, merchant, and inspect frames: green = uncommon, blue = rare, purple = epic, orange = legendary."] = "为背包、角色面板、银行、商人和观察窗口中的物品添加按品质着色的发光边框：绿色=优秀，蓝色=精良，紫色=史诗，橙色=传说。"
L["Minimum Quality"] = "最低品质"
L["Only show colored borders for items at or above this quality level."] = "仅为此品质等级及以上的物品显示彩色边框。"
L["Poor"] = "粗糙"
L["Common"] = "普通"
L["Uncommon"] = "优秀"
L["Rare"] = "精良"
L["Epic"] = "史诗"
L["Legendary"] = "传说"

-- 增强型鼠标提示
L["Enhanced Tooltips"] = "增强型鼠标提示"
L["Improves GameTooltip with class-colored borders, class-colored names, target-of-target info, and styled health bars."] = "改进游戏内鼠标提示：职业颜色边框、职业颜色名称、目标的目标信息以及样式化的生命条。"
L["Activate all tooltip improvements. Sub-options below control individual features."] = "激活所有鼠标提示改进功能。下方子选项控制单个功能。"
L["Class-Colored Border"] = "职业颜色边框"
L["Color the tooltip border by the unit's class (players) or reaction (NPCs)."] = "根据单位职业（玩家）或关系（NPC）为鼠标提示边框着色。"
L["Class-Colored Name"] = "职业颜色名称"
L["Color the unit name text in the tooltip by class color (players only)."] = "在鼠标提示中，根据职业颜色显示单位名称文本（仅限玩家）。"
L["Add a 'Targeting: <name>' line showing who the unit is targeting."] = "添加一行“目标：<名字>”以显示该单位的目标是谁。"
L["Add a 'Targeting: <name>' line to the tooltip showing who the unit is targeting."] = "在鼠标提示中添加一行“目标：<名字>”，显示该单位的目标。"
L["Styled Health Bar"] = "样式化生命条"
L["Restyle the tooltip health bar with class/reaction colors."] = "使用职业/关系颜色重新设计鼠标提示生命条样式。"
L["Restyle the tooltip health bar with class/reaction colors and slimmer look."] = "使用职业/关系颜色和更纤细的外观重新设计鼠标提示生命条。"
L["Anchor to Cursor"] = "锚定到光标"
L["Make the tooltip follow the cursor position instead of the default anchor."] = "使鼠标提示跟随光标位置，而不是默认的锚点。"

-- 聊天修改
L["Enable Chat Mods"] = "启用聊天功能修改"
L["Enables or disables Chat Mods."] = "启用或禁用聊天功能修改。"
L["Editbox Position"] = "输入框位置"
L["Choose where the chat editbox is positioned."] = "选择聊天输入框的摆放位置。"
L["Top"] = "顶部"
L["Bottom"] = "底部"
L["Middle"] = "中间"
L["Tab & Button Fade"] = "标签与按鈕淡出"
L["How visible chat tabs are when not hovered. 0 = fully hidden, 1 = fully visible."] = "鼠标未悬停时聊天标签的可见度。0 = 完全隐藏，1 = 完全可见。"
L["Chat Style Opacity"] = "聊天样式透明度"
L["Minimum opacity of the custom chat background. At 0 it fades with tabs; above 0 it stays partially visible when idle."] = "自定义聊天背景的最小透明度。0时与标签同步淡出；超出0则空闲时仍部分可见。"
L["Text Box Min Opacity"] = "输入框最小透明度"
L["Minimum opacity of the text input box when idle. At 0 it fades with tabs; above 0 it stays partially visible."] = "空闲时文本输入框的最小透明度。0时与标签同步淡出；超出0则仍部分可见。"
L["Chat Style"] = "\u804a\u5929\u6837\u5f0f"
L["Visual style for the chat frame background."] = "\u804a\u5929\u6846\u80cc\u666f\u7684\u89c6\u89c9\u6837\u5f0f\u3002"
L["Editbox Style"] = "输入框样式"
L["Visual style for the chat input box background."] = "聊天输入框背景的视觉样式。"
L["Dark"] = "\u6697\u8272"
L["DragonUI Style"] = "DragonUI \u6837\u5f0f"
L["Midnight"] = "\u5b50\u5915"

-- 背包整合 (Combuctor)
L["Enable Combuctor"] = "启用背包整合 (Combuctor)"
L["All-in-one bag replacement with item filtering, search, quality indicators, and bank integration."] = "具有物品过滤、搜索、品质指示器和银行整合功能的一体化背包替代插件。"
L["Combuctor Settings"] = "Combuctor设置"

-- 背包整理
L["Bag Sort"] = "背包整理"
L["Enable Bag Sort"] = "启用背包整理"
L["Sort buttons for bags and bank. Sorts items by type, rarity, level, and name."] = "背包和银行的整理按钮。按类型、稀有度、等级和名称排序物品。"
L["Add sort buttons to bag and bank frames. Also enables /sort and /sortbank slash commands."] = "为背包和银行窗口添加整理按钮。同时启用 /sort 和 /sortbank 命令。"
L["Sort bags and bank items with buttons"] = "通过按钮整理背包和银行物品"

L["Show 'All' Tab"] = "显示“全部”标签页"
L["Show the 'All' category tab that displays all items without filtering."] = "显示不过滤、展示所有物品的“全部”分类标签页。"
L["Equipment"] = "装备"
L["Usable"] = "消耗品"
L["Show Equipment Tab"] = "显示装备标签页"
L["Show the Equipment category tab for armor and weapons."] = "显示护甲和武器的装备分类标签页。"
L["Show Usable Tab"] = "显示消耗品标签页"
L["Show the Usable category tab for consumables and devices."] = "显示消耗品和设备的“消耗品”分类标签页。"
L["Show Consumable Tab"] = "显示消耗品标签页"
L["Show the Consumable category tab."] = "显示消耗品分类标签页。"
L["Show Quest Tab"] = "显示任务标签页"
L["Show the Quest items category tab."] = "显示任务物品分类标签页。"
L["Show Trade Goods Tab"] = "显示商品标签页"
L["Show the Trade Goods category tab (includes gems and recipes)."] = "显示商品（包括宝石和配方）分类标签页。"
L["Show Miscellaneous Tab"] = "显示其他标签页"
L["Show the Miscellaneous items category tab."] = "显示其他物品分类标签页。"
L["Left Side Tabs"] = "左侧标签页"
L["Place category filter tabs on the left side of the bag frame instead of the right."] = "将分类过滤标签页放在背包窗口的左侧而非右侧。"
L["Place category filter tabs on the left side of the bank frame instead of the right."] = "将分类过滤标签页放在银行窗口的左侧而非右侧。"
L["Changes require closing and reopening bags to take effect."] = "更改需要关闭并重新打开背包才能生效。"
L["Subtabs"] = "子标签页"
L["Configure which bottom subtabs appear within each category tab. Applies to both inventory and bank."] = "配置每个分类标签页内显示哪些底部的子标签页。同时适用于背包和银行。"
L["Normal"] = "普通"
L["Trade Bags"] = "专业背包"
L["Show the Normal bags subtab (non-profession bags)."] = "显示普通背包（非专业背包）子标签页。"
L["Show the Trade bags subtab (profession bags)."] = "显示专业背包子标签页。"
L["Show the Armor subtab."] = "显示护甲子标签页。"
L["Show the Weapon subtab."] = "显示武器子标签页。"
L["Show the Trinket subtab."] = "显示饰品子标签页。"
L["Show the Consumable subtab."] = "显示消耗品子标签页。"
L["Show the Devices subtab."] = "显示设备子标签页。"
L["Show the Trade Goods subtab."] = "显示商品子标签页。"
L["Show the Gem subtab."] = "显示宝石子标签页。"
L["Show the Recipe subtab."] = "显示配方子标签页。"
L["Configure Combuctor bag replacement settings."] = "配置背包整合 (Combuctor) 替代设置。"
L["Category Tabs"] = "分类标签页"
L["Inventory Tabs"] = "背包标签页"
L["Bank Tabs"] = "银行标签页"
L["Inventory"] = "背包"
L["Bank"] = "银行"
L["Choose which category tabs appear on the bag frame. Changes require closing and reopening bags to take effect."] = "选择在背包窗口上显示哪些分类标签页。更改需要关闭并重新打开背包才能生效。"
L["Choose which category tabs appear on the inventory bag frame."] = "选择在背包窗口上显示哪些分类标签页。"
L["Choose which category tabs appear on the bank frame."] = "选择在银行窗口上显示哪些分类标签页。"
L["Display"] = "显示"

-- 高级模块 - 备用显示名称
L["Main Bars"] = "主动作条"
L["Vehicle"] = "载具"
L["Multicast"] = "多目标施法"
L["Buttons"] = "按钮"
L["Hide Blizzard Elements"] = "隐藏暴雪默认元素"
L["Buffs"] = "增益效果"
L["KeyBinding"] = "按键绑定"
L["Cooldowns"] = "冷却时间"

-- 高级模块 - RegisterModule 显示名称（来自模块文件）
L["Micro Menu"] = "微型菜单"
L["Loot Roll"] = "掷骰"
L["Key Binding"] = "按键绑定"
L["Item Quality"] = "物品品质"
L["Buff Frame"] = "增益效果框体"
L["Hide Blizzard"] = "隐藏原始界面"
L["Tooltip"] = "鼠标提示"

-- 高级模块 - RegisterModule 描述（来自模块文件）
L["Micro menu and bags system styling and positioning"] = "微型菜单和背包系统的样式/位置设置"
L["Quest tracker positioning and styling"] = "任务追踪器位置和样式设置"
L["Enhanced tooltip styling with class colors and health bars"] = "带有职业颜色和生命条的增强型鼠标提示样式"
L["Hide default Blizzard UI elements"] = "隐藏默认的暴雪界面元素"
L["Custom minimap styling, positioning, tracking icons and calendar"] = "自定义小地图样式、位置、追踪图标和日历"
L["Main action bars, status bars, scaling and positioning"] = "主动作条、状态条、缩放和位置"
L["LibKeyBound integration for intuitive keybinding"] = "用于直观按键绑定的LibKeyBound集成"
L["Color item borders by quality in bags, character panel, bank, and merchant"] = "在背包、角色面板、银行、商人窗口按物品品质为边框着色"
L["Darken UI borders and chrome"] = "使界面边框和装饰变暗"
L["Action button styling and enhancements"] = "动作按钮样式和增强功能"
L["Custom buff frame styling, positioning and toggle button"] = "自定义增益效果框体样式、位置和切换按钮"
L["Vehicle interface enhancements"] = "载具界面增强功能"
L["Stance/shapeshift bar positioning and styling"] = "姿态/变形条位置和样式设置"
L["Pet action bar positioning and styling"] = "宠物动作条位置和样式设置"
L["Multicast (totem/possess) bar positioning and styling"] = "多目标施法（图腾/控制）条位置和样式设置"
L["Chat Mods"] = "聊天功能修改"
L["Chat enhancements: hide buttons, editbox position, URL copy, chat copy, link hover, tell target"] = "聊天增强：隐藏按钮、输入框位置、URL/聊天复制、链接悬停提示、/告诉目标"
L["Combuctor"] = "背包整合 (Combuctor)"
L["All-in-one bag replacement with filtering and search"] = "具有过滤和搜索功能的一体化背包替代"

-- ============================================================================
-- 动作条标签页
-- ============================================================================

-- 子标签页
L["Layout"] = "布局"
L["Visibility"] = "可见性"

-- 缩放比例部分
L["Action Bar Scales"] = "动作条缩放比例"
L["Main Bar Scale"] = "主动作条缩放"
L["Right Bar Scale"] = "右侧动作条缩放"
L["Left Bar Scale"] = "左侧动作条缩放"
L["Bottom Left Bar Scale"] = "左下动作条缩放"
L["Bottom Right Bar Scale"] = "右下动作条缩放"
L["Scale for main action bar"] = "主动作条缩放"
L["Scale for right action bar (MultiBarRight)"] = "右侧动作条缩放 (MultiBarRight)"
L["Scale for left action bar (MultiBarLeft)"] = "左侧动作条缩放 (MultiBarLeft)"
L["Scale for bottom left action bar (MultiBarBottomLeft)"] = "左下动作条缩放 (MultiBarBottomLeft)"
L["Scale for bottom right action bar (MultiBarBottomRight)"] = "右下动作条缩放 (MultiBarBottomRight)"
L["Reset All Scales"] = "重置所有缩放比例"
L["Reset all action bar scales to their default values (0.9)"] = "将所有动作条缩放比例重置为其默认值(0.9)"
L["All action bar scales reset to default values (0.9)"] = "所有动作条缩放比例已重置为默认值(0.9)"
L["All action bar scales reset to 0.9"] = "所有动作条缩放比例重置为0.9"

-- 位置部分
L["Action Bar Positions"] = "动作条位置"
L["Tip: Use the Move UI Elements button above to reposition action bars with your mouse."] = "提示：使用上方的“移动界面元素”按钮，用鼠标重新定位动作条。"
L["Left Bar Horizontal"] = "左侧条水平放置"
L["Make the left secondary bar horizontal instead of vertical."] = "将左侧辅助动作条改为水平放置，而非垂直。"
L["Right Bar Horizontal"] = "右侧条水平放置"
L["Make the right secondary bar horizontal instead of vertical."] = "将右侧辅助动作条改为水平放置，而非垂直。"

-- 按钮外观部分
L["Button Appearance"] = "按钮外观"
L["Main Bar Only Background"] = "仅主动作条显示背景"
L["If checked, only the main action bar buttons will have a background. If unchecked, all action bar buttons will have a background."] = "如果勾选，则只有主动作条的按钮会有背景。如果不勾选，则所有动作条按钮都有背景。"
L["Only the main action bar buttons will have a background."] = "仅主动作条的按钮显示背景。"
L["Hide Main Bar Background"] = "隐藏主动作条背景"
L["Hide the background texture of the main action bar (makes it completely transparent)"] = "隐藏主动作条的背景纹理（使其完全透明）"
L["Hide the background texture of the main action bar."] = "隐藏主动作条的背景纹理。"

-- 文本可见性
L["Text Visibility"] = "文本可见性"
L["Count Text"] = "数量文本"
L["Show Count"] = "显示数量"
L["Show Count Text"] = "显示叠加次数文本"
L["Hotkey Text"] = "按键文本"
L["Show Hotkey"] = "显示按键"
L["Show Hotkey Text"] = "显示按键文本"
L["Range Indicator"] = "距离指示器"
L["Show small range indicator point on buttons"] = "在按钮上显示小的距离指示点"
L["Show range indicator dot on buttons."] = "在按钮上显示距离指示点。"
L["Macro Text"] = "宏文本"
L["Show Macro Names"] = "显示宏名称"
L["Page Numbers"] = "页面编号"
L["Show Pages"] = "显示页面"
L["Show Page Numbers"] = "显示页面编号"

-- 冷却文本
L["Cooldown Text"] = "冷却文本"
L["Min Duration"] = "最短持续时间"
L["Minimum duration for text triggering"] = "触发文本显示的最短持续时间"
L["Minimum duration for cooldown text to appear."] = "冷却文本出现的最短持续时间设置。"
L["Text Color"] = "文本颜色"
L["Cooldown Text Color"] = "冷却文本颜色"
L["Size of cooldown text."] = "冷却文本的大小。"

-- 颜色
L["Colors"] = "颜色"
L["Macro Text Color"] = "宏文本颜色"
L["Color for macro text"] = "宏文本的颜色"
L["Hotkey Shadow Color"] = "按键阴影颜色"
L["Shadow color for hotkey text"] = "按键文本的阴影颜色"
L["Border Color"] = "边框颜色"
L["Border color for buttons"] = "按钮的边框颜色"

-- 狮鹫装饰
L["Gryphons"] = "狮鹫装饰"
L["Gryphon Style"] = "狮鹫样式"
L["Display style for the action bar end-cap gryphons."] = "动作条两端的狮鹫装饰的显示样式。"
L["End-cap ornaments flanking the main action bar."] = "主动作条两端的装饰纹样。"
L["Gryphon previews are hidden while D3D9Ex is active to avoid client crashes."] = "启用 D3D9Ex 时会隐藏狮鹫预览，以避免客户端崩溃。"
L["Style"] = "样式"
L["Old"] = "旧样式"
L["New"] = "新样式"
L["Flying"] = "飞行"
L["Hide Gryphons"] = "隐藏狮鹫"
L["Classic"] = "经典"
L["Dragonflight"] = "巨龙时代"
L["Hidden"] = "隐藏"
L["Dragonflight (Wyvern)"] = "巨龙时代 (双足飞龙)"
L["Dragonflight (Gryphon)"] = "巨龙时代 (狮鹫)"

-- 布局部分
L["Main Bar Layout"] = "主动作条布局"
L["Bottom Left Bar Layout"] = "左下动作条布局"
L["Bottom Right Bar Layout"] = "右下动作条布局"
L["Right Bar Layout"] = "右侧动作条布局"
L["Left Bar Layout"] = "左侧动作条布局"
L["Configure the main action bar grid layout. Rows are determined automatically from columns and buttons shown."] = "配置主动作条网格布局。行数根据列数和显示的按钮数自动确定。"
L["Columns"] = "列数"
L["Buttons Shown"] = "显示的按钮数"
L["Quick Presets"] = "快速预设"
L["Apply layout presets to multiple bars at once."] = "将布局预设同时应用于多个动作条。"
L["Both 1x12"] = "均为 1x12"
L["Both 2x6"] = "均为 2x6"
L["Reset All"] = "全部重置"
L["All bar layouts reset to defaults."] = "所有动作条布局已重置为默认值。"

-- 可见性部分
L["Bar Visibility"] = "动作条可见性"
L["Control when action bars are visible. Bars can show only on hover, only in combat, or both. When no option is checked the bar is always visible."] = "控制动作条的显示条件。动作条可以仅在鼠标悬停时显示、仅在战斗中显示，或两者皆可。未选择任何选项时，动作条始终可见。"
L["Enable / Disable Bars"] = "启用 / 禁用动作条"
L["Bottom Left Bar"] = "左下动作条"
L["Bottom Right Bar"] = "右下动作条"
L["Right Bar"] = "右侧动作条"
L["Left Bar"] = "左侧动作条"
L["Main Bar"] = "主动作条"
L["Show on Hover Only"] = "仅鼠标悬停时显示"
L["Show in Combat Only"] = "仅战斗中显示"
L["Hide the main bar until you hover over it."] = "仅在鼠标悬停时显示主动作条。"
L["Hide the main bar until you enter combat."] = "仅在进入战斗时显示主动作条。"

-- ============================================================================
-- 附加动作条标签页
-- ============================================================================

L["Bars that appear based on your class and situation."] = "根据你的职业和情况出现的动作条。"
L["Specialized bars that appear when needed (stance/pet/vehicle/totems)"] = "需要时出现的特殊动作条（姿态/宠物/载具/图腾）"
L["Auto-show bars: Stance (Warriors/Druids/DKs) • Pet (Hunters/Warlocks/DKs) • Vehicle (All classes) • Totem (Shamans)"] = "自动显示的动作条：姿态（战士/德鲁伊/死亡骑士）• 宠物（猎人/术士/死亡骑士）• 载具（全职业）• 图腾（萨满）"

-- 通用设置
L["Common Settings"] = "通用设置"
L["Button Size"] = "按钮大小"
L["Size of buttons for all additional bars"] = "所有附加动作条的按钮大小"
L["Button Spacing"] = "按钮间距"
L["Space between buttons for all additional bars"] = "所有附加动作条的按钮间距"

-- 姿态条
L["Stance Bar"] = "姿态条"
L["Warriors, Druids, Death Knights"] = "战士、德鲁伊、死亡骑士"
L["X Position"] = "水平位置"
L["Y Position"] = "垂直位置"
L["Y Offset"] = "Y轴偏移"
L["Horizontal position of stance bar from screen center. Negative values move left, positive values move right."] = "姿态条相对于屏幕中心的水平位置。负值向左移动，正值向右移动。"

-- 宠物动作条
L["Pet Bar"] = "宠物动作条"
L["Hunters, Warlocks, Death Knights - Use editor mode to move"] = "猎人、术士、死亡骑士 - 使用编辑模式移动"
L["Show Empty Slots"] = "显示空技能槽"
L["Display empty action slots on pet bar"] = "在宠物动作条上显示空的技能槽"

-- 载具动作条
L["Vehicle Bar"] = "载具动作条"
L["All classes (vehicles/special mounts)"] = "全职业（载具/特殊坐骑）"
L["Custom Art Style"] = "自定义艺术风格"
L["Use custom vehicle bar art style with health/power bars and themed skin. Requires UI reload to apply."] = "使用带有生命值/能量条和主题皮肤的自定义载具条艺术风格。需要重新加载界面才能应用。"
L["Blizzard Art Style"] = "暴雪艺术风格"
L["Use Blizzard vehicle bar art with health/power display. Requires reload."] = "使用带有生命值/能量显示的暴雪默认载具条艺术风格（需要重载界面）。"

-- 图腾条
L["Totem Bar"] = "图腾条"
L["Totem Bar (Shaman)"] = "图腾条（萨满）"
L["Shamans only - Totem multicast bar. Position is controlled via Editor Mode."] = "仅限萨满 - 图腾多目标施法条。位置通过编辑模式控制。"
L["TIP: Use Editor Mode to position the totem bar (type /dragonui edit)."] = "提示：使用编辑模式来定位图腾条（输入 /dragonui edit）。"

-- ============================================================================
-- 施法条标签页
-- ============================================================================

L["Player Castbar"] = "玩家施法条"
L["Target Castbar"] = "目标施法条"
L["Focus Castbar"] = "焦点施法条"

-- 子标签页
L["Player"] = "玩家"
L["Target"] = "目标"
L["Focus"] = "焦点"

-- 通用选项
L["Width"] = "宽度"
L["Width of the cast bar"] = "施法条的宽度"
L["Height"] = "高度"
L["Height of the cast bar"] = "施法条的高度"
L["Scale"] = "缩放比例"
L["Size scale of the cast bar"] = "施法条的缩放比例"
L["Show Icon"] = "显示图标"
L["Show the spell icon next to the cast bar"] = "在施法条旁边显示法术图标"
L["Show Spell Icon"] = "显示法术图标"
L["Show the spell icon next to the target castbar"] = "在目标施法条旁边显示法术图标"
L["Icon Size"] = "图标大小"
L["Size of the spell icon"] = "法术图标的大小"
L["Text Mode"] = "文本模式"
L["Choose how to display spell text: Simple (centered spell name only) or Detailed (spell name + time)"] = "选择法术文本的显示方式：简单（仅居中显示法术名称）或详细（法术名称 + 时间）"
L["Simple (Centered Name Only)"] = "简单（仅居中显示名称）"
L["Simple (Name Only)"] = "简单（仅显示名称）"
L["Simple"] = "简单"
L["Detailed (Name + Time)"] = "详细（名称 + 时间）"
L["Detailed"] = "详细"
L["Time Precision"] = "时间精度"
L["Decimal places for remaining time."] = "剩余时间的小数点位数。"
L["Max Time Precision"] = "最大时间精度"
L["Decimal places for total time."] = "总时间的小数点位数。"
L["Hold Time (Success)"] = "保持时间（成功）"
L["How long the bar stays visible after a successful cast."] = "成功施法后施法条保持可见的时间。"
L["How long the bar stays after a successful cast."] = "施法成功后施法条保持的时间。"
L["How long to show the castbar after successful completion"] = "施法成功完成后施法条显示的时间"
L["Hold Time (Interrupt)"] = "保持时间（打断）"
L["How long the bar stays visible after being interrupted."] = "施法被打断后施法条保持可见的时间。"
L["How long the bar stays after being interrupted."] = "施法被打断后施法条保持的时间。"
L["How long to show the castbar after interruption/failure"] = "施法被打断/失败后施法条显示的时间"
L["Auto-Adjust for Auras"] = "根据光环自动调整位置"
L["Automatically adjust position based on target auras (CRITICAL FEATURE)"] = "根据目标身上的光环自动调整位置（关键功能）"
L["Shift castbar when buff/debuff rows are showing."] = "当增益/减益效果行显示时，移动施法条位置。"
L["Automatically adjust position based on focus auras"] = "根据焦点目标身上的光环自动调整位置"
L["Reset Position"] = "重置位置"
L["Resets the X and Y position to default."] = "将X和Y位置重置为默认值。"
L["Reset target castbar position to default"] = "将目标施法条位置重置为默认值"
L["Reset focus castbar position to default"] = "将焦点施法条位置重置为默认值"
L["Player castbar position reset."] = "玩家施法条位置已重置。"
L["Target castbar position reset."] = "目标施法条位置已重置。"
L["Focus castbar position reset."] = "焦点施法条位置已重置。"
L["Castbar detached - positioned freely via Editor Mode"] = "施法条已分离 - 可在编辑模式中自由定位"
L["Castbar attached - follows Target frame"] = "施法条已附着 - 跟随目标框体"
L["Castbar attached - follows Focus frame"] = "施法条已附着 - 跟随焦点框体"
L["Re-attach Castbar to Target"] = "将施法条重新附着到目标"
L["Re-attach Castbar to Focus"] = "将施法条重新附着到焦点"

-- 目标/焦点施法条的宽度/高度描述
L["Width of the target castbar"] = "目标施法条的宽度"
L["Height of the target castbar"] = "目标施法条的高度"
L["Scale of the target castbar"] = "目标施法条的缩放比例"
L["Width of the focus castbar"] = "焦点施法条的宽度"
L["Height of the focus castbar"] = "焦点施法条的高度"
L["Scale of the focus castbar"] = "焦点施法条的缩放比例"
L["Show the spell icon next to the focus castbar"] = "在焦点施法条旁边显示法术图标"
L["Time to show the castbar after successful cast completion"] = "施法成功完成后施法条显示的时间"
L["Time to show the castbar after cast interruption"] = "施法被打断后施法条显示的时间"

-- Latency indicator (player only)
L["Latency Indicator"] = "延迟指示器"
L["Enable Latency Indicator"] = "启用延迟指示器"
L["Show a safe-zone overlay based on real cast latency."] = "基于实际施法延迟显示安全区域。"
L["Latency Color"] = "延迟颜色"
L["Latency Alpha"] = "延迟透明度"
L["Opacity of the latency indicator."] = "延迟指示器的透明度。"

-- ============================================================================
-- 增强功能标签页
-- ============================================================================

L["Enhancements"] = "增强功能"
L["Visual enhancements that add Dragonflight-style polish to the UI. These are optional — disable any you don't want."] = "为界面添加巨龙时代风格润色的视觉增强功能。这些是可选的——可禁用任何你不想要的功能。"

-- （暗色模式、距离指示器、物品品质、鼠标提示已在模块部分定义）

-- ============================================================================
-- 微型菜单标签页
-- ============================================================================

L["Gray Scale Icons"] = "灰度图标"
L["Grayscale Icons"] = "灰度图标"
L["Use grayscale icons instead of colored icons for the micro menu"] = "为微型菜单使用灰度图标而非彩色图标"
L["Use grayscale icons instead of colored icons."] = "使用灰度图标而非彩色图标。"
L["Grayscale Icons Settings"] = "灰度图标设置"
L["Normal Icons Settings"] = "普通图标设置"
L["Menu Scale"] = "菜单缩放"
L["Icon Spacing"] = "图标间距"
L["Hide on Vehicle"] = "在载具上时隐藏"
L["Hide micromenu and bags if you sit on vehicle"] = "如果你在载具上，则隐藏微型菜单和背包"
L["Hide micromenu and bags while in a vehicle."] = "在载具上时隐藏微型菜单和背包。"
L["Show Latency Indicator"] = "显示延迟指示器"
L["Show a colored bar below the Help button indicating connection quality (green/yellow/red). Requires UI reload."] = "在帮助按钮下方显示指示连接质量的彩色条（绿色/黄色/红色）。需要重新加载界面。"

-- 背包
L["Bags"] = "背包"
L["Configure the position and scale of the bag bar independently from the micro menu."] = "独立于微型菜单配置背包栏的位置和缩放。"
L["Bag Bar Scale"] = "背包栏缩放"

-- 经验值和声望条
L["XP & Rep Bars (Legacy Offsets)"] = "经验值和声望条（旧版偏移量）"
L["Main XP & Rep bar options have moved to the XP & Rep Bars tab."] = "主要的经验值和声望条选项已移至“经验值和声望条”标签页。"
L["These offset options are for advanced positioning adjustments."] = "这些偏移量选项用于高级位置微调。"
L["Both Bars Offset"] = "双条偏移量"
L["Y offset when XP & reputation bar are shown"] = "当经验值和声望条都显示时的Y轴偏移量"
L["Single Bar Offset"] = "单条偏移量"
L["Y offset when XP or reputation bar is shown"] = "当经验值或声望条显示时的Y轴偏移量"
L["No Bar Offset"] = "无条偏移量"
L["Y offset when no XP or reputation bar is shown"] = "当经验值或声望条均不显示时的Y轴偏移量"
L["Rep Bar Above XP Offset"] = "经验条上方的声望条偏移量"
L["Y offset for reputation bar when XP bar is shown"] = "当经验条显示时声望条的Y轴偏移量"
L["Rep Bar Offset"] = "声望条偏移量"
L["Y offset when XP bar is not shown"] = "当经验条不显示时的Y轴偏移量"

-- ============================================================================
-- 小地图标签页
-- ============================================================================

L["Basic Settings"] = "基本设置"
L["Border Alpha"] = "边框透明度"
L["Top border alpha (0 to hide)."] = "顶部边框的透明度（0为完全隐藏）。"
L["Addon Button Skin"] = "插件按钮皮肤"
L["Apply DragonUI border styling to addon icons (e.g., bag addons)"] = "为插件图标（例如背包插件）应用DragonUI边框样式"
L["Apply DragonUI border styling to addon icons."] = "为插件图标应用DragonUI边框样式。"
L["Addon Button Fade"] = "插件按钮淡出"
L["Addon icons fade out when not hovered."] = "插件图标在未悬停时淡出。"
L["Player Arrow Size"] = "玩家箭头大小"
L["Size of the player arrow on the minimap"] = "小地图上玩家箭头的大小"
L["New Blip Style"] = "新图标样式"
L["Use new DragonUI object icons on the minimap. When disabled, uses classic Blizzard icons."] = "在小地图上使用新的DragonUI对象图标。禁用时，使用经典的暴雪图标。"
L["Use newer-style minimap blip icons."] = "使用新样式的小地图图标。"

-- 时间与日历
L["Time & Calendar"] = "时间与日历"
L["Show Clock"] = "显示时钟"
L["Show/hide the minimap clock"] = "显示/隐藏小地图时钟"
L["Show Calendar"] = "显示日历"
L["Show/hide the calendar frame"] = "显示/隐藏日历框架"
L["Clock Font Size"] = "时钟字体大小"
L["Font size for the clock numbers on the minimap"] = "小地图上时钟数字的字体大小"

-- 显示设置
L["Display Settings"] = "显示设置"
L["Tracking Icons"] = "追踪图标"
L["Show current tracking icons (old style)."] = "显示当前的追踪图标（旧样式）。"
L["Zoom Buttons"] = "缩放按钮"
L["Show zoom buttons (+/-)."] = "显示缩放按钮 (+/-)。"
L["Zone Text Size"] = "区域文本大小"
L["Zone Text Font Size"] = "区域文本字体大小"
L["Zone text font size on top border"] = "顶部边框上区域文本的字体大小"
L["Font size of the zone text above the minimap."] = "小地图上方区域文本的字体大小设置。"

-- 位置
L["Position"] = "位置"
L["Reset minimap to default position (top-right corner)"] = "将小地图重置到默认位置（右上角）"
L["Reset Minimap Position"] = "重置小地图位置"
L["Minimap position reset to default"] = "小地图位置已重置为默认值"
L["Minimap position reset."] = "小地图位置已重置。"

-- ============================================================================
-- 任务追踪器标签页
-- ============================================================================

L["Configures the quest objective tracker position and behavior."] = "配置任务目标追踪器的位置和行为。"
L["Position and display settings for the objective tracker."] = "任务追踪器的位置和显示设置。"
L["Show Header Background"] = "显示标题背景"
L["Show/hide the decorative header background texture."] = "显示/隐藏装饰性的标题背景纹理。"
L["Anchor Point"] = "锚点"
L["Screen anchor point for the quest tracker."] = "任务追踪器的屏幕锚点。"
L["Top Right"] = "右上"
L["Top Left"] = "左上"
L["Bottom Right"] = "右下"
L["Bottom Left"] = "左下"
L["Center"] = "中央"
L["Horizontal position offset"] = "水平位置偏移量"
L["Vertical position offset"] = "垂直位置偏移量"
L["Reset quest tracker to default position"] = "将任务追踪器重置为默认位置"
L["Font Size"] = "字体大小"
L["Font size for quest tracker text"] = "任务追踪器文本的字体大小设置"

-- ============================================================================
-- 单位框架标签页
-- ============================================================================

-- 子标签页
L["Pet"] = "宠物"
L["ToT / ToF"] = "目标的目标 / 焦点的目标"
L["Party"] = "小队"

-- 通用选项
L["Global Scale"] = "全局缩放"
L["Global scale for all unit frames"] = "所有单位框架的全局缩放"
L["Scale of the player frame"] = "玩家框架的缩放"
L["Scale of the target frame"] = "目标框架的缩放"
L["Scale of the focus frame"] = "焦点框架的缩放"
L["Scale of the pet frame"] = "宠物框架的缩放"
L["Scale of the target of target frame"] = "目标的目标框架的缩放"
L["Scale of the focus of target frame"] = "焦点的目标框架的缩放"
L["Scale of party frames"] = "小队框架的缩放"
L["Class Color"] = "职业颜色"
L["Class Color Health"] = "生命条职业颜色"
L["Use class color for health bar"] = "生命条使用职业颜色"
L["Use class color for health bars in party frames"] = "小队框架的生命条使用职业颜色"
L["Class Portrait"] = "职业头像"
L["Show class icon instead of 3D portrait"] = "显示职业图标而非3D头像"
L["Show class icon instead of 3D portrait (only for players)"] = "显示职业图标而非3D头像（仅限玩家）"
L["Class icon instead of 3D model for players."] = "玩家头像使用职业图标而非3D模型。"
L["Alternative Class Icons"] = "替代职业图标"
L["Use DragonUI alternative class icons instead of Blizzard's class icon atlas."] = "使用 DragonUI 的替代职业图标，而不是 Blizzard 的职业图标图集。"
L["Large Numbers"] = "大数字缩写"
L["Format Large Numbers"] = "大数字缩写格式"
L["Format large numbers (1k, 1m)"] = "大数字缩写格式 (1k, 1m)"
L["Text Format"] = "文本格式"
L["How to display health and mana values"] = "生命值和法力值的显示方式"
L["Choose how to display health and mana text"] = "选择生命值和法力值文本的显示方式"

-- 文本格式值
L["Current Value Only"] = "仅当前值"
L["Current Value"] = "当前值"
L["Percentage Only"] = "仅百分比"
L["Percentage"] = "百分比"
L["Both (Numbers + Percentage)"] = "两者（数值 + 百分比）"
L["Numbers + %"] = "数值 + %"
L["Current/Max Values"] = "当前/最大值"
L["Current / Max"] = "当前 / 最大"

-- 小队文本格式值
L["Current Value Only (2345)"] = "仅当前值 (2345)"
L["Formatted Current (2.3k)"] = "缩写的当前值 (2.3k)"
L["Percentage Only (75%)"] = "仅百分比 (75%)"
L["Percentage + Current (75% | 2.3k)"] = "百分比 + 当前值 (75% | 2.3k)"

-- 生命值/法力值文本
L["Always Show Health Text"] = "始终显示生命值文本"
L["Show health text always (true) or only on hover (false)"] = "始终显示生命值文本（是）或仅在悬停时显示（否）"
L["Always show health text on party frames (instead of only on hover)"] = "在小队框架上始终显示生命值文本（而不仅是悬停时）"
L["Always display health text (otherwise only on mouseover)"] = "始终显示生命值文本（默认：仅鼠标悬停时显示）"
L["Always Show Mana Text"] = "始终显示法力值文本"
L["Show mana/power text always (true) or only on hover (false)"] = "始终显示法力值/能量文本（是）或仅在悬停时显示（否）"
L["Always show mana text on party frames (instead of only on hover)"] = "在小队框架上始终显示法力值文本（而不仅是悬停时）"
L["Always display mana/energy/rage text (otherwise only on mouseover)"] = "始终显示法力值/能量/怒气文本（默认：仅鼠标悬停时显示）"

-- 玩家框架特定选项
L["Player Frame"] = "玩家框架"
L["Dragon Decoration"] = "龙形装饰"
L["Add decorative dragon to your player frame for a premium look"] = "为你的玩家框架添加装饰性的龙，以获得高级外观"
L["None"] = "无"
L["Elite Dragon (Golden)"] = "精英龙（金色）"
L["Elite (Golden)"] = "精英（金色）"
L["RareElite Dragon (Winged)"] = "稀有精英龙（有翼）"
L["RareElite (Winged)"] = "稀有精英（有翼）"
L["Glow Effects"] = "发光效果"
L["Show Rest Glow"] = "显示休息时发光效果"
L["Show a golden glow around the player frame when resting (in an inn or city). Works with all frame modes: normal, elite, fat health bar, and vehicle."] = "休息时（在旅店或城市中）在玩家框架周围显示金色发光效果。适用于所有框架模式：普通、精英、宽体生命条和载具。"
L["Golden glow around the player frame when resting (inn or city). Works with all frame modes."] = "休息时（在旅店或城市中）在玩家框架周围显示金色发光效果。适用于所有框架模式。"
L["Combat Flash"] = "战斗闪光"
L["Show Combat Flash"] = "显示战斗闪光"
L["Pulsing glow effect when entering combat. Works with all frame modes."] = "进入战斗时的脉冲发光效果。适用于所有框架模式。"
L["Combat Flash Opacity"] = "战斗闪光不透明度"
L["Maximum opacity of the combat flash pulse effect."] = "战斗闪光脉冲效果的最大不透明度。"
L["Always Show Alternate Mana Text"] = "始终显示备用法力文本"
L["Show mana text always visible (default: hover only)"] = "始终显示法力值文本（默认：仅悬停时显示）"
L["Alternate Mana (Druid)"] = "备用法力（德鲁伊）"
L["Always Show"] = "始终显示"
L["Druid mana text visible at all times, not just on hover."] = "德鲁伊的法力值文本始终可见，而不仅是悬停时。"
L["Alternate Mana Text Format"] = "备用法力文本格式"
L["Choose text format for alternate mana display"] = "选择备用法力显示的文本格式"
L["Percentage + Current/Max"] = "百分比 + 当前/最大值"

-- 宽体生命条
L["Health Bar Style"] = "生命条样式"
L["Fat Health Bar"] = "宽体生命条"
L["Enable"] = "启用"
L["Full-width health bar that fills the entire frame area. Uses modified border texture that removes the inner divider line. Compatible with Dragon Decoration (requires fat variant textures). Note: Automatically disabled during vehicle UI."] = "填充整个框架区域的宽体生命条。使用移除了内部分隔线的修改边框纹理。与龙形装饰兼容（需要宽体变体纹理）。注意：在载具界面期间会自动禁用。"
L["Full-width health bar. Auto-disabled in vehicles."] = "宽体生命条。乘坐载具时自动禁用。"
L["Hide Mana Bar (Fat Mode)"] = "隐藏法力条（宽体模式）"
L["Hide Mana Bar"] = "隐藏法力条"
L["Completely hide the mana bar when Fat Health Bar is active."] = "当宽体生命条激活时，完全隐藏法力条。"
L["Mana Bar Width (Fat Mode)"] = "法力条宽度（宽体模式）"
L["Mana Bar Width"] = "法力条宽度"
L["Width of the mana bar when Fat Health Bar is active. Movable via Editor Mode."] = "宽体生命条激活时，法力条的宽度。可通过编辑模式移动。"
L["Mana Bar Height (Fat Mode)"] = "法力条高度（宽体模式）"
L["Mana Bar Height"] = "法力条高度"
L["Height of the mana bar when Fat Health Bar is active."] = "宽体生命条激活时，法力条的高度。"
L["Mana Bar Texture"] = "法力条纹理"
L["Choose the texture style for the power/mana bar. Only applies in Fat Health Bar mode."] = "选择能量/法力条的纹理样式。仅适用于宽体生命条模式。"
L["DragonUI (Default)"] = "DragonUI（默认）"
L["Blizzard Classic"] = "暴雪经典"
L["Flat Solid"] = "纯色扁平"
L["Smooth"] = "平滑"
L["Aluminium"] = "铝制"
L["LiteStep"] = "轻步"

-- 能量条颜色
L["Power Bar Colors"] = "能量条颜色"
L["Mana"] = "法力"
L["Rage"] = "怒气"
L["Energy"] = "能量"
L["Runic Power"] = "符文能量"
L["Happiness"] = "快乐值"
L["Runes"] = "符文"
L["Reset Colors to Default"] = "重置颜色为默认值"

-- 目标框架
L["Target Frame"] = "目标框架"
L["Threat Glow"] = "仇恨发光效果"
L["Show threat glow effect"] = "显示仇恨发光效果"
L["Show Name Background"] = "显示名称背景"
L["Show the colored name background behind the target name."] = "在目标名称后面显示有颜色的名称背景。"

-- 焦点框架
L["Focus Frame"] = "焦点框架"
L["Show the colored name background behind the focus name."] = "在焦点名称后面显示有颜色的名称背景。"
L["Show Buff/Debuff on Focus"] = "在焦点上显示增益/减益"
L["Uses the native large focus frame mode to show buffs and debuffs on the focus frame."] = "使用原生的大型焦点框架模式，在焦点框架上显示增益和减益。"
L["Override Position"] = "覆盖默认位置"
L["Override default positioning"] = "覆盖默认位置设置"
L["Move the pet frame independently from the player frame."] = "将宠物框架与玩家框架分开移动。"

-- 宠物框架
L["Pet Frame"] = "宠物框架"
L["Allows the pet frame to be moved freely. When unchecked, it will be positioned relative to the player frame."] = "允许宠物框架自由移动。不勾选时，它将相对于玩家框架定位。"
L["Horizontal position (only active if Override is checked)"] = "水平位置（仅在“覆盖默认位置”勾选时生效）"
L["Vertical position (only active if Override is checked)"] = "垂直位置（仅在“覆盖默认位置”勾选时生效）"

-- 目标的目标
L["Target of Target"] = "目标的目标"
L["Follows the Target frame by default. Move it in Editor Mode (/dragonui edit) to detach and position freely."] = "默认跟随目标框架。在编辑模式（/dragonui edit）中移动它可使其分离并自由定位。"
L["Detached — positioned freely via Editor Mode"] = "已分离 — 通过编辑模式自由定位"
L["Attached — follows Target frame"] = "已附加 — 跟随目标框架"
L["Re-attach to Target"] = "重新附加到目标框架"

-- 焦点的目标
L["Target of Focus"] = "焦点的目标"
L["Follows the Focus frame by default. Move it in Editor Mode (/dragonui edit) to detach and position freely."] = "默认跟随焦点框架。在编辑模式（/dragonui edit）中移动它可使其分离并自由定位。"
L["Attached — follows Focus frame"] = "已附加 — 跟随焦点框架"
L["Re-attach to Focus"] = "重新附加到焦点框架"

-- 小队框架
L["Party Frames"] = "小队框架"
L["Party Frames Configuration"] = "小队框架配置"
L["Custom styling for party member frames with automatic health/mana text display and class colors."] = "具有自动生命值/法力值文本显示和职业颜色的自定义小队成员框架样式。"

-- 首领框架
L["Boss Frames"] = "首领框架"
L["Enabled"] = "已启用"

L["Orientation"] = "排列方向"
L["Vertical"] = "垂直"
L["Horizontal"] = "水平"
L["Party frame orientation"] = "小队框架排列方向"
L["Vertical Padding"] = "垂直间距"
L["Space between party frames in vertical mode."] = "垂直排列模式下，小队框架之间的间距。"
L["Horizontal Padding"] = "水平间距"
L["Space between party frames in horizontal mode."] = "水平排列模式下，小队框架之间的间距。"

-- ============================================================================
-- 经验值和声望条标签页
-- ============================================================================

L["Bar Style"] = "条样式"
L["XP / Rep Bar Style"] = "经验值 / 声望条样式"
L["DragonflightUI: fully custom bars with rested XP background.\nRetailUI: atlas-based reskin of Blizzard bars.\n\nChanging style requires a UI reload."] = "DragonflightUI：带有休息经验值背景的完全自定义条。\nRetailUI：基于图集的暴雪条重制版。\n\n更改样式需要重新加载界面。"
L["DragonflightUI"] = "巨龙时代UI"
L["RetailUI"] = "正式服UI"
L["XP bar style changed to "] = "经验条样式更改为："
L["A UI reload is required to apply this change."] = "需要重新加载界面以应用此更改。"

-- 大小和缩放
L["Size & Scale"] = "大小和缩放"
L["Bar Height"] = "条高度"
L["Height of the XP and Reputation bars (in pixels)."] = "经验值和声望条的高度（以像素为单位）。"
L["Experience Bar Scale"] = "经验条缩放"
L["Scale of the experience bar."] = "经验条的缩放比例。"
L["Reputation Bar Scale"] = "声望条缩放"
L["Scale of the reputation bar."] = "声望条的缩放比例。"

-- 休息经验值
L["Rested XP"] = "休息经验值"
L["Show Rested XP Background"] = "显示休息经验值背景"
L["Display a translucent bar showing the total available rested XP range.\n(DragonflightUI style only)"] = "显示一个半透明条，指示可用的总休息经验值范围。\n（仅限巨龙时代UI样式）"
L["Show Exhaustion Tick"] = "显示休息状态分界线"
L["Show the exhaustion tick indicator on the XP bar, marking where rested XP ends."] = "在经验条上显示休息状态分界线指示器，标记休息经验值结束的位置。"

-- 文本显示
L["Text Display"] = "文本显示"
L["Always Show Text"] = "始终显示文本"
L["Always display XP/Rep text instead of only on hover."] = "始终显示经验值/声望文本，而不仅是鼠标悬停时。"
L["Show XP Percentage"] = "显示经验值百分比"
L["Display XP percentage alongside the value text."] = "在数值文本旁边显示经验值百分比。"

-- ============================================================================
-- 配置文件标签页
-- ============================================================================

L["Database not available."] = "数据库不可用。"
L["Save and switch between different configurations per character."] = "为每个角色保存和切换不同的配置。"
L["Current Profile"] = "当前配置文件"
L["Active: "] = "激活的配置文件："
L["Switch or Create Profile"] = "切换或创建配置文件"
L["Select Profile"] = "选择配置文件"
L["New Profile Name"] = "新配置文件名"
L["Copy From"] = "从何处复制"
L["Copies all settings from the selected profile into your current one."] = "将所选配置文件的所有设置复制到当前配置文件中。"
L["Copied profile: "] = "已复制的配置文件："
L["Delete Profile"] = "删除配置文件"
L["Warning: Deleting a profile is permanent and cannot be undone."] = "警告：删除配置文件是永久性的，无法撤销。"
L["Delete"] = "删除"
L["Deleted profile: "] = "已删除的配置文件："
L["Are you sure you want to delete the profile '%s'? This cannot be undone."] = "你确定要删除配置文件 '%s' 吗？此操作无法撤销。"
L["Reset Current Profile"] = "重置当前配置文件"
L["Restores the current profile to its defaults. This cannot be undone."] = "将当前配置文件恢复到其默认设置。此操作无法撤销。"
L["Reset Profile"] = "重置配置文件"
L["All changes will be lost and the UI will be reloaded.\nAre you sure you want to reset your profile?"] = "所有更改都将丢失，并且界面将重新加载。\n你确定要重置你的配置文件吗？"
L["Profile reset to defaults."] = "配置文件已重置为默认值。"

-- 单位框架层模块
L["Unit Frame Layers"] = "单位框架层"
L["Enable Unit Frame Layers"] = "启用单位框架层"
L["Heal prediction, absorb shields, and animated health loss on unit frames"] = "单位框架上的治疗预估、吸收护盾和动态生命值损失"
L["Heal prediction bars, absorb shields, and animated health loss overlays on unit frames."] = "单位框架上的治疗预估条、吸收护盾和动态生命值损失覆盖层。"
L["Show heal prediction, absorb shields, and animated health loss on all unit frames."] = "在所有单位框架上显示治疗预估、吸收护盾和动态生命值损失。"
L["Animated Health Loss"] = "动态生命值损失"
L["Show animated red health loss bar on player frame when taking damage."] = "受到伤害时，在玩家框架上显示红色的动态生命值损失条。"
L["Builder/Spender Feedback"] = "资源获取/消耗反馈"
L["Show mana gain/loss glow feedback on player mana bar (experimental)."] = "在玩家法力条上显示法力获取/消耗的发光反馈（实验性）。"

-- LAYOUT PRESETS
L["Layout Presets"] = "布局预设"
L["Save and restore complete UI layouts. Each preset captures all positions, scales, and settings."] = "保存和恢复完整的界面布局。每个预设包含所有位置、缩放和设置。"
L["No presets saved yet."] = "尚未保存任何预设。"
L["Save New Preset"] = "保存新预设"
L["Save your current UI layout as a new preset."] = "将当前界面布局保存为新预设。"
L["Preset"] = "预设"
L["Enter a name for this preset:"] = "输入此预设的名称："
L["Save"] = "保存"
L["Load"] = "加载"
L["Load preset '%s'? This will overwrite your current layout settings."] = "加载预设 '%s'？这将覆盖您当前的布局设置。"
L["Load Preset"] = "加载预设"
L["Delete preset '%s'? This cannot be undone."] = "删除预设 '%s'？此操作无法撤销。"
L["Delete Preset"] = "删除预设"
L["Duplicate Preset"] = "复制预设"
L["Preset saved: "] = "预设已保存: "
L["Preset loaded: "] = "预设已加载: "
L["Preset deleted: "] = "预设已删除: "
L["Preset duplicated: "] = "预设已复制: "
L["Also delete all saved layout presets?"] = "是否同时删除所有已保存的布局预设？"
L["Presets kept."] = "预设已保留。"

-- PRESET IMPORT / EXPORT
L["Export Preset"] = "导出预设"
L["Import Preset"] = "导入预设"
L["Import a preset from a text string shared by another player."] = "从其他玩家分享的文本中导入预设。"
L["Import"] = "导入"
L["Select All"] = "全选"
L["Close"] = "关闭"
L["Enter a name for the imported preset:"] = "为导入的预设输入名称："
L["Imported Preset"] = "导入的预设"
L["Preset imported: "] = "预设已导入: "
L["Invalid preset string."] = "无效的预设字符串。"
L["Not a valid DragonUI preset string."] = "不是有效的 DragonUI 预设字符串。"
L["Failed to export preset."] = "导出预设失败。"

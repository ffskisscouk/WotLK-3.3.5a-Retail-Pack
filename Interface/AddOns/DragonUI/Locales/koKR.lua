--[[
================================================================================
DragonUI - English Locale (Default)
================================================================================
Base locale. All keys use `true` (the key itself is the display value).

When adding new strings:
1. Add L[<your key>] = true here
2. Use L["Your String"] in your code
3. Add translations to other locale files
================================================================================
]]

local L = LibStub("AceLocale-3.0"):NewLocale("DragonUI", "koKR")
if not L then return end

-- ============================================================================
-- CORE / GENERAL
-- ============================================================================

-- Combat lockdown messages
L["Cannot toggle editor mode during combat!"] = "전투 중에는 편집 모드를 열 수 없습니다!"
L["Cannot reset positions during combat!"] = "전투 중에는 위치를 초기화할 수 없습니다!"
L["Cannot toggle keybind mode during combat!"] = "전투 중에는 단축키 설정 모드를 열 수 없습니다!"
L["Cannot move frames during combat!"] = "전투 중에는 프레임을 이동할 수 없습니다!"
L["Cannot open options in combat."] = "전투 중에는 옵션을 열 수 없습니다."
L["Options panel not available. Try /reload."] = "옵션 패널을 사용할 수 없습니다. /reload를 시도하세요."

-- Module availability
L["Editor mode not available."] = "편집 모드를 사용할 수 없습니다."
L["Keybind mode not available."] = "단축키 설정 모드를 사용할 수 없습니다."
L["Vehicle debug not available"] = "탈것 디버그를 사용할 수 없습니다."
L["KeyBinding module not available"] = "단축키 설정 모듈을 사용할 수 없습니다."
L["Unable to open configuration"] = "설정창을 열 수 없습니다."
L["Commands: /dragonui config, /dragonui edit"] = "명령어: /dragonui config, /dragonui edit"
L["Reset position: %s"] = "위치 초기화: %s"
L["All positions reset to defaults"] = "모든 위치가 기본값으로 초기화되었습니다"
L["Editor mode enabled - Drag frames to reposition"] = "편집 모드 활성화 - 프레임을 드래그하여 위치 변경"
L["Editor mode disabled - Positions saved"] = "편집 모드 비활성화 - 위치가 저장되었습니다"
L["Minimap module restored to Blizzard defaults"] = "미니맵 모듈이 블리자드 기본값으로 복원되었습니다"
L["All action bar scales reset to default values"] = "모든 액션바 크기가 기본값으로 초기화되었습니다"
L["Minimap position reset to default"] = "미니맵 위치가 기본값으로 초기화되었습니다"
L["Targeting: %s"] = "대상 지정: %s"
L["XP: %d/%d"] = "XP: %d/%d"
L["GROUP %d"] = "그룹 %d"
L["XP: "] = "XP: "
L["Remaining: "] = "남음: "
L["Rested: "] = "휴식: "

-- Errors
L["Error executing pending operation:"] = "대기 중인 작업 실행 오류:"
L["Error -- Addon 'DragonUI_Options' not found or is disabled."] = "오류 -- 'DragonUI_Options' 애드온을 찾을 수 없거나 비활성화되어 있습니다."

-- ============================================================================
-- SLASH COMMANDS / HELP
-- ============================================================================

L["Unknown command: "] = "알 수 없는 명령어: "
L["=== DragonUI Commands ==="] = "=== DragonUI 명령어 ==="
L["/dragonui or /dui - Open configuration"] = "/dragonui 또는 /dui - 설정창 열기"
L["/dragonui config - Open configuration"] = "/dragonui config - 설정창 열기"
L["/dragonui edit - Toggle editor mode (move UI elements)"] = "/dragonui edit - 편집 모드 전환 (UI 요소 이동)"
L["/dragonui reset - Reset all positions to defaults"] = "/dragonui reset - 모든 위치를 기본값으로 초기화"
L["/dragonui reset <name> - Reset specific mover"] = "/dragonui reset <이름> - 특정 요소의 위치 초기화"
L["/dragonui status - Show module status"] = "/dragonui status - 모듈 상태 표시"
L["/dragonui kb - Toggle keybind mode"] = "/dragonui kb - 단축키 설정 모드 전환"
L["/dragonui version - Show version info"] = "/dragonui version - 버전 정보 표시"
L["/dragonui help - Show this help"] = "/dragonui help - 도움말 표시"
L["/rl - Reload UI"] = "/rl - UI 재설정(리로드)"

-- ============================================================================
-- STATUS DISPLAY
-- ============================================================================

L["=== DragonUI Status ==="] = "=== DragonUI 상태 ==="
L["Detected Modules:"] = "감지된 모듈:"
L["Loaded"] = "로드됨"
L["Not Loaded"] = "로드되지 않음"
L["Target Frame"] = true
L["Focus Frame"] = true
L["Party Frames"] = true
L["Cooldowns"] = true
L["Registered Movers: "] = "등록된 이동 지점: "
L["Editable Frames: "] = "편집 가능한 프레임: "
L["DragonUI Version: "] = "DragonUI 버전: "
L["Use /dragonui edit to enter edit mode, then right-click frames to reset."] = "/dragonui edit를 입력하여 편집 모드로 들어간 뒤, 프레임을 우클릭하면 위치가 초기화됩니다."

-- ============================================================================
-- EDITOR MODE
-- ============================================================================

L["Exit Edit Mode"] = "편집 모드 종료"
L["Reset All Positions"] = "모든 위치 초기화"
L["Are you sure you want to reset all interface elements to their default positions?"] = "모든 인터페이스 요소를 기본 위치로 초기화하시겠습니까?"
L["Yes"] = "예"
L["No"] = "아니요"
L["UI elements have been repositioned. Reload UI to ensure all graphics display correctly?"] = "UI 요소의 위치가 변경되었습니다. 모든 그래픽이 올바르게 표시되도록 UI를 재설정하시겠습니까?"
L["Reload Now"] = "지금 재설정"
L["Later"] = "나중에"

-- ============================================================================
-- KEYBINDING MODULE
-- ============================================================================

L["LibKeyBound-1.0 not found or failed to load:"] = "LibKeyBound-1.0을 찾을 수 없거나 로드에 실패했습니다:"
L["Commands:"] = "명령어:"
L["/dukb - Toggle keybinding mode"] = "/dukb - 단축키 설정 모드 전환"
L["/dukb help - Show this help"] = "/dukb help - 도움말 표시"
L["Module disabled."] = "모듈이 비활성화되었습니다."
L["Keybinding mode activated. Hover over buttons and press keys to bind them."] = "단축키 설정 모드가 활성화되었습니다. 버튼 위에 마우스를 올리고 키를 누르면 지정됩니다."
L["Keybinding mode deactivated."] = "단축키 설정 모드가 비활성화되었습니다."

-- ============================================================================
-- GAME MENU
-- ============================================================================


-- ============================================================================
-- MINIMAP MODULE
-- ============================================================================

L["DragonUI: Minimap module restored to Blizzard defaults"] = "DragonUI: 미니맵 모듈이 블리자드 기본값으로 복구되었습니다."

-- ============================================================================
-- EDITOR MODE LABELS (displayed on mover overlays)
-- ============================================================================

L["MainBar"] = "주 단축바"
L["RightBar"] = "우측 단축바"
L["LeftBar"] = "좌측 단축바"
L["BottomBarLeft"] = "하단 좌측"
L["BottomBarRight"] = "하단 우측"
L["XPBar"] = "경험치 바"
L["RepBar"] = "평판 바"
L["MinimapFrame"] = "미니맵"
L["LFGFrame"] = "던전 찾기"
L["PlayerFrame"] = "플레이어"
L["ManaBar"] = "마나 바"
L["PetFrame"] = "소환수"
L["ToF"] = "주시의 대상"
L["tot"] = "대상의 대상"
L["ToT"] = "대상의 대상"
L["fot"] = "주시의 대상"
L["PartyFrames"] = "파티"
L["TargetFrame"] = "대상"
L["FocusFrame"] = "주시 대상"
L["TargetCastbar"] = "대상 시전바"
L["FocusCastbar"] = "주시 대상 시전바"
L["BagsBar"] = "가방"
L["MicroMenu"] = "마이크로 메뉴"
L["VehicleExitOverlay"] = "탈것 내리기"
L["StanceOverlay"] = "태세바"
L["petbar"] = "소환수바"
L["boss"] = "보스 프레임"
L["Boss Frames"] = "보스 프레임"
L["Boss1Frame"] = "보스 프레임"
L["Boss2Frame"] = "보스 프레임"
L["Boss3Frame"] = "보스 프레임"
L["Boss4Frame"] = "보스 프레임"
L["TotemBarOverlay"] = "토템 바"
L["PlayerCastbar"] = "시전바"
L["TooltipWidget"] = "툴팁"
L["Auras"] = "오라 (버프/디버프)"
L["WeaponEnchants"] = "무기 강화 효과"
L["Loot Roll"] = "주사위 굴림"
L["Quest Tracker"] = "퀘스트 추적기"

-- Mover tooltip strings
L["Drag to move"] = "드래그 이동"
L["Right-click to reset"] = "우클릭으로 초기화"

-- Editor mode system messages
L["All editable frames shown for editing"] = "편집을 위해 모든 프레임을 표시합니다."
L["All editable frames hidden, positions saved"] = "모든 프레임을 숨기고 위치를 저장했습니다."

-- ============================================================================
-- COMPATIBILITY MODULE
-- ============================================================================

-- Conflict warning popup
L["DragonUI Conflict Warning"] = "DragonUI 충돌 경고"
L["The addon |cFFFFFF00%s|r conflicts with DragonUI."] = "애드온 |cFFFFFF00%s|r 이(가) DragonUI와 충돌합니다."
L["Reason:"] = "원인:"
L["Disable the conflicting addon now?"] = "충돌하는 애드온을 지금 비활성화하시겠습니까?"
L["Keep Both"] = "둘 다 유지"
L["DragonUI - D3D9Ex Warning"] = "DragonUI - D3D9Ex 경고"
L["DragonUI detected that your client is using D3D9Ex."] = "DragonUI가 클라이언트가 D3D9Ex를 사용 중인 것을 감지했습니다."
L["DragonUI's action bar system is not compatible with D3D9Ex."] = "DragonUI의 액션바 시스템은 D3D9Ex와 호환되지 않습니다."
L["Some DragonUI action bar textures will be missing while this mode is active."] = "이 모드가 활성화된 동안 일부 DragonUI 액션바 텍스처가 보이지 않습니다."
L["If you want to disable this mode, open WTF\\Config.wtf."] = "이 모드를 끄려면 WTF\\Config.wtf 파일을 여세요."
L["Delete this line:"] = "이 줄을 삭제하세요:"
L["Or replace it with:"] = "또는 이 줄로 바꾸세요:"
L["Hide Gryphons"] = "그리핀 숨기기"
L["Understood"] = "확인"
L["DragonUI - UnitFrameLayers Detected"] = "DragonUI - UnitFrameLayers 감지됨"
L["DragonUI already includes Unit Frame Layers functionality (heal prediction, absorb shields, and animated health loss)."] = "DragonUI에는 이미 Unit Frame Layers 기능(치유 예측, 흡수 보호막, 애니메이션 체력 손실)이 포함되어 있습니다."
L["Choose how to resolve this overlap:"] = "이 중복을 해결할 방법을 선택하세요:"
L["Use DragonUI: disable external UnitFrameLayers and enable DragonUI layers."] = "DragonUI 사용: 외부 UnitFrameLayers를 끄고 DragonUI 레이어를 켭니다."
L["Disable Both: disable external UnitFrameLayers and keep DragonUI layers disabled."] = "둘 다 비활성화: 외부 UnitFrameLayers를 끄고 DragonUI 레이어도 끈 상태로 유지합니다."
L["Use DragonUI"] = "DragonUI 사용"
L["Disable Both"] = "둘 다 비활성화"
L["Use DragonUI Unit Frame Layers"] = "DragonUI Unit Frame Layers 사용"
L["Disable both Unit Frame Layers"] = "두 Unit Frame Layers 모두 비활성화"
L["DragonUI - Party Frame Issue"] = true
L["You joined a party while in combat. Due to CompactRaidFrame taint issues, party frames may not display correctly."] = true
L["Reload the UI to fix party frame display?"] = true

-- Conflict reasons
L["Conflicts with DragonUI's custom unit frame textures and power bar system."] = "DragonUI의 사용자 지정 유닛 프레임 텍스처 및 자원 바 시스템과 충돌합니다."
L["Known taint issues when manipulating party frames during combat. DragonUI provides automatic fixes."] = "전투 중 파티 프레임 조작 시 알려진 오염 문제가 있습니다. DragonUI가 자동 수정 기능을 제공합니다."
L["Resets minimap mask and blip textures. DragonUI re-applies its custom textures automatically."] = "미니맵 마스크와 블립 텍스처를 초기화합니다. DragonUI가 사용자 지정 텍스처를 자동으로 다시 적용합니다."
L["SexyMap modifies the minimap borders, shape, and zone text which conflicts with DragonUI's minimap module."] = "SexyMap이 미니맵 테두리, 모양, 지역 이름 텍스트를 변경하여 DragonUI의 미니맵 모듈과 충돌합니다."

-- SexyMap compatibility popup
L["DragonUI - SexyMap Detected"] = "DragonUI - SexyMap 감지됨"
L["Which minimap do you want to use?"] = "어떤 미니맵을 사용하시겠습니까?"
L["SexyMap"] = "SexyMap"
L["DragonUI"] = "DragonUI"
L["Hybrid"] = "하이브리드"
L["Recommended"] = "권장"

-- SexyMap options panel
L["SexyMap Compatibility"] = "SexyMap 호환성"
L["Minimap Mode"] = "미니맵 모드"
L["Choose how DragonUI and SexyMap share the minimap."] = "DragonUI와 SexyMap이 미니맵을 어떻게 함께 사용할지 선택하세요."
L["Requires UI reload to apply."] = "적용하려면 UI 재실행이 필요합니다."
L["Uses SexyMap for the minimap."] = "미니맵에 SexyMap을 사용합니다."
L["Uses DragonUI for the minimap."] = "미니맵에 DragonUI를 사용합니다."
L["SexyMap visuals with DragonUI editor and positioning."] = "SexyMap 외형을 사용하면서 DragonUI 편집기와 위치 조정을 유지합니다."
L["Minimap mode changed. Reload UI to apply?"] = "미니맵 모드가 변경되었습니다. 적용하려면 UI를 재실행하시겠습니까?"

-- SexyMap slash commands
L["SexyMap compatibility mode has been reset. Reload UI to choose again."] = "SexyMap 호환 모드가 초기화되었습니다. 다시 선택하려면 UI를 재실행하세요."
L["Current SexyMap mode: |cFFFFFF00%s|r"] = "현재 SexyMap 모드: |cFFFFFF00%s|r"
L["No SexyMap mode selected (SexyMap not detected or not yet chosen)."] = "SexyMap 모드가 선택되지 않았습니다. (SexyMap이 감지되지 않았거나 아직 선택되지 않음)"
L["Show current SexyMap compatibility mode"] = "현재 SexyMap 호환 모드 표시"
L["Reset SexyMap mode choice (re-prompts on reload)"] = "SexyMap 모드 선택 초기화 (재실행 시 다시 묻기)"
L["Loaded addons:"] = "로드된 애드온:"

-- ============================================================================
-- STATIC POPUPS (shared between modules)
-- ============================================================================

L["Changing this setting requires a UI reload to apply correctly."] = "이 설정을 올바르게 적용하려면 UI를 재설정해야 합니다."
L["Reload UI"] = "UI 재설정"
L["Not Now"] = "나중에"
L["Disable"] = "비활성화"
L["Ignore"] = "무시"
L["Skip"] = "건너뛰기"
L["The Blizzard option |cFFFFFF00Party/Arena Background|r is enabled. This conflicts with DragonUI's party frames."] = "블리자드 옵션 |cFFFFFF00파티/투기장 배경|r이 활성화되어 있습니다. DragonUI 파티 프레임과 충돌합니다."
L["Disable it now?"] = "지금 비활성화하시겠습니까?"
L["Some interface settings are not configured optimally for DragonUI."] = "일부 인터페이스 설정이 DragonUI에 최적으로 맞춰져 있지 않습니다."
L["This includes settings that conflict with DragonUI and settings recommended for the best visual experience."] = "여기에는 DragonUI와 충돌하는 설정과 최상의 시각적 경험을 위해 권장되는 설정이 포함됩니다."
L["Affected settings:"] = "영향받는 설정:"
L["Some interface settings are not configured optimally for DragonUI. Do you want to fix them?"] = "일부 인터페이스 설정이 DragonUI에 최적으로 맞춰져 있지 않습니다. 지금 수정하시겠습니까?"
L["Do you want to fix them now?"] = "지금 수정하시겠습니까?"
L["Party/Arena Background"] = "파티/투기장 배경"
L["Default Status Text"] = "기본 상태 텍스트"
L["Conflict"] = "충돌"
L["Recommended"] = "권장"

-- Bag Sort
L["Sort Bags"] = "가방 정렬"
L["Sort Bank"] = "은행 정렬"
L["Sort Items"] = "아이템 정렬"
L["Click to sort items by type, rarity, and name."] = "유형, 희귀도, 이름순으로 아이템을 정렬하려면 클릭하세요."
L["Clear Locked Slots"] = "잠긴 슬롯 모두 해제"
L["Click to clear all locked bag slots."] = "잠긴 가방 슬롯을 모두 해제하려면 클릭하세요."
L["Alt+LeftClick any bag slot (item or empty) to lock or unlock it."] = "가방 슬롯(아이템 있음/없음 무관)을 Alt+왼쪽 클릭하여 잠금/잠금 해제하세요."
L["Click the lock-clear button to remove all locked slots."] = "잠금 해제 버튼을 클릭하면 잠긴 슬롯이 모두 해제됩니다."
L["Hover an item or slot, then type /sortlock."] = "아이템 또는 슬롯에 마우스를 올린 뒤 /sortlock 을 입력하세요."
L["Slot locked (bag %d, slot %d)."] = "슬롯 잠금됨 (가방 %d, 슬롯 %d)."
L["Slot unlocked (bag %d, slot %d)."] = "슬롯 잠금 해제됨 (가방 %d, 슬롯 %d)."
L["Could not clear locks (config not ready)."] = "잠금을 해제할 수 없습니다 (설정이 아직 준비되지 않음)."
L["Cleared all sort-locked slots."] = "정렬 잠금 슬롯을 모두 해제했습니다."

-- Micromenu Latency
L["Network"] = "네트워크"
L["Latency"] = "지연 시간"

-- ============================================================================
-- STABILIZATION PATCH STRINGS
-- ============================================================================

L["/dragonui debug on|off|status - Toggle diagnostic logging"] = "/dragonui debug on|off|status - 진단 로그 전환"
L["Usage: /dragonui debug on|off|status"] = "사용법: /dragonui debug on|off|status"
L["Enable debug mode first with /dragonui debug on"] = "먼저 /dragonui debug on 으로 디버그 모드를 활성화하세요"
L["Debug mode is %s"] = "디버그 모드는 현재 %s 상태입니다"
L["Debug mode enabled"] = "디버그 모드가 활성화되었습니다"
L["Debug mode disabled"] = "디버그 모드가 비활성화되었습니다"
L["enabled"] = true
L["disabled"] = true
L["Enabled"] = "활성화됨"
L["Disabled"] = "비활성화됨"
L["Legacy refresh failed for"] = true
L["RegisterMover: name and parent are required"] = true
L["Bonus Action Button %d"] = true
L["Bottom Left Button"] = true
L["Bottom Right Button"] = true
L["Right Button"] = true
L["Left Button"] = true
L["Totem Bar"] = "토템 바"
L["Test Pet"] = true
L["=== TargetFrame children (depth 3) ==="] = true
L["=== FocusFrame children (depth 3) ==="] = true
L["BG texture not found"] = true
L["BG tinted RED"] = true
L["BG tinted GREEN"] = true
L["BG color reset"] = true
L["=== BANK SCAN DEBUG ==="] = true
L["=== BANK QUALITY DEBUG ==="] = true
L["Module enabled:"] = true
L["BankFrame exists:"] = true
L["BankFrame shown:"] = true
L["Usage: /dui shadowcolor red|green|reset|info"] = true
L["Usage: /dui shadowcrop <bottom_px> [right_px]"] = true
L["  e.g. /dui shadowcrop 90 - show top 90 of 128 px height"] = true
L["  e.g. /dui shadowcrop 90 200 - crop both bottom and right"] = true
L["  /dui shadowcrop reset - restore full texture"] = true
L["BG reset to 256x128 full texture"] = true
L["Crop applied: showing %dx%d of 256x128 (texcoord 0-%.3f, 0-%.3f)"] = true
L["Invalid values. Height 1-128, Width 1-256"] = true
L["=== TargetFrame elements (use /dui shadowtest N to toggle) ==="] = true
L["Total elements: %d"] = true
L["HIDDEN: %d. %s [%s]"] = true
L["SHOWN: %d. %s [%s]"] = true
L["Invalid element number. Use /dui shadowtest to list."] = true
L["DragonUI Compatibility:"] = true
L["Registered Modules:"] = "등록된 모듈:"
L["No modules registered in ModuleRegistry"] = "ModuleRegistry에 등록된 모듈이 없습니다"
L["load-once"] = "한 번만 로드"
L["%s will disable after /reload because its secure hooks cannot be removed safely."] = "%s 모듈은 안전한 훅을 안전하게 제거할 수 없어 /reload 후 비활성화됩니다."
L["%s uses permanent secure hooks and will fully disable after /reload."] = "%s 모듈은 영구적인 안전 훅을 사용하므로 /reload 후 완전히 비활성화됩니다."
L["%s remains active until /reload because its secure hooks cannot be removed safely."] = "%s 모듈은 안전한 훅을 안전하게 제거할 수 없어 /reload 전까지 활성 상태를 유지합니다."
L["Cooldown Text"] = "재사용 대기시간 텍스트"
L["Cooldown text on action buttons"] = "액션 버튼의 재사용 대기시간 텍스트"
L["Cast Bar"] = "시전 바"
L["Custom player, target, and focus cast bars"] = "플레이어, 대상, 주시 대상용 사용자 지정 시전 바"
L["Multicast"] = "멀티캐스트"
L["Shaman totem bar positioning and styling"] = "주술사 토템 바 위치 및 스타일"
L["Player Frame"] = "플레이어 프레임"
L["Dragonflight-styled boss target frames"] = "Dragonflight 스타일의 우두머리 대상 프레임"
L["Dragonflight-styled player unit frame"] = "Dragonflight 스타일의 플레이어 유닛 프레임"
L["ModuleRegistry:Register requires name and moduleTable"] = "ModuleRegistry:Register에는 name과 moduleTable이 필요합니다"
L["ModuleRegistry: Module already registered -"] = "ModuleRegistry: 이미 등록된 모듈 -"
L["ModuleRegistry: Registered module -"] = "ModuleRegistry: 등록된 모듈 -"
L["order:"] = "순서:"
L["ModuleRegistry: Refresh failed for"] = "ModuleRegistry: 새로 고침 실패 대상"
L["ModuleRegistry: Unknown module -"] = "ModuleRegistry: 알 수 없는 모듈 -"
L["ModuleRegistry: Enabled -"] = "ModuleRegistry: 활성화 -"
L["ModuleRegistry: Disabled -"] = "ModuleRegistry: 비활성화 -"
L["CombatQueue:Add requires id and func"] = "CombatQueue:Add에는 id와 func가 필요합니다"
L["CombatQueue: Registered PLAYER_REGEN_ENABLED"] = "CombatQueue: PLAYER_REGEN_ENABLED 등록됨"
L["CombatQueue: Queued operation -"] = "CombatQueue: 대기열에 추가된 작업 -"
L["CombatQueue: Removed operation -"] = "CombatQueue: 제거된 작업 -"
L["CombatQueue: Processing"] = "CombatQueue: 처리 중"
L["queued operations"] = "대기 중인 작업"
L["CombatQueue: Failed to execute"] = "CombatQueue: 실행 실패"
L["CombatQueue: Executed -"] = "CombatQueue: 실행 완료 -"
L["CombatQueue: Unregistered PLAYER_REGEN_ENABLED"] = "CombatQueue: PLAYER_REGEN_ENABLED 등록 해제됨"
L["CombatQueue: Immediate execution failed -"] = "CombatQueue: 즉시 실행 실패 -"

-- ============================================================================
-- RELEASE PREP STRINGS
-- ============================================================================

L["Buttons"] = "버튼"
L["Action button styling and enhancements"] = "액션 버튼 스타일 및 개선"
L["Dark Mode"] = "다크 모드"
L["Darken UI borders and chrome"] = "UI 테두리와 장식을 어둡게 표시"
L["Item Quality"] = "아이템 품질"
L["Color item borders by quality in bags, character panel, bank, and merchant"] = "가방, 캐릭터 창, 은행, 상인 창의 아이템 테두리를 품질별로 표시"
L["Key Binding"] = "키 바인딩"
L["LibKeyBound integration for intuitive keybinding"] = "직관적인 키 설정을 위한 LibKeyBound 통합"
L["Buff Frame"] = "버프 프레임"
L["Custom buff frame styling, positioning and toggle button"] = "버프 프레임 사용자 지정 스타일, 위치 및 토글 버튼"
L["Chat Mods"] = "채팅 기능"
L["Chat enhancements: hide buttons, editbox position, URL copy, chat copy, link hover, tell target"] = "채팅 개선: 버튼 숨김, 입력창 위치, URL 복사, 채팅 복사, 링크 미리보기, 대상에게 귓속말"
L["Bag Sort"] = "가방 정렬"
L["Sort bags and bank items with buttons"] = "버튼으로 가방과 은행 아이템 정렬"
L["Combuctor"] = "Combuctor"
L["All-in-one bag replacement with filtering and search"] = "필터와 검색 기능이 있는 올인원 가방 대체"
L["Stance Bar"] = "태세 바"
L["Vehicle"] = "탈것"
L["Vehicle interface enhancements"] = "탈것 인터페이스 개선"
L["Pet Bar"] = "소환수 바"
L["Micro Menu"] = "마이크로 메뉴"
L["Main Bars"] = "주 액션바"
L["Main action bars, status bars, scaling and positioning"] = "주 액션바, 상태 바, 크기 및 위치 조정"
L["Hide Blizzard"] = "블리자드 기본 UI 숨김"
L["Hide default Blizzard UI elements"] = "기본 블리자드 UI 요소 숨기기"
L["Minimap"] = "미니맵"
L["Custom minimap styling, positioning, tracking icons and calendar"] = "사용자 지정 미니맵 스타일, 위치, 추적 아이콘 및 달력"
L["Quest tracker positioning and styling"] = "퀘스트 추적기 위치 및 스타일 설정"
L["Tooltip"] = "툴팁"
L["Enhanced tooltip styling with class colors and health bars"] = "직업 색상과 생명력 바가 적용된 향상된 툴팁 스타일"
L["Unit Frame Layers"] = "유닛 프레임 레이어"
L["Heal prediction, absorb shields, and animated health loss on unit frames"] = "유닛 프레임의 치유 예측, 흡수 보호막 및 애니메이션 체력 손실"
L["Stance/shapeshift bar positioning and styling"] = "태세/변신 바 위치 및 스타일 설정"
L["Pet action bar positioning and styling"] = "소환수 액션 바 위치 및 스타일 설정"
L["Micro menu and bags system styling and positioning"] = "마이크로 메뉴 및 가방 시스템 스타일/위치 설정"
L["Sort complete."] = "정렬이 완료되었습니다."
L["Sort already in progress."] = "정렬이 이미 진행 중입니다."
L["Bags already sorted!"] = "가방이 이미 정렬되어 있습니다!"
L["You must be at the bank."] = "은행에 있어야 합니다."
L["Bank already sorted!"] = "은행이 이미 정렬되어 있습니다!"
L["Reputation: "] = "평판: "
L["Error in SafeCall:"] = "SafeCall 오류:"

L["Double-Click to Copy"] = "|cff33ff11더블 클릭|r하여 복사"
L["Copy Text"] = "텍스트 복사"

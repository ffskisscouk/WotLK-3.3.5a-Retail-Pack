-- Создаем глобальную ссылку
DialogueUITooltip = GameTooltip

-- Храним оригинальные методы
local orig_SetQuestItem = GameTooltip.SetQuestItem
local orig_SetQuestRewardSpell = GameTooltip.SetQuestRewardSpell

-- Функция замены фона GameTooltip
local function ReplaceGameTooltipBackground()
    -- Скрываем ВСЕ стандартные текстуры тултипа (фон и рамка)
    for i = 1, GameTooltip:GetNumRegions() do
        local region = select(i, GameTooltip:GetRegions())
        if region and region:GetObjectType() == "Texture" then
            local texture = region:GetTexture()
            if texture then
                -- Скрываем стандартные фоны и рамки тултипа
                if string.find(texture, "UI%-Tooltip%-Background") or
                   string.find(texture, "Tooltips\\UI%-Tooltip%-Background") or
                   string.find(texture, "UI%-Tooltip%-Border") or
                   string.find(texture, "Tooltips\\UI%-Tooltip%-Border") then
                    region:Hide()
                end
            end
        end
    end
    
    -- Создаем или показываем наш parchment фон
    local customBg = getglobal("GameTooltipCustomParchmentBg")
    if not customBg then
        customBg = GameTooltip:CreateTexture("GameTooltipCustomParchmentBg", "BACKGROUND")
        customBg:SetAllPoints()
        customBg:SetTexture("Interface\\AddOns\\DialogUI\\src\\assets\\art\\parchment\\TooltipBackground-Temp")
        if not customBg:GetTexture() then
            customBg:SetTexture(0.87, 0.86, 0.75, 0.95)
        end
    end
    customBg:Show()
    
    -- Убираем стандартный backdrop полностью
    GameTooltip:SetBackdrop(nil)
end

-- Перехватываем методы
function GameTooltip:SetQuestItem(itemType, index)
    orig_SetQuestItem(self, itemType, index)
    ReplaceGameTooltipBackground()
end

function GameTooltip:SetQuestRewardSpell(index)
    orig_SetQuestRewardSpell(self, index)
    ReplaceGameTooltipBackground()
end

-- Обработчик OnShow для всех случаев
GameTooltip:HookScript("OnShow", function(self)
    -- Проверяем, является ли это квестовым тултипом
    if self:GetOwner() then
        local ownerName = self:GetOwner():GetName() or ""
        if string.find(ownerName, "Quest") or string.find(ownerName, "DQuest") then
            ReplaceGameTooltipBackground()
        end
    end
end)

DEFAULT_CHAT_FRAME:AddMessage("DialogUI: GameTooltip background override loaded")
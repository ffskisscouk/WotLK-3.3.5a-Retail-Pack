local AddOnName, Private = ...

local GetAddOnInfo = C_GetAddOnInfo

local ADDON_BUTTON_HEIGHT = 16;
local MAX_ADDONS_DISPLAYED = 19;

local MEMORY_QUERY_THROTTLE;

local UIDropDownMenu_Initialize = C_UIDropDownMenu_Initialize
local UIDropDownMenu_AddButton = C_UIDropDownMenu_AddButton
local UIDropDownMenu_CreateInfo = C_UIDropDownMenu_CreateInfo
local UIDropDownMenu_GetSelectedValue = C_UIDropDownMenu_GetSelectedValue
local UIDropDownMenu_SetSelectedValue = C_UIDropDownMenu_SetSelectedValue
local GameTooltip = GameTooltip

local function ResetAddOns()
	if ( not AddonList.save ) then
		local character = UIDropDownMenu_GetSelectedValue(AddonListCharacterDropDown);
		local startStatus = AddonList.startStatus;
		for i=1, #startStatus do
			local previousState = startStatus[i]
			local currentState = (GetAddOnEnableState(character, i) > 0);

			if ( currentState ~= previousState ) then
				if ( previousState ) then
					EnableAddOn(i, character);
				else
					DisableAddOn(i, character);
				end
			end
		end
	end
end

local function SaveAddOns()
	-- TODO
end

function AddonList_HasAnyChanged()
	if (AddonList.outOfDate and not IsAddonVersionCheckEnabled() or (not AddonList.outOfDate and IsAddonVersionCheckEnabled() and AddonList_HasOutOfDate())) then
		return true;
	end
	local character = UnitName("player");
	for i=1,GetNumAddOns() do
		local enabled = (GetAddOnEnableState(character, i) > 0);
		local reason = select(5,GetAddOnInfo(i))
		if ( enabled ~= AddonList.startStatus[i] and reason ~= "DEP_DISABLED" ) then
			return true
		end
	end
	return false
end

function AddonList_HasNewVersion()
	local hasNewVersion = false;
	for i=1, GetNumAddOns() do
		local name, title, notes, loadable, reason, security, newVersion = GetAddOnInfo(i);
		if ( newVersion ) then
			hasNewVersion = true;
			break;
		end
	end
	return hasNewVersion;
end

local function AddonList_Show()
	ShowUIPanel(AddonList);
end

local function AddonList_Hide(save)
	AddonList.save = save
	HideUIPanel(AddonList);
end

function AddonList_OnLoad(self)
	if ( GetNumAddOns() > 0 ) then
		-- Game Menu button.
		local GameMenuFrame = GameMenuFrame;
		local GameMenuButtonRatings = GameMenuButtonRatings;
		local GameMenuButtonLogout = GameMenuButtonLogout;
		local GameMenuButtonAdded = GameMenuButtonRatings:IsShown() and 2 or 1;

		local GameMenuButtonAddons = CreateFrame("Button", "GameMenuButtonAddons", GameMenuFrame, "GameMenuButtonTemplate");
		GameMenuButtonAddons:SetPoint("TOP", GameMenuButtonMacros, "BOTTOM", 0, -1);
		GameMenuButtonAddons:SetText(ADDONS);
		GameMenuButtonAddons:SetScript("OnClick", function()
			PlaySound("igMainMenuOption");
			HideUIPanel(GameMenuFrame);
			AddonList_Show();
		end);

		GameMenuFrame:SetHeight(GameMenuFrame:GetHeight() + (GameMenuButtonAddons:GetHeight() * GameMenuButtonAdded) + 16);

		if ( GameMenuButtonAdded == 2 ) then
			GameMenuButtonRatings:SetPoint("TOP", GameMenuButtonAddons, "BOTTOM", 0, -1);
			GameMenuFrame:HookScript("OnShow", function()
				GameMenuButtonLogout:SetPoint("TOP", GameMenuButtonRatings, "BOTTOM", 0, -16);
			end);
		else
			GameMenuButtonLogout:SetPoint("TOP", GameMenuButtonAddons, "BOTTOM", 0, -16);
		end

		-- Adjust scroll parent.
		--AddonListScrollFrameScrollChildFrame:SetParent(AddonListScrollFrame);
	end
end

function AddonList_Setup(self)
	-- Init OnShow
	local characterName = UnitName("player");

	-- Adjust scroll parent.
	AddonListScrollFrameScrollChildFrame:SetParent(AddonListScrollFrame);

	-- Set default text.
	self.TitleText:SetText(Private.ADDON_LIST);
	AddonListForceLoad.Text:SetText(Private.ADDON_FORCE_LOAD);
	self.EnableAllButton:SetText(Private.ENABLE_ALL_ADDONS);
	self.DisableAllButton:SetText(Private.DISABLE_ALL_ADDONS);

	ButtonFrameTemplate_HidePortrait(self);

	self.offset = 0;

	--self:SetParent(UIParent);
	--self:SetFrameStrata("HIGH");
	self.startStatus = {};
	self.shouldReload = false;
	self.outOfDate = IsAddonVersionCheckEnabled() and AddonList_HasOutOfDate();
	self.outOfDateIndexes = {};
	for i=1,GetNumAddOns() do
		self.startStatus[i] = (GetAddOnEnableState(characterName, i) > 0);
		if (select(5, GetAddOnInfo(i)) == "INTERFACE_VERSION") then
			tinsert(self.outOfDateIndexes, i);
		end
	end

	local drop = CreateFrame("Frame", "AddonListCharacterDropDown", self, "C_UIDropDownMenuTemplate")
	drop:SetPoint("TOPLEFT", 0, -30)
	UIDropDownMenu_Initialize(drop, AddonListCharacterDropDown_Initialize);
	UIDropDownMenu_SetSelectedValue(drop, characterName);
end

function AddonList_SetStatus(self,lod,status,reload)
	local button = self.LoadAddonButton
	local string = self.Status
	local relstr = self.Reload

	if ( lod ) then
		button:Show()
	else
		button:Hide()
	end

	if ( status ) then
		string:Show()
	else
		string:Hide()
	end

	if ( reload ) then
		relstr:Show()
	else
		relstr:Hide()
	end
end

local function TriStateCheckbox_SetState(checked, checkButton)
	local checkedTexture = _G[checkButton:GetName().."CheckedTexture"];
	if ( not checkedTexture ) then
		message("Can't find checked texture");
	end
	if ( not checked or checked == 0 ) then
		-- nil or 0 means not checked
		checkButton:SetChecked(false);
		checkButton.state = 0;
	elseif ( checked == 2 ) then
		-- 2 is a normal
		checkButton:SetChecked(true);
		checkedTexture:SetVertexColor(1, 1, 1);
		checkedTexture:SetDesaturated(false);
		checkButton.state = 2;
	else
		-- 1 is a gray check
		checkButton:SetChecked(true);
		checkedTexture:SetDesaturated(true);
		checkButton.state = 1;
	end
end

function AddonList_Update()
	local numEntrys = GetNumAddOns();
	local characterName = UnitName("player");
	local name, title, notes, enabled, loadable, reason, security;
	local entryName = "AddonListEntry";
	local addonIndex, entry, obj;

	for i=1, MAX_ADDONS_DISPLAYED do
		addonIndex = AddonList.offset + i;
		entryID = entryName..i;
		entry = _G[entryID];

		-- Create
		if ( not entry ) then
			entry = CreateFrame("Button", entryID, AddonList, "AddonListEntryTemplate")
			entry:SetID(i)

			if ( i == 1 ) then
				entry:SetPoint("TOPLEFT", AddonList, 10, -70)
			else
				entry:SetPoint("TOP", _G[entryName..(i-1)], "BOTTOM", 0, -4)
			end

			entry.Reload:SetText(Private.REQUIRES_RELOAD)
			entry.LoadAddonButton:SetText(Private.LOAD_ADDON)
		end

		if ( addonIndex > numEntrys ) then
			entry:Hide();
		else
			name, title, notes, loadable, reason, security = GetAddOnInfo(addonIndex);

			-- Get the character from the current list (nil is all characters)
			local character = UIDropDownMenu_GetSelectedValue(AddonListCharacterDropDown);
			if ( character == true ) then
				character = nil;
			end

			obj = entry.Enabled;
			local checkboxState = GetAddOnEnableState(character, addonIndex);
			enabled = (GetAddOnEnableState(characterName, addonIndex) > 0);
			TriStateCheckbox_SetState(checkboxState, obj);
			if (checkboxState == 1 ) then
				obj.tooltip = Private.ENABLED_FOR_SOME;
			else
				obj.tooltip = nil;
			end

			obj = entry.Title;
			if ( loadable or ( enabled and (reason == "DEP_DEMAND_LOADED" or reason == "DEMAND_LOADED") ) ) then
				obj:SetTextColor(1.0, 0.78, 0.0);
			elseif ( enabled and reason ~= "DEP_DISABLED" ) then
				obj:SetTextColor(1.0, 0.1, 0.1);
			else
				obj:SetTextColor(0.5, 0.5, 0.5);
			end
			obj:SetText(title or name);

			if ( security ) then -- This currently doesn't get used.
				obj = entry.Security;
				if ( security == "SECURE" ) then
					AddonList_SetSecurityIcon(obj.Icon, 1);
				elseif ( security == "INSECURE" ) then
					AddonList_SetSecurityIcon(obj.Icon, 2);
				elseif ( security == "BANNED" ) then
					AddonList_SetSecurityIcon(obj.Icon, 3);
				end
				obj.tooltip = _G["ADDON_"..security];
			end

			obj = entry.Status;
			if ( not loadable and reason ) then
				obj:SetText(_G["ADDON_"..reason]);
			else
				obj:SetText("");
			end

			if ( enabled ~= AddonList.startStatus[addonIndex] and reason ~= "DEP_DISABLED" or 
				(reason ~= "INTERFACE_VERSION" and tContains(AddonList.outOfDateIndexes, addonIndex)) or 
				(reason == "INTERFACE_VERSION" and not tContains(AddonList.outOfDateIndexes, addonIndex))) then
				if ( enabled ) then
					-- special case for loadable on demand addons
					if ( AddonList_IsAddOnLoadOnDemand(addonIndex) ) then
						AddonList_SetStatus(entry, true, false, false)
					else
						AddonList_SetStatus(entry, false, false, true)
					end
				else
					AddonList_SetStatus(entry, false, false, true)
				end
			else
				AddonList_SetStatus(entry, false, true, false)
			end

			entry:SetID(addonIndex);
			entry:Show();
		end
	end

	-- ScrollFrame stuff
	FauxScrollFrame_Update(AddonListScrollFrame, numEntrys, MAX_ADDONS_DISPLAYED, ADDON_BUTTON_HEIGHT);

	if ( AddonList_HasAnyChanged() ) then
		AddonListOkayButton:SetText(Private.RELOADUI)
		AddonList.shouldReload = true
	else
		AddonListOkayButton:SetText(OKAY)
		AddonList.shouldReload = false
	end
end

function AddonList_IsAddOnLoadOnDemand(index)
	local lod = false
	if ( IsAddOnLoadOnDemand(index) ) then

		local deps = GetAddOnDependencies(index)
		local okay = true;
		for i = 1, select('#', deps) do
			local dep = select(i, deps)
			if ( dep and not IsAddOnLoaded(select(i, deps)) ) then
				okay = false;
				break;
			end
		end
		lod = okay;
	end
	return lod;
end

function AddonList_Enable(index, enabled)
	local character = UIDropDownMenu_GetSelectedValue(AddonListCharacterDropDown);
	if ( enabled ) then
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
		EnableAddOn(index,character);
	else
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF);
		DisableAddOn(index,character);
	end
	AddonList_Update();
end

function AddonList_EnableAll(self, button, down)
	EnableAllAddOns(UIDropDownMenu_GetSelectedValue(AddonListCharacterDropDown));
	AddonList_Update();
end

function AddonList_DisableAll(self, button, down)
	DisableAllAddOns(UIDropDownMenu_GetSelectedValue(AddonListCharacterDropDown));
	AddonList_Update();
end

function AddonList_LoadAddOn(index)
	if ( not AddonList_IsAddOnLoadOnDemand(index) ) then return end
	LoadAddOn(index)
	if ( IsAddOnLoaded(index) ) then
		AddonList.startStatus[index] = true
	end
	AddonList_Update()
end

function AddonList_OnOkay()
	PlaySound(SOUNDKIT.GS_LOGIN_CHANGE_REALM_OK);
	AddonList_Hide(true);
	if ( AddonList.shouldReload ) then
		ReloadUI();
	end
end

function AddonList_OnCancel()
	PlaySound(SOUNDKIT.GS_LOGIN_CHANGE_REALM_CANCEL);
	AddonList_Hide(false);
end

function AddonListScrollFrame_OnVerticalScroll(self, offset)
	local scrollbar = _G[self:GetName().."ScrollBar"];
	scrollbar:SetValue(offset);
	AddonList.offset = floor((offset / ADDON_BUTTON_HEIGHT) + 0.5);
	AddonList_Update();
	if ( GameTooltip:IsShown() ) then
		AddonTooltip_Update(GameTooltip:GetOwner(), true);
		GameTooltip:Show()
	end
end

function AddonList_OnShow(self)
	if ( not self.startStatus ) then
		AddonList_Setup(self);
	else
		UIDropDownMenu_Initialize(AddonListCharacterDropDown, AddonListCharacterDropDown_Initialize);
		UIDropDownMenu_SetSelectedValue(AddonListCharacterDropDown, UIDropDownMenu_GetSelectedValue(AddonListCharacterDropDown));
	end
	AddonList_Update();
end

function AddonList_OnHide(self)
	if ( self.save ) then
		SaveAddOns();
	else
		ResetAddOns();
	end
	self.save = false;
end

function AddonList_HasOutOfDate()
	local hasOutOfDate = false;
	local character = UnitName("player");
	for i=1, GetNumAddOns() do
		local name, title, notes, loadable, reason = GetAddOnInfo(i);
		local enabled = (GetAddOnEnableState(character, i) > 0);
		if ( enabled and not loadable and reason == "INTERFACE_VERSION" ) then
			hasOutOfDate = true;
			break;
		end
	end
	return hasOutOfDate;
end

function AddonList_SetSecurityIcon(texture, index)
	local width = 64;
	local height = 16;
	local iconWidth = 16;
	local increment = iconWidth/width;
	local left = (index - 1) * increment;
	local right = index * increment;
	texture:SetTexCoord( left, right, 0, 1.0);
end

function AddonList_DisableOutOfDate()
	local character = UnitName("player");
	for i=1, GetNumAddOns() do
		local name, title, notes, loadable, reason = GetAddOnInfo(i);

		local enabled = (GetAddOnEnableState(character , i) > 0);
		if ( enabled and not loadable and reason == "INTERFACE_VERSION" ) then
			DisableAddOn(i, true);			
		end
	end
	SaveAddOns();
end

--[[function AddonListCharacterDropDown_OnClick(self)
	UIDropDownMenu_SetSelectedValue(AddonListCharacterDropDown, self.value);
	AddonList_Update();
end]]

function AddonListCharacterDropDown_Initialize()
	local selectedValue = nil -- UIDropDownMenu_GetSelectedValue(AddonListCharacterDropDown);
	local info = UIDropDownMenu_CreateInfo();
	info.text = ALL;
	info.value = true;
	info.disabled = true;
	--info.func = AddonListCharacterDropDown_OnClick;
	--info.checked = (selectedValue) and nil or 1;
	UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = UnitName("player");
	info.value = info.text
	info.checked = (selectedValue == info.value) and 1 or nil;
	UIDropDownMenu_AddButton(info);
end

function AddonTooltip_BuildDeps(...)
	local deps = "";
	for i=1, select("#", ...) do
		if ( i == 1 ) then
			deps = Private.ADDON_DEPENDENCIES .. select(i, ...);
		else
			deps = deps..", "..select(i, ...);
		end
	end
	return deps;
end

function AddonTooltip_Update(owner, scrolling)
	local index = owner:GetID();
	local name, title, notes, loadable, reason, security = GetAddOnInfo(index);

	GameTooltip:ClearLines();

	if ( security == "BANNED" ) then
		GameTooltip:SetText(ADDON_BANNED_TOOLTIP);
	else
		GameTooltip:AddLine(title or name);

		GameTooltip:AddLine(notes, 1, 1, 1);
		GameTooltip:AddLine(AddonTooltip_BuildDeps(GetAddOnDependencies(index)));

		if ( reason ~= "DEMAND_LOADED" ) then
			local author = GetAddOnMetadata(index, "Author");
			local version = GetAddOnMetadata(index, "Version");
			if ( author or version ) then
				GameTooltip:AddLine(" ");

				if ( author ) then
					GameTooltip:AddLine("Author: "..author, .7, .7, .7);
				end

				if ( version ) then
					GameTooltip:AddLine("Version: "..version, .7, .7, .7);
				end
			end
		end

		if ( loadable ) then
			local now = GetTime();
			if ( not MEMORY_QUERY_THROTTLE or (not scrolling and (now - MEMORY_QUERY_THROTTLE) > 10) ) then
				UpdateAddOnMemoryUsage();
				MEMORY_QUERY_THROTTLE = now;
			end

			local memory, string = GetAddOnMemoryUsage(index);
			if ( memory > 1000 ) then
				memory = memory / 1000;
				string = TOTAL_MEM_MB_ABBR;
			else
				string = TOTAL_MEM_KB_ABBR;
			end
			GameTooltip:AddLine(" ");
			GameTooltip:AddLine(format(string, memory));
		elseif ( reason ) then
			GameTooltip:AddLine(" ");
			GameTooltip:AddLine(_G["ADDON_"..reason]);
		end
	end

	GameTooltip:Show()
end
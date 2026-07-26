local WDM = LibStub("AceAddon-3.0"):GetAddon("WDM")
local POIs = WDM:NewModule("POIs", "AceHook-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("WDM")

--[[local data = {
    flightmasters = {
        
    },
}]]

local options = {
    name = L["POI Icons"],
    desc = L["Additional POI (Point of Interest) icons. Standard icons are not affected"],
    descStyle = "inline",
    handler = POIs,
    type = "group",
    childGroups = "tree",
    args = {
        showFMPOIs = {
            type = "toggle",
            order = 1,
            name = L["Show Flight Masters"],
            desc = L["Toggles the display of Flight Masters on World Map."],
            get = "isShowFMPOIs",
            set = "ToggleShowFMPOIs",
            width = "double",
        },
        showBothFM = {
            type = "toggle",
            order = 2,
            disabled = false,
            name = L["Including the opposite faction"],
            desc = L["Toggles the display of Flight Masters of the opposite faction"],
            get = "isShowBothFM",
            set = "ToggleShowBothFM",
            width = "double",
        },
    },
}
	
local defaults = {
    profile =  {
        showFMPOIs = true,
        suboptions = {
            showBothFM = false,
        }
    },
}

function POIs:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("WDMdb", defaults, true)

    LibStub("AceConfig-3.0"):RegisterOptionsTable("POIs", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("POIs", L["POI Icons"], "WoW Dungeon Maps")
end

function POIs:WorldMapFrame_Update()
    local numPOIs = GetNumMapLandmarks();
	local englishFaction, localizedFaction = UnitFactionGroup("player");

	if ( NUM_WORLDMAP_POIS < numPOIs ) then
		for i=NUM_WORLDMAP_POIS+1, numPOIs do
			WorldMap_CreatePOI(i);
		end
		NUM_WORLDMAP_POIS = numPOIs;
	end

	for i=1, NUM_WORLDMAP_POIS do
		local worldMapPOIName = "WorldMapFramePOI"..i;
		local worldMapPOI = _G[worldMapPOIName];

		if ( i <= numPOIs ) then
			local name, description, textureIndex, x, y, mapLinkID = GetMapLandmarkInfo(i);
			local x1, x2, y1, y2 = WorldMap_GetPOITextureCoords(textureIndex);

			_G[worldMapPOIName.."Texture"]:SetTexCoord(x1, x2, y1, y2);
			x = x * WorldMapButton:GetWidth();
			y = -y * WorldMapButton:GetHeight();

			worldMapPOI:SetPoint("CENTER", "WorldMapButton", "TOPLEFT", x, y );
			worldMapPOI.name = name;
			worldMapPOI.description = description;
			worldMapPOI.mapLinkID = mapLinkID;

			if ( self.db.profile.showBothFM == false ) and (( textureIndex == 180 and englishFaction == "Horde" ) or 
				( textureIndex == 179 and englishFaction == "Alliance" )) then 
                worldMapPOI:Hide();
            else 
                if ( self.db.profile.showFMPOIs == false ) and 
                        ( textureIndex >= 178 ) and  ( textureIndex <= 180 ) then
                    worldMapPOI:Hide();
                else
                    worldMapPOI:Show();
                end
            end
		else
			worldMapPOI:Hide();
		end
	end
end

function POIs:isShowFMPOIs(info)
    if not self.db.profile.showFMPOIs then
        self.db.profile.showBothFM = false;
        options.args.showBothFM.disabled = true;
    else
        options.args.showBothFM.disabled = false;
    end

    return self.db.profile.showFMPOIs
end

function POIs:ToggleShowFMPOIs(info, value)
    self.db.profile.showFMPOIs = value
end

function POIs:isShowBothFM(info)
    return self.db.profile.showBothFM
end

function POIs:ToggleShowBothFM(info, value)
    self.db.profile.showBothFM = value
end

function POIs:OnEnable()
	self:SecureHook("WorldMapFrame_Update")
end

function POIs:OnDisable()
	self:UnhookAll()
	WorldMapFrame_Update()
end

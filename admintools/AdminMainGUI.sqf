#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };}forEach _types;_res}
#define COLOR_WHITE [1, 1, 1, 0.7]
#define COLOR_LIGHTBLUE [0.46, 0.75, 0.92, 0.7]
#define COLOR_ORANGE [1, 0.63, 0.01, 1]
#define COLOR_GREEN [0, 1, 0, 0.7]
#define COLOR_RED [1, 0, 0, 0.7]
#define COLOR_PURPLE [0.80, 0.14, 0.94, 0.7]
#define COLOR_PINK [0.94, 0.14, 0.87, 0.7]

// Might be a good idea to use variables for the file locations
// _EXECscript1 = 'player execVM "admintools\tools\%1"';

PlayerListbox = 13003;
AdminToolsListbox = 13006;
AdminSpawnListbox = 13007;
AdminSpawnItemListbox = 13008;
CurrentSpawnMenu = "";

// Variables for the tools
if (isNil 'Tool_AdminGodMode') then {Tool_AdminGodMode = false;};
if (isNil 'Tool_VehicleGodMode') then {Tool_VehicleGodMode = false;};
if (isNil 'Tool_VehicleBoost') then {Tool_VehicleBoost = false;};
if (isNil 'Tool_InfiniteAmmo') then {Tool_InfiniteAmmo = false;};
if (isNil 'Tool_InvisibleMode') then {Tool_InvisibleMode = false;};
if (isNil 'Tool_ZombieShield') then {Tool_ZombieShield = false;};
if (isNil 'Tool_AdminFastBuild') then {Tool_AdminFastBuild = false;};
if (isNil 'Tool_ESP') then {Tool_ESP = false;};
if (isNil 'Tool_AdminScrollMenu') then {Tool_AdminScrollMenu = false;};
//*******************************************************************
if (isNil 'MapMarker_Players') then {MapMarker_Players = false;};
if (isNil 'MapMarker_Corpse') then {MapMarker_Corpse = false;};
if (isNil 'MapMarker_Plot') then {MapMarker_Plot = false;};
if (isNil 'MapMarker_Vault') then {MapMarker_Vault = false;};
if (isNil 'MapMarker_Tent') then {MapMarker_Tent = false;};
if (isNil 'MapMarker_Vehicle') then {MapMarker_Vehicle = false;};
if (isNil 'MapMarker_Wreck') then {MapMarker_Wreck = false;};
if (isNil 'MapMarker_BuiltItem') then {MapMarker_BuiltItem = false;};

private ["_dialog"];

// Creates the list of players currently on the server
call CreateServerPlayerList;

closedialog 0;

// Creates the dialog and clears the listboxes
_dialog = createdialog "AdminDialogFull";

lbClear PlayerListbox;
lbClear AdminToolsListbox;
lbClear AdminSpawnListbox;
lbClear AdminSpawnItemListbox;

disableSerialization;
_display = findDisplay 2626;
_filterButton_1 = 13010;
_filterButton_2 = 13011;
_filterButton_3 = 13012;

_control = _display displayCtrl _filterButton_1;
_control ctrlSetScale 0;
_control ctrlCommit 0;
_control = _display displayCtrl _filterButton_2;
_control ctrlSetScale 0;
_control ctrlCommit 0;
_control = _display displayCtrl _filterButton_3;
_control ctrlSetScale 0;
_control ctrlCommit 0;

// Populates the playerlistbox with the current players on the server 
call PopulatePlayerListbox;

// Highlights any admin/moderators or players waiting in the help queue
call PlayerListHighlight;

// Populates the admin tool listbox and the spawn menu listbox with the tool names 
call PopulateAdminListbox;

// Sets the text colour of the tools in the admin tool listbox and the spawn menu listbox
call AdminListboxSetColours;


//*********************************** Tool Update Functions ********************************************************************************

// The following functions are called from the dialog 

// This function is called from the dialog when a user double clicks on an item from the admin tool list box
AdminTool_Update = {

	// Gets the index value of the currently selected item from the admin tool list box and then calls the related function or script
	_tool = _this select 0;
	switch (_tool) do
	{
		case 0:{[name call GetSelectedPlayer] execVM "admintools\tools\SpectatePlayer-Logi.sqf";};
		case 1:{[name call GetSelectedPlayer] execVM "admintools\tools\Teleport\TpToPlayer-Logi.sqf";};
		case 2:{[name call GetSelectedPlayer] execVM "admintools\tools\Teleport\TPtoME-Logi.sqf";};
		case 3:{[name call GetSelectedPlayer] execVM "admintools\tools\Teleport\TpInPlayerVehicle-Logi.sqf";};
		case 4:{[name call GetSelectedPlayer] execVM "admintools\tools\Teleport\TPInAdminVehicle-Logi.sqf";};
		case 5:{[name call GetSelectedPlayer] execVM "admintools\tools\EjectFromVehicle-Logi.sqf";};
		case 6:{[call GetSelectedPlayer] execVM "admintools\tools\VehicleLocator-Logi.sqf";};
		case 7:{[call GetSelectedPlayer] execVM "admintools\tools\RepairVehicle-Logi.sqf";};
		case 8:{[call GetSelectedPlayer] execVM "admintools\tools\HealPlayer-Logi.sqf";};
		case 9:{[call GetSelectedPlayer] execVM "admintools\tools\HumanityIncrease-Logi.sqf";};
		case 10:{[call GetSelectedPlayer] execVM "admintools\tools\HumanityDecrease-Logi.sqf";};
		case 11:{[call GetSelectedPlayer] execVM "admintools\tools\GiveAmmo-Logi.sqf";};  
		case 12:{[call GetSelectedPlayer] execVM "admintools\tools\RemoveGear-Logi.sqf";};
		case 13:{call GetSelectedPlayer setDamage 1;};
		//******************************************
		case 15:{call AdminGodToggle;};
		case 16:{call VehicleGodToggle;};
		case 17:{call VehicleBoostToggle;};
		case 18:{call InfiniteAmmoToggle;};
		case 19:{call InvisibilityToggle;};
		case 20:{call ZombieShieldToggle;};
		case 21:{call AdminFastBuildToggle;};
		case 22:{call ESPToggle;};
		case 23:{call AdminScrollMenuToggle;};
		//******************************************
		case 25:{call PlayerMarker;};
		case 26:{call CorpseMarker;};
		case 27:{call PlotMarker;};
		case 28:{call VaultMarker;};
		case 29:{call TentMarker;};
		case 30:{call VehicleMarker;};
		case 31:{call WreckMarker;};
		case 32:{call BuiltItemMarker;};
	};
};

// This function gets called when a user double clicks on an item in the spawn tool list box (This function is called from the function below)
// This is only used to set the text colour of the items in the spawn tool list box
SpawnTool_UpdateText = {

	// Gets the index value of the currently selected item in the spawn tool list box
	_currentCell = lbCurSel AdminSpawnListbox;
	
	// This sets the selected items text red and the other items text white in the spawn tool listbox 
	for "_i" from 0 to 5 do { if (_i != _currentCell) then {lbSetColor [AdminSpawnListbox, _i, COLOR_WHITE];} else {lbSetColor [AdminSpawnListbox, _i, COLOR_RED];};};
};

// This function is called from the dialog when a user double clicks on an item from the spawn tool list box
// This function is used to determine which spawn menu to call
SpawnTool_Update = {

	// Gets the index value of the currently selected item in the spawn tool list box and then calls the related function
	_tool = _this select 0; // AdminSpawnListbox
	call SpawnTool_UpdateText;
	switch (_tool) do
	{
		case 0:{call SpawnVehicleScript;};
		case 1:{call SpawnVehicleScript;};
		case 2:{call SpawnWeaponScript;};
		case 3:{call SpawnGearScript;};
		case 4:{call SpawnBuildingScript;};
		case 5:{call SpawnSkinScript;};
	};
};

// This function is called from the dialog when a user double clicks on an item from the spawn item list box
// The function is used to determine which spawn script to call and passes in the selected item as a parameter
SpawnItem_Update = {
	_item = _this select 0;  
	_currentCell = lbCurSel AdminSpawnListbox;
	
	switch (_currentCell) do
	{
		case 0:{[((vehicleList select _item) select 0)] execVM "admintools\tools\addvehicle.sqf";};
		case 1:{[((vehicleList select _item) select 0)] execVM "admintools\tools\addtempvehicle.sqf";};
		case 2:{[_item, call GetSelectedPlayer] call compile preprocessFileLineNumbers 'admintools\tools\addWeapon-Logi.sqf';};
		case 3:{[_item, call GetSelectedPlayer] call compile preprocessFileLineNumbers 'admintools\tools\addGear-Logi.sqf';};
		case 4:{[((buildingList select _item) select 0),"building"] execVM "admintools\tools\AdminBuild\adminBuild.sqf";};
		case 5:{[((skinList select _item) select 0)] execVM "admintools\tools\SkinChanger-Logi.sqf";};
	};
};

//***************************************************** Secondary Tool Functions **************************************************************

// These functions are called when a user toggles one of the admin tools in the GUI
// These functions set the text colour in the dialog, toggle the variable and then call the related script

AdminGodToggle = {
	if (!Tool_AdminGodMode) then {lbSetColor [AdminToolsListbox, 15, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 15, COLOR_RED];};
	Tool_AdminGodMode =! Tool_AdminGodMode;
	[] execVM "admintools\tools\AdminMode\GodModePlayer.sqf";
};

VehicleGodToggle = {
	if (!Tool_VehicleGodMode) then {lbSetColor [AdminToolsListbox, 16, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 16, COLOR_RED];};
	Tool_VehicleGodMode =! Tool_VehicleGodMode;
	[] execVM "admintools\tools\AdminMode\GodModeVehicle.sqf";
};

VehicleBoostToggle = {
	if (!Tool_VehicleBoost) then {lbSetColor [AdminToolsListbox, 17, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 17, COLOR_RED];};
	Tool_VehicleBoost =! Tool_VehicleBoost;
	[] execVM "admintools\tools\AdminMode\speedboost.sqf";
};

InfiniteAmmoToggle = {
	if (!Tool_InfiniteAmmo) then {lbSetColor [AdminToolsListbox, 18, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 18, COLOR_RED];};
	Tool_InfiniteAmmo =! Tool_InfiniteAmmo;
	[] execVM "admintools\tools\AdminMode\InfiniteAmmo.sqf";
};

InvisibilityToggle = {
	if (!Tool_InvisibleMode) then {lbSetColor [AdminToolsListbox, 19, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 19, COLOR_RED];};
	Tool_InvisibleMode =! Tool_InvisibleMode;
	[] execVM "admintools\tools\AdminMode\Invisibility.sqf";
};

ZombieShieldToggle = {
	if (!Tool_ZombieShield) then {lbSetColor [AdminToolsListbox, 20, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 20, COLOR_RED];};
	Tool_ZombieShield =! Tool_ZombieShield;
	[] execVM "admintools\tools\ZombieShield-Logi.sqf";
};

AdminFastBuildToggle = {
	if (!Tool_AdminFastBuild) then {lbSetColor [AdminToolsListbox, 21, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 21, COLOR_RED];};
	Tool_AdminFastBuild =! Tool_AdminFastBuild;
	[Tool_AdminFastBuild] execVM "admintools\tools\AdminMode\AdminFastBuild-Logi.sqf";
};

ESPToggle = {
	if (!Tool_ESP) then 
	{
		lbSetColor [AdminToolsListbox, 22, COLOR_GREEN];
		[] execVM "admintools\tools\AdminMode\ESPplayer.sqf";
	}
	else{
		lbSetColor [AdminToolsListbox, 22, COLOR_RED];
		[false] execVM "admintools\tools\AdminMode\ESPplayer.sqf";
	};
	Tool_ESP =! Tool_ESP;
};

AdminScrollMenuToggle = {
	if (!Tool_AdminScrollMenu) then {lbSetColor [AdminToolsListbox, 23, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 23, COLOR_RED];};
	toolsAreActive =! toolsAreActive;
	Tool_AdminScrollMenu =! Tool_AdminScrollMenu;
};


//************************************************** Map Marker Functions ****************************************************************

// These functions are called when a user toggles one of the map marker tools in the GUI
// These functions set the text colour in the dialog, toggle the variable and then call the related script

PlayerMarker = {
	if (!MapMarker_Players) then {lbSetColor [AdminToolsListbox, 25, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 25, COLOR_RED];};
	MapMarker_Players =! MapMarker_Players;
	[] execVM "admintools\tools\AdminMode\MapMarkerPlayer-Logi.sqf";
};

CorpseMarker = {
	if (!MapMarker_Corpse) then {lbSetColor [AdminToolsListbox, 26, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 26, COLOR_RED];};
	MapMarker_Corpse =! MapMarker_Corpse;
	[] execVM "admintools\tools\AdminMode\MapMarkerCorpse-Logi.sqf";
};

PlotMarker = {
	if (!MapMarker_Plot) then {lbSetColor [AdminToolsListbox, 27, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 27, COLOR_RED];};
	MapMarker_Plot =! MapMarker_Plot;
	[] execVM "admintools\tools\AdminMode\MapMarkerPlotPoles-Logi.sqf";
};

VaultMarker = {
	if (!MapMarker_Vault) then {lbSetColor [AdminToolsListbox, 28, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 28, COLOR_RED];};
	MapMarker_Vault =! MapMarker_Vault;
	[] execVM "admintools\tools\AdminMode\MapMarkerVault-Logi.sqf";
};

TentMarker = {
	if (!MapMarker_Tent) then {lbSetColor [AdminToolsListbox, 29, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 29, COLOR_RED];};
	MapMarker_Tent =! MapMarker_Tent;
	[] execVM "admintools\tools\AdminMode\MapMarkerTents-Logi.sqf";
};

VehicleMarker = {
	if (!MapMarker_Vehicle) then {lbSetColor [AdminToolsListbox, 30, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 30, COLOR_RED];};
	MapMarker_Vehicle =! MapMarker_Vehicle;
	[] execVM "admintools\tools\AdminMode\MapMarkerVehicle-Logi.sqf";
};

WreckMarker = {
	if (!MapMarker_Wreck) then {lbSetColor [AdminToolsListbox, 31, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 31, COLOR_RED];};
	MapMarker_Wreck =! MapMarker_Wreck;
	[] execVM "admintools\tools\AdminMode\MapMarkerWreck-Logi.sqf";
};

BuiltItemMarker = {
	if (!MapMarker_BuiltItem) then {lbSetColor [AdminToolsListbox, 32, COLOR_GREEN];} else {lbSetColor [AdminToolsListbox, 32, COLOR_RED];};
	MapMarker_BuiltItem =! MapMarker_BuiltItem;
	[] execVM "admintools\tools\AdminMode\MapMarkerBuildables-Logi.sqf";
};


//*************************************************** Spawn Menu Functions ******************************************************************

// These functions are used for creating the spawn lists, they are called when a user selects the specific spawn list from the GUI

// This function creates the spawn gear list
SpawnGearScript = {
	private ["_cfgMagazines"];
	
	if (isNil "gearList") then
	{
		gearList = [];   
		_cfgMagazines = configFile >> "cfgMagazines";
		
		for "_i" from 0 to (count _cfgMagazines)-1 do 
		{
			private ["_gear", "_gearType","_textPart","_image"];
			_gear = _cfgMagazines select _i;

			if (isClass _gear) then {
				_gearType = configName _gear;
			
				// Add the gear to the list
				if ((getNumber(_gear >> "scope") == 2) && (getText(_gear >> "picture") != "")) then 
				{
					_textPart =	getText(configFile >> "cfgMagazines" >> _gearType >> "displayName");
					_image = (getText (configFile >> "cfgMagazines" >> _gearType >> "picture"));
									
					if (_image != "z\addons\dayz_communityassets\pictures\i_buiscit_ca.paa") then {gearList set [count gearList,[_gearType, _textPart, _image]];};
				};
			};
		};
	};
	
	// This loads the spawn gear list into the GUI
	lbClear AdminSpawnItemListbox;
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [AdminSpawnItemListbox, format["%2 (%1)", _x select 0, _x select 1]];
		lbSetPicture [AdminSpawnItemListbox, _index, _image];
	} forEach gearList;
	
	// Resets the listbox index and calls the show filter button function
	lbSetCurSel [AdminSpawnItemListbox, 0];
	CurrentSpawnMenu = "Gear";
	call ShowFilterButton;
};

// This function creates the spawn weapon list
SpawnWeaponScript = {
	private ["_cfgWeapons"];

	if (isNil "weaponList") then
	{
		weaponList = [];
		_cfgWeapons = configFile >> "cfgWeapons";

		for "_i" from 0 to (count _cfgWeapons)-1 do 
		{
			private ["_weapon", "_weaponType","_textPart","_keyCheck","_image"];
			_weapon = _cfgWeapons select _i;

			if (isClass _weapon) then {
				_weaponType = configName _weapon;
				_keyCheck = toArray _weaponType;
				_keyCheck resize 5;
				_keyCheck;
				_keyCheck = toString _keyCheck;
			
				// Remove the 12500 key items and the MineE, then add the rest of the weapons to the list
				if ((_weaponType != "MineE") && ((_keyCheck != "ItemK")  || (_keyCheck == "ItemKeyKit"))) then 
				{
					if ((getText(_weapon >> "picture") != "")) then 
					{
						_textPart =	getText(configFile >> "cfgWeapons" >> _weaponType >> "displayName");
						_image = (getText (configFile >> "cfgWeapons" >> _weaponType >> "picture"));
						weaponList set [count weaponList,[_weaponType, _textPart, _image]];
					};
				};
			};
		};
	};

	// This loads the spawn weapon list into the GUI
	lbClear AdminSpawnItemListbox;
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [AdminSpawnItemListbox, format["%2 (%1)", _x select 0, _x select 1]];
		lbSetPicture [AdminSpawnItemListbox, _index, _image];
	} forEach weaponList;
	
	// Resets the listbox index and calls the show filter button function
	lbSetCurSel [AdminSpawnItemListbox, 0];
	CurrentSpawnMenu = "Weapon";
	call ShowFilterButton;
};

// This function creates the spawn vehicle list
SpawnVehicleScript = {
	private ["_kindOf", "_filter", "_cfgVehicles"];

	if (isNil "vehicleList") then
	{
		vehicleList = [];
		_kindOf = ["LandVehicle","Air","Ship"];
		_filter = ["BIS_Steerable_Parachute","ParachuteBase","StaticWeapon"];      
		_cfgVehicles = configFile >> "cfgVehicles";

		for "_i" from 0 to (count _cfgVehicles)-1 do 
		{
			private ["_vehicle", "_vehicleType","_textPart","_image"];
			_vehicle = _cfgVehicles select _i;

			if (isClass _vehicle) then 
			{
				_vehicleType = configName(_vehicle);
				
				// Add the vehicles to the list
				if ((getNumber(_vehicle >> "scope") == 2) && (getText(_vehicle >> "picture") != "") && (KINDOF_ARRAY(_vehicleType,_kindOf)) && !(KINDOF_ARRAY(_vehicleType,_filter))) then 
				{
					_textPart =	getText(configFile >> "cfgVehicles" >> _vehicleType >> "displayName");
					_image = (getText (configFile >> "CfgVehicles" >> _vehicleType >> "picture"));
					vehicleList set [count vehicleList,[_vehicleType, _textPart, _image]];
				};
			};
		};
	};

	// This loads the spawn vehicle list into the GUI
	lbClear AdminSpawnItemListbox;
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [AdminSpawnItemListbox, format["%2 (%1)", _x select 0, _x select 1]];
	  lbSetPicture [AdminSpawnItemListbox, _index, _image];
	} forEach vehicleList;
	
	// Resets the listbox index and calls the show filter button function
	lbSetCurSel [AdminSpawnItemListbox, 0];
	CurrentSpawnMenu = "Vehicle";
	call ShowFilterButton;
};

// This function creates the spawn building list
SpawnBuildingScript = {
	private ["_cfgVehicles","_image"];

	if (isNil "buildingList") then
	{
		buildingList = [];
		_cfgVehicles = configFile >> "CfgVehicles";
		_image = "\z\addons\dayz_epoch\pictures\equip_wooden_crate_ca.paa";

		for "_i" from 0 to (count _cfgVehicles)-1 do 
		{
			private ["_building", "_buildingType", "_textPart"];
			_building = _cfgVehicles select _i;

			if (isClass _building) then 
			{
				_buildingType = configName _building;

				// Add the buildings to the list
				if ((getText (_building >> "picture") != "") && (getNumber (_building >> "scope") == 2) && ((_buildingType isKindOf "House") || (_buildingType isKindOf "Building"))) then 
				{
					if !((_buildingType isKindOf "ParachuteBase") || (_buildingType isKindOf "BIS_Steerable_Parachute")) then
					{
						_textPart =	getText(configFile >> "CfgVehicles" >> _buildingType >> "displayName");
						buildingList set [count buildingList,[_buildingType, _textPart, _image]];
					};
				};
			};
		};
	};

	// This loads the spawn building list into the GUI
	lbClear AdminSpawnItemListbox;
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [AdminSpawnItemListbox, format["%2 (%1)", _x select 0, _x select 1]];
		lbSetPicture [AdminSpawnItemListbox, _index, _image];
	} forEach buildingList;
	
	// Resets the listbox index and calls the show filter button function
	lbSetCurSel [AdminSpawnItemListbox, 0];
	CurrentSpawnMenu = "Building";
	call ShowFilterButton;
};

// This function creates the spawn skin list
SpawnSkinScript = {
	private ["_kindOf","_filter","_cfgVehicles","_image"];
	
	if (isNil "skinList") then
	{
		skinList = [];
		_kindOf = ["Man","zZombie_Base","Animal"];
		_filter = ["Survivor1_DZ",""];     
		_cfgVehicles = configFile >> "cfgVehicles";
		_image = "\dayz_equip\textures\equip_cloth_parcel_ca.paa";

		for "_i" from 0 to (count _cfgVehicles)-1 do 
		{
			private ["_skin", "_skinType", "_textPart"];
			_skin = _cfgVehicles select _i;

			if (isClass _skin) then {
				_skinType = configName _skin;

				// Add the player skins to the list
				if ((getNumber(_skin >> "scope") == 2) && (getText(_skin >> "picture") != "") && (KINDOF_ARRAY(_skinType,_kindOf)) && !(KINDOF_ARRAY(_skinType,_filter))) then 
				{
					if !(_skinType == "zZombie_Base") then 
					{
						_textPart =	getText(configFile >> "cfgVehicles" >> _skinType >> "displayName");
						skinList set [count skinList,[_skinType, _textPart, _image]];
					};
				};
			};
		};
	};

	// This loads the spawn skin list into the GUI
	lbClear AdminSpawnItemListbox;
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [AdminSpawnItemListbox, format["%2 (%1)", _x select 0, _x select 1]];
		lbSetPicture [AdminSpawnItemListbox, _index, _image];
	} forEach skinList;
	
	// Resets the listbox index and calls the show filter button function
	lbSetCurSel [AdminSpawnItemListbox, 0];
	CurrentSpawnMenu = "Skin";
	call ShowFilterButton;
};


//*************************************************** Spawn Filter Functions ******************************************************************

// These functions are used to filter the spawn lists, they are called after the filter buttons have been pressed in the GUI
// These are still under development!
// The vehicle filter works, the skin filter needs a little bit of modifying to remove un-wanted skins and the gear,building and weapon filters need creating
// These functions are called by passing in the "kindOf" item to filter with. For example : ["LandVehicle"] call LoadSpecificVehicleList; or ["Ship"] call LoadSpecificVehicleList;

// Vehicle spawn list filter
LoadSpecificVehicleList = {
	private ["_kindOf", "_filter", "_cfgVehicles"];
	
	lbClear AdminSpawnItemListbox;
	
		vehicleList = [];
		_kindOf = [_this select 0];
		_filter = ["BIS_Steerable_Parachute","ParachuteBase","StaticWeapon"];      
		_cfgVehicles = configFile >> "cfgVehicles";

		for "_i" from 0 to (count _cfgVehicles)-1 do 
		{
			private ["_vehicle", "_vehicleType", "_textPart"];
			_vehicle = _cfgVehicles select _i;
			
			if (isClass _vehicle) then {
				_vehicleType = configName(_vehicle);
				
				if ((getNumber(_vehicle >> "scope") == 2) and (getText(_vehicle >> "picture") != "") and (KINDOF_ARRAY(_vehicleType,_kindOf)) and !(KINDOF_ARRAY(_vehicleType,_filter))) then {
					_textPart =	getText(configFile >> "cfgVehicles" >> _vehicleType >> "displayName");
					_image = (getText (configFile >> "CfgVehicles" >> _vehicleType >> "picture"));
					vehicleList set [count vehicleList,[_vehicleType, _textPart, _image]];
				};
			};
		};
	
	lbClear AdminSpawnItemListbox;
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [AdminSpawnItemListbox, format["%2 (%1)", _x select 0, _x select 1]];
	  lbSetPicture [AdminSpawnItemListbox, _index, _image];
	} forEach vehicleList;
};

// Skin spawn list filter
LoadSpecificSkinList = {
	private ["_kindOf","_image","_filter","_cfgVehicles"];
	
	lbClear AdminSpawnItemListbox;
	
		skinList = [];
		_image = "\dayz_equip\textures\equip_cloth_parcel_ca.paa";
		_kindOf = [_this select 0];
		_filter = ["Survivor1_DZ",""];      
		_cfgVehicles = configFile >> "cfgVehicles";

		for "_i" from 0 to (count _cfgVehicles)-1 do 
		{
			private ["_skin", "_skinType", "_textPart"];
			_skin = _cfgVehicles select _i;
			
			if (isClass _skin) then 
			{
				_skinType = configName(_skin);
				
				if ((getNumber(_skin >> "scope") == 2) && (KINDOF_ARRAY(_skinType,_kindOf)) && !(KINDOF_ARRAY(_skinType,_filter))) then 
				{
					if !(_skinType == "zZombie_Base") then 
					{
						_textPart =	getText(configFile >> "cfgVehicles" >> _skinType >> "displayName");
						skinList set [count skinList,[_skinType, _textPart, _image]];
					};
				};
			};
		};
	
	lbClear AdminSpawnItemListbox;
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [AdminSpawnItemListbox, format["%2 (%1)", _x select 0, _x select 1]];
	  lbSetPicture [AdminSpawnItemListbox, _index, _image];
	} forEach skinList;
};

// Gear spawn list filter
LoadSpecificGearList = {
	private ["_kindOf","_image","_filter","_cfgMagazines"];
	
	lbClear AdminSpawnItemListbox;
	
		gearList = [];
		_image = "\dayz_equip\textures\equip_cloth_parcel_ca.paa";
		_kindOf = [_this select 0];
		_cfgMagazines = configFile >> "cfgMagazines";

		for "_i" from 0 to (count _cfgMagazines)-1 do 
		{
			private ["_gear", "_skinType", "_textPart"];
			_gear = _cfgMagazines select _i;
			
			if (isClass _gear) then 
			{
				_skinType = configName(_gear);
				
				if ((getNumber(_gear >> "scope") == 2) && (KINDOF_ARRAY(_skinType,_kindOf))) then 
				{
					_textPart =	getText(configFile >> "cfgMagazines" >> _skinType >> "displayName");
					gearList set [count gearList,[_skinType, _textPart, _image]];
				};
			};
		};
	
	lbClear AdminSpawnItemListbox;
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [AdminSpawnItemListbox, format["%2 (%1)", _x select 0, _x select 1]];
	  lbSetPicture [AdminSpawnItemListbox, _index, _image];
	} forEach gearList;
};

// This function is used to show the filter buttons in the GUI and set the button text (Still needs a bit of work)
ShowFilterButton = {
	private ["_display","_filterButton_1","_filterButton_2","_filterButton_3","_control"];
	
	disableSerialization;

	_display = findDisplay 2626;
	_filterButton_1 = 13010;
	_filterButton_2 = 13011;
	_filterButton_3 = 13012;
	
	// Sets the text for the filter buttons
	if (CurrentSpawnMenu == "Gear") then 
	{
		(_display displayCtrl _filterButton_1) ctrlSetText "Food";
		(_display displayCtrl _filterButton_2) ctrlSetText "Medical";
		(_display displayCtrl _filterButton_3) ctrlSetText "Modular";
	};
	
	if (CurrentSpawnMenu == "Weapon") then 
	{
		(_display displayCtrl _filterButton_1) ctrlSetText "Weapon";
		(_display displayCtrl _filterButton_2) ctrlSetText "Tool";
		(_display displayCtrl _filterButton_3) ctrlSetText "Other";
	};
	
	if (CurrentSpawnMenu == "Vehicle") then 
	{
		(_display displayCtrl _filterButton_1) ctrlSetText "Land";
		(_display displayCtrl _filterButton_2) ctrlSetText "Air";
		(_display displayCtrl _filterButton_3) ctrlSetText "Sea";
	};
	
	if (CurrentSpawnMenu == "Building") then 
	{
		(_display displayCtrl _filterButton_1) ctrlSetText "House";
		(_display displayCtrl _filterButton_2) ctrlSetText "Farm";
		(_display displayCtrl _filterButton_3) ctrlSetText "Office";
	};
	
	if (CurrentSpawnMenu == "Skin") then 
	{
		(_display displayCtrl _filterButton_1) ctrlSetText "Man";
		(_display displayCtrl _filterButton_2) ctrlSetText "Zombie";
		(_display displayCtrl _filterButton_3) ctrlSetText "Animal";
	};
	
	_control = _display displayCtrl _filterButton_1;
	_control ctrlSetScale 1;
	_control ctrlCommit 0;
	_control = _display displayCtrl _filterButton_2;
	_control ctrlSetScale 1;
	_control ctrlCommit 0;
	_control = _display displayCtrl _filterButton_3;
	_control ctrlSetScale 1;
	_control ctrlCommit 0;
};

// Filter button click event functions (These need finishing once the filters are completed!)
FilterButtonClicked_1 = {
	if (CurrentSpawnMenu == "Gear") then {systemChat "Gear filter button clicked!";};
	if (CurrentSpawnMenu == "Weapon") then {systemChat "Weapon filter button clicked!";};
	if (CurrentSpawnMenu == "Vehicle") then {["LandVehicle"] call LoadSpecificVehicleList;};
	if (CurrentSpawnMenu == "Building") then {systemChat "House filter button clicked!";};
	if (CurrentSpawnMenu == "Skin") then {["Man"] call LoadSpecificSkinList;};
};

FilterButtonClicked_2 = {
	if (CurrentSpawnMenu == "Gear") then {systemChat "Gear filter button clicked!";};
	if (CurrentSpawnMenu == "Weapon") then {systemChat "Tool filter button clicked!";};
	if (CurrentSpawnMenu == "Vehicle") then {["Air"] call LoadSpecificVehicleList;};
	if (CurrentSpawnMenu == "Building") then {systemChat "Farm filter button clicked!";};
	if (CurrentSpawnMenu == "Skin") then {["zZombie_Base"] call LoadSpecificSkinList;};
};

FilterButtonClicked_3 = {
	if (CurrentSpawnMenu == "Gear") then {systemChat "Gear filter button clicked!";};
	if (CurrentSpawnMenu == "Weapon") then {systemChat "Other filter button clicked!";};
	if (CurrentSpawnMenu == "Vehicle") then {["Ship"] call LoadSpecificVehicleList;};
	if (CurrentSpawnMenu == "Building") then {systemChat "Office filter button clicked!";};
	if (CurrentSpawnMenu == "Skin") then {["Animal"] call LoadSpecificSkinList;};
};


//*************************************************** Other Functions **********************************************************************

// This function creates the list of players to be displayed in the player list in the GUI
CreateServerPlayerList = {
	// Creates the list of players on the server
	playerlist = [];
	{
		private ["_playerName","_playerUID","_image"];
		_playerName = name vehicle _x;
		_playerUID = getPlayerUID _x;
		
		//_image = (getText (configFile >> 'CfgVehicles' >> (typeOf vehicle _x) >> 'picture'));
		
		// If the player is on foot it gets the weapon image otherwise it gets the vehicle image
		if (_x == vehicle _x) then{_image = (getText (configFile >> 'cfgWeapons' >> (currentWeapon _x) >> 'picture'));} else {_image = (getText (configFile >> 'CfgVehicles' >> (typeOf vehicle _x) >> 'picture'));};			
		if (_image != "z\addons\dayz_communityassets\pictures\i_buiscit_ca.paa") then {playerlist set [count playerlist,[_playerUID, _playerName, _image]];};
	} forEach playableUnits;
};

// This function populates the listbox in the GUI with the playerlist that was created by the function above
PopulatePlayerListbox = {
	// Fill the player listbox with the players from the playerlist
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [PlayerListbox, format["%2 (%1)", _x select 0, _x select 1]];
		lbSetPicture [PlayerListbox, _index, _image];
	} forEach playerlist;
};


// This function highlights any admin or moderators in the player listbox and any player that is waiting in the help queue
PlayerListHighlight = {
	private ["_counter","_currentAdminUID"];
	_counter = 0;
	_currentAdminUID = getPlayerUID player;

	{
		private ["_playerName","_playerUID"];
		_playerName = name vehicle _x;
		_playerUID = getPlayerUID _x;
		
		// Admin are displayed purple and moderators are displayed pink
		if (_playerUID in AdminList && _playerName in AdminNameList) then {lbSetColor [PlayerListbox, _counter, COLOR_PURPLE];};
		if (_playerUID in ModList && _playerName in ModNameList) then {lbSetColor [PlayerListbox, _counter, COLOR_PINK];};
		
		// Players in the help queue are displayed red
		if (_playerName in helpQueue) then {lbSetColor [PlayerListbox, _counter, COLOR_RED];};
		
		// Sets the player listbox index to match the current admin
		if (_playerUID == _currentAdminUID) then {lbSetCurSel [PlayerListbox, _counter];};
		_counter = _counter + 1;
	} forEach playableUnits;
};


// This function removes the selected player from the help queue. It is called when a user double clicks on a player in the listbox in the GUI
RemoveFromHelpQueue = {
	_playerIndex = _this select 0;
	
	// If the selected player is in the help queue, they are removed and the text colour is reset in the GUI
	if (name call GetSelectedPlayer in helpQueue) then {
		EAT_contactAdminServer = ["remove", name call GetSelectedPlayer];
		lbSetColor [PlayerListbox, _playerIndex, COLOR_WHITE];
	};
};



// This function returns the selected player from the player listbox
GetSelectedPlayer = {
	private ["_currentCell","_allPlayers","_selectedPlayer"];
	
	// Get the current index of the player listbox
	_currentCell = lbCurSel PlayerListbox; 
	_allPlayers = [];
	{if (isPlayer _x) then {_allPlayers = _allPlayers + [_x];};} forEach playableUnits;
	
	// Set the selected player
	_selectedPlayer = _allPlayers select _currentCell; 
_selectedPlayer
};

// This function populates the admin tools listbox in the GUI with all of the available tools
PopulateAdminListbox = {
	private ["_index"];

	// Fill the admin tool listbox
	_index = lbAdd [AdminToolsListbox, " Spectate Player"];
	_index = lbAdd [AdminToolsListbox, " Teleport to Player"];
	_index = lbAdd [AdminToolsListbox, " Teleport Player to Admin"];
	_index = lbAdd [AdminToolsListbox, " Join players vehicle"];
	_index = lbAdd [AdminToolsListbox, " Player Join Admins Vehicle"];
	_index = lbAdd [AdminToolsListbox, " Eject Player from Vehicle"];
	_index = lbAdd [AdminToolsListbox, " Locate Players Vehicle"];
	_index = lbAdd [AdminToolsListbox, " Repair Players Vehicle"];
	_index = lbAdd [AdminToolsListbox, " Heal Player"];
	_index = lbAdd [AdminToolsListbox, " Humanity Increase"];
	_index = lbAdd [AdminToolsListbox, " Humanity Decrease"];
	_index = lbAdd [AdminToolsListbox, " Give Ammo"];
	_index = lbAdd [AdminToolsListbox, " Remove Gear"];
	_index = lbAdd [AdminToolsListbox, " Kill Player"];
	//************************************************************
	_index = lbAdd [AdminToolsListbox, "Admin Tools:"];
	_index = lbAdd [AdminToolsListbox, " Admin Godmode"];
	_index = lbAdd [AdminToolsListbox, " Vehicle Godmode"];
	_index = lbAdd [AdminToolsListbox, " Vehicle Boost"];
	_index = lbAdd [AdminToolsListbox, " Infinite Ammo"];
	_index = lbAdd [AdminToolsListbox, " Invisible Mode"];
	_index = lbAdd [AdminToolsListbox, " Zombie Shield"];
	_index = lbAdd [AdminToolsListbox, " Admin Fast Build"];
	_index = lbAdd [AdminToolsListbox, " ESP"];
	_index = lbAdd [AdminToolsListbox, " Admin Scroll Menu"];
	//************************************************************
	_index = lbAdd [AdminToolsListbox, "Map markers:"];
	_index = lbAdd [AdminToolsListbox, " Players"];
	_index = lbAdd [AdminToolsListbox, " Corpses"];
	_index = lbAdd [AdminToolsListbox, " Plot poles"];
	_index = lbAdd [AdminToolsListbox, " Vaults"];
	_index = lbAdd [AdminToolsListbox, " Tents"];
	_index = lbAdd [AdminToolsListbox, " Vehicles"];
	_index = lbAdd [AdminToolsListbox, " Wrecks"];
	_index = lbAdd [AdminToolsListbox, " Modular Items"];

	// Fill the admin spawn listbox
	_index = lbAdd [AdminSpawnListbox, " Spawn Permanent Vehicle"];
	_index = lbAdd [AdminSpawnListbox, " Spawn Temporary Vehicle"];
	_index = lbAdd [AdminSpawnListbox, " Spawn Weapon"];
	_index = lbAdd [AdminSpawnListbox, " Spawn Gear"];
	_index = lbAdd [AdminSpawnListbox, " Spawn Building"];
	_index = lbAdd [AdminSpawnListbox, " Player Morph"];
};

// This function sets the text colour of each of the items in the admin tools list box
AdminListboxSetColours = {
	// Set the admin tool listbox colours
	// The first set of admin tools are all light blue, so this is done with a loop
	for "_i" from 0 to 13 do {lbSetColor [AdminToolsListbox, _i, COLOR_LIGHTBLUE];};
	
	// None click-able list divider
	lbSetColor [AdminToolsListbox, 14, COLOR_ORANGE]; 
	
	// The next set of the admin tools have their text colour determined depending on the related variable (Red or Green)
	if (!Tool_AdminGodMode) then {lbSetColor [AdminToolsListbox, 15, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 15, COLOR_GREEN];};
	if (!Tool_VehicleGodMode) then {lbSetColor [AdminToolsListbox, 16, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 16, COLOR_GREEN];};
	if (!Tool_VehicleBoost) then {lbSetColor [AdminToolsListbox, 17, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 17, COLOR_GREEN];};
	if (!Tool_InfiniteAmmo) then {lbSetColor [AdminToolsListbox, 18, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 18, COLOR_GREEN];};
	if (!Tool_InvisibleMode) then {lbSetColor [AdminToolsListbox, 19, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 19, COLOR_GREEN];};
	if (!Tool_ZombieShield) then {lbSetColor [AdminToolsListbox, 20, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 20, COLOR_GREEN];};
	if (!Tool_AdminFastBuild) then {lbSetColor [AdminToolsListbox, 21, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 21, COLOR_GREEN];};
	if (!Tool_ESP) then {lbSetColor [AdminToolsListbox, 22, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 22, COLOR_GREEN];};
	if (!Tool_AdminScrollMenu) then {lbSetColor [AdminToolsListbox, 23, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 23, COLOR_GREEN];};

	// None click-able list divider
	lbSetColor [AdminToolsListbox, 24, COLOR_ORANGE];
	
	// The map marker tools also have their text colour determined depending on the related variable (Red or Green)
	if (!MapMarker_Players) then {lbSetColor [AdminToolsListbox, 25, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 25, COLOR_GREEN];};
	if (!MapMarker_Corpse) then {lbSetColor [AdminToolsListbox, 26, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 26, COLOR_GREEN];};
	if (!MapMarker_Plot) then {lbSetColor [AdminToolsListbox, 27, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 27, COLOR_GREEN];};
	if (!MapMarker_Vault) then {lbSetColor [AdminToolsListbox, 28, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 28, COLOR_GREEN];};
	if (!MapMarker_Tent) then {lbSetColor [AdminToolsListbox, 29, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 29, COLOR_GREEN];};
	if (!MapMarker_Vehicle) then {lbSetColor [AdminToolsListbox, 30, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 30, COLOR_GREEN];};
	if (!MapMarker_Wreck) then {lbSetColor [AdminToolsListbox, 31, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 31, COLOR_GREEN];};
	if (!MapMarker_BuiltItem) then {lbSetColor [AdminToolsListbox, 32, COLOR_RED];} else {lbSetColor [AdminToolsListbox, 32, COLOR_GREEN];};

	// Set the admin spawn listbox colours (White)
	for "_i" from 0 to 5 do {lbSetColor [AdminSpawnListbox, _i, COLOR_WHITE];};
};








// This function creates an arrow above the admins head if the AdminHighlightToolUsage variable has been set to true
// This feature is still under development (The tools array in the config file needs to be setup and read here)
// The arrow was working fine when the admin was on foot, but when the admin got into a vehicle the arrow would be left behind
// I attempted to rectify this by using a loop to detect if the admin had gotten into a vehicle and then attaching the arrow to that vehicle
// This is working using the loop and the arrow stays with the admin even in vehicles, but it is causing another glitchy arrow to keep appearing and disappearing very fast
// At the moment this is called from the close button but it will need to be called every time a user toggles a tool.
AdminHighlightToggle = {
	private ["_adminLocation","_adminArrow"];
	
	if (AdminHighlightToolUsage) then 
	{
		// If the specific admin tool is enabled, the arrow is created
		// (This if statement will need to be replaced with a statement to compare the currently enabled tools with the array from the config)
		//if (Tool_ESP || Tool_ZombieShield || Tool_InfiniteAmmo || Tool_VehicleBoost || Tool_VehicleGodMode || Tool_AdminGodMode) then 
		//{
			//call compile preprocessFileLineNumbers 'admintools\tools\AdminHighlight-Logi.sqf';
		//} 
		//else 
		//{
			//AdminHighlightTool = !AdminHighlightTool;
			//{deleteVehicle _x;} forEach nearestObjects[player,["Sign_arrow_down_large_EP1"],10];
		//};
	};
};


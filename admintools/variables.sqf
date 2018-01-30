// Do not modify this file unless you know what you are doing

dayz_antihack = 0; // Disabled to allow use of mod antihack
EAT_adminList = EAT_adminList + EAT_superAdminList; // add SuperAdmin to Admin
EAT_adminModList = EAT_adminList + EAT_modList; // Add all admin/mod into one list for easy call
if ((getPlayerUID player) in EAT_adminModList) then {EAT_isAdmin = true;} else {EAT_isAdmin = false;}; // Discern if player is admin

/***** Set variables *****/
EAT_tempList = []; // Initialize EAT_tempList
EAT_helpQueue = []; // Initialize help queue
EAT_szAdminZone = []; // Temporary admin safe zones
EAT_vehicleGod2 = false;
EAT_playerGod2 = false;
EAT_areaGodMode = false;

/****************** Server Public Variables ******************/
	if(isDedicated) then {
		// Log tool usage to .txt file
		"EAT_PVEH_usageLogger" addPublicVariableEventHandler {
			"EATadminLogger" callExtension (_this select 1);
		};
		
		// Export base to .sqf
		"EAT_PVEH_baseExporter" addPublicVariableEventHandler {
			"EATbaseExporter" callExtension (_this select 1);
		};
		
		// Export base to .sqf
		"EAT_PVEH_safeZone" addPublicVariableEventHandler {
			EAT_szAdminZone = _this select 1;

			EAT_PVEH_safeZoneClient = EAT_szAdminZone;
			{(owner _x) publicVariableClient "EAT_PVEH_safeZoneClient";} forEach entities "CAManBase";
		};

		// teleport fix
		"EAT_PVEH_teleportFix" addPublicVariableEventHandler{
			_array = (_this select 1);

			if((_array select 0) == "add") then {
				EAT_tempList = EAT_tempList + [_array select 1];
			} else {
				EAT_tempList = EAT_tempList - [_array select 1];
			};
			EAT_teleportFixClient = EAT_tempList;
			{(owner _x) publicVariableClient "EAT_teleportFixClient";} forEach entities "CAManBase";
		};
		
		// Send information to server for temp vehicle spawning
		"EAT_PVEH_vehSpawn" addPublicVariableEventHandler {(_this select 1) spawn EAT_vehSpawn;};
		
		// Send crate spawning information to the server
		"EAT_PVEH_crateSpawn" addPublicVariableEventHandler {(_this select 1) spawn EAT_crateSpawn;};
		
		// Send AI spawning information to the server
		"EAT_PVEH_aiSpawn" addPublicVariableEventHandler {(_this select 1) spawn EAT_serverAiSpawn;};
	};
/****************** Client Public Variables ******************/
	// Broadcast server message to clients
	"EAT_PVEH_serverMessage" addPublicVariableEventHandler {
		[format["<t size='0.8' color='#ff0000' font='Zeppelin33'>%1</t>", _this select 1],0,0,10,2,0,8] spawn BIS_fnc_dynamicText;
	};
	
	"EAT_teleportFixClient" addPublicVariableEventHandler {
		EAT_tempList = (_this select 1);
		// bypass new 1.0.6 antihack temporarily
	};
	
	"EAT_PVEH_safeZoneClient" addPublicVariableEventHandler {
		EAT_szAdminZone = (_this select 1);
	};

	// Broadcast date to clients
	"EAT_PVEH_SetDate" addPublicVariableEventHandler {
		dayzSetDate = (_this select 1);
		setDate dayzSetDate;
	};
	
	// Broadcast weather to clients
	"EAT_PVEH_SetOvercast" addPublicVariableEventHandler {
		5 setOvercast (_this select 1);
	};
	
	// Broadcast fog to clients
	"EAT_PVEH_SetFog" addPublicVariableEventHandler {
		5 setFog (_this select 1);
	};

	// Admin ticket system
	"EAT_PVEH_contactAdmin" addPublicVariableEventHandler {
		private ["_array", "_addRemove"];
		_array = (_this select 1);
		_addRemove = (_array select 0);
		
		if(_addRemove == "add") then {
			_array = _array - ["add"];
			EAT_helpQueue = EAT_helpQueue + _array;
		} else {
			_array = _array - ["remove"];
			EAT_helpQueue = EAT_helpQueue - _array;
		};
		
		if (EAT_isAdmin && _addRemove == "add") then {
			systemChat "**** A player needs help ****";
		};
	};


/******************* Buildings *******************/
	// This section defines all of the buildings in the building GUI
	// Format: variable = [["TYPE","NAME","BUILING_CLASS"],["TYPE","NAME","BUILING_CLASS"]];
	
	//Residential
		_buildHouse = [["House","Yellow Modern","Land_sara_domek_zluty"],["House","Large Orange","Land_Housev2_02_Interier"],["House","Yellow Wood","land_housev_3i3"],["House","Burgundy","land_housev_1l2"],["House","Orange/Green","Land_HouseV_3I1"],["House","Damaged Brick","land_r_housev2_04"],["House","Orange/Red","Land_HouseV_1I1"],["House","Barn","Land_HouseV_3I4"],["House","Yellow","Land_HouseV_1T"],["House","Red Brick","Land_HouseV_2I"],["House","Wood","Land_HouseV_1I3"],["House","Green","Land_HouseV_1L1"],["House","Yellow Wood","Land_HouseV_1I2"],["House","Yellow Stone","Land_HouseV_2L"],["House","Green Wood","Land_HouseV_2T2"],["House","Green wood/concrete","Land_HouseV_3I2"],["House","Shanty","Land_MBG_Shanty_BIG"],["House","Middle-East 1","Land_House_C_11_EP1"],["House","Middle-East 2","Land_House_C_12_EP1"],["House","Old Stone 1","Land_House_K_1_EP1"],["House","Old Stone 2","Land_House_K_3_EP1"],["House","Old Stone 3","Land_House_K_5_EP1"],["House","Old Stone 4","Land_House_K_7_EP1"],["House","Old Stone 5","Land_House_K_8_EP1"],["House","Old Stone 6","Land_House_L_1_EP1"],["House","Old Stone 7","Land_House_L_3_EP1"],["House","Old Stone 8","Land_House_L_4_EP1"],["House","Old Stone 9","Land_House_L_6_EP1"],["House","Old Stone 10","Land_House_L_7_EP1"],["House","Old Stone 11","Land_House_L_8_EP1"],["House","Old Stone Ruins","Land_ruin_01"]];
		_buildHouseBlock = [["House Block","A1","Land_HouseBlock_A1"],["House Block","A1","Land_HouseBlock_A1"],["House Block","A1_2","Land_HouseBlock_A1_2"],["House Block","A2","Land_HouseBlock_A2"],["House Block","A2_1","Land_HouseBlock_A2_1"],["House Block","A3","Land_HouseBlock_A3"],["House Block","B1","Land_HouseBlock_B1"],["House Block","B2","Land_HouseBlock_B2"],["House Block","B3","Land_HouseBlock_B3"],["House Block","B4","Land_HouseBlock_B4"],["House Block","B5","Land_HouseBlock_B5"],["House Block","B6","Land_HouseBlock_B6"],["House Block","C1","Land_HouseBlock_C1"],["House Block","C2","Land_HouseBlock_C2"],["House Block","C3","Land_HouseBlock_C3"],["House Block","C4","Land_HouseBlock_C4"],["House Block","C5","Land_HouseBlock_C5"]];
		_buildApartment = [["Apartment","B","Land_MBG_ApartmentsTwo_B"],["Apartment","G","Land_MBG_ApartmentsTwo_G"],["Apartment","P","Land_MBG_ApartmentsTwo_P"],["Apartment","W","Land_MBG_ApartmentsOne_W"],["Apartment","Large","land_mbg_apartments_big_04"],["Apartment","Red Short","Land_Panelak"],["Apartment","Red Tall","Land_Panelak2"],["Apartment","Red Very Tall","Land_Panelak3"],["Apartment","Grey (closed)","Land_A_Office02"]];
		_buildOffice = [["Office","International Hotel","Land_HouseB_Tenement"],["Office","Municipal Office","Land_A_MunicipalOffice"],["School","School (normal)","Land_A_Office01"]];
		EAT_buildShed = [["Shed","Nice Wood (open)","Land_Shed_Wooden"],["Shed","Rickety Wood (closed)","Land_kulna"],["Shed","Large Old Wood (closed)","Land_Shed_W4"],["Shed","Patchwork wood (closed)","Land_Shed_W03"],["Shed","Grey Wood (closed)","Land_Shed_W02"],["Shed","Old Metal (closed)","Land_Shed_m03"]];
		_buildResidentMisc = [["Hospital","Hospital (normal)","land_a_hospital"],["Store","Pub","Land_A_Pub_01"],["Store","Supermarket 1","Land_A_GeneralStore_01"],["Store","Supermarket 2","Land_A_GeneralStore_01a"]];
		EAT_buildResidential = _buildHouse + _buildHouseBlock + _buildApartment + _buildOffice + EAT_buildShed + _buildResidentMisc;

	//Industrial
		_buildCargo = [["Cargo","1 Closed Red Crate","Land_Misc_Cargo1Bo"],["Cargo","2 Closed Red Crates","Land_Misc_Cargo2D"],["Cargo","1 Open Cargo Crate","Land_Misc_Cargo1D"],["Cargo","Military Crate","US_WarfareBVehicleServicePoint_Base_EP1"]];
		_buildIndustrialParts = [["Metal","Overhang","Land_Ind_Shed_02_main"],["Metal","Arch","Land_Ind_Shed_01_end"],["Station","Vehicle Ceckpoint","Land_Hlidac_budka"]];
		EAT_buildIndustrial = _buildCargo + _buildIndustrialParts;
	
	//Military
		EAT_buildMilitary = [["Military","ATC","Land_Mil_ControlTower"],["Barracks","L-Barracks","Land_Mil_Barracks_L"],["Barracks","L-Barracks","Land_Mil_Barracks_i"],["Depot","Warfare Depot","WarfareBDepot"],["Hospital","Field Hospital","INS_WarfareBFieldhHospital"]];
	
	//Religious
		EAT_buildReligious = [["Church","Orange","Land_Church_01"],["Church","Open","Land_Church_03"],["Church","Closed","Land_Church_02"],["Church","Destroyed","Land_Church_05R"],["Mosque","Small","Land_A_Mosque_small_2_EP1"],["Mosque","Medium","Land_A_Mosque_small_1_EP1"],["Mosque","Large","Land_A_Mosque_big_hq_EP1"],["Mosque","Addon","Land_A_Mosque_big_addon_EP1"],["Mosque","Wall","Land_A_Mosque_big_wall_EP1"]];

	//Graves
		EAT_buildGrave = [["Grave","Grave (normal)","Grave"],["Grave","Cross 1","GraveCross1"],["Grave","Cross 2","GraveCross2"],["Grave","Cross /w Helmet","GraveCrossHelmet"],["Grave","Mass Grave","Mass_grave_DZ"]];
		
	//Castle
		EAT_buildCastle = [["Castle","Gate","Land_A_Castle_Gate"],["Castle","Tower","Land_A_Castle_Bergfrit"],["Castle","Stairs","Land_A_Castle_Stairs_A"]];
		
	//Ore
		EAT_buildOre = [["Ore","Gold","Gold_Vein_DZE"],["Ore","Silver","Silver_Vein_DZE"],["Ore","Iron","Iron_Vein_DZE"]];
		
	//Roads
		EAT_buildRoad = [[]];

	//Other
		_buildMarker = [["Marker","Archway","Sign_circle_EP1"]];
		_buildSand = [["Sandbag","Nest (BIG)","Land_fortified_nest_big"],["Sandbag","2 Story cubes /w Net","Land_Fort_Watchtower"]];
		_buildRamp = [["Ramp","Concrete Tall","Land_ConcreteRamp"],["Ramp","Concrete Short","RampConcrete"],["Ramp","Wood Small","Land_WoodenRamp"]];
		_buildMisc = [["Statue","Soldiers /w Flag","Land_A_statue01"],["Statue","Tank","Land_A_statue02"],["Misc","Archway","Land_brana02nodoor"]];
		EAT_buildOutdoors = [["Outdoors","Outhouse","Land_KBud"]];
		EAT_buildOther =  EAT_buildOutdoors + _buildMisc + _buildRamp + _buildSand + _buildMarker;

	
	EAT_allBuildingList = EAT_buildResidential + EAT_buildIndustrial + EAT_buildMilitary + EAT_buildReligious + EAT_buildGrave + EAT_buildCastle + EAT_buildOre + EAT_buildOther;

	
/**************************** Common Functions ****************************/

	// This is a centralized function for checking if an action is allowed to take place.
	// This is basically the "_canDo" found in player actions.
	EAT_fnc_actionAllowed = {
		private["_player","_vehicle","_inVehicle","_onLadder","_canDo"];
		_player = player; //Setting a local variable as player saves resources
		_vehicle = vehicle _player;
		_inVehicle = (_vehicle != _player);
		_onLadder =	(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState _player) >> "onLadder")) == 1;
		_canDo = (!r_drag_sqf && !r_player_unconscious && !_onLadder && !_inVehicle);

	_canDo
	};
	
	// Generates a selectable list of players for teleports and spectate
	// Title is set by setting EAT_pMenuTitle = "TITLE HERE" before calling the function
	EAT_pMenuTitle = "";
	EAT_fnc_playerSelect =
	{
		private["_pmenu","_arr"];
		_pmenu = [["",true],[EAT_pMenuTitle, [-1], "", -5, [["expression", ""]], "1", "0"]];
		for "_i" from (_this select 0) to (_this select 1) do
		{_arr = [format['%1', plist select (_i)], [12],  "", -5, [["expression", format ["pselect5 = plist select %1;", _i]]], "1", "1"]; _pmenu set [_i + 2, _arr];};
		if (count plist > (_this select 1)) then {_pmenu set [(_this select 1) + 2, ["Next", [13], "", -5, [["expression", "snext = true;"]], "1", "1"]];}
		else {_pmenu set [(_this select 1) + 2, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];};
		_pmenu set [(_this select 1) + 3, ["Exit", [13], "", -5, [["expression", "pselect5 = 'exit';"]], "1", "1"]];
		showCommandingMenu "#USER:_pmenu";
	};

	// Convert multidimensional array to single dimensional
	// Used in adminBuild
	myfnc_MDarray = {
		private ["_list","_i","_temp"];
		_list = []; _temp = _this select 0; _i = 0;					//varDeclaration

		for "_i" from 0 to ((count _temp) - 1) do {					//assert input array size (starts at 1, not 0; hence the -1)
			_list set [_i,((_temp select _i) select 2)];			//set is faster than deep copy "+"; could of had used BIS_fnc_returnNestedElement, but i like to have control over it
		};
		_list;														//return the uniDimensional List of classnames
	};

/********************** Admin/Mod functions/variables **********************/
	if (EAT_isAdmin) then {
	
		//Admin-Mod mode script calls
			EAT_playerGodToggle = {
				EAT_playerGod = !EAT_playerGod;
				[] execVM "admintools\tools\AdminMode\GodModePlayer.sqf";
			};
			EAT_vehicleGodToggle = {
				EAT_vehicleGod = !EAT_vehicleGod;
				[] execVM "admintools\tools\AdminMode\GodModeVehicle.sqf";
			};
			EAT_playerESPToggle = {
				EAT_playerESP = !EAT_playerESP;
				if(EAT_playerESP && EAT_enhancedESP) then {EAT_enhancedESP = false; [EAT_enhancedESP] execVM "admintools\tools\AdminMode\ESPenhanced.sqf";};
				[] execVM "admintools\tools\AdminMode\ESPplayer.sqf";
			};
			EAT_enhancedESPToggle = {
				EAT_enhancedESP = !EAT_enhancedESP;
				if(EAT_playerESP && EAT_enhancedESP) then {EAT_playerESP = false; [EAT_playerESP] execVM "admintools\tools\AdminMode\ESPplayer.sqf";};
				[] execVM "admintools\tools\AdminMode\ESPenhanced.sqf";
			};
			EAT_grassOffToggle = {
				EAT_grassOff = !EAT_grassOff;
				[] execVM "admintools\tools\AdminMode\GrassOFF.sqf";
			};
			EAT_infAmmoToggle = {
				EAT_infAmmo = !EAT_infAmmo;
				[] execVM "admintools\tools\AdminMode\InfiniteAmmo.sqf";
			};
			EAT_speedBoostToggle = {
				EAT_speedBoost = !EAT_speedBoost;
				[] execVM "admintools\tools\AdminMode\speedboost.sqf";
			};
			EAT_fastWalkToggle = {
				EAT_fastWalk = !EAT_fastWalk;
				[] execVM "admintools\tools\AdminMode\fastWalk.sqf";
			};
			EAT_invisibilityToggle = {
				EAT_invisibility = !EAT_invisibility;
				[] execVM "admintools\tools\AdminMode\Invisibility.sqf";
			};
			EAT_flyingToggle = {
				EAT_flying = !EAT_flying;
				[] execVM "admintools\tools\AdminMode\Flying.sqf";
			};
			EAT_adminBuildToggle = {
				EAT_adminBuild = !EAT_adminBuild;
				[] execVM "admintools\tools\AdminMode\AdminFastBuild.sqf";
			};
			
		// Admin-mod mode toggle function
			EAT_AdminToggle =
			{
				if (EAT_speedBoost) then {[] execVM "admintools\tools\AdminMode\speedboost.sqf";};
				if (EAT_enhancedESP) then {[] execVM "admintools\tools\AdminMode\ESPenhanced.sqf";};
				if (EAT_playerESP) then {[] execVM "admintools\tools\AdminMode\ESPplayer.sqf";};
				if (EAT_invisibility) then {[] execVM "admintools\tools\AdminMode\Invisibility.sqf";};
				if (EAT_infAmmo) then {[] execVM "admintools\tools\AdminMode\InfiniteAmmo.sqf";};
				if (EAT_flying) then {[] execVM "admintools\tools\AdminMode\Flying.sqf";};
				if (EAT_playerGod) then {[] execVM "admintools\tools\AdminMode\GodModePlayer.sqf";};
				if (EAT_vehicleGod) then {[] execVM "admintools\tools\AdminMode\GodModeVehicle.sqf";};
				if (EAT_grassOff) then {[] execVM "admintools\tools\AdminMode\GrassOFF.sqf";};
				if (EAT_adminBuild) then {[] execVM "admintools\tools\AdminMode\AdminFastBuild.sqf";};
			};
	};

/**************** overwrite epoch public variables ****************/
	if(EAT_wtChanger)then{"dayzSetDate" addPublicVariableEventHandler {};};


// Required for permanent arma building spawn
{DayZ_SafeObjects = DayZ_SafeObjects + [_x select 2];}forEach EAT_allBuildingList;

// Used to detect the Overwatch Mod for crate spawning
EAT_isOverpoch = isClass (configFile >> "CfgWeapons" >> "USSR_cheytacM200");

diag_log("Admin Tools: variables.sqf loaded");

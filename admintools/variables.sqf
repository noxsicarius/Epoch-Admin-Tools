// Do not modify this file unless you know what you are doing

AdminList = AdminList + SuperAdminList; // add SuperAdmin to Admin
AdminAndModList = AdminList + ModList; // Add all admin/mod into one list for easy call

/***** Set variables *****/
tempList = []; // Initialize templist
helpQueue = []; // Initialize help queue

/*
	Determines default on or off for admin tools menu
	Set this to false if you want the menu to be off by default.
	F11 turns the tool off, F10 turns it on.
	Leave this as True for now, it is under construction.
*/
if (isNil "toolsAreActive") then {toolsAreActive = true;};


/****************** Server Public Variables ******************/
	if(isDedicated) then {
		"usageLogger" addPublicVariableEventHandler {
			"EATadminLogger" callExtension (_this select 1);
		};
		"useBroadcaster" addPublicVariableEventHandler {
			EAT_toClient = (_this select 1);
			{
				if ((getPlayerUID _x ) in SuperAdminList) then {
					(owner _x) publicVariableClient "EAT_toClient";
				};
			} forEach entities "CAManBase";
		};
		"EAT_baseExporter" addPublicVariableEventHandler {
			"EATbaseExporter" callExtension (_this select 1);
		};
		"EAT_teleportFixServer" addPublicVariableEventHandler{
			_array = (_this select 1);
			_addRemove = (_array select 0);

			if(_addRemove == "add") then {
				_array = _array - ["add"];
				tempList = tempList + _array;
			} else {
				_array = _array - ["remove"];
				tempList = tempList - _array;
			};
			EAT_teleportFixClient = tempList;
			{(owner _x) publicVariableClient "EAT_teleportFixClient";} forEach entities "CAManBase";
		};
		"EAT_SetDateServer" addPublicVariableEventHandler {
			EAT_setDateClient = (_this select 1);
			setDate EAT_setDateClient;
			{(owner _x) publicVariableClient "EAT_setDateClient";} forEach entities "CAManBase";
		};
		"EAT_SetOvercastServer" addPublicVariableEventHandler {
			EAT_setOvercastClient = (_this select 1);
			5 setOvercast EAT_setOvercastClient;
			{(owner _x) publicVariableClient "EAT_setOvercastClient";} forEach entities "CAManBase";
		};
		"EAT_SetFogServer" addPublicVariableEventHandler {
			EAT_setFogClient = (_this select 1);
			5 setFog EAT_setFogClient;
			{(owner _x) publicVariableClient "EAT_setFogClient";} forEach entities "CAManBase";
		};
		"EAT_contactAdminServer" addPublicVariableEventHandler {
			_array = (_this select 1);
			_addRemove = (_array select 0);

			if(_addRemove == "add") then {
				_array = _array - ["add"];
				helpQueue = helpQueue + _array;
			} else {
				_array = _array - ["remove"];
				helpQueue = helpQueue - _array;
			};
			EAT_contactAdminClient = helpQueue;
			{
				if ((getPlayerUID _x) in AdminAndModList) then {	//check if the clientID(uniqueID) is an admin|mod
					(owner _x) publicVariableClient "EAT_contactAdminClient";
				};
			} forEach entities "CAManBase";
		};
	};

/****************** Client Public Variables ******************/
	if ((getPlayerUID player) in SuperAdminList) then {
		"EAT_toClient" addPublicVariableEventHandler {
			systemChat (_this select 1);
		};
	};

	"EAT_teleportFixClient" addPublicVariableEventHandler {
		tempList = (_this select 1);
	};

	"EAT_SetDateClient" addPublicVariableEventHandler {
		setDate (_this select 1);
	};
	"EAT_setOvercastClient" addPublicVariableEventHandler {
		drn_fnc_DynamicWeather_SetWeatherLocal = {};
		5 setOvercast (_this select 1);
	};
	"EAT_setFogClient" addPublicVariableEventHandler {
		drn_fnc_DynamicWeather_SetWeatherLocal = {};
		5 setFog (_this select 1);
	};

	"EAT_contactAdminClient" addPublicVariableEventHandler {
		helpQueue = (_this select 1);
		if ((getPlayerUID player) in AdminAndModList) then {
			systemChat "****A player needs help****";
		};
	};


/******************* Buildings *******************/
	// This section defines all of the buildings in the building GUI
	// Format: variable = [["TYPE","NAME","BUILING_CLASS"],["TYPE","NAME","BUILING_CLASS"]];
	
	//Residential
		buildHouse = [["House","Yellow Modern","Land_sara_domek_zluty"],["House","Large Orange","Land_Housev2_02_Interier"],["House","Yellow Wood","land_housev_3i3"],["House","Burgundy","land_housev_1l2"],["House","Orange/Green","Land_HouseV_3I1"],["House","Damaged Brick","land_r_housev2_04"],["House","Orange/Red","Land_HouseV_1I1"],["House","Barn","Land_HouseV_3I4"],["House","Yellow","Land_HouseV_1T"],["House","Red Brick","Land_HouseV_2I"],["House","Wood","Land_HouseV_1I3"],["House","Green","Land_HouseV_1L1"],["House","Yellow Wood","Land_HouseV_1I2"],["House","Yellow Stone","Land_HouseV_2L"],["House","Green Wood","Land_HouseV_2T2"],["House","Green wood/concrete","Land_HouseV_3I2"],["House","Shanty","Land_MBG_Shanty_BIG"],["House","Middle-East 1","Land_House_C_11_EP1"],["House","Middle-East 2","Land_House_C_12_EP1"],["House","Old Stone 1","Land_House_K_1_EP1"],["House","Old Stone 2","Land_House_K_3_EP1"],["House","Old Stone 3","Land_House_K_5_EP1"],["House","Old Stone 4","Land_House_K_7_EP1"],["House","Old Stone 5","Land_House_K_8_EP1"],["House","Old Stone 6","Land_House_L_1_EP1"],["House","Old Stone 7","Land_House_L_3_EP1"],["House","Old Stone 8","Land_House_L_4_EP1"],["House","Old Stone 9","Land_House_L_6_EP1"],["House","Old Stone 10","Land_House_L_7_EP1"],["House","Old Stone 11","Land_House_L_8_EP1"],["House","Old Stone Ruins","Land_ruin_01"]];
		buildHouseBlock = [["House Block","A1","Land_HouseBlock_A1"],["House Block","A1","Land_HouseBlock_A1"],["House Block","A1_2","Land_HouseBlock_A1_2"],["House Block","A2","Land_HouseBlock_A2"],["House Block","A2_1","Land_HouseBlock_A2_1"],["House Block","A3","Land_HouseBlock_A3"],["House Block","B1","Land_HouseBlock_B1"],["House Block","B2","Land_HouseBlock_B2"],["House Block","B3","Land_HouseBlock_B3"],["House Block","B4","Land_HouseBlock_B4"],["House Block","B5","Land_HouseBlock_B5"],["House Block","B6","Land_HouseBlock_B6"],["House Block","C1","Land_HouseBlock_C1"],["House Block","C2","Land_HouseBlock_C2"],["House Block","C3","Land_HouseBlock_C3"],["House Block","C4","Land_HouseBlock_C4"],["House Block","C5","Land_HouseBlock_C5"]];
		buildApartment = [["Apartment","B","Land_MBG_ApartmentsTwo_B"],["Apartment","G","Land_MBG_ApartmentsTwo_G"],["Apartment","P","Land_MBG_ApartmentsTwo_P"],["Apartment","W","Land_MBG_ApartmentsOne_W"],["Apartment","Large","land_mbg_apartments_big_04"],["Apartment","Red Short","Land_Panelak"],["Apartment","Red Tall","Land_Panelak2"],["Apartment","Red Very Tall","Land_Panelak3"],["Apartment","Grey (closed)","Land_A_Office02"]];
		buildOffice = [["Office","International Hotel","Land_HouseB_Tenement"],["Office","Municipal Office","Land_A_MunicipalOffice"],["School","School (normal)","Land_A_Office01"]];
		buildShed = [["Shed","Nice Wood (open)","Land_Shed_Wooden"],["Shed","Rickety Wood (closed)","Land_kulna"],["Shed","Large Old Wood (closed)","Land_Shed_W4"],["Shed","Patchwork wood (closed)","Land_Shed_W03"],["Shed","Grey Wood (closed)","Land_Shed_W02"],["Shed","Old Metal (closed)","Land_Shed_m03"]];
		buildResidentMisc = [["Hospital","Hospital (normal)","land_a_hospital"],["Store","Pub","Land_A_Pub_01"],["Store","Supermarket 1","Land_A_GeneralStore_01"],["Store","Supermarket 2","Land_A_GeneralStore_01a"]];
		buildResidential = buildHouse + buildHouseBlock + buildApartment + buildOffice + buildShed + buildResidentMisc;

	//Industrial
		buildCargo = [["Cargo","1 Closed Red Crate","Land_Misc_Cargo1Bo"],["Cargo","2 Closed Red Crates","Land_Misc_Cargo2D"],["Cargo","1 Open Cargo Crate","Land_Misc_Cargo1D"],["Cargo","Military Crate","US_WarfareBVehicleServicePoint_Base_EP1"]];
		buildIndustrialParts = [["Metal","Overhang","Land_Ind_Shed_02_main"],["Metal","Arch","Land_Ind_Shed_01_end"],["Station","Vehicle Ceckpoint","Land_Hlidac_budka"]];
		buildIndustrial = buildCargo + buildIndustrialParts;
	
	//Military
		buildMilitary = [["Barracks","L-Barracks","Land_Mil_Barracks_L"],["Depot","Warfare Depot","WarfareBDepot"],["Hospital","Field Hospital","INS_WarfareBFieldhHospital"]];
	
	//Religious
		buildReligious = [["Church","Orange","Land_Church_01"],["Church","Open","Land_Church_03"],["Church","Closed","Land_Church_02"],["Church","Destroyed","Land_Church_05R"],["Mosque","Small","Land_A_Mosque_small_2_EP1"],["Mosque","Medium","Land_A_Mosque_small_1_EP1"],["Mosque","Large","Land_A_Mosque_big_hq_EP1"],["Mosque","Addon","Land_A_Mosque_big_addon_EP1"],["Mosque","Wall","Land_A_Mosque_big_wall_EP1"]];

	//Graves
		buildGrave = [["Grave","Grave (normal)","Grave"],["Grave","Cross 1","GraveCross1"],["Grave","Cross 2","GraveCross2"],["Grave","Cross /w Helmet","GraveCrossHelmet"],["Grave","Mass Grave","Mass_grave_DZ"]];
		
	//Castle
		buildCastle = [["Castle","Gate","Land_A_Castle_Gate"],["Castle","Tower","Land_A_Castle_Bergfrit"],["Castle","Stairs","Land_A_Castle_Stairs_A"]];
		
	//Ore
		buildOre = [["Ore","Gold","Gold_Vein_DZE"],["Ore","Silver","Silver_Vein_DZE"],["Ore","Iron","Iron_Vein_DZE"]];
		
	//Roads
		buildRoad = [[]];

	//Other
		buildMarker = [["Marker","Archway","Sign_circle_EP1"]];
		buildSand = [["Sandbag","Nest (BIG)","Land_fortified_nest_big"],["Sandbag","2 Story cubes /w Net","Land_Fort_Watchtower"]];
		buildRamp = [["Ramp","Concrete Tall","Land_ConcreteRamp"],["Ramp","Concrete Short","RampConcrete"],["Ramp","Wood Small","Land_WoodenRamp"]];
		buildMisc = [["Statue","Soldiers /w Flag","Land_A_statue01"],["Statue","Tank","Land_A_statue02"],["Misc","Archway","Land_brana02nodoor"]];
		buildOutdoors = [["Outdoors","Outhouse","Land_KBud"]];
		buildOther =  buildOutdoors + buildMisc + buildRamp + buildSand + buildMarker;

	
	allBuildingList = buildResidential + buildIndustrial + buildMilitary + buildReligious + buildGrave + buildCastle + buildOre + buildOther;


/**************************** Functions ****************************/

	fnc_actionAllowed = {
		private["_player","_vehicle","_inVehicle","_onLadder","_canDo"];
		_player = player; //Setting a local variable as player saves resources
		_vehicle = vehicle _player;
		_inVehicle = (_vehicle != _player);
		_onLadder =	(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState _player) >> "onLadder")) == 1;
		_canDo = (!r_drag_sqf && !r_player_unconscious && !_onLadder && !_inVehicle);

	_canDo
	};

// overwrite epoch public variables
//"PVDZE_plr_SetDate" addPublicVariableEventHandler {};

// Show the admin list has loaded
adminListLoaded = true;
diag_log("Admin Tools: variables.sqf loaded");

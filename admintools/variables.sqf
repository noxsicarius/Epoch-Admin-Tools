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
		drn_fnc_DynamicWeather_SetWeatherLocal = {};
		setDate (_this select 1);
	};
	
	// Broadcast weather to clients
	"EAT_PVEH_SetOvercast" addPublicVariableEventHandler {
		drn_fnc_DynamicWeather_SetWeatherLocal = {};
		5 setOvercast (_this select 1);
	};
	
	// Broadcast fog to clients
	"EAT_PVEH_SetFog" addPublicVariableEventHandler {
		drn_fnc_DynamicWeather_SetWeatherLocal = {};
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
		EAT_buildMilitary = [["Barracks","L-Barracks","Land_Mil_Barracks_L"],["Depot","Warfare Depot","WarfareBDepot"],["Hospital","Field Hospital","INS_WarfareBFieldhHospital"]];
	
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


	
/******************* Crates *******************/
	// This section has the items in each crate
	// Format: variable = [["ITEM",AMOUNT],["ITEM",AMOUNT],......];

	// Backpack crate
	EAT_backpackCrateContents = [["DZ_Backpack_EP1", 1],["DZ_British_ACU", 1],["DZ_CivilBackpack_EP1", 1],["DZ_CompactPack_EP1", 1],["DZ_GunBag_EP1", 1],["DZ_LargeGunBag_EP1", 1],["DZ_TK_Assault_Pack_EP1", 1]];

	// Items Crate
	_bloodBag = "ItemBloodbag";
	if(dayz_classicBloodBagSystem) then {_bloodBag = "bloodBagONEG";};
	EAT_itemCrateWeapons = [["Binocular", 5],["Binocular_Vector", 5],["ItemCompass", 5],["ItemCrowbar", 5],["ItemEtool", 5],["ItemFishingPole", 5],["ItemFlashlight", 5],["ItemFlashlightRed", 5],["ItemGPS", 5],["ItemHatchet", 5],["ItemKeyKit", 5],["ItemKnife", 5],["ItemMap", 5],["ItemMatchBox", 5],["ItemRadio", 5],["ItemSledge", 5],["ItemToolbox", 5],["ItemWatch", 5],["Laserdesignator", 5],["NVGoggles", 5]];
	EAT_itemCrateMagazines = [["FoodSteakCooked", 10],["HandChemBlue", 10],["HandChemGreen", 10],["HandChemRed", 10],["HandRoadFlare", 10],["ItemAntibiotic", 10],["ItemBandage", 10],[_bloodBag, 10],["ItemBriefcase100oz", 10],["ItemBriefcaseEmpty", 10],["ItemCopperBar", 10],["ItemCopperBar10oz", 10],["ItemEpinephrine", 10],["ItemFuelBarrel", 10],["ItemGoldBar", 10],["ItemGoldBar10oz", 10],["ItemHeatPack", 10],["ItemJerrycan", 10],["ItemMorphine", 10],["ItemOilBarrel", 10],["ItemPainkiller", 10],["ItemSilverBar", 10],["ItemSilverBar10oz", 10],["ItemSodaMdew", 10],["PartEngine", 10],["PartFueltank", 10],["PartGeneric", 10],["PartGlass", 10],["PartVRotor", 10],["PartWheel", 10],["Skin_Bandit1_DZ", 10],["Skin_Bandit2_DZ", 10],["Skin_BanditW1_DZ", 10],["Skin_BanditW2_DZ", 10],["Skin_CZ_Soldier_Sniper_EP1_DZ", 10],["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", 10],["Skin_Drake_Light_DZ", 10],["Skin_FR_OHara_DZ", 10],["Skin_FR_Rodriguez_DZ", 10],["Skin_Functionary1_EP1_DZ", 10],["Skin_Graves_Light_DZ", 10],["Skin_GUE_Commander_DZ", 10],["Skin_GUE_Soldier_2_DZ", 10],["Skin_GUE_Soldier_CO_DZ", 10],["Skin_GUE_Soldier_Crew_DZ", 10],["Skin_GUE_Soldier_MG_DZ", 10],["Skin_GUE_Soldier_Sniper_DZ", 10],["Skin_Haris_Press_EP1_DZ", 10],["Skin_Ins_Soldier_GL_DZ", 10],["Skin_Pilot_EP1_DZ", 10],["Skin_Priest_DZ", 10],["Skin_Rocker1_DZ", 10],["Skin_Rocker2_DZ", 10],["Skin_Rocker3_DZ", 10],["Skin_Rocker4_DZ", 10],["Skin_Rocket_DZ", 10],["Skin_RU_Policeman_DZ", 10],["Skin_Sniper1_DZ", 10],["Skin_Soldier_Bodyguard_AA12_PMC_DZ", 10],["Skin_Soldier_Sniper_PMC_DZ", 10],["Skin_Soldier_TL_PMC_DZ", 10],["Skin_SurvivorW2_DZ", 10],["Skin_SurvivorW3_DZ", 10],["Skin_SurvivorWcombat_DZ", 10],["Skin_SurvivorWdesert_DZ", 10],["Skin_SurvivorWpink_DZ", 10],["Skin_SurvivorWsequishaD_DZ", 10],["Skin_SurvivorWsequisha_DZ", 10],["Skin_TK_INS_Soldier_EP1_DZ", 10],["Skin_TK_INS_Warlord_EP1_DZ", 10],["TrapBear", 10],["TrashJackDaniels", 10],["TrashTinCan", 10]];

	// Building Crate
	EAT_buildingCrateWeapons = [["ItemCrowbar", 5],["ItemEtool", 5],["ItemHatchet", 5],["ItemMatchBox", 5],["ItemSledge", 5],["ItemToolbox", 5]];
	EAT_buildingCrateMagazines = [["plot_pole_kit", 10],["bulk_empty", 10],["bulk_ItemTankTrap", 20],["bulk_ItemWire",  10],["CinderBlocks", 30],["cinder_door_kit", 10],["cinder_garage_kit", 10],["cinder_wall_kit", 60],["deer_stand_kit", 10],["desert_large_net_kit", 10],["desert_net_kit", 10],["forest_large_net_kit", 10],["forest_net_kit", 10],["fuel_pump_kit", 10],["ItemBurlap", 10],["ItemCanvas", 10],["ItemComboLock", 10],["ItemCorrugated", 10],["ItemFireBarrel_Kit", 10],["ItemFuelBarrelEmpty", 10],["ItemGenerator", 10],["ItemGunRackKit", 10],["ItemHotwireKit", 10],["ItemJerrycan", 10],["ItemLockbox", 10],["ItemPole", 10],["ItemSandbag", 50],["ItemSandbagExLarge", 20],["ItemSandbagExLarge5x", 20],["ItemSandbagLarge", 20],["ItemScaffoldingKit", 10],["BagFenceRound_DZ_kit",20],["ItemTankTrap", 10],["ItemTent", 5],["ItemDesertTent", 5],["ItemVault", 10],["ItemWire", 10],["ItemWoodFloor", 30],["ItemWoodFloorHalf", 30],["ItemWoodFloorQuarter", 30],["ItemWoodLadder", 30],["ItemWoodStairs", 10],["ItemWoodStairsSupport", 10],["ItemWoodWall", 30],["ItemWoodWallDoor", 10],["ItemWoodWallDoorLg", 10],["ItemWoodWallGarageDoor", 10],["ItemWoodWallGarageDoorLocked", 10],["ItemWoodWallLg", 30],["ItemWoodWallThird", 20],["ItemWoodWallWindow", 20],["ItemWoodWallWindowLg", 30],["ItemWoodWallWithDoor", 10],["ItemWoodWallwithDoorLg", 10],["ItemWoodWallWithDoorLgLocked", 10],["ItemWoodWallWithDoorLocked", 10],["light_pole_kit", 10],["m240_nest_kit", 5],["metal_floor_kit", 60],["metal_panel_kit", 20],["MortarBucket", 5],["outhouse_kit", 5],["park_bench_kit", 5],["PartGeneric", 30],["PartPlankPack", 30],["PartPlywoodPack", 30],["PartWoodLumber", 30],["PartWoodPile", 30],["PartWoodPlywood", 30],["rusty_gate_kit", 5],["sandbag_nest_kit", 30],["stick_fence_kit", 5],["storage_shed_kit", 10],["sun_shade_kit", 10],["wooden_shed_kit", 10],["wood_ramp_kit", 10],["wood_shack_kit", 10],["workbench_kit", 5]];

	// Weapons Crate
	EAT_weaponCrateWeapons = [["AK_107_GL_Kobra", 5],["AK_107_GL_PSO", 5],["AK_107_Kobra", 5],["AK_107_PSO", 5],["AKM_DZ", 5],["AK_47_S", 5],["AK74_DZ", 5],["AK_74_GL", 5],["AK_74_GL_Kobra", 5],["AKS_74", 5],["AK74_Kobra_DZ", 5],["AKS_74_PSO", 5],["AKS74U_DZ", 5],["AKS_74_UN_Kobra", 5],["AKS_GOLD", 5],["BAF_AS50_scoped_DZ", 5],["BAF_AS50_TWS", 5],["BAF_L110A1_Aim", 5],["BAF_L7A2_GPMG", 5],["BAF_L85A2_RIS_ACOG", 5],["BAF_L85A2_RIS_CWS", 5],["L85_Holo_DZ", 5],["BAF_L85A2_RIS_SUSAT", 5],["BAF_L85A2_UGL_ACOG", 5],["BAF_L85A2_UGL_Holo", 5],["BAF_L85A2_UGL_SUSAT", 5],["BAF_L86A2_ACOG", 5],["BAF_LRR_scoped", 5],["BAF_LRR_scoped_W", 5],["Bizon_DZ", 5],["Bizon_SD_DZ", 5],["M1911_DZ", 5],["Crossbow_DZ", 5],["DMR_DZ", 5],["G36_C_SD_camo", 5],["G36_C_SD_eotech", 5],["G36a", 5],["G36A_Camo_DZ", 5],["G36C_DZ", 5],["G36C_camo", 5],["G36K", 5],["G36K_Camo_DZ", 5],["FNFAL_DZ", 5],["FN_FAL_ANPVS4_DZE", 5],["G17_FL_DZ", 5],["CZ550_DZ", 5],["ksvk", 5],["LeeEnfield_DZ", 5],["M1014_DZ", 5],["m107_DZ", 5],["m107_TWS_EP1_DZ", 5],["M14_CCO_DZ", 5],["M16A2_DZ", 5],["M16A2_GL_DZ", 5],["m16a4", 5],["M16A4_ACOG_DZ", 5],["M16A4_ACG_GL", 5],["M16A4_GL", 5],["M24_DZ", 5],["M24_des_EP1", 5],["M240_DZ", 5],["m240_scoped_EP1_DZE", 5],["M249_DZ", 5],["M249_DZ", 5],["M249_m145_EP1_DZE", 5],["M40A3_Gh_DZ", 5],["M4A1_DZ", 5],["M4A1_CCO_DZ", 5],["M4A1_Aim_camo", 5],["M4A1_AIM_SD_camo", 5],["M4A1_HWS_GL", 5],["M4A1_HWS_GL_camo", 5],["M4A1_HWS_GL_SD_Camo", 5],["M4A1_RCO_GL", 5],["M4A3_CCO_EP1", 5],["M4A3_RCO_GL_EP1", 5],["M4SPR", 5],["M60A4_EP1_DZE", 5],["M9_DZ", 5],["M9_SD_DZ", 5],["Makarov_DZ", 5],["Makarov_SD_DZ", 5],["MeleeHatchet", 5],["MeleeCrowbar", 5],["MG36", 5],["Mk48_CCO_DZ", 5],["MP5_DZ", 5],["MP5_SD_DZ", 5],["MR43_DZ", 5],["Pecheneg_DZ", 5],["PK", 5],["Remington870_FL_DZ", 5],["Revolver_DZ", 5],["revolver_gold_EP1", 5],["RPK74_DZ", 5],["Sa61_EP1", 5],["Saiga12K", 5],["SVD_DZ", 5],["SVD_Gh_DZ", 5],["SVD_des_EP1", 5],["SVD_NSPU_EP1", 5],["PDW_DZ", 5],["UZI_SD_EP1", 5],["Winchester1866_DZ", 5],["PKM_DZ",5],["SA58_DZ",5],["Sa58V_RCO_EP1", 5],["RPG7V", 5],["ItemMachete", 5]];
	EAT_weaponCrateMagazines = [["2Rnd_shotgun_74Slug", 20],["2Rnd_shotgun_74Pellets", 20],["5Rnd_127x108_KSVK", 20],["5Rnd_127x99_as50", 20],["5Rnd_762x51_M24", 20],["5Rnd_86x70_L115A1", 20],["5x_22_LR_17_HMR", 20],["6Rnd_45ACP", 20],["7Rnd_45ACP_1911", 20],["8Rnd_9x18_Makarov", 20],["8Rnd_9x18_MakarovSD", 20],["8Rnd_B_Beneli_74Slug", 20],["8Rnd_B_Beneli_Pellets", 20],["8Rnd_B_Saiga12_74Slug", 20],["8Rnd_B_Saiga12_Pellets", 20],["10Rnd_127x99_M107", 20],["10Rnd_762x54_SVD", 20],["10x_303", 20],["15Rnd_9x19_M9", 20],["15Rnd_9x19_M9SD", 20],["15Rnd_W1866_Slug", 20],["15Rnd_W1866_Pellet", 20],["17Rnd_9x19_glock17", 20],["20Rnd_556x45_Stanag", 20],["20Rnd_762x51_DMR", 20],["20Rnd_762x51_FNFAL", 20],["20Rnd_B_765x17_Ball", 20],["30Rnd_545x39_AK", 20],["30Rnd_545x39_AKSD", 20],["30Rnd_556x45_G36", 20],["30Rnd_556x45_G36SD", 20],["30Rnd_556x45_Stanag", 20],["30Rnd_556x45_StanagSD", 20],["30Rnd_762x39_AK47", 20],["30Rnd_9x19_MP5", 20],["30Rnd_9x19_MP5SD", 20],["30Rnd_9x19_UZI", 20],["30Rnd_9x19_UZI_SD", 20],["50Rnd_127x108_KORD", 20],["64Rnd_9x19_Bizon", 20],["64Rnd_9x19_SD_Bizon", 20],["75Rnd_545x39_RPK", 20],["100Rnd_762x51_M240", 20],["100Rnd_762x54_PK", 20],["100Rnd_556x45_BetaCMag", 20],["100Rnd_556x45_M249", 20],["200Rnd_556x45_L110A1", 20],["200Rnd_556x45_M249", 20],["BoltSteel", 20],["PG7V", 20],["1Rnd_HE_M203", 20],["HandGrenade_west", 20],["SmokeShell", 20],["SmokeShellGreen", 20],["SmokeShellRed", 20],["PipeBomb", 20]];

	
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

diag_log("Admin Tools: variables.sqf loaded");
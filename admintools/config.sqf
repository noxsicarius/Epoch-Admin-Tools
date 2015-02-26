
/************** Epoch Admin Tools Variables **************/

//Replace 111111111 with your ID. 
SuperAdminList = [
"111111111", // <Your In-Game Name here>
"999999999" // <S-Admin In-Game Name>
];
AdminList = [
"999999999", // <Admin In-Game Name>
"999999999" // <Admin In-Game Name>
];
ModList = [
"999999999", // <Moderator In-Game Name>
"999999999" // <Moderator In-Game Name>
];


/************** Action Menu Variables **************/

	/*
		Give players an actions menu? (dance, deploy bike/mozzie, flip car)
		Default: true
	*/
	ActionMenuPlayers = true;

	/*
		Give admins the same action menu above? (not really needed unless you are a playing admin)
		Default: false
	*/
	ActionMenuAdmins = false;


	/****** Bike variables ******/

	//Allow player to build a bike?
	AllowBuildBike = true;

	// This option requires players to have a toolbox to build a bike (consumes the toolbox)
	RequireToolBoxBike = true;

	// This option requires players to have the parts for building a bike (consumes the parts)
	// Required parts: two wheels, one scrap metal
	RequirePartsBike = false;

	// This option dictates if players are allowed to repack a bike to get their items back
	AllowPackBike = true;


	/****** Mozzie variables ******/

	//Allow player to build a Mozzie?
	AllowBuildMozzie = true;

	// This option requires players to have a toolbox to build a Mozzie (consumes the toolbox)
	RequireToolBoxMozzie = false;

	// This option requires players to have the parts for building a Mozzie (consumes the parts)
	// Required parts: main rotor, two scrap, one engine, one jerry can (full)
	RequirePartsMozzie = true;

	// This option dictates if players are allowed to repack a mozzie to get their items back
	AllowPackMozzie = true;


	/****** Misc ******/
		
	// Allow players to flip their vehicles rightside up
	AllowFlipVehicle = true;
		
	// Allow players to commit suicide
	AllowSuicide = true;
		
	// Allow players to use the movement menu (dance)
	AllowMovementMenu = true;

	/* 
		Allow players to open a help ticket with the admins.
		The help queue can be viewed via the admin menu.
		The player can NOT spam the admins.
	*/
	AllowContactAdmin = true;

		/*
			Stops spamming of the contact admin. If it is enabled and a user contacts an admin
			the given number of times they will get a white screen for blindTime seconds and 
			the contact feature will be disabled
		*/
		enableAntiSpam = true;
		antiSpamLimit = 15; // default 15 contacts
		blindTime = 30; // default 30 seconds



/*
	Broadcasts a message to the super admins when the admin tools are used.
	Default: false
*/
broadcastToolUse = false;


/*
	Log admin tool usage by your admins?
	This creates a log in your server\EpochAdminToolLogs\toolUsageLog.txt
	You MUST have the EpochAdminToolsUsageLogger.dll in the root server
	directory or this will not work. The tool will still work either way.
	This is divided into two categories.
*/
	/*
		A major tool is a strong tool with high possibility for exploiting:
		Teleport, god mode, ESP, infinite ammo, invisibility, crate spawns, 
		unlocking items, displaying lock codes...
		Default: true
	*/
	logMajorTool = true;

	/*
		A minor tool is a weak tool with low possibility for exploiting:
		grass off, skin change, weapon kits, flying, maintain area, admin build
		Default: true
	*/
	logMinorTool = true;

	
	
	
/******************* Crates *******************/
	// This section has the items in each crate
	// Format: variable = [["ITEM",AMOUNT],["ITEM",AMOUNT],......];

	// Backpack crate
	backpackCrateContents = [["DZ_Backpack_EP1", 1],["DZ_British_ACU", 1],["DZ_CivilBackpack_EP1", 1],["DZ_CompactPack_EP1", 1],["DZ_GunBag_EP1", 1],["DZ_LargeGunBag_EP1", 1],["DZ_TK_Assault_Pack_EP1", 1]];

	// Items Crate
	itemCrateWeapons = [["Binocular", 5],["Binocular_Vector", 5],["ItemCompass", 5],["ItemCrowbar", 5],["ItemEtool", 5],["ItemFishingPole", 5],["ItemFlashlight", 5],["ItemFlashlightRed", 5],["ItemGPS", 5],["ItemHatchet_DZE", 5],["ItemKeyKit", 5],["ItemKnife", 5],["ItemMap", 5],["ItemMatchbox_DZE", 5],["ItemRadio", 5],["ItemSledge", 5],["ItemToolbox", 5],["ItemWatch", 5],["Laserdesignator", 5],["NVGoggles", 5]];
	itemCrateMagazines = [["FoodSteakCooked", 10],["HandChemBlue", 10],["HandChemGreen", 10],["HandChemRed", 10],["HandRoadFlare", 10],["ItemAntibiotic", 10],["ItemBandage", 10],["ItemBloodbag", 10],["ItemBriefcase100oz", 10],["ItemBriefcaseEmpty", 10],["ItemCopperBar", 10],["ItemCopperBar10oz", 10],["ItemEpinephrine", 10],["ItemFuelBarrel", 10],["ItemGoldBar", 10],["ItemGoldBar10oz", 10],["ItemHeatPack", 10],["ItemJerrycan", 10],["ItemMorphine", 10],["ItemOilBarrel", 10],["ItemPainkiller", 10],["ItemSilverBar", 10],["ItemSilverBar10oz", 10],["ItemSodaMdew", 10],["PartEngine", 10],["PartFueltank", 10],["PartGeneric", 10],["PartGlass", 10],["PartVRotor", 10],["PartWheel", 10],["Skin_Bandit1_DZ", 10],["Skin_Bandit2_DZ", 10],["Skin_BanditW1_DZ", 10],["Skin_BanditW2_DZ", 10],["Skin_CZ_Soldier_Sniper_EP1_DZ", 10],["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", 10],["Skin_Drake_Light_DZ", 10],["Skin_FR_OHara_DZ", 10],["Skin_FR_Rodriguez_DZ", 10],["Skin_Functionary1_EP1_DZ", 10],["Skin_Graves_Light_DZ", 10],["Skin_GUE_Commander_DZ", 10],["Skin_GUE_Soldier_2_DZ", 10],["Skin_GUE_Soldier_CO_DZ", 10],["Skin_GUE_Soldier_Crew_DZ", 10],["Skin_GUE_Soldier_MG_DZ", 10],["Skin_GUE_Soldier_Sniper_DZ", 10],["Skin_Haris_Press_EP1_DZ", 10],["Skin_Ins_Soldier_GL_DZ", 10],["Skin_Pilot_EP1_DZ", 10],["Skin_Priest_DZ", 10],["Skin_Rocker1_DZ", 10],["Skin_Rocker2_DZ", 10],["Skin_Rocker3_DZ", 10],["Skin_Rocker4_DZ", 10],["Skin_Rocket_DZ", 10],["Skin_RU_Policeman_DZ", 10],["Skin_Sniper1_DZ", 10],["Skin_Soldier_Bodyguard_AA12_PMC_DZ", 10],["Skin_Soldier_Sniper_PMC_DZ", 10],["Skin_Soldier_TL_PMC_DZ", 10],["Skin_SurvivorW2_DZ", 10],["Skin_SurvivorW3_DZ", 10],["Skin_SurvivorWcombat_DZ", 10],["Skin_SurvivorWdesert_DZ", 10],["Skin_SurvivorWpink_DZ", 10],["Skin_SurvivorWsequishaD_DZ", 10],["Skin_SurvivorWsequisha_DZ", 10],["Skin_TK_INS_Soldier_EP1_DZ", 10],["Skin_TK_INS_Warlord_EP1_DZ", 10],["TrapBear", 10],["TrashJackDaniels", 10],["TrashTinCan", 10]];

	// Building Crate
	buildingCrateWeapons = [["ItemCrowbar", 5],["ItemEtool", 5],["ItemHatchet_DZE", 5],["ItemMatchbox_DZE", 5],["ItemSledge", 5],["ItemToolbox", 5]];
	buildingCrateMagazines = [["30m_plot_kit", 10],["bulk_empty", 10],["bulk_ItemTankTrap", 20],["bulk_ItemWire",  10],["CinderBlocks", 30],["cinder_door_kit", 10],["cinder_garage_kit", 10],["cinder_wall_kit", 60],["deer_stand_kit", 10],["desert_large_net_kit", 10],["desert_net_kit", 10],["forest_large_net_kit", 10],["forest_net_kit", 10],["fuel_pump_kit", 10],["ItemBurlap", 10],["ItemCanvas", 10],["ItemComboLock", 10],["ItemCorrugated", 10],["ItemFireBarrel_Kit", 10],["ItemFuelBarrelEmpty", 10],["ItemGenerator", 10],["ItemGunRackKit", 10],["ItemHotwireKit", 10],["ItemJerrycan", 10],["ItemLockbox", 10],["ItemPole", 10],["ItemSandbag", 50],["ItemSandbagExLarge", 20],["ItemSandbagExLarge5x", 20],["ItemSandbagLarge", 20],["ItemScaffoldingKit", 10],["BagFenceRound_DZ_kit",20],["ItemTankTrap", 10],["ItemTent", 5],["ItemTentDomed", 5],["ItemTentDomed2", 5],["ItemTentOld", 5],["ItemVault", 10],["ItemWire", 10],["ItemWoodFloor", 30],["ItemWoodFloorHalf", 30],["ItemWoodFloorQuarter", 30],["ItemWoodLadder", 30],["ItemWoodStairs", 10],["ItemWoodStairsSupport", 10],["ItemWoodWall", 30],["ItemWoodWallDoor", 10],["ItemWoodWallDoorLg", 10],["ItemWoodWallGarageDoor", 10],["ItemWoodWallGarageDoorLocked", 10],["ItemWoodWallLg", 30],["ItemWoodWallThird", 20],["ItemWoodWallWindow", 20],["ItemWoodWallWindowLg", 30],["ItemWoodWallWithDoor", 10],["ItemWoodWallwithDoorLg", 10],["ItemWoodWallWithDoorLgLocked", 10],["ItemWoodWallWithDoorLocked", 10],["light_pole_kit", 10],["m240_nest_kit", 5],["metal_floor_kit", 60],["metal_panel_kit", 20],["MortarBucket", 5],["outhouse_kit", 5],["park_bench_kit", 5],["PartGeneric", 30],["PartPlankPack", 30],["PartPlywoodPack", 30],["PartWoodLumber", 30],["PartWoodPile", 30],["PartWoodPlywood", 30],["rusty_gate_kit", 5],["sandbag_nest_kit", 30],["stick_fence_kit", 5],["storage_shed_kit", 10],["sun_shade_kit", 10],["wooden_shed_kit", 10],["wood_ramp_kit", 10],["wood_shack_kit", 10],["workbench_kit", 5]];

	// Weapons Crate
	weaponCrateWeapons = [["AK_107_GL_Kobra", 5],["AK_107_GL_PSO", 5],["AK_107_Kobra", 5],["AK_107_PSO", 5],["AK_47_M", 5],["AK_47_S", 5],["AK_74", 5],["AK_74_GL", 5],["AK_74_GL_Kobra", 5],["AKS_74", 5],["AKS_74_Kobra", 5],["AKS_74_PSO", 5],["AKS_74_U", 5],["AKS_74_UN_Kobra", 5],["AKS_GOLD", 5],["BAF_AS50_scoped_DZ", 5],["BAF_AS50_TWS", 5],["BAF_L110A1_Aim", 5],["BAF_L7A2_GPMG", 5],["BAF_L85A2_RIS_ACOG", 5],["BAF_L85A2_RIS_CWS", 5],["BAF_L85A2_RIS_Holo", 5],["BAF_L85A2_RIS_SUSAT", 5],["BAF_L85A2_UGL_ACOG", 5],["BAF_L85A2_UGL_Holo", 5],["BAF_L85A2_UGL_SUSAT", 5],["BAF_L86A2_ACOG", 5],["BAF_LRR_scoped", 5],["BAF_LRR_scoped_W", 5],["bizon", 5],["bizon_silenced", 5],["Colt1911", 5],["Crossbow_DZ", 5],["DMR_DZ", 5],["G36_C_SD_camo", 5],["G36_C_SD_eotech", 5],["G36a", 5],["G36A_camo", 5],["G36C", 5],["G36C_camo", 5],["G36K", 5],["G36K_camo", 5],["FN_FAL", 5],["FN_FAL_ANPVS4", 5],["glock17_EP1", 5],["Huntingrifle", 5],["ksvk", 5],["LeeEnfield", 5],["M1014", 5],["m107_DZ", 5],["m107_TWS_EP1_DZ", 5],["M14_EP1", 5],["M16A2", 5],["M16A2GL", 5],["m16a4", 5],["m16a4_acg", 5],["M16A4_ACG_GL", 5],["M16A4_GL", 5],["M24", 5],["M24_des_EP1", 5],["M240_DZ", 5],["m240_scoped_EP1_DZE", 5],["M249_DZ", 5],["M249_EP1_DZ", 5],["M249_m145_EP1_DZE", 5],["M40A3", 5],["M4A1", 5],["M4A1_Aim", 5],["M4A1_Aim_camo", 5],["M4A1_AIM_SD_camo", 5],["M4A1_HWS_GL", 5],["M4A1_HWS_GL_camo", 5],["M4A1_HWS_GL_SD_Camo", 5],["M4A1_RCO_GL", 5],["M4A3_CCO_EP1", 5],["M4A3_RCO_GL_EP1", 5],["M4SPR", 5],["M60A4_EP1_DZE", 5],["M9", 5],["M9SD", 5],["Makarov", 5],["MakarovSD", 5],["MeleeHatchet", 5],["MeleeCrowbar", 5],["MG36", 5],["Mk_48_DES_EP1", 5],["Mk_48_DZ", 5],["MP5A5", 5],["MP5SD", 5],["MR43", 5],["Pecheneg_DZ", 5],["PK", 5],["Remington870_lamp", 5],["revolver_EP1", 5],["revolver_gold_EP1", 5],["RPK_74", 5],["Sa61_EP1", 5],["Saiga12K", 5],["SVD", 5],["SVD_CAMO", 5],["SVD_des_EP1", 5],["SVD_NSPU_EP1", 5],["UZI_EP1", 5],["UZI_SD_EP1", 5],["Winchester1866", 5],["Sa58V_RCO_EP1", 5],["RPG7V", 5],["ItemMachete", 5]];
	weaponCrateMagazines = [["2Rnd_shotgun_74Slug", 20],["2Rnd_shotgun_74Pellets", 20],["5Rnd_127x108_KSVK", 20],["5Rnd_127x99_as50", 20],["5Rnd_762x51_M24", 20],["5Rnd_86x70_L115A1", 20],["5x_22_LR_17_HMR", 20],["6Rnd_45ACP", 20],["7Rnd_45ACP_1911", 20],["8Rnd_9x18_Makarov", 20],["8Rnd_9x18_MakarovSD", 20],["8Rnd_B_Beneli_74Slug", 20],["8Rnd_B_Beneli_Pellets", 20],["8Rnd_B_Saiga12_74Slug", 20],["8Rnd_B_Saiga12_Pellets", 20],["10Rnd_127x99_M107", 20],["10Rnd_762x54_SVD", 20],["10x_303", 20],["15Rnd_9x19_M9", 20],["15Rnd_9x19_M9SD", 20],["15Rnd_W1866_Slug", 20],["15Rnd_W1866_Pellet", 20],["17Rnd_9x19_glock17", 20],["20Rnd_556x45_Stanag", 20],["20Rnd_762x51_DMR", 20],["20Rnd_762x51_FNFAL", 20],["20Rnd_B_765x17_Ball", 20],["30Rnd_545x39_AK", 20],["30Rnd_545x39_AKSD", 20],["30Rnd_556x45_G36", 20],["30Rnd_556x45_G36SD", 20],["30Rnd_556x45_Stanag", 20],["30Rnd_556x45_StanagSD", 20],["30Rnd_762x39_AK47", 20],["30Rnd_9x19_MP5", 20],["30Rnd_9x19_MP5SD", 20],["30Rnd_9x19_UZI", 20],["30Rnd_9x19_UZI_SD", 20],["50Rnd_127x108_KORD", 20],["64Rnd_9x19_Bizon", 20],["64Rnd_9x19_SD_Bizon", 20],["75Rnd_545x39_RPK", 20],["100Rnd_762x51_M240", 20],["100Rnd_762x54_PK", 20],["100Rnd_556x45_BetaCMag", 20],["100Rnd_556x45_M249", 20],["200Rnd_556x45_L110A1", 20],["200Rnd_556x45_M249", 20],["BoltSteel", 20],["PG7V", 20],["1Rnd_HE_M203", 20],["HandGrenade_west", 20],["SmokeShell", 20],["SmokeShellGreen", 20],["SmokeShellRed", 20],["PipeBomb", 20]];


	
diag_log("Admin Tools: config.sqf loaded");

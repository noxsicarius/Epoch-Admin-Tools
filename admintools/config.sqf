
/************** Epoch Admin Tools Variables **************/

	//Replace 111111111 with your ID. 
	EAT_superAdminList = [
	"111111111", // <player name>
	"999999999" // <player name>
	];
	EAT_adminList = [
	"999999999", // <player name>
	"999999999" // <player name>
	];
	EAT_modList = [
	"999999999", // <player name>
	"999999999" // <player name>
	];
	

	
	//Enable/Disable weather/time change menu. This may cause server to revert to mid-day on restart.
	EAT_wtChanger = false;


	//This creates a log in your server\EpochAdminToolLogs\toolUsageLog.txt REQUIRES: EATadminLogger.dll
		EAT_logMajorTool = true; //A major tool is a strong tool with high possibility for exploitation
		EAT_logMinorTool = false;//A minor tool is a weak tool with low possibility for exploitation

		
/************** Safe Zone Variables *****************/
	EAT_safeZones = true; //Enable the player safe zones script? REQUIRED for the other variables to take effect
	EAT_szVehicleGod = true; // Protect vehicles in the safe zone
	EAT_szDetectTraders = true; // This can USUALLY detect the MAJOR THREE traders (no aircraft/bandit/hero)
	EAT_szUseCustomZones = false; // Allows you to set your own zone positions (Works with auto detect)
	EAT_szPlotPoleZones = false; // NOT WORKING YET. Makes EVERY player plot pole area a safe zone
	EAT_szAntiTheft = true; // Disable stealing from inventory while in zone (allows interaction with friend inventory)
	EAT_szAiShield = false; // Remove AI in a radius around the zone
	EAT_szAiDistance = 100; // Distance to remove AI from players in a zone
	EAT_szZombieShield = true; // Remove zombies near players
	EAT_szZombieDistance = 20; // Distance to remove zombies from player in the zone
	EAT_szUseSpeedLimits = true; // Enforce a speed limit for vehicles to stop from pushing players out of zone
	EAT_szSpeedLimit = 35; // Max speed for vehicles inside the zones
	EAT_szUseHint = false; // Use hints for messages? (will display at bottom of screen instead if false)
	EAT_szAdminWeapon = false; // Allow admins to use weapons in the safe zones? (True = yes)
	
	// You can find these in the sensors section of the mission.sqm for each map
	// Format: [[X,Z,Y],RADIUS] Z can be left 0 in most cases
	EAT_szCustomZones = [
		// Cherno zones that can't be auto detected:
		[[1606.6443,289.70795,7803.5156],100], // Bandit
		[[12944.227,210.19823,12766.889],100], // Hero
		[[12060.471,158.85699,12638.533],100] // Aircraft (NO COMMA ON LAST LINE)
		// ALWAYS LEAVE OFF THE LAST "," OR THIS WILL BREAK
	];


/************** Admin/Mod mode Variables **************/
	
	// Defines the default on and off for admin/mod mode options
	// ALL items can be turned on or off during gameplay, these are just defaults
	EAT_playerGod = true;
	EAT_vehicleGod = true;
	EAT_playerESP = true;
	EAT_enhancedESP = false;
	EAT_grassOff = true;
	EAT_infAmmo = true;
	EAT_speedBoost = false;
	EAT_fastWalk = false;
	EAT_invisibility = false;
	EAT_flying = false;
	EAT_adminBuild = false;
	
	// Change the maximum build distance for placable base items
	DZE_buildMaxMoveDistance = 20;

	
	
/************** Action Menu Variables **************/

	/*
		Give players an actions menu? (dance, deploy bike/mozzie, flip car)
		Default: true
	*/
	EAT_ActionMenuPlayers = true;

	/*
		Give admins the same action menu above? (not really needed unless you are a playing admin)
		Default: false
	*/
	EAT_ActionMenuAdmins = false;


	/****** Bike variables ******/

	//Allow player to build a bike?
	EAT_AllowBuildBike = true;

	// This option requires players to have a toolbox to build a bike (consumes the toolbox)
	EAT_RequireToolBoxBike = true;

	// This option requires players to have the parts for building a bike (consumes the parts)
	// Required parts: two wheels, one scrap metal
	EAT_RequirePartsBike = false;

	// This option dictates if players are allowed to repack a bike to get their items back
	EAT_AllowPackBike = true;


	/****** Mozzie variables ******/

	//Allow player to build a Mozzie?
	EAT_AllowBuildMozzie = true;

	// This option requires players to have a toolbox to build a Mozzie (consumes the toolbox)
	EAT_RequireToolBoxMozzie = false;

	// This option requires players to have the parts for building a Mozzie (consumes the parts)
	// Required parts: main rotor, two scrap, one engine, one jerry can (full)
	EAT_RequireToolBoxMozzie = true;

	// This option dictates if players are allowed to repack a mozzie to get their items back
	EAT_AllowPackMozzie = true;


	/****** Misc ******/
		
	// Allow players to flip their vehicles rightside up
	EAT_AllowFlipVehicle = true;
		
	// Allow players to commit suicide
	EAT_AllowSuicide = true;
		
	// Allow players to use the movement menu (dance)
	EAT_AllowMovementMenu = true;

	/* 
		Allow players to open a help ticket with the admins.
		The help queue can be viewed via the admin menu.
		The player can NOT spam the admins.
	*/
	EAT_AllowContactAdmin = true;

		/*
			Stops spamming of the contact admin. If it is enabled and a user contacts an admin
			the given number of times they will get a white screen for EAT_blindTime seconds and 
			the contact feature will be disabled
		*/
		EAT_enableAntiSpam = true;
		EAT_antiSpamLimit = 15; // default 15 contacts
		EAT_blindTime = 30; // default 30 seconds
		
		
		
diag_log("Admin Tools: config.sqf loaded");

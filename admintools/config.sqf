
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
	// Format: [[POSITION],RADIUS]
	EAT_szCustomZones = [
		// Cherno zones that can't be auto detected:
		[[1606.6443,289.70795,7803.5156],100], // Bandit
		[[12944.227,210.19823,12766.889],100], // Hero
		[[12060.471,158.85699,12638.533],100] // Aircraft (NO COMMA ON LAST LINE)
		// ALWAYS LEAVE OFF THE LAST "," OR THIS WILL BREAK
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
		
		
		
diag_log("Admin Tools: config.sqf loaded");

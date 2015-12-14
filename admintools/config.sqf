
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
	

	/*
		Enable/Disable weather/time change menu.
		Important: This may cause server to always revert to mid-day on restart.
	*/	
		EAT_wtChanger = false;


	/*
		Log admin tool usage by your admins?
		This creates a log in your server\EpochAdminToolLogs\toolUsageLog.txt
		REQUIRES: EATadminLogger.dll
	*/
		//A major tool is a strong tool with high possibility for exploiting
		EAT_logMajorTool = true;

		//A minor tool is a weak tool with low possibility for exploiting
		EAT_logMinorTool = false;


		
/************** Safe Zone Variables *****************/
	// This script is a modified version of AGN safe zone commander
	SafeZonePlayer = true;					//Enable the player safe zones script? REQUIRED for the other variables to take effect
	antiCamper = 10;						//Time limit for keeping god mode active x seconds after leaving the zone
	safeZoneZombieShield = true;			//Remove zombies from safe zone
	safeZoneGodmode = true; 				//Enable god mode inside the safe zone?
	safeZoneAntiBackpack = true;			//Disable backpack gear theft?
	safeZoneLootPiles = true;				//Allow looting from loot spawns inside the zone?

	// Vehicle safe zones
	SafeZoneVehicle = true;					// Use the vehicle safe zones script?
	
	
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

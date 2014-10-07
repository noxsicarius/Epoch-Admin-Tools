
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

//Allow player to build a bike?\
AllowBuildBike = true;

// This option requires players to have a toolbox to build a bike
RequireToolBoxBike = true;

// This option requires players to have the parts for building a bike
RequirePartsBike = true;

// This option dictates if players are allowed to repack a bike to get their items back
AllowPackBike = true;


/****** Mozzie variables ******/

//Allow player to build a Mozzie?
AllowBuildMozzie = true;

// This option requires players to have a toolbox to build a Mozzie
RequireToolBoxMozzie = true;

// This option requires players to have the parts for building a Mozzie
RequirePartsMozzie = true;

// This option dictates if players are allowed to repack a mozzie to get their items back
AllowPackMozzie = false;


/****** Misc ******/
	
// Allow players to flip their vehicles rightside up
AllowFlipVehicle = true;
	
// Allow players to commit suicide
AllowSuicide = true;
	
// Allow players to use the movement menu (dance)
AllowMovementMenu = true;




diag_log("Admin Tools: config.sqf loaded");

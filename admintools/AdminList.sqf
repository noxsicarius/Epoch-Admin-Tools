// Epoch Admin Tools
//Replace 111111111 with your ID. 
AdminList = [
"111111111", // <Your In-Game Name here>
"999999999" // <Admin In-Game Name>
];
ModList = [
"999999999", // <Moderator In-Game Name>
"999999999" // <Moderator In-Game Name>
];

/*
	Log admin tool usage by your admins?
	This creates a log in your server\EpochAdminToolLogs\toolUsageLog.txt
	You MUST have the EpochAdminToolsUsageLogger.dll in the root server
	directory or this will not work. The tool will still work either way.
	This is divided into two categories.
*/

	/*
		A major tool is a strong tool with high possibility for exploiting:
		Teleport, god mode, ESP, infinite ammo, invisibility
		
		Default: true
	*/
	logMajorTool = true;

	/*
		A minor tool is a weak tool with low possibility for exploiting:
		grass off, skin change, 
		
		Default: true
	*/
	logMinorTool = true;


/*
	Broadcasts a message to the entire server when the admin tools are used.
	If you are a playing admin keep this on so players know there is no abuse.
	Default: true
*/
broadcastToolUse = true;


/*
	Base deletion variable.
	Determines default true or false for deleting all vehicles
	inside the base delete dome. Can be changed in game.
	Default: true
*/
BD_vehicles = true;


// DO NOT MODIFY ANYTHING BEYOND THIS POINT
if(isNil "tempList") then {tempList = [];}; 

/*
	Determines default on or off for admin tools menu
	Set this to false if you want the menu to be off by default.
	F11 turns the tool off, F10 turns it on.
	Leave this as True for now, it is under construction.
*/
if (isNil "toolsAreActive") then {toolsAreActive = true;};

adminListLoaded = true;

diag_log("Admin Tools: AdminList.sqf loaded");

if(logMajorTool || logMinorTool) then {
	"usageLogger" addPublicVariableEventHandler {
		private["_logText"];
		_logText = _this select 1;
		call compile ("EpochAdminToolsUsageLogger" callExtension (_logText));
	};
};

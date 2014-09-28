// Epoch Admin Tools
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




// DO NOT MODIFY ANYTHING BEYOND THIS POINT
AdminList = AdminList + SuperAdminList;
tempList = [];

/*
	Determines default on or off for admin tools menu
	Set this to false if you want the menu to be off by default.
	F11 turns the tool off, F10 turns it on.
	Leave this as True for now, it is under construction.
*/
if (isNil "toolsAreActive") then {toolsAreActive = true;};


// load server public variables
if(isDedicated) then {
	"usageLogger" addPublicVariableEventHandler {
		"EATadminLogger" callExtension (_this select 1);
	};
	"useBroadcaster" addPublicVariableEventHandler {
		EAT_toClient = (_this select 1);
		{(owner _x) publicVariableClient "EAT_toClient";} forEach entities "CAManBase";
	};
	"EAT_baseExporter" addPublicVariableEventHandler {
		"EATbaseExporter" callExtension (_this select 1);
	};
	"EAT_teleportFixServer" addPublicVariableEventHandler{
		EAT_teleportFixClient = (_this select 1);
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
};

// Client public variables
if ((getPlayerUID player) in SuperAdminList) then {
	"EAT_toClient" addPublicVariableEventHandler {
		systemChat (_this select 1);
	};
};

"EAT_teleportFixClient" addPublicVariableEventHandler {
	_array = (_this select 1);
	_addRemove = (_array select 0);
	//_count = count tempList;
	if(_addRemove == "add") then {
		_array = _array - ["add"];
		tempList = tempList + _array;
	} else {
		_array = _array - ["remove"];
		tempList = tempList - _array;
	};
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

// overwrite epoch public variables
"PVDZE_plr_SetDate" addPublicVariableEventHandler {};

// Show the admin list has loaded
adminListLoaded = true;
diag_log("Admin Tools: AdminList.sqf loaded");

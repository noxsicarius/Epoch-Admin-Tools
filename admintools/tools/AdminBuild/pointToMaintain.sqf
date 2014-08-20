private ["_classname","_objectID","_objectUID","_obj","_upgrade"];

player removeAction s_player_maint_build;
s_player_maint_build = 1;

_obj = cursorTarget;
if(isNull _obj) exitWith {s_player_maint_build = -1;};

_objectID 	= _obj getVariable ["ObjectID","0"]; // Find objectID
_objectUID	= _obj getVariable ["ObjectUID","0"]; // Find objectUID

if(_objectID == "0" && _objectUID == "0") exitWith {s_player_maint_build = -1; cutText [(localize "str_epoch_player_50"), "PLAIN DOWN"];};

// Get classname
_classname = typeOf _obj;

// Find next maintain
_upgrade = getArray (configFile >> "CfgVehicles" >> _classname >> "maintainBuilding");
if ((count _upgrade) > 0) then {
	cutText [format[(localize "STR_EPOCH_ACTIONS_4"), 1], "PLAIN DOWN", 5];
	PVDZE_maintainArea = [player,2,_obj];
	publicVariableServer "PVDZE_maintainArea";
	
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has used admin build to maintain: %3",name player,getPlayerUID player,_obj];
		[] spawn {publicVariable "usageLogger";};
	};

};
s_player_maint_build = -1;

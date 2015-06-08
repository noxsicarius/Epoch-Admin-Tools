private ["_location","_dir","_classname","_text","_object","_objectID","_objectUID","_newclassname","_obj","_upgrade","_lockable",
"_combination_1","_combination_2","_combination_3","_combination","_objectCharacterID"];

player removeAction s_player_upgrade_build;
s_player_upgrade_build = 1;

_obj = cursorTarget;
if(isNull _obj) exitWith {s_player_upgrade_build = -1;};

_objectID 	= _obj getVariable ["ObjectID","0"]; // Find objectID
_objectUID	= _obj getVariable ["ObjectUID","0"];// Find objectUID

if(_objectID == "0" && _objectUID == "0") exitWith {s_player_upgrade_build = -1; cutText [(localize "str_epoch_player_50"), "PLAIN DOWN"];};

// Get classname
_classname = typeOf _obj;

// Find display name
_text = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");

// Find next upgrade
_upgrade = getArray (configFile >> "CfgVehicles" >> _classname >> "upgradeBuilding");

if ((count _upgrade) > 0) then {

	_newclassname = _upgrade select 0;

	_lockable = 0;
	if(isNumber (configFile >> "CfgVehicles" >> _newclassname >> "lockable")) then {
		_lockable = getNumber(configFile >> "CfgVehicles" >> _newclassname >> "lockable");
	};

	_location	= _obj getVariable["OEMPos",(getposATL _obj)];			// Get position
	_dir = getDir _obj;													// Get direction
	_objectCharacterID 	= _obj getVariable ["CharacterID","0"];			// Current charID
	_classname = _newclassname;
	_object = createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"];// Create new object 
	_object setDir _dir;												// Set direction
	_object setPosATL _location; 										// Set location

	if (_lockable == 3) then {
		_combination_1 = floor(random 10);
		_combination_2 = floor(random 10);
		_combination_3 = floor(random 10);
		_combination = format["%1%2%3",_combination_1,_combination_2,_combination_3];
				
		_objectCharacterID = _combination;
				
		cutText [format[(localize "str_epoch_player_158"),_combination,_text], "PLAIN DOWN", 5];
	} else {	
		cutText [format[(localize "str_epoch_player_159"),_text], "PLAIN DOWN", 5];
	};

	PVDZE_obj_Swap = [_objectCharacterID,_object,[_dir,_location],_classname,_obj,player];
	publicVariableServer "PVDZE_obj_Swap";

	player reveal _object;

	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has used admin build to upgrade: %3",name player,getPlayerUID player,_obj];
		[] spawn {publicVariable "usageLogger";};
	};

} else {
	cutText [(localize "str_epoch_player_82"), "PLAIN DOWN"];
};

s_player_upgrade_build = -1;
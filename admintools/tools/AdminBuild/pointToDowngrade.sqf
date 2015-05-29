private ["_location","_dir","_classname","_text","_object","_objectID","_objectUID","_newclassname","_obj","_downgrade","_objectCharacterID"];

player removeAction s_player_downgrade_build;
s_player_downgrade_build = 1;

// get cursor target
_obj = cursorTarget;
if(isNull _obj) exitWith {s_player_downgrade_build = -1;};

_objectCharacterID 	= _obj getVariable ["CharacterID","0"];// Current charID
_objectID 	= _obj getVariable ["ObjectID","0"];// Find objectID
_objectUID	= _obj getVariable ["ObjectUID","0"];// Find objectUID

if(_objectID == "0" && _objectUID == "0") exitWith {s_player_downgrade_build = -1; cutText [(localize "str_epoch_player_50"), "PLAIN DOWN"];};

// Get classname
_classname = typeOf _obj;

// Find display name
_text = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");

// Find next downgrade
_downgrade = getArray (configFile >> "CfgVehicles" >> _classname >> "downgradeBuilding");

if ((count _downgrade) > 0) then {

	_newclassname = _downgrade select 0;

	// Get position
	_location	= _obj getVariable["OEMPos",(getposATL _obj)];

	// Get direction
	_dir = getDir _obj;

	// Reset the character ID on locked doors before they inherit the newclassname
	if (_classname in DZE_DoorsLocked) then {
		_obj setVariable ["CharacterID",dayz_characterID,true];
		_objectCharacterID = dayz_characterID;
	};

	_classname = _newclassname;
	_object = createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"]; 	// Create new object
	_object setDir _dir;			// Set direction
	_object setPosATL _location;	// Set location

	cutText [format[(localize "str_epoch_player_142"),_text], "PLAIN DOWN", 5];

	PVDZE_obj_Swap = [_objectCharacterID,_object,[_dir,_location],_classname,_obj,player];
	publicVariableServer "PVDZE_obj_Swap";

	player reveal _object;

	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has used admin build to downgrade: %3",name player,getPlayerUID player,_obj];
		[] spawn {publicVariable "usageLogger";};
	};

} else {
	cutText [(localize "str_epoch_player_51"), "PLAIN DOWN"];
};

s_player_downgrade_build = -1;

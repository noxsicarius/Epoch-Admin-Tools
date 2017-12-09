private ["_objectID","_objectUID","_obj","_ownerID","_dir","_pos","_holder","_weapons","_magazines","_backpacks","_lockedClass","_player"];

_obj = cursorTarget;
if(isNull _obj) exitWith {};

_objType = typeOf _obj;
_ownerID = _obj getVariable["ObjectID","0"];
_objectID = _obj getVariable["ObjectID","0"];
_player = player;

// Lock car
if (_obj isKindOf "LandVehicle" || _obj isKindOf "Air" || _obj isKindOf "Ship") then {
	{player removeAction _x} forEach s_player_lockunlock;s_player_lockunlock = [];
	s_player_lockUnlock_crtl = 1;

	PVDZE_veh_Lock = [_obj,true];

	if (local _obj) then {
		PVDZE_veh_Lock spawn local_lockUnlock
	} else {
		publicVariable "PVDZE_veh_Lock";
	};
	
	s_player_lockUnlock_crtl = -1;

	// Tool use logger
	if(EAT_logMinorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has locked a vehicle: %3",name _player,getPlayerUID _player,_obj];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};
} else {
	//Lock Safe/Lock_box
	if(_objType in DZE_UnLockedStorage) then {
		_lockedClass = getText (configFile >> "CfgVehicles" >> _objType >> "lockedClass");
		_text = getText (configFile >> "CfgVehicles" >> _objType >> "displayName");
		
		disableUserInput true; // Make sure player can not modify gear while it is being saved
		(findDisplay 106) closeDisplay 0; // Close gear
		dze_waiting = nil;
	
		[_lockedClass,objNull] call fn_waitForObject;
	
		PVDZE_handleSafeGear = [_player,_obj,1];
		publicVariableServer "PVDZE_handleSafeGear";	
		//wait for response from server to verify safe was logged and saved before proceeding
		waitUntil {!isNil "dze_waiting"};
		disableUserInput false; // Safe is done saving now

		format[localize "str_epoch_player_117",_text] call dayz_rollingMessages;
		
		// Tool use logger
		if(EAT_logMajorTool) then {
			EAT_PVEH_usageLogger = format["%1 %2 -- has locked a safe - ID:%3 UID:%4",name _player,getPlayerUID _player,_objectID,_ownerID];
			[] spawn {publicVariable "EAT_PVEH_usageLogger";};
		};

	} else {
		//Lock Door
		
		_objectCharacterID = _obj getVariable ["CharacterID","0"];
		
		if(_obj animationPhase "Open_hinge" == 1) then {_obj animate ["Open_hinge", 0];};
		if(_obj animationPhase "Open_latch" == 1) then {_obj animate ["Open_latch", 0];};
		if(_obj animationPhase "Open_door" == 1) then {_obj animate ["Open_door", 0];};
		if(_obj animationPhase "DoorR" == 1) then {_obj animate ["DoorR", 0];};
		if(_obj animationPhase "LeftShutter" == 1) then {_obj animate ["LeftShutter", 0];};
		if(_obj animationPhase "RightShutter" == 1) then {_obj animate ["RightShutter", 0];};
		
		// Tool use logger
		if(EAT_logMajorTool) then {
			EAT_PVEH_usageLogger = format["%1 %2 -- has locked a door - ID:%3 Combo:%4",name _player,getPlayerUID _player,_objectID,_objectCharacterID];
			[] spawn {publicVariable "EAT_PVEH_usageLogger";};
		};
	};
};

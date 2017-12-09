private ["_objectID","_objectUID","_obj","_ownerID","_dir","_pos","_holder","_weapons","_magazines","_backpacks","_objWpnTypes","_objWpnQty","_countr","_unlockedClass","_objType","_objectCharacterID","_player"];

_obj = cursorTarget;
if(isNull _obj) exitWith {};
_objectID = _obj getVariable["ObjectID","0"];
_objType = typeOf _obj;
_player = player;

// Unlock car
if (_obj isKindOf "LandVehicle" || _obj isKindOf "Air" || _obj isKindOf "Ship") then {

	{player removeAction _x} forEach s_player_lockunlock;s_player_lockunlock = [];
	s_player_lockUnlock_crtl = 1;

	PVDZE_veh_Lock = [_obj,false];
				
	if (local _obj) then {
		PVDZE_veh_Lock spawn local_lockUnlock
	} else {
		publicVariable "PVDZE_veh_Lock";
	};

	s_player_lockUnlock_crtl = -1;

	// Tool use logger
	if(EAT_logMajorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has unlocked vehicle: %3 with ID:%4",name _player,getPlayerUID _player,_obj,_objectID];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};
} else {
	// Unlock Safe/Lock_Box
	if(_objType in DZE_LockedStorage) then {
		// Get all required variables
		_unlockedClass = getText (configFile >> "CfgVehicles" >> _objType >> "unlockedClass");
		_text =	getText (configFile >> "CfgVehicles" >> _objType >> "displayName");
		//_obj setVariable["packing",1];
		
		disableUserInput true; // Make sure player can not modify gear while it is filling
		(findDisplay 106) closeDisplay 0; // Close gear
		dze_waiting = nil;
		
		[_unlockedClass,objNull] call fn_waitForObject;
		
		PVDZE_handleSafeGear = [_player,_obj,0];
		publicVariableServer "PVDZE_handleSafeGear";
		//wait for response from server to verify safe was logged before proceeding
		waitUntil {!isNil "dze_waiting"};
		disableUserInput false; // Safe is done filling now
		
		format[localize "STR_BLD_UNLOCKED",_text] call dayz_rollingMessages;
		
		// Tool use logger
		if(EAT_logMajorTool) then {
			EAT_PVEH_usageLogger = format["%1 %2 -- has unlocked a safe - ID:%3 UID:%4",name _player,getPlayerUID _player,_objectID,_ownerID];
			[] spawn {publicVariable "EAT_PVEH_usageLogger";};
		};		
	} else {

		_objectCharacterID = _obj getVariable ["CharacterID","0"];
		
		//Unlock Doors
		if(_obj animationPhase "Open_hinge" == 0) then {_obj animate ["Open_hinge", 1];};
		if(_obj animationPhase "Open_latch" == 0) then {_obj animate ["Open_latch", 1];};
		if(_obj animationPhase "Open_door" == 0) then {_obj animate ["Open_door", 1];};
		if(_obj animationPhase "DoorR" == 0) then {_obj animate ["DoorR", 1];};
		if(_obj animationPhase "LeftShutter" == 0) then {_obj animate ["LeftShutter", 1];};
		if(_obj animationPhase "RightShutter" == 0) then {_obj animate ["RightShutter", 1];};
		
		// Tool use logger
		if(EAT_logMajorTool) then {
			EAT_PVEH_usageLogger = format["%1 %2 -- has unlocked a door - ID:%3 Combo:%4",name _player,getPlayerUID _player,_objectID,_objectCharacterID];
			[] spawn {publicVariable "EAT_PVEH_usageLogger";};
		};
	};
};

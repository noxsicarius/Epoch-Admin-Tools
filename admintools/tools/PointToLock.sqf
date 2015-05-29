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
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has locked a vehicle: %3",name _player,getPlayerUID _player,_obj];
		[] spawn {publicVariable "usageLogger";};
	};
} else {
	//Lock Safe/Lock_box
	if(_objType == "VaultStorage") then {
		_lockedClass = getText (configFile >> "CfgVehicles" >> _objType >> "lockedClass");
		_obj setVariable["packing",1];
		_dir = direction _obj;
		_pos = _obj getVariable["OEMPos",(getposATL _obj)];
		_ownerID = _obj getVariable["CharacterID","0"];

		//log lock
		PVDZE_log_lockUnlock = [player, _obj,true];
		publicVariableServer "PVDZE_log_lockUnlock";
		
		//place locked vault
		_holder = createVehicle [_lockedClass,_pos,[], 0, "CAN_COLLIDE"];
		_holder setdir _dir;
		_holder setPosATL _pos;
		player reveal _holder;
		
		//set locked vault variables
		_holder setVariable["CharacterID",_ownerID,true];
		_holder setVariable["ObjectID",_objectID,true];
		_holder setVariable["ObjectUID",_objectUID,true];
		_holder setVariable ["OEMPos", _pos, true];

		_weapons = getWeaponCargo _obj;
		_magazines = getMagazineCargo _obj;
		_backpacks = getBackpackCargo _obj;

		// remove vault
		deleteVehicle _obj;

		// Fill variables with loot
		_holder setVariable ["WeaponCargo", _weapons, true];
		_holder setVariable ["MagazineCargo", _magazines, true];
		_holder setVariable ["BackpackCargo", _backpacks, true];
		
		// Tool use logger
		if(logMajorTool) then {
			usageLogger = format["%1 %2 -- has locked a safe - ID:%3 UID:%4",name _player,getPlayerUID _player,_objectID,_ownerID];
			[] spawn {publicVariable "usageLogger";};
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
		if(logMajorTool) then {
			usageLogger = format["%1 %2 -- has locked a door - ID:%3 Combo:%4",name _player,getPlayerUID _player,_objectID,_objectCharacterID];
			[] spawn {publicVariable "usageLogger";};
		};
	};
};

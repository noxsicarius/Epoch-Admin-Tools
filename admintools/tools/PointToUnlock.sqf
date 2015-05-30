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
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has unlocked vehicle: %3 with ID:%4",name _player,getPlayerUID _player,_obj,_objectID];
		[] spawn {publicVariable "usageLogger";};
	};
} else {
	// Unlock Safe/Lock_Box
	if(_objType in DZE_LockedStorage) then {
		// Get all required variables
		_unlockedClass = getText (configFile >> "CfgVehicles" >> _objType >> "unlockedClass");
		_text =	getText (configFile >> "CfgVehicles" >> _objType >> "displayName");
		_dir = direction _obj;
		_pos = _obj getVariable["OEMPos",(getposATL _obj)];
		_objectID = _obj getVariable["ObjectID","0"];
		_objectUID = _obj getVariable["ObjectUID","0"];
		_ownerID = _obj getVariable["CharacterID","0"];
		_weapons = 		_obj getVariable["WeaponCargo",[]];
		_magazines = 	_obj getVariable["MagazineCargo",[]];
		_backpacks = 	_obj getVariable["BackpackCargo",[]];
		_holder = createVehicle [_unlockedClass,_pos,[], 0, "CAN_COLLIDE"];
		
		//log the lockUnlock
		PVDZE_log_lockUnlock = [player, _obj, false];
		publicVariableServer "PVDZE_log_lockUnlock";
		_obj setVariable["packing",1];
		
		// Remove locked vault
		deleteVehicle _obj;

		//Add the new unlocked safe
		_holder setdir _dir;
		_holder setPosATL _pos;
		player reveal _holder;

		_holder setVariable["CharacterID",_ownerID,true];
		_holder setVariable["ObjectID",_objectID,true];
		_holder setVariable["ObjectUID",_objectUID,true];
		_holder setVariable ["OEMPos", _pos, true];

		if (count _weapons > 0) then {
			//Add weapons
			_objWpnTypes = 	_weapons select 0;
			_objWpnQty = 	_weapons select 1;
			_countr = 0;
			{
				_holder addweaponcargoGlobal [_x,(_objWpnQty select _countr)];
				_countr = _countr + 1;
			} count _objWpnTypes;
		};

		if (count _magazines > 0) then {
			//Add Magazines
			_objWpnTypes = _magazines select 0;
			_objWpnQty = _magazines select 1;
			_countr = 0;
			{
				if( _x != "CSGAS" ) then
				{
					_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];
					_countr = _countr + 1;
				};
			} count _objWpnTypes;
		};

		if (count _backpacks > 0) then {
			//Add Backpacks
			_objWpnTypes = _backpacks select 0;
			_objWpnQty = _backpacks select 1;
			_countr = 0;
			{
				_holder addbackpackcargoGlobal [_x,(_objWpnQty select _countr)];
				_countr = _countr + 1;
			} count _objWpnTypes;
		};

		// Tool use logger
		if(logMajorTool) then {
			usageLogger = format["%1 %2 -- has unlocked a safe - ID:%3 UID:%4",name _player,getPlayerUID _player,_objectID,_ownerID];
			[] spawn {publicVariable "usageLogger";};
		};
		// Tool use broadcaster
		if(broadcastToolUse) then {
			useBroadcaster = "Admin -- has forcibly unlocked a safe";
			[] spawn {publicVariableServer "useBroadcaster";};
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
		if(logMajorTool) then {
			usageLogger = format["%1 %2 -- has unlocked a door - ID:%3 Combo:%4",name _player,getPlayerUID _player,_objectID,_objectCharacterID];
			[] spawn {publicVariable "usageLogger";};
		};
		// Tool use broadcaster
		if(broadcastToolUse) then {
			useBroadcaster = "Admin -- has forcibly unlocked a door";
			[] spawn {publicVariableServer "useBroadcaster";};
		};
	};
};

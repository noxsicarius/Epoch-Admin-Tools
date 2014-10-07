private ["_mags","_player","_weps","_hasItems","_hasTools","_wheelNumber","_canDo","_onLadder","_finished","_finishedTime","_veh","_location","_vehtospawn","_dir","_pos","_dist","_location","_worldspace"];

_player = player; //Setting a local variable as player saves resources
_mags = magazines _player;
_weps = weapons _player;
_vehicle = vehicle _player;
_inVehicle = (_vehicle != _player);
_onLadder =	(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState _player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf && !r_player_unconscious && !_onLadder && !_inVehicle);
_wheelNumber = {_x == "PartWheel";} count _mags; // must return 2 or more
_hasItems = (("PartGeneric" in _mags) && (_wheelNumber > 1));
_hasTools = ("ItemToolbox" in _weps);

if((_hasItems && _hasTools && RequireToolBoxBike && RequirePartsBike) || (!RequireToolBoxBike && RequirePartsBike && _hasItems) || (!RequirePartsBike && RequireToolBoxBike && _hasTools) || (!RequirePartsBike && !RequireToolBoxBike)) then {
	hasBikeItem = true;
} else {
	hasBikeItem = false;
	if(RequirePartsBike && RequireToolBoxBike) then {
		cutText ["\n\nNeed: 1x Scrap Metal, 1x ToolBox and 2x Wheels required to build bike", "PLAIN DOWN"];
	} else {
		if(RequirePartsBike && !RequireToolBoxBike) then {
			cutText ["\n\nNeed: 1x scrap metal and 2x wheels required to build bike", "PLAIN DOWN"];
		} else {
			if(!RequirePartsBike && RequireToolBoxBike) then {
				cutText ["\n\nNeed: 1x ToolBox required to build bike", "PLAIN DOWN"];
			};
		};
	};
};

if (!hasBikeItem) exitWith {};

if (hasBikeItem && _canDo && dayz_combat == 1) exitWith {
    cutText ["You are in Combat and cannot build a bike.", "PLAIN DOWN"];
};

if (hasBikeItem && _canDo && (dayz_combat !=1)) then {
	DZE_ActionInProgress = true;
	if(RequirePartsBike) then {
		_player removeMagazine "PartGeneric";
		_player removeMagazine "PartWheel";
		_player removeMagazine "PartWheel";
	};
	if(RequireToolBoxBike) then {
		_player removeWeapon "ItemToolbox";
	};

	_player playActionNow "Medic";
	[_player,"repair",0,false,10] call dayz_zombieSpeak;
	[_player,10,true,(getPosATL _player)] spawn player_alertZombies;

	r_interrupt = false;
	r_doLoop = true;

	_finished = false;
	_finishedTime = diag_tickTime+8;

	while {r_doLoop} do {
		if (diag_tickTime >= _finishedTime) then {
			r_doLoop = false;
			_finished = true;
		};
		if (r_interrupt) then {
			r_doLoop = false;
		};
		sleep 0.1;
	};

	if (_finished) then {
		_vehtospawn = "Old_bike_TK_CIV_EP1";
		_dist = 6;
		_charID = dayz_characterID;
		_dir = getDir vehicle _player;
		_pos = getPosATL vehicle _player;
		_pos = [(_pos select 0)+_dist*sin(_dir),(_pos select 1)+_dist*cos(_dir),0];
		_worldspace = [_dir,_pos]; 
		_location = _pos;
		_veh = createVehicle [_vehtospawn, _pos, [], 0, "CAN_COLLIDE"];
		_veh setVariable ["MalSar",1,true];
		_veh setVariable ["ObjectID", "1", true];
		_veh setVariable ["ObjectUID", "1", true];
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;

		cutText ["\nYou have built a bike!", "PLAIN DOWN",3];
		DZE_ActionInProgress = false;
		sleep 6;
		cutText ["\nWarning: Spawned bikes DO NOT SAVE after server restart!", "PLAIN DOWN"];
	} else {
		r_interrupt = false;
		_player switchMove "";
		_player playActionNow "stop";
		DZE_ActionInProgress = false;
		
		if(RequirePartsBike) then {
			_player addMagazine "PartGeneric";
			_player addMagazine "PartWheel";
			_player addMagazine "PartWheel";
		};
		if(RequireToolBoxBike) then {
			_player addWeapon "ItemToolbox";
		};
		
		cutText ["\n\nCanceled building a bike!", "PLAIN DOWN",4];
	};
} else {
	if(!_canDo) then {
		cutText ["You are in a vehicle or already performing an action","PLAIN DOWN"];
	};
};

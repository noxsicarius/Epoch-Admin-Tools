private ["_mags","_player","_weps","_hasItems","_hasTools","_scrapNumber","_canDo","_finished","_finishedTime","_veh","_vehtospawn","_dir","_pos","_dist"];

_player = player; //Setting a local variable as player saves resources
_mags = magazines _player;
_weps = weapons _player;
_vehicle = vehicle _player;
_canDo = call fnc_actionAllowed;
_scrapNumber = {_x == "PartGeneric";} count _mags; // must return 2 or more
_hasItems = ((_scrapNumber > 1) && ("PartEngine" in _mags) && ("ItemJerrycan" in _mags) && ("PartVRotor" in _mags));
_hasTools = ("ItemToolbox" in _weps);

if((_hasItems && _hasTools && RequireToolBoxMozzie && RequirePartsMozzie) || (!RequireToolBoxMozzie && RequirePartsMozzie && _hasItems) || (!RequirePartsMozzie && RequireToolBoxMozzie && _hasTools) || (!RequirePartsMozzie && !RequireToolBoxMozzie)) then {
	hasMozzieItem = true;
} else { 
	hasMozzieItem = false;
	if(RequirePartsMozzie && RequireToolBoxMozzie) then {
		cutText ["\n\nNeed: 2x Scrap Metal, 1x Engine, 1x Main Rotor, 1x ToolBox, and 1x Jerrycan required to build mozzie", "PLAIN DOWN"];
	} else {
		if(RequirePartsMozzie && !RequireToolBoxMozzie) then {
			cutText ["\n\nNeed: 2x Scrap Metal, 1x Engine, 1x Main Rotor, and 1x Jerrycan required to build mozzie", "PLAIN DOWN"];
		} else {
			if(!RequirePartsMozzie && RequireToolBoxMozzie) then {
				cutText ["\n\nNeed: 1x ToolBox required to build mozzie", "PLAIN DOWN"];
			};
		};
	};
};


/********** Exit sequences **********/
if (!hasMozzieItem) exitWith {};
if(dayz_combat == 1) exitWith {cutText ["You are in Combat and cannot build a Mozzie.", "PLAIN DOWN"];};
if(!(_canDo)) exitWith {cutText ["You are in a vehicle or already performing an action","PLAIN DOWN"];};
/********** End Exit sequences **********/


DZE_ActionInProgress = true;
if(RequirePartsMozzie) then {
	_player removeMagazine "PartGeneric";
	_player removeMagazine "PartGeneric";
	_player removeMagazine "PartEngine";
	_player removeMagazine "ItemJerrycan";
	_player removeMagazine "PartVRotor";
};

if(RequireToolBoxMozzie) then {
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
	_vehtospawn = "CSJ_GyroC";
	_dist = 8;
	_dir = getDir vehicle _player;
	_pos = getPosATL vehicle _player;
	_pos = [(_pos select 0)+_dist * sin(_dir),(_pos select 1)+ _dist * cos(_dir),0];
	_veh = createVehicle [_vehtospawn, _pos, [], 0, "CAN_COLLIDE"];
	_veh setVariable ["MalSar",1,true];
	_veh setVariable ["ObjectID", "1", true];
	_veh setVariable ["ObjectUID", "1", true];
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	_veh setVehicleAmmo 0;

	cutText ["\nYou have built a Mozzie!", "PLAIN DOWN",3];
	DZE_ActionInProgress = false;
	sleep 6;
	cutText ["\nWarning: Spawned Mozzies DO NOT SAVE after server restart!", "PLAIN DOWN"];
} else {
	r_interrupt = false;
	_player switchMove "";
	_player playActionNow "stop";
	DZE_ActionInProgress = false;
		
	if(RequirePartsMozzie) then {
		_player addMagazine "PartGeneric";
		_player addMagazine "PartGeneric";
		_player addMagazine "PartEngine";
		_player addMagazine "ItemJerrycan";
		_player addMagazine "PartVRotor";
	};
	if(RequireToolBoxMozzie) then {
		_player addWeapon "ItemToolbox";
	};
	cutText ["\n\nCanceled building a Mozzie.", "PLAIN DOWN",4];
};

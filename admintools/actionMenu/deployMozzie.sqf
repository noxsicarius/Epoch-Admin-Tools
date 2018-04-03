private ["_mags","_player","_weps","_hasItems","_hasTools","_scrapNumber","_canDo","_finished","_veh","_vehtospawn","_dir","_pos","_dist"];

_player = player; //Setting a local variable as player saves resources
_mags = magazines _player;
_weps = weapons _player;
_canDo = call EAT_fnc_actionAllowed;
_scrapNumber = {_x == "PartGeneric";} count _mags; // must return 2 or more
_hasItems = ((_scrapNumber > 1) && ("PartEngine" in _mags) && ("ItemJerrycan" in _mags) && ("PartVRotor" in _mags));
_hasTools = ("ItemToolbox" in _weps);

if((_hasItems && _hasTools && EAT_RequireToolBoxMozzie && EAT_RequirePartsMozzie) || (!EAT_RequireToolBoxMozzie && EAT_RequirePartsMozzie && _hasItems) || (!EAT_RequirePartsMozzie && EAT_RequireToolBoxMozzie && _hasTools) || (!EAT_RequireToolBoxMozzie && !EAT_RequirePartsMozzie)) then {
	hasMozzieItem = true;
} else { 
	hasMozzieItem = false;
	if(EAT_RequireToolBoxMozzie && EAT_RequirePartsMozzie) then {
		"Need: 2x Scrap Metal, 1x Engine, 1x Main Rotor, 1x ToolBox, and 1x Jerrycan required to build mozzie" call dayz_rollingMessages;
	} else {
		if(EAT_RequirePartsMozzie && !EAT_RequireToolBoxMozzie) then {
			"Need: 2x Scrap Metal, 1x Engine, 1x Main Rotor, and 1x Jerrycan required to build mozzie" call dayz_rollingMessages;
		} else {
			if(!EAT_RequirePartsMozzie && EAT_RequireToolBoxMozzie) then {
				"Need: 1x ToolBox required to build mozzie" call dayz_rollingMessages;
			};
		};
	};
};


/********** Exit sequences **********/
if (!hasMozzieItem) exitWith {};
if(_player getVariable["inCombat",false]) exitWith {"You are in Combat and cannot build a Mozzie." call dayz_rollingMessages;};
if(!(_canDo)) exitWith {"You are in a vehicle or already performing an action" call dayz_rollingMessages;};
/********** End Exit sequences **********/


dayz_actionInProgress = true;

//Build Animation
_finished = ["Medic",1] call fn_loopAction;
if (!_finished) exitWith {dayz_actionInProgress = false; "Canceled building a Mozzie." call dayz_rollingMessages;};

if(EAT_RequirePartsMozzie) then {
	_player removeMagazine "PartGeneric";
	_player removeMagazine "PartGeneric";
	_player removeMagazine "PartEngine";
	_player removeMagazine "ItemJerrycan";
	_player removeMagazine "PartVRotor";
};

if(EAT_RequireToolBoxMozzie) then {
	_player removeWeapon "ItemToolbox";
};

_vehtospawn = "CSJ_GyroC";
_dist = 8;
_dir = getDir vehicle _player;
_pos = getPosATL vehicle _player;
_pos = [(_pos select 0)+_dist * sin(_dir),(_pos select 1)+ _dist * cos(_dir),0];
_veh = _vehtospawn createVehicle _pos;
_veh setVariable ["EAT_Veh",1,true];
_veh setVariable ["ObjectID", "1", true];
_veh setVariable ["ObjectUID", "1", true];
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
_veh setVehicleAmmo 0;

"You have built a Mozzie!" call dayz_rollingMessages;
dayz_actionInProgress = false;
uiSleep 6;
"Warning: Spawned Mozzies DO NOT SAVE after server restart!" call dayz_rollingMessages;


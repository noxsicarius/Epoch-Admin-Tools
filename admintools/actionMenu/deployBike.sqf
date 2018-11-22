private ["_mags","_player","_weps","_hasItems","_hasTools","_wheelNumber","_canDo","_finished","_veh","_vehtospawn","_dir","_pos","_dist"];

_player = player; //Setting a local variable as player saves resources
_mags = magazines _player;
_weps = weapons _player;
_canDo = call EAT_fnc_actionAllowed;
_wheelNumber = {_x == "PartWheel";} count _mags; // must return 2 or more
_hasItems = (("PartGeneric" in _mags) && (_wheelNumber > 1));
_hasTools = ("ItemToolbox" in _weps);

if((_hasItems && _hasTools && EAT_RequireToolBoxBike && EAT_RequirePartsBike) || (!EAT_RequireToolBoxBike && EAT_RequirePartsBike && _hasItems) || (!EAT_RequirePartsBike && EAT_RequireToolBoxBike && _hasTools) || (!EAT_RequirePartsBike && !EAT_RequireToolBoxBike)) then {
	hasBikeItem = true;
} else {
	hasBikeItem = false;
	if(EAT_RequirePartsBike && EAT_RequireToolBoxBike) then {
		"Need: 1x Scrap Metal, 1x ToolBox and 2x Wheels required to build bike" call dayz_rollingMessages;
	} else {
		if(EAT_RequirePartsBike && !EAT_RequireToolBoxBike) then {
			"Need: 1x scrap metal and 2x wheels required to build bike" call dayz_rollingMessages;
		} else {
			if(!EAT_RequirePartsBike && EAT_RequireToolBoxBike) then {
				"Need: 1x ToolBox required to build bike" call dayz_rollingMessages;
			};
		};
	};
};

/********** Exit sequences **********/
if (!hasBikeItem) exitWith {};
if(!(_canDo)) exitWith {"You are in a vehicle or already performing an action" call dayz_rollingMessages;};
/********** End Exit sequences **********/

dayz_actionInProgress = true;

_finished = ["Medic",1] call fn_loopAction;
if (!_finished) exitWith {dayz_actionInProgress = false; "Canceled building a bike!" call dayz_rollingMessages;};

if(EAT_RequirePartsBike) then {
	_player removeMagazine "PartGeneric";
	_player removeMagazine "PartWheel";
	_player removeMagazine "PartWheel";
};
if(EAT_RequireToolBoxBike) then {
	_player removeWeapon "ItemToolbox";
};

_vehtospawn = "Old_bike_TK_CIV_EP1";
_dist = 6;
_dir = getDir vehicle _player;
_pos = getPosATL vehicle _player;
_pos = [(_pos select 0)+_dist*sin(_dir),(_pos select 1)+_dist*cos(_dir),0];
_veh = _vehtospawn createVehicle _pos;
_veh setVariable ["EAT_Veh",1,true];
_veh setVariable ["ObjectID", "1", true];
_veh setVariable ["ObjectUID", "1", true];
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;

"You have built a bike!" call dayz_rollingMessages;
dayz_actionInProgress = false;
uiSleep 6;
"Warning: Spawned bikes DO NOT SAVE after server restart!" call dayz_rollingMessages;


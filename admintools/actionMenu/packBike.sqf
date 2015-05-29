private ["_player","_ctType","_inVehicle","_ct","_canDo","_onLadder","_finished","_finishedTime","_distance"];

_player = player; //Setting a local variable as player saves resources
_canDo = call fnc_actionAllowed;
_ct = cursorTarget;
_ctType = typeOf _ct;
_distance = _player distance _ct;


/********** Exit sequences **********/
if(isNull _ct || _ctType != "Old_bike_TK_CIV_EP1" || (_ct getVariable ["MalSar",0] != 1)) exitWith {cutText ["Target is not a player built bike.", "PLAIN DOWN"];};
if(dayz_combat == 1) exitWith {cutText ["You are in Combat and cannot pack a bike.", "PLAIN DOWN"];};
if(!(_canDo)) exitWith {cutText ["You are in a vehicle or already performing an action","PLAIN DOWN"];};
if(_distance > 3) exitWith {cutText ["You must be within 3 meters of the bike to pack it","PLAIN DOWN"];};
/********** End Exit sequences **********/


DZE_ActionInProgress = true;

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

	// This line is an anti-troll fix. If the bike was moved the bike is not packed.
	if(_distance > 3) exitWith {cutText ["You must be within 3 meters of the bike to pack it","PLAIN DOWN"];};
	
	_objectID = _ct getVariable ["ObjectID", "0"];
	_objectUID = _ct getVariable ["ObjectUID", "0"];
	PVDZE_obj_Delete = [_objectID, _objectUID, (name _player)];
	publicVariableServer "PVDZE_obj_Delete";

	deleteVehicle _ct;
	if(RequirePartsBike) then {
		_player addMagazine "PartGeneric";
		_player addMagazine "PartWheel";
		_player addMagazine "PartWheel";
	};
	if(RequireToolBoxBike) then {
		_player addWeapon "ItemToolbox";
	};
	
	cutText ["\nYou have packed a bike!", "PLAIN DOWN",3];
} else {
	r_interrupt = false;
	_player switchMove "";
	_player playActionNow "stop";
		
	cutText ["\n\nCanceled pack bike!", "PLAIN DOWN",4];
};
DZE_ActionInProgress = false;

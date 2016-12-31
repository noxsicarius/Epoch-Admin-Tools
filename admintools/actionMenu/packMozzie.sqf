private ["_player","_vehicle","_ctType","_inVehicle","_ct","_canDo","_onLadder","_finished","_finishedTime","_distance"];

_player = player; //Setting a local variable as player saves resources
_vehicle = vehicle _player;
_canDo = call EAT_fnc_actionAllowed;
_ct = cursorTarget;
_ctType = typeOf _ct;
_distance = _player distance _ct;


/********** Exit sequences **********/
if(isNull _ct || _ctType != "CSJ_GyroC" || (_ct getVariable ["EAT_Veh",0] != 1)) exitWith {cutText ["Target is not a player built mozzie.", "PLAIN DOWN"];};
if(_player getVariable["inCombat",false]) exitWith {cutText ["You are in Combat and cannot pack a mozzie.", "PLAIN DOWN"];};
if(!(_canDo)) exitWith {cutText ["You are in a vehicle or already performing an action","PLAIN DOWN"];};
if(_distance > 3) exitWith {cutText ["You must be within 3 meters of the mozzie to pack it","PLAIN DOWN"];};
/********** End Exit sequences **********/


dayz_actionInProgress = true;

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

	// This line is an anti-troll fix. If the mozzie was moved the mozzie is not packed.
	if(_distance > 4) exitWith {cutText ["You must be within 4 meters of the mozzie to pack it","PLAIN DOWN"];};
		
	_objectID = _ct getVariable ["ObjectID", "0"];
	_objectUID = _ct getVariable ["ObjectUID", "0"];
	PVDZ_obj_Destroy = [_objectID, _objectUID, (name _player)];
	publicVariableServer "PVDZ_obj_Destroy";

	deleteVehicle _ct;
	if(EAT_RequireToolBoxMozzie) then {
		_player addMagazine "PartGeneric";
		_player addMagazine "PartGeneric";
		_player addMagazine "PartEngine";
		_player addMagazine "ItemJerrycan";
		_player addMagazine "PartVRotor";
	};
	if(EAT_RequireToolBoxMozzie) then {
		_player addWeapon "ItemToolbox";
	};
		
	cutText ["\nYou have packed a mozzie!", "PLAIN DOWN",3];
} else {
	r_interrupt = false;
	_player switchMove "";
	_player playActionNow "stop";
		
	cutText ["\n\nCanceled pack mozzie!", "PLAIN DOWN",4];
};

dayz_actionInProgress = false;

private ["_player","_ctType","_ct","_canDo","_finished","_distance","_objectID","_objectUID"];

_player = player; //Setting a local variable as player saves resources
_canDo = call EAT_fnc_actionAllowed;
_ct = cursorTarget;
_ctType = typeOf _ct;
_distance = _player distance _ct;


/********** Exit sequences **********/
if(isNull _ct || _ctType != "CSJ_GyroC" || (_ct getVariable ["EAT_Veh",0] != 1)) exitWith {"Target is not a player built mozzie." call dayz_rollingMessages;};
if(_player getVariable["inCombat",false]) exitWith {"You are in Combat and cannot pack a mozzie." call dayz_rollingMessages;};
if(!(_canDo)) exitWith {"You are in a vehicle or already performing an action" call dayz_rollingMessages;};
if(_distance > 3) exitWith {"You must be within 3 meters of the mozzie to pack it" call dayz_rollingMessages;};
/********** End Exit sequences **********/

dayz_actionInProgress = true;

//Build Animation
_finished = ["Medic",1] call fn_loopAction;
if (!_finished) exitWith {dayz_actionInProgress = false; "Canceled pack mozzie!" call dayz_rollingMessages;};

// This line is an anti-troll fix. If the mozzie was moved the mozzie is not packed.
if(_distance > 4) exitWith {"You must be within 4 meters of the mozzie to pack it" call dayz_rollingMessages;};
	
_objectID = _ct getVariable ["ObjectID", "0"];
_objectUID = _ct getVariable ["ObjectUID", "0"];
PVDZ_obj_Destroy = [_objectID,_objectUID,_player,_ct,dayz_authKey];
publicVariableServer "PVDZ_obj_Destroy";

if(EAT_RequirePartsMozzie) then {
	_player addMagazine "PartGeneric";
	_player addMagazine "PartGeneric";
	_player addMagazine "PartEngine";
	_player addMagazine "ItemJerrycan";
	_player addMagazine "PartVRotor";
};
if(EAT_RequireToolBoxMozzie) then {
	_player addWeapon "ItemToolbox";
};

"You have packed a mozzie!" call dayz_rollingMessages;

dayz_actionInProgress = false;

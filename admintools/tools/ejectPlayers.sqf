private ["_ct"];

_ct = cursorTarget;
_ctType = typeOf _ct;
if(isNull _ct) exitWith{"No target" call dayz_rollingMessages;};
if(!(_ct isKindOf "LandVehicle") && !(_ct isKindOf "Air") && !(_ct isKindOf "Ship")) exitWith {cutText ["Target not a vehicle", "PLAIN DOWN"];};
if ((count crew _ct) < 1) exitWith {format["There are no players in the %1", _ctType] call dayz_rollingMessages;};

_ct forceSpeed 0;
{_x action ["Eject", _ct];} forEach crew _ct;
uiSleep 5;
_ct forceSpeed -1;

private ["_ct"];

_ct = cursorTarget;
if(isNull _ct) exitWith{cutText ["No target", "PLAIN DOWN"];};
if(!(_ct isKindOf "LandVehicle") && !(_ct isKindOf "Air") && !(_ct isKindOf "Ship")) exitWith{cutText ["Target not a vehicle", "PLAIN DOWN"];};

_ct forceSpeed 0;
{_x action ["Eject", _ct];} forEach crew _ct;
Sleep 5;
_ct forceSpeed -1;

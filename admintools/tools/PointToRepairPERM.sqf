private ["_configVeh","_capacity","_vehicle","_type","_name","_hitpoints","_player","_strH"];

_vehicle = cursorTarget;
if (isNull _vehicle) exitWith {"No target" call dayz_rollingMessages;};
_type = typeOf _vehicle;
_configVeh = configFile >> "cfgVehicles" >> _type;
_capacity = getNumber(_configVeh >> "fuelCapacity");
_name = getText(configFile >> "cfgVehicles" >> _type >> "displayName");
_hitpoints = _vehicle call vehicle_getHitpoints;
_player = player;

{
    private ["_damage","_selection"];
    _damage = [_vehicle,_x] call object_getHit;

   if (_damage > 0) then {
	_vehicle setVariable[_strH,0,true];
	};
} forEach _hitpoints;

if (local _vehicle) then {
	[_vehicle,_capacity] call local_setFuel;
} else {
	PVDZ_send = [_vehicle,"SetFuel",[_vehicle,_capacity]];
	publicVariableServer "PVDZ_send";
};

PVDZ_veh_Save = [_vehicle,"repair"];
publicVariableServer "PVDZ_veh_Save";

format["%1 Repaired and Refueled", _name] call dayz_rollingMessages;

// Tool use logger
if(EAT_logMinorTool) then {
	EAT_PVEH_usageLogger = format["%1 %2 -- has repaired %3",name _player,getPlayerUID _player,_vehicle];
	publicVariableServer "EAT_PVEH_usageLogger";
};

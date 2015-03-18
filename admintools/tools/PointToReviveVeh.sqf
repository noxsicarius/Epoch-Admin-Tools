private ["_vehicle","_type","_name","_hitpoints","_player"];

_vehicle = cursorTarget;
_type = typeOf _vehicle;
_name = getText(configFile >> "cfgVehicles" >> _type >> "displayName");
_hitpoints = _vehicle call vehicle_getHitpoints;
_player = player;

for "_i" from 1 to 10 do {
	{
		private ["_damage","_selection"];
		_damage = [_vehicle,_x] call object_getHit;

		if (_damage > 0) then {
			_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _x >> "name");
			[_vehicle,_selection,0] call object_setFixServer;
		};
	} count _hitpoints;

	_vehicle setDamage 0;
	_vehicle setFuel 1;
	_vehicle setVehicleAmmo 1;
	_vehicle setVelocity [0,0,1];	
};

titleText [format["%1 repaired. Will not be drivable until server restart", _name], "PLAIN DOWN"]; titleFadeOut 3;

// Tool use logger
if(logMinorTool) then {
	usageLogger = format["%1 %2 -- has revived a %3",name _player,getPlayerUID _player,_vehicle];
	[] spawn {publicVariable "usageLogger";};
};

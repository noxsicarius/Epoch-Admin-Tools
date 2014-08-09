private ["_veh","_location","_dist","_vehtospawn","_dir"];
 
_vehtospawn = _this select 0; 
_dist = 10;
_dir = getDir vehicle player;
_location = position player findEmptyPosition [2,20,_vehtospawn];

if(count _location != 0) then {
	_veh = createVehicle [_vehtospawn, _location, [], 0, "CAN_COLLIDE"];
	_veh setVariable ["MalSar",1,true];
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	
	cutText ["Spawned a vehicle.", "PLAIN DOWN"];

	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has spawned a temporary vehicle: %3",name player,getPlayerUID player,_vehtospawn];
		[] spawn {publicVariable "usageLogger";};
	};
} else {
	cutText ["Could not find an area to spawn vehicle.", "PLAIN DOWN"];
};
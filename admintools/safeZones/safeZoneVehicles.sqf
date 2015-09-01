if (isNil "canbuild") then {canbuild = true;};
 
while {true} do {
    if(!vehicleGod2) then {
		waitUntil { !canbuild };
	 
		waitUntil { player != vehicle player };
		private ["_veh"];
	 
		_veh = vehicle player;
	 
		_veh removeAllEventHandlers "handleDamage";
		_veh addEventHandler ["handleDamage", {false}];
		_veh allowDamage false;
	 
		fnc_usec_damageVehicle ={};
		vehicle_handleDamage ={};
		vehicle_handleKilled ={};
	 
		waitUntil { canbuild };
	 
		_veh removeAllEventHandlers "handleDamage";
		_veh addEventHandler ["handleDamage", {_this select 2}];
		_veh allowDamage true;
	 
		fnc_usec_damageVehicle = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandlerVehicle.sqf";
		vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
		vehicle_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleKilled.sqf";
	};
};
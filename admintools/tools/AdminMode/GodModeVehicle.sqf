/*
	Air vehicles will explode if hit with a rocket or when crashing.
*/
private["_playerVehicle"];

if(isNil "EAT_vehicleGod2") then {EAT_vehicleGod2 = true;} else {EAT_vehicleGod2 = !EAT_vehicleGod2};

if(EAT_vehicleGod2) then {
	// Tool use logger
	if(EAT_logMajorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has ENABLED vehicle god mode",name player,getPlayerUID player];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};
};

while{alive (vehicle player) && EAT_vehicleGod2} do
{
	// Wait until player gets in a vehicle or god mode is turned off
	waitUntil{Sleep 1; ((player != (vehicle player)) || !EAT_vehicleGod2)};

	// Enable god mode only if it hasn't been turned off
	if(EAT_vehicleGod2) then {
		_playerVehicle = (vehicle player);
		_playerVehicle setfuel 1;
		_playerVehicle setdammage 0;
		
		_playerVehicle removeAllEventHandlers "handleDamage";
		_playerVehicle addEventHandler ["handleDamage", {false}];
		_playerVehicle allowDamage false;
		
		fnc_veh_handleDam ={};
		fnc_veh_handleKilled ={};
	};

	// Wait until player leaves vehicle or god mode is turned off
	waitUntil{Sleep 1; ((player == (vehicle player)) || !EAT_vehicleGod2)};

	// Disable god mode for a vehicle only if it was on
	if(!isNil "_playerVehicle" && !inZone) then {
		_playerVehicle removeAllEventHandlers "handleDamage";
		_playerVehicle addEventHandler ["handleDamage", {_this select 2}];
		_playerVehicle allowDamage true;
		
		fnc_veh_handleDam = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\veh_handleDam.sqf";
		fnc_veh_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\veh_handleKilled.sqf";
		_playerVehicle = nil;
	};
};

// Disable god mode for a vehicle only if it was on
if(!isNil "_playerVehicle" && !inZone) then {
    _playerVehicle removeAllEventHandlers "handleDamage";
    _playerVehicle addEventHandler ["handleDamage", {_this select 2}];
    _playerVehicle allowDamage true;

    vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
    fnc_veh_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\veh_handleKilled.sqf";
};
	// Tool use logger
	if(EAT_logMajorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has DISABLED vehicle god mode",name player,getPlayerUID player];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};

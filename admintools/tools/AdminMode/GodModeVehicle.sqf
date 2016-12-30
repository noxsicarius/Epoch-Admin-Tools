/*
	Air vehicles will explode if hit with a rocket or when crashing.
*/
private["_vehicle"];

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
		_vehicle = (vehicle player);
		_vehicle setfuel 1;
		_vehicle setdammage 0;
		
		_vehicle removeAllEventHandlers "handleDamage";
		_vehicle addEventHandler ["handleDamage", {false}];
		_vehicle allowDamage false;
		
		fnc_veh_handleDam ={};
		fnc_veh_handleKilled ={};
	};

	// Wait until player leaves vehicle or god mode is turned off
	waitUntil{Sleep 1; ((player == (vehicle player)) || !EAT_vehicleGod2)};

	// Disable god mode for a vehicle only if it was on
	if(!isNil "_vehicle" && !inZone) then {
		_vehicle removeAllEventHandlers "handleDamage";
		_vehicle addEventHandler ["handleDamage", {_this select 2}];
		_vehicle allowDamage true;
		
		fnc_veh_handleDam = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\veh_handleDam.sqf";
		fnc_veh_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\veh_handleKilled.sqf";
		_vehicle = nil;
	};
};

// Disable god mode for a vehicle only if it was on
if(!isNil "_vehicle" && !inZone) then {
    _vehicle removeAllEventHandlers "handleDamage";
    _vehicle addEventHandler ["handleDamage", {_this select 2}];
    _vehicle allowDamage true;

    vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
    fnc_veh_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\veh_handleKilled.sqf";
};
	// Tool use logger
	if(EAT_logMajorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has DISABLED vehicle god mode",name player,getPlayerUID player];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};

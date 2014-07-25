/*
Not 100% god mode. There is a chance the car can still be blown
up, but the chance is small. This will be a good script until
a better solution is found. DOES NOT interfere with normal god mode.
Air vehicles will explode if hit with a rocket or when crashing.
Cars will not be damaged by crashes, but will be by rockets.
*/
private ["vehicleGod","playerVehicle"];
vehicleGod = _this select 0;

if(vehicleGod) then {
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = name player + " " + getPlayerUID player + " -- " + "has ENABLED vehicle god mode";
		publicVariable "usageLogger";
	};
} else {
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = name player + " " + getPlayerUID player + " -- " + "has DISABLED Player ESP ";
		publicVariable "usageLogger";
	};
};

while{alive (vehicle player) && vehicleGod} do
{
	waitUntil{player != (vehicle player)};
	playerVehicle = (vehicle player);
	
	playerVehicle setfuel 1;
	playerVehicle setdammage 0;
	
	playerVehicle removeAllEventHandlers "handleDamage";
    playerVehicle addEventHandler ["handleDamage", {false}];
    playerVehicle allowDamage false;
 
    fnc_usec_damageVehicle ={};
    vehicle_handleDamage ={};
    vehicle_handleKilled ={};
	
	waitUntil{player == (vehicle player)};

    playerVehicle removeAllEventHandlers "handleDamage";
    playerVehicle addEventHandler ["handleDamage", {_this select 2}];
    playerVehicle allowDamage true;
	
    fnc_usec_damageVehicle = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandlerVehicle.sqf";
    vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
    vehicle_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleKilled.sqf";	
};

    playerVehicle removeAllEventHandlers "handleDamage";
    playerVehicle addEventHandler ["handleDamage", {_this select 2}];
    playerVehicle allowDamage true;

    fnc_usec_damageVehicle = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandlerVehicle.sqf";
    vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
    vehicle_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleKilled.sqf";

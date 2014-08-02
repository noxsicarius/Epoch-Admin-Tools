/*
Not 100% god mode. There is a chance the car can still be blown
up, but the chance is small. This will be a good script until
a better solution is found. DOES NOT interfere with normal god mode.
Air vehicles will explode if hit with a rocket or when crashing.
Cars will not be damaged by crashes, but will be by rockets.
*/
private ["_playerVehicle"];
vehicleGod = _this select 0;

if(vehicleGod) then {
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has ENABLED vehicle god mode",name player,getPlayerUID player];
		publicVariable "usageLogger";
	};
};
// Tool use broadcaster
if(broadcastToolUse) then {
	{
		systemChat "Admin -- has used vehicle god mode";
	} forEach playableUnits;
};

while{alive (vehicle player) && vehicleGod} do
{
	waitUntil{Sleep 1; player != (vehicle player)};
	_playerVehicle = (vehicle player);
	_playerVehicle setfuel 1;
	_playerVehicle setdammage 0;
	
	_playerVehicle removeAllEventHandlers "handleDamage";
    _playerVehicle addEventHandler ["handleDamage", {false}];
    _playerVehicle allowDamage false;
 
    fnc_usec_damageVehicle ={};
    vehicle_handleDamage ={};
    vehicle_handleKilled ={};
	
	waitUntil{Sleep 1; player == (vehicle player)};

    _playerVehicle removeAllEventHandlers "handleDamage";
    _playerVehicle addEventHandler ["handleDamage", {_this select 2}];
    _playerVehicle allowDamage true;
	
    fnc_usec_damageVehicle = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandlerVehicle.sqf";
    vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
    vehicle_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleKilled.sqf";	
};

    _playerVehicle removeAllEventHandlers "handleDamage";
    _playerVehicle addEventHandler ["handleDamage", {_this select 2}];
    _playerVehicle allowDamage true;

    fnc_usec_damageVehicle = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandlerVehicle.sqf";
    vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
    vehicle_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleKilled.sqf";

	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has DISABLED vehicle god mode",name player,getPlayerUID player];
		publicVariable "usageLogger";
	};

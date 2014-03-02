/*
Not 100% god mode. There is a chance the car can still be blown
up, but the chance is small. This will be a good script until
a better solution is found. DOES NOT interfere with normal god mode
*/


if(isNil "vehicleGod") then
{
	vehicleGod = 0;
};

if (vehicleGod == 0) then
{
	vehicleGod = 1;
	cutText ["Vehicle Auto Repair - ON", "PLAIN DOWN"];
}
else
{
	vehicleGod = 0;
	cutText ["Vehicle Auto Repair - OFF", "PLAIN DOWN"];
};

while{alive (vehicle player) && vehicleGod == 1} do
{
	vehicle player setfuel 1;
	vehicle player setdammage 0;
	vehicle player setvehicleammo 1;
	
	sleep 0.001;
};




////FOR REFERENCE PURPOSSES ONLY////

/*
// Malory's Vehicle God-Mode Script
OLD vehicle god mode ON. This script does not work, but could offer a
more permanent solution without constant vehicle repair compared
to my method above.

cutText ["Vehicle God Mode - ON", "PLAIN"];
vehicle player setfuel 1;
vehicle player setvehicleammo 1;
vehicle player setdammage 0;
player_zombieCheck = {};
fnc_usec_damageHandler = {};
fnc_usec_unconscious  = {};	
vehicle player addEventHandler ["handleDamage", {false}];
vehicle player removeAllEventHandlers "handleDamage";
vehicle player allowDamage false;
*/


/*
OLD vehicle god mode OFF

// Malory's Vehicle God-Mode Script

cutText ["Vehicle God Mode - OFF", "PLAIN"];
player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";	
vehicle player addEventHandler ["handleDamage", {true}];
vehicle player removeAllEventHandlers "handleDamage";
vehicle player allowDamage true;
vehicle player allowDamage true;
*/
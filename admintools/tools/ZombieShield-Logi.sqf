//*****************************************************************************************************************
// Zombie Shield Script

// This script is called from the AdminMainGUI.sqf
// This script does not require any parameters
//*****************************************************************************************************************

private ["_pos","_zombies","_count","_zombie","_headShots"];

// Toggle zombie shield
if (isNil "SheildMe") then {SheildMe = true;} else {SheildMe = !SheildMe;};

// If the zombie shield is on, the distance is set to 10 metres
if(SheildMe) then {
	ZombieDistance=10;
	zombieShield=true;
} else {zombieShield=false;};

// Tool use logger
if(SheildMe && zombieShield) then {
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has enabled zombie shield for distance: %3",name player,getPlayerUID player,ZombieDistance];
		[] spawn {publicVariable "usageLogger";};
	};
} else {
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has disabled zombie shield",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};
};

// Zombie shield loop
 while {SheildMe && zombieShield} do 
{
	// This counts the number of zombies within 10 metres of the player
	_pos = getPos player;
	_zombies = _pos nearEntities ["zZombie_Base",ZombieDistance];
	_count = count _zombies;

	// Loop that deletes each of the zombies
	for "_i" from 0 to (_count -1) do
	{ 
		_zombie = _zombies select _i;
		deletevehicle _zombie;
		RandomHeadshots=round(random 4);
		if (!alive _zombie) then {
			zombiekills = player getVariable["zombieKills",0];
			if (RandomHeadshots==1) then {
				_headShots = player getVariable["headShots",0];
				player setVariable["headShots",_headShots+1,true];
			};
		};
		Sleep 0.1;
	};
	Sleep 0.3;
};

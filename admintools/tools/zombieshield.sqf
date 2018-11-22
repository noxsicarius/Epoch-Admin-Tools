private["_player"];
if (isNil "SheildMe") then {SheildMe = true;} else {SheildMe = !SheildMe;};
zombieShield = false;
ZombieDistance = 0;
_player = player;

if(SheildMe) then {
	zombieDistanceScreen = 
	[
		["",true],
		["Select distance:", [-1], "", -5, [["expression", ""]], "1", "0"], 	
		["5", [2], "", -5, [["expression", "ZombieDistance=5;zombieShield=true;"]], "1", "1"],
		["10", [3], "", -5, [["expression", "ZombieDistance=10;zombieShield=true;"]], "1", "1"],
		["25", [4], "", -5, [["expression", "ZombieDistance=25;zombieShield=true;"]], "1", "1"],
		["50", [5], "", -5, [["expression", "ZombieDistance=50;zombieShield=true;"]], "1", "1"],
		["100", [6], "", -5, [["expression", "ZombieDistance=100;zombieShield=true;"]], "1", "1"],
		["500", [7], "", -5, [["expression", "ZombieDistance=500;zombieShield=true;"]], "1", "1"],	
		["1000", [8], "", -5, [["expression", "ZombieDistance=1000;zombieShield=true;"]], "1", "1"],	
		["10000", [9], "", -5, [["expression", "ZombieDistance=10000;zombieShield=true;"]], "1", "1"],	
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
	];

	showCommandingMenu "#USER:zombieDistanceScreen";
	WaitUntil{(commandingMenu == "")};
	format["Zombie shield activated with distance %1 meters!",ZombieDistance] call dayz_rollingMessages;
} else {
	zombieShield=false;
	"Zombie shield deactivated!" call dayz_rollingMessages;
};

if(SheildMe && zombieShield) then {
	// Tool use logger
	if(EAT_logMinorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has enabled zombie shield for distance: %3",name _player,getPlayerUID _player,ZombieDistance];
		publicVariableServer "EAT_PVEH_usageLogger";
	};
} else {
	// Tool use logger
	if(EAT_logMinorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has disabled zombie shield",name _player,getPlayerUID _player];
		publicVariableServer "EAT_PVEH_usageLogger";
	};
};

 while {SheildMe && zombieShield} do 
{
	private["_pos","_zombies"];
	_pos = getPos _player;
	_zombies = _pos nearEntities ["zZombie_Base",ZombieDistance];

	if((count _zombies) > 0) then {
		{
			deleteVehicle _x;
		} forEach _zombies;	
	};
};

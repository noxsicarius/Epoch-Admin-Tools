if (isNil "SheildMe") then {SheildMe = true;} else {SheildMe = !SheildMe;};
zombieShield = false;
ZombieDistance = 0;

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
	titleText [format["Zombie shield activated with distance %1 meters!",ZombieDistance],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	zombieShield=false;
};

if(SheildMe && zombieShield) then {
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has enabled zombie shield for distance: %3",name player,getPlayerUID player,ZombieDistance];
		[] spawn {publicVariable "usageLogger";};
	};
} else {
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has disabled zombie shield",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};
};

 while {SheildMe && zombieShield} do 
{
	_pos = getPos player;
	_zombies = _pos nearEntities ["zZombie_Base",ZombieDistance];
	_count = count _zombies;

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
titleText ["Zombie shield deactivated!","PLAIN DOWN"]; titleFadeOut 4;

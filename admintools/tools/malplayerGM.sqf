// Malory's Player God-Mode Script

if (isNil "malpgm") then
{
	malpgm = 0;
};

if (malpgm == 0) then
{
	malpgm = 1;
    cutText ["Player and Zombie God Mode - ON", "PLAIN"];
	player_zombieCheck = {};
	fnc_usec_damageHandler = {};
	fnc_usec_unconscious  = {};	
	player addEventHandler ["handleDamage", {false}];
	player removeAllEventHandlers "handleDamage";
	player allowDamage false;
	while {malpgm == 1} do
	{
	};
}
	
else
{
	malpgm = 0;
    cutText ["Player and Zombie God Mode - OFF", "PLAIN"];
	player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
	fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
	fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";	
	player addEventHandler ["handleDamage", {true}];
	player removeAllEventHandlers "handleDamage";
	player allowDamage true;
};




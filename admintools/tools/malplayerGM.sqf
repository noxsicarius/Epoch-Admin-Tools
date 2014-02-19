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
	(vehicle player) removeAllEventHandlers "handleDamage";
	(vehicle player) addEventHandler ["handleDamage", { false }];	
	(vehicle player) allowDamage false;
	r_player_unconscious = false;
	r_player_infected = false;
	r_player_injured = false;
	r_player_inpain = false;
	r_fracture_legs = false;
	r_fracture_arms = false;
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

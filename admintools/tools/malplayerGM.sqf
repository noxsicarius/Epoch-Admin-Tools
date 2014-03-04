// Malory's Player God-Mode Script
// Heals all problems and removes damage

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
	(vehicle player) removeAllEventHandlers "handleDamage";
	(vehicle player) addEventHandler ["handleDamage", { false }];	
	(vehicle player) allowDamage false;
	r_player_unconscious = false;
	r_player_infected = false;
	r_player_injured = false;
	r_player_inpain = false;
	r_player_loaded = flase;
	r_player_cardiac = false;
	r_player_lowblood = false;
	r_fracture_legs = false;
	r_fracture_arms = false;
	r_player_blood = 11999;
	r_player_timeout =		0;
	r_handlerCount = 		0;
	dayz_sourceBleeding = objNull;
	dayz_hunger	= 0;
	dayz_thirst = 0;
	dayz_temperatur = 100;
	disableUserInput false;
	player setVariable ["USEC_injured",false,true];
	{player setVariable[_x,false,true];} forEach USEC_woundHit;
	player setVariable ["unconsciousTime", r_player_timeout, true];
	player setHit ['legs',0];
	player setVariable ['hit_legs',0,false];
	player setVariable['medForceUpdate',true,true];
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

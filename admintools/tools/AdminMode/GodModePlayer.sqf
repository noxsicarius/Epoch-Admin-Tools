/* 
	Heals all damage and makes the user invincible to damage by everything 
	excluding antihack killing a hacker.
*/
if(isNil "playerGod2") then {playerGod2 = true;} else {playerGod2 = !playerGod2};

private["_player","_vehicle"];
_player = player;
_vehicle = (vehicle _player);

if (playerGod2) then
{
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has ENABLED _player god mode",name _player,getPlayerUID _player];
		[] spawn {publicVariable "usageLogger";};
	};

	player_zombieCheck = {};
	fnc_usec_damageHandler = {};
	fnc_usec_unconscious = {};
	_vehicle removeAllEventHandlers "handleDamage";
	_vehicle addEventHandler ["handleDamage", { false }];	
	_vehicle allowDamage false;
	r_player_unconscious = false;
	r_player_infected = false;
	r_player_injured = false;
	r_player_inpain = false;
	r_player_loaded = false;
	r_player_cardiac = false;
	r_player_lowblood = false;
	r_fracture_legs = false;
	r_fracture_arms = false;
	r_player_blood = 11999;
	r_player_timeout = 0;
	r_handlerCount = 0;
	dayz_sourceBleeding = objNull;
	dayz_hunger	= 0;
	dayz_thirst = 0;
	dayz_temperatur = 100;
	disableUserInput false;
	_player setVariable ["USEC_injured",false,true];
	{_player setVariable[_x,false,true];} forEach USEC_woundHit;
	_player setVariable ["unconsciousTime", r_player_timeout, true];
	_player setHit ['legs',0];
	_player setVariable ['hit_legs',0,false];
	_player setVariable['medForceUpdate',true,true];
} else {
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has DISABLED _player god mode",name _player,getPlayerUID _player];
		[] spawn {publicVariable "usageLogger";};
	};
	// Tool use broadcaster
	if(!((getPlayerUID _player) in SuperAdminList) && broadcastToolUse) then {
		useBroadcaster = format["%1 -- has DISABLED god mode",name _player];
		[] spawn {publicVariableServer "useBroadcaster";};
	};

	player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
	fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
	fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";	
	_player addEventHandler ["handleDamage", {true}];
	_player removeAllEventHandlers "handleDamage";
	_player allowDamage true;
};
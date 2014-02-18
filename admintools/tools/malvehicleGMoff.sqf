// Malory's Vehicle God-Mode Script

cutText ["Vehicle God Mode - OFF", "PLAIN"];
player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";	
vehicle player addEventHandler ["handleDamage", {true}];
vehicle player removeAllEventHandlers "handleDamage";
vehicle player allowDamage true;
vehicle player allowDamage true;
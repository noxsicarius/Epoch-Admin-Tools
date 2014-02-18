// Malory's Vehicle God-Mode Script

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
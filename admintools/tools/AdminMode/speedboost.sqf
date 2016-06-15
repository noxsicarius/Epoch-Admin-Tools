if(isNil "EAT_speedBoost2") then {EAT_speedBoost2 = true;} else {EAT_speedBoost2 = !EAT_speedBoost2};

if (EAT_speedBoost2) then {
	// Tool use logger
	if(EAT_logMinorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has ENABLED speed boost",name player,getPlayerUID player];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};

	waituntil {!isnull (finddisplay 46)};
	SPEED_UP =(findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call MY_KEYDOWN_FNC;false;"];

	MY_KEYDOWN_FNC = {
		private["_vehicle","_nos","_supgrade"];
		_vehicle = vehicle player;
		if(_vehicle == player)exitwith{};

		_nos = _vehicle getvariable "nitro";
		_supgrade = _vehicle getvariable "supgrade";

		if(isEngineOn _vehicle) then
		{
			switch (_this) do {
				case 17: {
					if(!isnil "_supgrade") then {
						_vehicle SetVelocity [(velocity _vehicle select 0) * 1.011, (velocity _vehicle select 1) *1.011, (velocity _vehicle select 2) * 0.99];
					} else {
						_vehicle setvariable ["supgrade", 1, true];
					};
				};
				case 42: {
					if(!isnil "_nos") then {
						_vehicle setVelocity [(velocity _vehicle select 0) * 1.01, (velocity _vehicle select 1) * 1.01, (velocity _vehicle select 2) * 0.99];
					} else {
						_vehicle setvariable ["nitro", 1, true];
					};
				};
			};
		};
	};
}else{
	// Tool use logger
	if(EAT_logMinorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has DISABLED speed boost",name player,getPlayerUID player];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};

	(findDisplay 46) displayRemoveEventHandler ["KeyDown", SPEED_UP];
};

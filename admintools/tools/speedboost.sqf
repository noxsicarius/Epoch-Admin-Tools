if (isNil "speedToggle") then {speedToggle = true;} else { speedToggle = !speedToggle;};

if (speedToggle) then {
	waituntil {!isnull (finddisplay 46)};
	SPEED_UP =(findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call MY_KEYDOWN_FNC;false;"];

	MY_KEYDOWN_FNC = {

		_vcl = vehicle player;
		if(_vcl == player)exitwith{};

		_nos = _vcl getvariable "nitro";
		_supgrade = _vcl getvariable "supgrade";

		if(isEngineOn _vcl) then
		{
			switch (_this) do {
				case 17: {
					if(isEngineOn _vcl and !isnil "_supgrade") then
					{
						_vcl SetVelocity [(velocity _vcl select 0) * 1.011, (velocity _vcl select 1) *1.011, (velocity _vcl select 2) * 0.99];
					} else {_vcl setvariable ["supgrade", 1, true];};
				};
				case 42: {
					if(isEngineOn _vcl and !isnil "_nos") then
					{
						_vcl setVelocity [(velocity _vcl select 0) * 1.01, (velocity _vcl select 1) * 1.01, (velocity _vcl select 2) * 0.99];
					} else {_vcl setvariable ["nitro", 1, true];};
				};
			};
		};
	};
	titleText ["Speed Boost - ON","PLAIN DOWN"];titleFadeOut 2;
}
else{
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", SPEED_UP];
	titleText ["Speed Boost - OFF","PLAIN DOWN"];titleFadeOut 2;
};

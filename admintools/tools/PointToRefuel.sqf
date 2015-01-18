// Temporary refuel
private ["_ct","_player"];
_ct = cursorTarget;
_player = player;

if (_ct isKindOf "LandVehicle" || _ct isKindOf "Air" || _ct isKindOf "Ship") then {
	_ct setfuel 1;
	cutText ["Point to Refuel Successful", "PLAIN"];
	
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has temporarily refueld %3",name _player,getPlayerUID _player,_ct];
		[] spawn {publicVariable "usageLogger";};
	};
};
// Temporary refuel
private ["_ct"];
_ct = cursorTarget;

if (_ct isKindOf "LandVehicle" || _ct isKindOf "Air" || _ct isKindOf "Ship") then {
	_ct setfuel 1;
	cutText ["Point to Refuel Successful", "PLAIN"];
	
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has temporarily refueld %3",name player,getPlayerUID player,_ct];
		[] spawn {publicVariable "usageLogger";};
	};
};
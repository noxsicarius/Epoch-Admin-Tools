// Toggle grass on or off for better visibility/performance

private ["_grassToggle"];
_grassToggle = _this select 0;

if (_grassToggle) then {
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = name player + " " + getPlayerUID player + " -- " + "has turned grass off";
		publicVariable "usageLogger";
	};

	setterraingrid 50;
}else{
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = name player + " " + getPlayerUID player + " -- " + "has turned grass back on";
		publicVariable "usageLogger";
	};

	setterraingrid 25;
};
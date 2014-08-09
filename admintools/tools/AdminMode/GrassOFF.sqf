// Toggle grass on or off for better visibility/performance

private ["_grassToggle"];
_grassToggle = _this select 0;

if (_grassToggle) then {
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has turned grass off",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};

	setterraingrid 50;
}else{
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has turned grass back on",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};

	setterraingrid 25;
};
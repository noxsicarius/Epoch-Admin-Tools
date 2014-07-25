// This file should not be modified
adminBuild = _this select 0;

if(adminBuild) then {
	DZE_StaticConstructionCount = 1;
	DZE_requireplot = 0;

	// Tool use logger
	if(logToolUse) then {
		usageLogger = name player + " " + getPlayerUID player + " -- " + "has ENABLED admin build";
		publicVariable "usageLogger";
	};

} else {
	DZE_StaticConstructionCount = 0;
	DZE_requireplot = 1;
	
	// Tool use logger
	if(logToolUse) then {
		usageLogger = name player + " " + getPlayerUID player + " -- " + "has DISABLED admin build ";
		publicVariable "usageLogger";
	};

};
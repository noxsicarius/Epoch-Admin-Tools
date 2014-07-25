// This file should not be modified
adminBuild = _this select 0;

if(adminBuild) then {
	DZE_StaticConstructionCount = 1;
	DZE_requireplot = 0;

	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has ENABLED admin build",name player,getPlayerUID player];
		publicVariable "usageLogger";
	};

} else {
	DZE_StaticConstructionCount = 0;
	DZE_requireplot = 1;
	
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has DISABLED	admin build",name player,getPlayerUID player];
		publicVariable "usageLogger";
	};
};
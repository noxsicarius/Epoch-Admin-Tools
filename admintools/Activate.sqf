
waitUntil{!isNil "adminListLoaded"}; // Wait for adminlist before starting

// Start of tool activation
if ((getPlayerUID player) in AdminList || (getPlayerUID player) in ModList) then {
	private["_veh", "_idx"];
	_idx = -1;

	// Wait for the character to load all required items
	waitUntil {!isNil "dayz_animalCheck"}; 

	// Load key macros
	[]execVM "admintools\KeyBindings\FunctionKeys.sqf";
	[]execVM "admintools\KeyBindings\NumberKeys.sqf";
	
	// Tool use logger
	if(logMajorTool || logMinorTool) then {
		usageLogger = format["%1 %2 -- has logged on",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};

	while {alive player} do
	{
		if(toolsAreActive) then
		{
			if (_idx == -1) then
			{
				_idx = (vehicle player) addaction [("<t color=""#585858"">" + ("Admin Menu") +"</t>"),"admintools\AdminToolsMain.sqf","",7,false,true,"",""];
				_veh = vehicle player;
			};
			if (_veh != vehicle player) then
			{
				_veh removeAction _idx;
				_idx = -1;      
			};
		}else{
			if(_idx != -1) then {
				_veh removeAction _idx;
				_idx = -1;
			};
		};
		Sleep 2;
	};
	
	_veh removeAction _idx;
	_idx = -1;
};
waitUntil {!isNil "dayz_animalCheck"}; // Wait for the character to load all required items

// Give players action menu
if((ActionMenuPlayers && !((getPlayerUID player) in AdminAndModList)) || (ActionMenuAdmins && ((getPlayerUID player) in AdminAndModList))) then {
	[] spawn {
		_idx = -1;
		_veh = vehicle player;

		while {alive player} do {
			if(_idx == -1) then {
				_idx = (vehicle player) addaction [("<t color=""#FE9A2E"">" + ("Action Menu") + "</t>"),"admintools\actionMenu\ActionsMenu.sqf","",-107,false,true,"",""];
				_veh = vehicle player;
			};
			if (_veh != vehicle player) then
			{
				_veh removeAction _idx;
				_idx = -1;      
			};
			Sleep 2;
		};
	};
};


// Give admins the admin menu
if ((getPlayerUID player) in AdminAndModList) then {
	[] spawn {
		_idx = -1;
		_veh = vehicle player;

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
			Sleep 2;
		};
		
		_veh removeAction _idx;
		_idx = -1;
	};
};
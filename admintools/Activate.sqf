private["_player"];

waitUntil {!isNil "adminListLoaded"}; // Wait for adminlist before starting
waitUntil {!isNil "dayz_animalCheck"}; // Wait for the character to load all required items

_player = player;

// Give players action menu
if((ActionMenuPlayers && !(((getPlayerUID _player) in AdminAndModList))) || (ActionMenuAdmins && ((getPlayerUID _player) in AdminAndModList))) then {
	[] spawn {
		private["_veh", "_idx"];
		_idx = -1;
		_veh = vehicle _player;

		while {alive player} do {
			if(_idx == -1) then {
				_idx = (vehicle _player) addaction [("<t color=""#FE9A2E"">" + ("Action Menu") + "</t>"),"admintools\actionMenu\Actions_Menu.sqf","",-107,false,true,"",""];
				_veh = vehicle _player;
			};
			if (_veh != vehicle _player) then
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
		private["_veh", "_idx"];
		_idx = -1;
		_veh = vehicle _player;

		// Load key macros
		[]execVM "admintools\KeyBindings\FunctionKeys.sqf";
		[]execVM "admintools\KeyBindings\NumberKeys.sqf";
		
		// Tool use logger
		if(logMajorTool || logMinorTool) then {
			usageLogger = format["%1 %2 -- has logged on",name _player,getPlayerUID _player];
			[] spawn {publicVariable "usageLogger";};
		};

		while {alive player} do
		{
			if(toolsAreActive) then
			{
				if (_idx == -1) then
				{
					_idx = (vehicle _player) addaction [("<t color=""#585858"">" + ("Admin Menu") +"</t>"),"admintools\AdminToolsMain.sqf","",7,false,true,"",""];
					_veh = vehicle _player;
				};
				if (_veh != vehicle _player) then
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
};
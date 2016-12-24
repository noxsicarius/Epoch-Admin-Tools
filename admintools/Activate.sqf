// Give players action menu
if((EAT_ActionMenuPlayers && !EAT_isAdmin) || (EAT_ActionMenuAdmins && EAT_isAdmin)) then {
	[] spawn {
		_idx = -1;
		_veh = vehicle player;

		while {alive player} do {
			if(_idx == -1) then {
				_idx = (vehicle player) addaction [("<t color=""#FE9A2E"">" + ("Action Menu") + "</t>"),"admintools\actionMenu\ActionsMenu.sqf","",-107,false,true,"",""];
				_veh = vehicle player;
			};
			if (_veh != vehicle player) then {
				_veh removeAction _idx;
				_idx = -1;      
			};
			Sleep 2;
		};
	};
};

// Give admins the admin menu
if (EAT_isAdmin) then {
	[] spawn {
		_idx = -1;
		_veh = vehicle player;

		// Load key macros
		[]execVM "admintools\KeyBindings\FunctionKeys.sqf";
		[]execVM "admintools\KeyBindings\NumberKeys.sqf";
		
		// Tool use logger
		if(EAT_logMajorTool || EAT_logMinorTool) then {
			EAT_PVEH_usageLogger = format["%1 %2 -- has logged on",name player,getPlayerUID player];
			[] spawn {publicVariable "EAT_PVEH_usageLogger";};
		};

		while {alive player} do
		{
			if (_idx == -1) then {
				_idx = (vehicle player) addaction [("<t color=""#585858"">" + ("Admin Menu") +"</t>"),"admintools\AdminToolsMain.sqf","",7,false,true,"",""];
				_veh = vehicle player;
			};
			if (_veh != vehicle player) then {
				_veh removeAction _idx;
				_idx = -1;      
			};
			Sleep 2;
		};
		
		_veh removeAction _idx;
		_idx = -1;
	};
};

// Start safezone scripts if enabled
if(EAT_safeZones && !isServer) then {[] spawn {[] ExecVM "admintools\safeZones\safeZones.sqf";};};

diag_log("Admin Tools: Activate.sqf loaded");
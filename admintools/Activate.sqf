// Give players action menu
if((EAT_ActionMenuPlayers && !EAT_isAdmin && EAT_ActionMenuHotkey) || (EAT_ActionMenuAdmins && EAT_isAdmin && EAT_ActionMenuHotkey)) then {
	//accent grave key used to activate the action menu
	Tab_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 15) then {[] execVM ""admintools\actionMenu\ActionsMenu.sqf"";true};"];
} else {
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
				uiSleep 2;
			};
		};
	};
};


if (EAT_isAdmin && EAT_AdminMenuHotkey) then {
	//Use hotkey option to activate admin tools
	F2_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 60) then {[] execVM ""admintools\AdminToolsMain.sqf"";true};"];
	// Load key macros
	[]execVM "admintools\KeyBindings\FunctionKeys.sqf";
	[]execVM "admintools\KeyBindings\NumberKeys.sqf";
	
	// Tool use logger
	if(EAT_logMajorTool || EAT_logMinorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has logged on",name player,getPlayerUID player];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};
} else {
	// Give admins the admin menu (self action)
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
};
// Start Debug Monitor if enabled
if (EAT_DebugMonitor && !isDedicated) then {[] execVM "admintools\debug_monitor\debug_monitor.sqf";
	// The Insert key is used for toggling the debug monitor
	Ins_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 210) then {[] execVM ""admintools\debug_monitor\debug_monitor.sqf"";true};"];
};
// Start safezone scripts if enabled
if(EAT_safeZones && !isServer) then {[] spawn {[] ExecVM "admintools\safeZones\safeZones.sqf";};};

diag_log("Admin Tools: Activate.sqf loaded");

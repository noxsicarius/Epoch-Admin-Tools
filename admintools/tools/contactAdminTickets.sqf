EAT_helpQueueMenu =
[
["",true],
	["Teleport to player", [], "", -5, [["expression", "[] spawn fn_tpToPlayer"]], "1", "1"],
	["Teleport player to you", [], "", -5, [["expression", "[] spawn fn_tpToMe"]], "1", "1"],
	["Return Player to Last Pos",[],"", -5, [["expression", format[_EXECgenTools, "Teleport\returnPlayerTP.sqf"]]], "1", "1"],
	["Remove a player from queue", [], "", -5, [["expression", "[] spawn fn_removeFromQueue"]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", ""]], "1", "1"]
];
	
fn_tpToPlayer = {
	private ["_name","_pmenu","_max","_player","_menuCheckOk"];
	_player = player; _menuCheckOk = false; _max = 10; _j = 0;

	snext = false; plist = []; pselect5 = "";
	{plist set [count plist, _x];} forEach EAT_helpQueue;
	EAT_pMenuTitle = "Teleport to Player:";

	while {pselect5 == "" && !_menuCheckOk} do
	{
		[_j, (_j + _max) min (count plist)] call EAT_fnc_playerSelect; _j = _j + _max;
		WaitUntil {pselect5 != "" || snext || commandingMenu == ""};
		_menuCheckOk = (commandingMenu == "");
		snext = false;
	};

	if (pselect5 != "exit" && pselect5 != "") then
	{
		_name = pselect5;

		{
			scopeName "fn_tpToPlayer";
			if(name _x == _name) then
			{
				if(alive _x) then {
					titleText[format["Teleporting to %1", _name],"PLAIN DOWN"];
					(vehicle _player) attachTo [_x, [2, 2, 0]];
					sleep 0.25;
					detach (vehicle _player);

					// Tool use logger
					if(EAT_logMinorTool) then {
						EAT_PVEH_usageLogger = format["%1 %2 -- has teleported to %3 for a ticket",name _player,getPlayerUID _player,_name];
						[] spawn {publicVariable "EAT_PVEH_usageLogger";};
					};
				} else {
					cutText[format["%1 is no longer alive, removing from queue",_name],"PLAIN DOWN",2];
				};
				breakOut "fn_tpToPlayer";
			};
		} forEach entities "CAManBase";
		
		EAT_helpQueue = EAT_helpQueue - [_name];
		EAT_PVEH_contactAdmin = ["remove", _name];
		[] spawn {publicVariable "EAT_PVEH_contactAdmin";};
	};
	true
};

fn_tpToMe = {
	private ["_name","_pmenu","_max","_UID","_player","_menuCheckOk"];
	_player = player; _menuCheckOk = false; _j = 0; _max = 10;
	
	snext = false; plist = []; pselect5 = "";
	{plist set [count plist, _x];} forEach EAT_helpQueue;
	EAT_pMenuTitle = "Teleport to Me:";

	while {pselect5 == "" && !_menuCheckOk} do
	{
		[_j, (_j + _max) min (count plist)] call EAT_fnc_playerSelect; _j = _j + _max;
		WaitUntil {pselect5 != "" || snext || commandingMenu == ""};
		_menuCheckOk = (commandingMenu == "");
		snext = false;
	};

	if (pselect5 != "exit" && pselect5 != "") then
	{
		_name = pselect5;

		{
			scopeName "fn_tpToMe";
			if(name _x == _name) then
			{
				if(alive _x) then {
					_UID = (getPlayerUID _x);
					
					EAT_returnPlayer = [_x, (getPos _x)]; // Used to return player to last position

					EAT_PVEH_teleportFix = ["add",_UID];
					publicVariableServer "EAT_PVEH_teleportFix";
					
					titleText[format["Teleporting %1", _name],"PLAIN DOWN"];

					sleep 1; // Give the server time to register the antihack bypass.
					_x attachTo [vehicle _player, [2, 2, 0]];
					sleep 0.25;
					detach _x;

					Sleep 3;
					EAT_PVEH_teleportFix = ["remove",_UID];
					[] spawn {publicVariableServer "EAT_PVEH_teleportFix"};
					
					// Tool use logger
					if(EAT_logMinorTool) then {
						EAT_PVEH_usageLogger = format["%1 %2 -- has teleported %3 to them for a ticket",name _player,getPlayerUID _player,_name];
						[] spawn {publicVariable "EAT_PVEH_usageLogger";};
					};
				} else {
					cutText["Player is no longer alive, removing from queue","PLAIN DOWN",2];
				};

				breakOut "fn_tpToMe";
			};
		} forEach entities "CAManBase";
		
		EAT_helpQueue = EAT_helpQueue - [_name];
		EAT_PVEH_contactAdmin = ["remove", _name];
		[] spawn {publicVariable "EAT_PVEH_contactAdmin";};
	};
	true
};

fn_removeFromQueue = {
	private ["_name","_pmenu","_max","_player","_menuCheckOk"];
	_player = player; _menuCheckOk = false; _j = 0; _max = 10;

	snext = false; plist = []; pselect5 = "";
	{plist set [count plist, _x];} forEach EAT_helpQueue;
	EAT_pMenuTitle = "Remove Player from Queue";

	while {pselect5 == "" && !_menuCheckOk} do
	{
		[_j, (_j + _max) min (count plist)] call EAT_fnc_playerSelect; _j = _j + _max;
		WaitUntil {pselect5 != "" || snext || commandingMenu == ""};
		_menuCheckOk = (commandingMenu == "");
		snext = false;
	};

	if (pselect5 != "exit" && pselect5 != "") then
	{
		_name = pselect5;
		EAT_helpQueue = EAT_helpQueue - [_name];
		EAT_PVEH_contactAdmin = ["remove", _name];
		[] spawn {publicVariable "EAT_PVEH_contactAdmin";};
	};

	true
};

showCommandingMenu "#USER:EAT_helpQueueMenu";

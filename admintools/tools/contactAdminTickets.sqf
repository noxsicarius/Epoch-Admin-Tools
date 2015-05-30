helpQueueMenu =
[
["",true],
	["Teleport to player", [], "", -5, [["expression", "[] spawn fn_tpToPlayer"]], "1", "1"],
	["Teleport player to you", [], "", -5, [["expression", "[] spawn fn_tpToMe"]], "1", "1"],
	["Remove a player from queue", [], "", -5, [["expression", "[] spawn fn_removeFromQueue"]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", ""]], "1", "1"]
];
	
fn_tpToPlayer = {
	private ["_name","_pmenu","_max","_player"];
	_player = player; _j = 0; _max = 10;

	snext = false; plist = []; pselect5 = "";
	{plist set [count plist, _x];} forEach helpQueue;
	pMenuTitle = "Teleport to Player:";

	while {pselect5 == ""} do
	{
		[_j, (_j + _max) min (count plist)] call fn_smenu; _j = _j + _max;
		WaitUntil {pselect5 != "" or snext};
		snext = false;
	};

	if (pselect5 != "exit") then
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
					if(logMinorTool) then {
						usageLogger = format["%1 %2 -- has teleported to %3 for a ticket",name _player,getPlayerUID _player,_name];
						[] spawn {publicVariable "usageLogger";};
					};
				} else {
					cutText["Player is no longer alive, removing from queue","PLAIN DOWN",2];
				};
				breakOut "fn_tpToPlayer";
			};
		} forEach entities "CAManBase";
		
		EAT_contactAdminServer = ["remove", _name];
		[] spawn {publicVariable "EAT_contactAdminServer";};
	};
	true
};

fn_tpToMe = {
	private ["_name","_pmenu","_max","_UID","_player"];
	_player = player; _j = 0; _max = 10;
	
	snext = false; plist = []; pselect5 = "";
	{plist set [count plist, _x];} forEach helpQueue;
	pMenuTitle = "Teleport to Me:";

	while {pselect5 == ""} do
	{
		[_j, (_j + _max) min (count plist)] call fn_smenu; _j = _j + _max;
		WaitUntil {pselect5 != "" or snext};	
		snext = false;
	};

	if (pselect5 != "exit") then
	{
		_name = pselect5;

		{
			scopeName "fn_tpToMe";
			if(name _x == _name) then
			{
				if(alive _x) then {
					_UID = (getPlayerUID _x);

					EAT_teleportFixServer = ["add",_UID];
					publicVariableServer "EAT_teleportFixServer";
					
					titleText[format["Teleporting %1", _name],"PLAIN DOWN"];
					
					_x attachTo [vehicle _player, [2, 2, 0]];
					sleep 0.25;
					detach _x;

					Sleep 3;
					EAT_teleportFixServer = ["remove",_UID];
					[] spawn {publicVariableServer "EAT_teleportFixServer"};
					
					// Tool use logger
					if(logMinorTool) then {
						usageLogger = format["%1 %2 -- has teleported %3 to them for a ticket",name _player,getPlayerUID _player,_name];
						[] spawn {publicVariable "usageLogger";};
					};
					// Tool use broadcaster
					if(!((getPlayerUID _player) in SuperAdminList) && broadcastToolUse) then {
						useBroadcaster = format["%1 -- has teleported %2 to them for a ticket ",name _player, _name];
						[] spawn {publicVariableServer "useBroadcaster";};
					};
				} else {
					cutText["Player is no longer alive, removing from queue","PLAIN DOWN",2];
				};

				breakOut "fn_tpToMe";
			};
		} forEach entities "CAManBase";

		EAT_contactAdminServer = ["remove", _name];
		[] spawn {publicVariable "EAT_contactAdminServer";};
	};
	true
};

fn_removeFromQueue = {
	private ["_name","_pmenu","_max","_player"];
	_player = player; _j = 0; _max = 10;

	snext = false; plist = []; pselect5 = "";
	{plist set [count plist, _x];} forEach helpQueue;
	pMenuTitle = "Remove Player from Queue";

	while {pselect5 == ""} do
	{
		[_j, (_j + _max) min (count plist)] call fn_smenu; _j = _j + _max;
		WaitUntil {pselect5 != "" or snext};
		snext = false;
	};

	if (pselect5 != "exit") then
	{
		_name = pselect5;
		EAT_contactAdminServer = ["remove", _name];
		[] spawn {publicVariable "EAT_contactAdminServer";};
	};

	true
};

showCommandingMenu "#USER:helpQueueMenu";

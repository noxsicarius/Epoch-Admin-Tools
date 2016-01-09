private["_max","_j","_menuCheckOk"];
_menuCheckOk = false; _max = 10; _j = 0;
snext = false; plist = []; pselect5 = "";

{if ((_x != player) && (getPlayerUID _x != "")) then {plist set [count plist, name _x];};} forEach entities "CAManBase";
{if ((count crew _x) > 0) then {{if ((_x != player) && (getPlayerUID _x != "")) then {plist set [count plist, name _x];};} forEach crew _x;};} foreach (entities "LandVehicle" + entities "Air" + entities "Ship");

pMenuTitle = "Teleport to Me:";

while {pselect5 == "" && !_menuCheckOk} do
{
	[_j, (_j + _max) min (count plist)] call fn_smenu; _j = _j + _max;
	WaitUntil {pselect5 != "" || snext || commandingMenu == ""};
	_menuCheckOk = (commandingMenu == "");
	snext = false;
};

if (pselect5 != "exit") then {
	_name = pselect5;
	
	{
		scopeName "fn_tpToMe";
		if(name _x == _name) then {
			_UID = (getPlayerUID _x);
			
			tempList = tempList + _x;
			EAT_PVEH_teleportFix = ["add",_UID];
			publicVariableServer "EAT_PVEH_teleportFix";
			
			titleText[format["Teleporting %1", _name],"PLAIN DOWN"];
			
			sleep 3; // Give the server time to register the antihack bypass.
			if(vehicle _x != _x) then {
				(vehicle _x) attachTo [vehicle player, [5, 5, 0]];
			} else {
				_x attachTo [vehicle player, [2, 2, 0]];
			};
			
			sleep 0.25;
			detach _x;
			
			Sleep 3;
			tempList = tempList - _x;
			EAT_PVEH_teleportFix = ["remove",_UID];
			[] spawn {publicVariableServer "EAT_PVEH_teleportFix"};
			
			// Tool use logger
			if(EAT_logMajorTool) then {
				EAT_PVEH_usageLogger = format["%1 %2 -- has teleported %3_%4 to them",name player,getPlayerUID player,_name,_UID];
				[] spawn {publicVariable "EAT_PVEH_usageLogger";};
			};
			breakOut "fn_tpToMe";
		};
	} forEach entities "CAManBase";
};
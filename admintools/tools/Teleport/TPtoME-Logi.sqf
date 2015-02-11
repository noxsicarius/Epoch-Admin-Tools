//**************************************************************************************************************************************
// Teleport To Me Script

// This script requires 1 parameter (player name)
// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_name","_UID","_message"];

_name = _this select 0;

{
	if(name _x == _name) then
	{
		_UID = (getPlayerUID _x);

		EAT_teleportFixServer = ["add",_UID];
		publicVariableServer "EAT_teleportFixServer";
		
		// Display a message to the admin that called the script
		_message = format ["Teleporting %1!", name _selectedPlayer];
		[_message] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";
		
		_x attachTo [vehicle player, [2, 2, 0]];
		sleep 0.25;
		detach _x;

		Sleep 3;
		EAT_teleportFixServer = ["remove",_UID];
		[] spawn {publicVariableServer "EAT_teleportFixServer"};
		
		// Tool use logger
		if(logMajorTool) then {
			usageLogger = format["%1 %2 -- has teleported %3_%4 to them",name player,getPlayerUID player,_name,_UID];
			[] spawn {publicVariable "usageLogger";};
		};
		// Tool use broadcaster
		if(!((getPlayerUID player) in SuperAdminList) && broadcastToolUse) then {
			useBroadcaster = format["%1 -- has teleported %2 to them",name player, _name];
			[] spawn {publicVariableServer "useBroadcaster";};
		};
	};
} forEach entities "CAManBase";

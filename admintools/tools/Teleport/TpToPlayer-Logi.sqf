//**************************************************************************************************************************************
// Teleport To Player Script

// This script requires 1 parameter (player name)
// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_name","_message"];

_name = _this select 0;

{
	if(name _x == _name) then
	{
		// Display a message to the admin that called the script
		_message = format ["Teleporting to %1!", name _selectedPlayer];
		[_message] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";
		
		(vehicle player) attachTo [_x, [2, 2, 0]];
		sleep 0.25;
		detach (vehicle player);

		// Tool use logger
		if(logMajorTool) then {
			usageLogger = format["%1 %2 -- has teleported to %3_%4",name player,getPlayerUID player,_name,_x];
			[] spawn {publicVariable "usageLogger";};
		};
		// Tool use broadcaster
		if(!((getPlayerUID player) in SuperAdminList) && broadcastToolUse) then {
			useBroadcaster = format["%1 -- has teleported to %2",name player,_name];
			[] spawn {publicVariableServer "useBroadcaster";};
		};
	};
} forEach entities "CAManBase";

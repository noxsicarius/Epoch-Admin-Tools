//**************************************************************************************************************************************
// Spectate Player Script 

// This script requires 1 parameter (player name)
// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_name","_currentCameraView"];

_name = _this select 0;
_currentCameraView = cameraView;
spectate = true;

{
	if(format[name _x] == _name) then 
	{
		F7_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 65) then {spectate = false;};"];	
		(vehicle _x) switchCamera "EXTERNAL";

		["Press F7 to cancel spectating!"] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";

		waitUntil { !(alive _x) or !(alive player) or !(spectate)};
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", F7_KEY];
		player switchCamera _currentCameraView;	

		// Tool use logger
		if(logMajorTool) then {
			usageLogger = format["%1 %2 -- has begun spectating %3",name player,getPlayerUID player,_name];
			[] spawn {publicVariable "usageLogger";};
		};
		// Tool use broadcaster
		if(!((getPlayerUID player) in SuperAdminList) && broadcastToolUse) then {
			useBroadcaster = format["%1 -- is spectating %2",name player,_name];
			[] spawn {publicVariableServer "useBroadcaster";};
		};
	};
} forEach playableUnits;

spectate = false;

if (!spectate) then 
{	
	["Spectate finished!"] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";

	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has stopped spectating %3",name player,getPlayerUID player,_name];
		[] spawn {publicVariable "usageLogger";};
	};
};

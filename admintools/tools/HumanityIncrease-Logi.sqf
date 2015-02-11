//**************************************************************************************************************************************
// Humanity Increase Script

// This script requires 1 parameter (player)
// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_selectedPlayer","_humanityChange","_humanity","_message"];

// Sets the selected player as the first parameter
_selectedPlayer = _this select 0;

// Increases the selected players humanity by 1000
_humanityChange = 1000;
_humanity = _selectedPlayer getVariable["humanity", 0];
_selectedPlayer setVariable["humanity", _humanity + _humanityChange, true];

// Display a message to the admin that called the script
_message = format ["You have given %1 humanity to %3. %3's humanity is now %2!", _humanityChange, _humanity + _humanityChange, name _selectedPlayer];
[_message] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";

// Tool use logger
if(logMinorTool) then {
	usageLogger = format["%1 %2 -- has added %3 to %4's humanity (total %5)",name player,getPlayerUID player,_humanityChange,name _selectedPlayer,_humanity + _humanityChange];
	[] spawn {publicVariable "usageLogger";};
};

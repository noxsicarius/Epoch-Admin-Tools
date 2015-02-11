//**************************************************************************************************************************************
// Eject Player From Vehicle Script

// This script requires 1 parameter (player name)
// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_playerName","_message"];

// Sets the selected players name as the first parameter
_playerName = _this select 0;

// Loop for each playable unit
{
	// If the name matches a player
	if (name _x == _playerName) then
	{
		if (_x != vehicle _x) then 
		{
			// Ejects the selected player from their vehicle
			_x action ["eject", (vehicle _x)];
			
			// Display a message to the admin that called the script
			_message = format ["%1 has been ejected from their vehicle!", _playerName];
			[_message] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";
		}
		else 
		{
			// Display a message to the admin that called the script
			_message = format ["%1 is not currently in a vehicle!", _playerName];
			[_message] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";
		};
	};
} forEach playableUnits;

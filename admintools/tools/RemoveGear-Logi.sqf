//**************************************************************************************************************************************
// Remove Gear Script

// This script requires 1 parameter (player)
// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_selectedPlayer","_message"];

// Sets the selected player as the first parameter
_selectedPlayer = _this select 0;

// Removes the selected players magazines, weapons and backpack
{_selectedPlayer removeMagazine _x;} forEach (magazines _selectedPlayer);
removeAllWeapons _selectedPlayer;
removeAllItems _selectedPlayer;
removebackpack _selectedPlayer;

// Displays a message to the admin that called the script
_message = format ["You have removed all of %1's items!",name _selectedPlayer];
[_message] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";

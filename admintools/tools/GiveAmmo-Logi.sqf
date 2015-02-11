//*****************************************************************************************************************
// Give Ammo Script

// This script requires 1 parameter (player)
// This script is called from the AdminMainGUI.sqf
//*****************************************************************************************************************

private ["_selectedPlayer","_numberOfMagsAdded","_playerMagazineArray","_selectedMagazine","_playerWeaponName","_result","_message"];

// Sets the selected player as the first parameter
_selectedPlayer = _this select 0;

_numberOfMagsAdded = 0;

// Gets the array of magazines for the current weapon of the selected player
_playerMagazineArray = getArray (configFile >> 'CfgWeapons' >> currentWeapon vehicle _selectedPlayer >> 'magazines');
_selectedMagazine = _playerMagazineArray select 0;

// Gets the display name of the selected players current weapon
_playerWeaponName =	getText(configFile >> "CfgWeapons" >> currentWeapon vehicle _selectedPlayer >> "displayName");

// Loop which executes 3 times, attempting to add a magazine to the players inventory on each loop
for "_i" from 0 to 2 do {
	_result = [_selectedPlayer,_selectedMagazine] call BIS_fnc_invAdd; 
	if (_result) then {_numberOfMagsAdded = _numberOfMagsAdded + 1;};
};

// This checks if any magazine where actually added to the players inventory
if (_numberOfMagsAdded > 0) then 
{
	// Display a message to the admin that called the script
	_message = format ["You have given %1 %2 magazines for their %3!",name _selectedPlayer,_numberOfMagsAdded,_playerWeaponName];
	[_message] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";
	
}
else
{ 
	// Display a message to the admin that called the script
	_message = format ["%1 does not have enough inventory space to add any ammo!",name _selectedPlayer];
	[_message] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";
};

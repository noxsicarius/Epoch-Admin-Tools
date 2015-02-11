private ["_weapon","_itemName","_result","_magazineArray","_magazine"];

// Sets the selected weapon to spawn
_weapon = ((weaponList select (_this select 0)) select 0);
_itemName = getText (configFile >> "cfgWeapons" >> _weapon >> "displayName");

_selectedPlayer = _this select 1;

// Attempts to add the weapon to the players inventory
_result = [_selectedPlayer,_weapon] call BIS_fnc_invAdd;

// If the weapon was successfully added to the players inventory
if (_result) then 
{
	systemChat format ["%1 has been added to %2's inventory!",_itemName, name _selectedPlayer];
	
	// Make the player select the weapon
	_selectedPlayer selectWeapon _weapon;
	
	// Get the array of magazines for the selected weapon
	_magazineArray = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"); 
	_magazine = _magazineArray select 0;
	
	// Attempt to add 3 magazines for the selected weapon
	for "_i" from 0 to 2 do { _result = [_selectedPlayer,_magazine] call BIS_fnc_invAdd; };
	
	// Reloads the current weapon
	reload _selectedPlayer;
}
else // If the weapon could not be added to the players inventory
{ 
	systemChat format ["%1 does not have enough space to hold an %2!",name _selectedPlayer, _itemName];
};

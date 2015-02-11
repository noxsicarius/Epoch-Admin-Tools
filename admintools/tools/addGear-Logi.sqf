private ["_gear","_itemName","_selectedPlayer","_result"];

// Sets the selected gear item to spawn
_gear = ((gearList select (_this select 0)) select 0);
_itemName = getText (configFile >> "CfgMagazines" >> _gear >> "displayName");

_selectedPlayer = _this select 1;

// Attempts to add the item to the players inventory
_result = [_selectedPlayer,_gear] call BIS_fnc_invAdd;
if (_result) then 
{
  systemChat format ["%1 has been added to %2's inventory!",_itemName, name _selectedPlayer];
} 
else 
{
  systemChat format ["%1 does not have enough space to hold a %2!",name _selectedPlayer, _itemName];
};

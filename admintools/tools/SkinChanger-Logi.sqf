//**************************************************************************************************************************************
// Repair Vehicle Script

// This script requires 1 parameter (skin)
// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_skin","_unitBag","_bagType","_backPackZ","_removeMap","_removeGPS","_removeCompass","_removeWatch","_removeRadio","_removeNightVision","_bagWeapons","_bagMagazines","_array1","_array2"];

_skin = _this select 0;
_unitBag = unitBackpack player;
_bagType = (typeOf _unitBag);
_backPackZ = ["CZ_VestPouch_EP1","DZ_LargeGunBag_EP1","DZ_ALICE_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Backpack_EP1",
		"DZ_British_ACU","DZ_CivilBackpack_EP1","DZ_Czech_Vest_Pouch","DZ_Patrol_Pack_EP1","DZ_TK_Assault_Pack_EP1",
		"DZ_GunBag_EP1","DZ_CompactPack_EP1","DZ_TerminalPack_EP1"];
	
// This checks for the following items in the players inventory (Some skins will add these items, so this is used to determine if they need to be removed)
if !(('ItemMap' in items player)) then {_removeMap = true;} else {_removeMap = false;};
if !(('ItemGPS' in items player)) then {_removeGPS = true;} else {_removeGPS = false;};
if !(('ItemCompass' in items player)) then {_removeCompass = true;} else {_removeCompass = false;};
if !(('ItemWatch' in items player)) then {_removeWatch = true;} else {_removeWatch = false;};
if !(('ItemRadio' in items player)) then {_removeRadio = true;} else {_removeRadio = false;};
if !(('NVGoggles' in items player)) then {_removeNightVision = true;} else {_removeNightVision = false;};	

// If the player is changing into an animal based skin or a zombie based skin
if ((_skin isKindOf 'CAAnimalBase') || (_skin isKindOf 'zZombie_Base')) then
{
	// Removes all of the players items
	{player removeMagazine _x;} forEach (magazines player);
	removeAllItems player;
	removeAllWeapons player;
	removeBackpack player;
	
	// Performs the skin change
	[dayz_playerUID,dayz_characterID,_skin] spawn player_humanityMorph;
	waitUntil {typeOf player == _skin};

	// Switch to third person view
	vehicle player switchCamera 'EXTERNAL';
}
else
{
	// If the player had a backpack
	if(_bagType !="") then 
	{
		// Stores the items from the backpack
		_bagWeapons = getWeaponCargo _unitBag;
		_bagMagazines = getMagazineCargo _unitBag;
		
		// Removes the backpack
		removeBackpack (vehicle player);
		
		// Performs the skin change
		[dayz_playerUID,dayz_characterID,_skin] spawn player_humanityMorph;
		waitUntil {typeOf player == _skin};
		
		// Switch to third person view
		vehicle player switchCamera 'EXTERNAL';
		
		// Removes any items that might have been added with the new skin (unless the user previously had these items)
		if (_removeMap) then {[player,"ItemMap"] call BIS_fnc_invRemove;};
		if (_removeGPS) then {[player,"ItemGPS"] call BIS_fnc_invRemove;};
		if (_removeCompass) then {[player,"ItemCompass"] call BIS_fnc_invRemove;};
		if (_removeWatch) then {[player,"ItemWatch"] call BIS_fnc_invRemove;};
		if (_removeRadio) then {[player,"ItemRadio"] call BIS_fnc_invRemove;};
		if (_removeNightVision) then {[player,"NVGoggles"] call BIS_fnc_invRemove;};
		
		if(_bagType in _backPackZ) then
		{
			// Adds the original backpack to the player after the skin change
			(vehicle player) addBackpack _bagType;
			Sleep 0.1;
		
			// This puts all of the weapons back into the backpack
			_array1 = _bagWeapons select 0;
			_array2 = _bagWeapons select 1;
			{(unitBackpack player) addWeaponCargo [(_array1 select _forEachIndex),(_array2 select _forEachIndex)];}forEach _array1;
				
			// This puts all of the magazines back into the backpack
			_array1 = _bagMagazines select 0;
			_array2 = _bagMagazines select 1;
			{(unitBackpack player) addMagazineCargo [(_array1 select _forEachIndex),(_array2 select _forEachIndex)];}forEach _array1;
		};
	} 
	else // If the player did not have a backpack
	{
		// Performs the skin change
		[dayz_playerUID,dayz_characterID,_skin] spawn player_humanityMorph;
		waitUntil {typeOf player == _skin};
		
		// Switch to third person view
		vehicle player switchCamera 'EXTERNAL';
		
		// Removes any items that might have been added with the new skin (unless the user previously had these items)
		if (_removeMap) then {[player,"ItemMap"] call BIS_fnc_invRemove;};
		if (_removeGPS) then {[player,"ItemGPS"] call BIS_fnc_invRemove;};
		if (_removeCompass) then {[player,"ItemCompass"] call BIS_fnc_invRemove;};
		if (_removeWatch) then {[player,"ItemWatch"] call BIS_fnc_invRemove;};
		if (_removeRadio) then {[player,"ItemRadio"] call BIS_fnc_invRemove;};
		if (_removeNightVision) then {[player,"NVGoggles"] call BIS_fnc_invRemove;};
	};
};
		
// Tool use logger
if(logMinorTool) then {
	usageLogger = format["%1 %2 -- has changed skins to %3",name player,getPlayerUID player,_skin];
	[] spawn {publicVariable "usageLogger";};
};

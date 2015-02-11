//**************************************************************************************************************************************
// Vault Map Marker Script

// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_vaultMarkerColour","_vaultArray","_currentVault","_vaultMarker"];

_vaultMarkerColour = "ColorOrange"; 
_vaultArray = [] + (allMissionObjects "VaultStorage" + allMissionObjects "VaultStorageLocked" + allMissionObjects "LockboxStorageLocked" + allMissionObjects "LockboxStorage");

if(isNil "AddVaultsToMap") then {AddVaultsToMap = true;} else {AddVaultsToMap = !AddVaultsToMap};

// If the player does not have a GPS in their possession, this will attempt to add one
if !(('ItemGPS' in items player)) then { result = [player,"ItemGPS"] call BIS_fnc_invAdd;};

// Loop while the vault map marker tool is enabled
While {AddVaultsToMap} do 
{
	// Only create the map markers if the map is actually open
	if (visibleMap) then 
	{
		for "_i" from 0 to (count _vaultArray)-1 do
		{
			// Deletes previous map marker
			deleteMarkerLocal ("vaultMarker" + (str _i));
			_currentVault = _vaultArray select _i;
			
			// Creates the new map marker
			_vaultMarker = createMarkerLocal [("vaultMarker" + (str _i)), getPos _currentVault];
			_vaultMarker setMarkerTypeLocal "Camp";
			_vaultMarker setMarkerSizeLocal [0.4, 0.4];
			_vaultMarker setMarkerTextLocal "Vault";
			_vaultMarker setMarkerColorLocal _vaultMarkerColour;
		};
		uiSleep 5;
	};
};

// If the vault map marker tool is disabled, the vault map markers are deleted
If (!AddVaultsToMap) then {for "_i" from 0 to 9999 do {deleteMarkerLocal ("vaultMarker" + (str _i));};};

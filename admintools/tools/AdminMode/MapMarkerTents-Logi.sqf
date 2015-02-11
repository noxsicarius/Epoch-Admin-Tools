//**************************************************************************************************************************************
// Tent Map Marker Script

// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_tentMarkerColour","_tentArray","_currentTent","_tentMarker"];

_tentMarkerColour = "ColorBlue"; 
_tentArray = allMissionObjects "TentStorage";

if(isNil "AddTentsToMap") then {AddTentsToMap = true;} else {AddTentsToMap = !AddTentsToMap};

// If the player does not have a GPS in their possession, this will attempt to add one
if !(('ItemGPS' in items player)) then { result = [player,"ItemGPS"] call BIS_fnc_invAdd;};

// Loop while the tent map marker tool is enabled
While {AddTentsToMap} do 
{
	// Only create the map markers if the map is actually open
	if (visibleMap) then 
	{
		for "_i" from 0 to (count _tentArray)-1 do
		{
			// Deletes previous map marker
			deleteMarkerLocal ("tentMarker" + (str _i));
			_currentTent = _tentArray select _i;
			
			// Creates the new map marker
			_tentMarker = createMarkerLocal [("tentMarker" + (str _i)), getPos _currentTent];
			_tentMarker setMarkerTypeLocal "DOT";
			_tentMarker setMarkerSizeLocal [0.4, 0.4];
			_tentMarker setMarkerTextLocal "Tent";
			_tentMarker setMarkerColorLocal _tentMarkerColour;
		};
		uiSleep 5;
	};
};

// If the tent map marker tool is disabled, the tent map markers are deleted
If (!AddTentsToMap) then {for "_i" from 0 to 9999 do {deleteMarkerLocal ("tentMarker" + (str _i));};};

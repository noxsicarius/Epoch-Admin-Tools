//**************************************************************************************************************************************
// Wreck Map Marker Script

// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_wreckMarkerColour","_wreckArray","_currentWreck","_wreckName","_wreckMarker"];

_wreckMarkerColour = "ColorBlack"; 
_wreckArray = allMissionObjects "UH1Wreck_DZ" + allMissionObjects "UH60Wreck_DZ" + allMissionObjects "UH60_NAVY_Wreck_DZ" + allMissionObjects "UH60_ARMY_Wreck_DZ" + allMissionObjects "UH60_NAVY_Wreck_burned_DZ" + allMissionObjects "UH60_ARMY_Wreck_burned_DZ" + allMissionObjects "Mi8Wreck_DZ" + allMissionObjects "Mass_grave_DZ" + allMissionObjects "Supply_Crate_DZE";

if(isNil "AddWrecksToMap") then {AddWrecksToMap = true;} else {AddWrecksToMap = !AddWrecksToMap};

// If the player does not have a GPS in their possession, this will attempt to add one
if !(('ItemGPS' in items player)) then { result = [player,"ItemGPS"] call BIS_fnc_invAdd;};

// Loop while the wreck map marker tool is enabled
While {AddWrecksToMap} do 
{
	// Only create the map markers if the map is actually open
	if (visibleMap) then 
	{
		for "_i" from 0 to (count _wreckArray)-1 do
		{
			// Deletes previous map marker
			deleteMarkerLocal ("wreckMarker" + (str _i));
			_currentWreck = _wreckArray select _i;
			_wreckName = getText (configFile >> 'CfgVehicles' >> (typeOf _currentWreck) >> 'displayName');
			
			// Creates the new map marker
			_wreckMarker = createMarkerLocal [("wreckMarker" + (str _i)), getPos _currentWreck];
			_wreckMarker setMarkerTypeLocal "DOT";
			_wreckMarker setMarkerSizeLocal [0.4, 0.4];
			_wreckMarker setMarkerTextLocal format[" %1", _wreckName];
			_wreckMarker setMarkerColorLocal _wreckMarkerColour;
		};
		uiSleep 5;
	};
};

// If the wreck map marker tool is disabled, the wreck map markers are deleted
If (!AddWrecksToMap) then {for "_i" from 0 to 9999 do {deleteMarkerLocal ("wreckMarker" + (str _i));};};

//**************************************************************************************************************************************
// Plot Pole Map Marker Script

// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_plotPoleMarkerColour","_plotPoleAray","_currentPlotPole","_plotPoleMarker"];

_plotPoleMarkerColour = "ColorYellow";
_plotPoleAray = [] + (allMissionObjects "Plastic_Pole_EP1_DZ");

if(isNil "AddPlotPolesToMap") then {AddPlotPolesToMap = true;} else {AddPlotPolesToMap = !AddPlotPolesToMap};

// If the player does not have a GPS in their possession, this will attempt to add one
if !(('ItemGPS' in items player)) then { result = [player,"ItemGPS"] call BIS_fnc_invAdd;};

// Loop while the plot pole map marker tool is enabled
While {AddPlotPolesToMap} do 
{
	// Only create the map markers if the map is actually open
	if (visibleMap) then 
	{
		for "_i" from 0 to (count _plotPoleAray)-1 do
		{
			// Deletes previous map marker
			deleteMarkerLocal ("plotPoleMarker" + (str _i));
			_currentPlotPole = _plotPoleAray select _i;
			
			// Creates the new map marker
			_plotPoleMarker = createMarkerLocal [("plotPoleMarker" + (str _i)), getPos _currentPlotPole];
			_plotPoleMarker setMarkerTypeLocal "DOT";
			_plotPoleMarker setMarkerSizeLocal [0.4, 0.4];
			_plotPoleMarker setMarkerTextLocal "PlotPole";
			_plotPoleMarker setMarkerColorLocal _plotPoleMarkerColour;
		};
		uiSleep 5;
	};
};

// If the plot pole map marker tool is disabled, the plot pole map markers are deleted
If (!AddPlotPolesToMap) then {for "_i" from 0 to 9999 do {deleteMarkerLocal ("plotPoleMarker" + (str _i));};};

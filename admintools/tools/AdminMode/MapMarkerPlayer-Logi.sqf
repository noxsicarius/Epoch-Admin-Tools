//**************************************************************************************************************************************
// Player Map Marker Script

// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_playerMarkerColour","_currentPlayerName","_currentPlayerPosition","_playerMarker"];

_playerMarkerColour = "ColorRed";
if(isNil "AddPlayersToMap") then {AddPlayersToMap = true;} else {AddPlayersToMap = !AddPlayersToMap};

// If the player does not have a GPS in their possession, this will attempt to add one
if !(('ItemGPS' in items player)) then { result = [player,"ItemGPS"] call BIS_fnc_invAdd;};

// Loop while the player map marker tool is enabled
While {AddPlayersToMap} do 
{
	// Only create the map markers if the map is actually open
	if (visibleMap) then 
	{
		for "_i" from 0 to (count playableUnits)-1 do
		{
			//deleteMarkerLocal ("playerMarker" + (str _i));
			if ((playableUnits select _i) == vehicle (playableUnits select _i)) then 
			{
				_currentPlayerName = name (playableUnits select _i);
				//_currentPlayerPosition = getPos (playableUnits select _i);
			
				// Deletes previous map marker
				deleteMarkerLocal ("playerMarker" + (str _i));
				_playerMarker = createMarkerLocal [("playerMarker" + (str _i)), getPos (playableUnits select _i)];
				
				// Creates the new map marker
				_playerMarker setMarkerTypeLocal "DOT";
				_playerMarker setMarkerSizeLocal [0.4, 0.4];
				_playerMarker setMarkerTextLocal format["%1", _currentPlayerName];
				_playerMarker setMarkerColorLocal _playerMarkerColour;
			};
		};
		uiSleep 2;
	};
};

// If the player map marker tool is disabled, the player map markers are deleted
If (!AddPlayersToMap) then {for "_i" from 0 to 9999 do {deleteMarkerLocal ("playerMarker" + (str _i));};};

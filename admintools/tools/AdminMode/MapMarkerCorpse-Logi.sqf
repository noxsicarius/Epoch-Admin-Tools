//**************************************************************************************************************************************
// Corpse Map Marker Script

// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_corpseMarkerColour","_errorMessage","_corpseArray","_currentCorpse","_corpseName","_corpseMarker"];

_corpseMarkerColour = "ColorBlack";
_errorMessage = "Error: No unit";
if(isNil "AddCorpsesToMap") then {AddCorpsesToMap = true;} else {AddCorpsesToMap = !AddCorpsesToMap};

// If the player does not have a GPS in their possession, this will attempt to add one
if !(('ItemGPS' in items player)) then { result = [player,"ItemGPS"] call BIS_fnc_invAdd;};

// Loop while the corpse map marker tool is enabled
While {AddCorpsesToMap} do 
{
	// Only create the map markers if the map is actually open
	if (visibleMap) then 
	{
		_corpseArray = (allDead + allMissionObjects "GraveDZE");
		for "_i" from 0 to (count _corpseArray)-1 do
		{
			// Deletes previous map marker
			deleteMarkerLocal ("corpseMarker" + (str _i));
			_currentCorpse = _corpseArray select _i;

			if ((!isNull _currentCorpse) && !(_currentCorpse isKindOf "zZombie_base") && (_currentCorpse isKindOf "Man")) then
			{
				// Gets the corpses name and creates the map marker
				_corpseName = (_currentCorpse getVariable["bodyName", name _currentCorpse]);
				if (_corpseName != _errorMessage) then
				{
					_corpseMarker = createMarkerLocal [("corpseMarker" + (str _i)), getPos _currentCorpse];
					_corpseMarker setMarkerTypeLocal "DOT";
					_corpseMarker setMarkerSizeLocal [0.4, 0.4];
					_corpseMarker setMarkerTextLocal format["%1",_corpseName];
					_corpseMarker setMarkerColorLocal _corpseMarkerColour;
				};
			};	
		};
		uiSleep 5;
	};
};

// If the corpse map marker tool is disabled, the corpse map markers are deleted
If (!AddCorpsesToMap) then {for "_i" from 0 to 9999 do {deleteMarkerLocal ("corpseMarker" + (str _i));};};

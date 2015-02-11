//**************************************************************************************************************************************
// Vehicle Map Marker Script

// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_lockedVehicleMarkerColour","_unlockedVehicleMarkerColour","_occupiedVehicleMarkerColour","_vehicleArray","_currentVehicle","_currentVehicleName","_currentVehiclePlayers","_vehicleMarker"];

if(isNil "AddVehiclesToMap") then {AddVehiclesToMap = true;} else {AddVehiclesToMap = !AddVehiclesToMap};

// If the player does not have a GPS in their possession, this will attempt to add one
if !(('ItemGPS' in items player)) then { result = [player,"ItemGPS"] call BIS_fnc_invAdd;};

_lockedVehicleMarkerColour = "ColorRed";
_unlockedVehicleMarkerColour = "ColorGreen";
_occupiedVehicleMarkerColour = "ColorBlue";

// Loop while the vehicle map marker tool is enabled
While {AddVehiclesToMap} do 
{
	// Only create the map markers if the map is actually open
	if (visibleMap) then 
	{
		_vehicleArray = ([0,0,0] nearEntities [['LandVehicle','Air','Ship'], 10000000]);
		for "_i" from 0 to (count _vehicleArray)-1 do
		{
			_currentVehicle = _vehicleArray select _i;
			_currentVehicleName = getText (configFile >> 'CfgVehicles' >> (typeOf _currentVehicle) >> 'displayName');
			
			// If the current vehicle is not locked 
			if !(locked _currentVehicle) then
			{
				// If the unlocked vehicle contains any players (Includes AI)
				if (count crew _currentVehicle != 0) then 
				{
					// Stores the players names in an array
					_currentVehiclePlayers = [];
					{_currentVehiclePlayers = _currentVehiclePlayers + [name _x];} forEach crew _currentVehicle;
					
					// Deletes previous map marker
					deleteMarkerLocal ("vehicleMarker" + (str _i));
					
					// Creates the new map marker with the names of the occupants
					_vehicleMarker = createMarkerLocal [("vehicleMarker" + (str _i)), getPos _currentVehicle];
					_vehicleMarker setMarkerTypeLocal "DOT";
					_vehicleMarker setMarkerSizeLocal [0.4, 0.4];
					_vehicleMarker setMarkerTextLocal format["%1 in a: %2", _currentVehiclePlayers, _currentVehicleName];
					_vehicleMarker setMarkerColorLocal _occupiedVehicleMarkerColour;
				}
				else // If the unlocked vehicle does not contain any occupants
				{
					// Deletes previous map marker
					deleteMarkerLocal ("vehicleMarker" + (str _i));
					
					// Creates the new map marker
					_vehicleMarker = createMarkerLocal [("vehicleMarker" + (str _i)), getPos _currentVehicle];
					_vehicleMarker setMarkerTypeLocal "DOT";
					_vehicleMarker setMarkerSizeLocal [0.4, 0.4];
					_vehicleMarker setMarkerTextLocal format["%1", _currentVehicleName];
					_vehicleMarker setMarkerColorLocal _unlockedVehicleMarkerColour;
				};
			}
			else 
			{
				// If the locked vehicle contains any players (Includes AI)
				if (count crew _currentVehicle != 0) then 
				{
					// Stores the players names in an array
					_currentVehiclePlayers = [];
					{_currentVehiclePlayers = _currentVehiclePlayers + [name _x];} forEach crew _currentVehicle;
					
					// Deletes previous map marker
					deleteMarkerLocal ("vehicleMarker" + (str _i));
					
					// Creates the new map marker with the names of the occupants
					_vehicleMarker = createMarkerLocal [("vehicleMarker" + (str _i)), getPos _currentVehicle];
					_vehicleMarker setMarkerTypeLocal "DOT";
					_vehicleMarker setMarkerSizeLocal [0.4, 0.4];
					_vehicleMarker setMarkerTextLocal format["%1 in a: %2", _currentVehiclePlayers, _currentVehicleName];
					_vehicleMarker setMarkerColorLocal _occupiedVehicleMarkerColour;
				}
				else // If the locked vehicle does not contain any occupants
				{
					// Deletes previous map marker
					deleteMarkerLocal ("vehicleMarker" + (str _i));
					
					// Creates the new map marker
					_vehicleMarker = createMarkerLocal [("vehicleMarker" + (str _i)), getPos _currentVehicle];
					_vehicleMarker setMarkerTypeLocal "DOT";
					_vehicleMarker setMarkerSizeLocal [0.4, 0.4];
					_vehicleMarker setMarkerTextLocal format["%1", _currentVehicleName];
					_vehicleMarker setMarkerColorLocal _lockedVehicleMarkerColour;
				};
			};
		};
		uiSleep 3;
	};
};

// If the vehicle map marker tool is disabled, the vehicle map markers are deleted
If (!AddVehiclesToMap) then {for "_i" from 0 to 9999 do {deleteMarkerLocal ("vehicleMarker" + (str _i));};};

//**************************************************************************************************************************************
// Locate vehicle Script (Remotely)

// This script requires 1 parameter (player)
// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_selectedPlayer","_playerName","_inv","_searchString","_ID","_found","_targetColor","_finalID","_targetPosition","_targetVehicle","_count","_key","_keyName","_showMapMarker","_markerColour"];

_showMapMarker = True;            // True = display the map markers, False = just identify the keys
_markerColour = "ColorOrange";    // Alternatives = "ColorBlack", "ColorRed", "ColorGreen", "ColorBlue", "ColorYellow", "ColorWhite"

// Sets the selected player as the first parameter
_selectedPlayer = _this select 0;
_playerName = name _selectedPlayer;

// Store the selected players inventory and create the arrays
_inv = [_selectedPlayer] call BIS_fnc_invString;
if (_showMapMarker && !("ItemMap" in _inv)) exitWith { systemChat "You need a map to locate your vehicles!";};
_keyColor = [];
_keyID = [];
_removedID = [];
_count = 0;

// Loop to search the players inventory for vehicle keys
{
    for "_i" from 1 to 2500 do {
		// Compose the string to search with
        _searchString = format ["ItemKey%1%2",_x,str(_i)];
		
		// If a vehicle key is found in the players inventory
        if ((_searchString in _inv)) then {
			_count = _count + 1;
            _targetColor = _x;
			_keyColor = _keyColor + [_targetColor];
            _ID = str(_i);
			_ID = parseNumber _ID;
			
			// Determines the key ID based on the key colour
			if (_targetColor == "Green") then { _finalID = _ID; };
			if (_targetColor == "Red") then { _finalID = _ID + 2500; };
			if (_targetColor == "Blue") then { _finalID = _ID + 5000; };
			if (_targetColor == "Yellow") then { _finalID = _ID + 7500; };
			if (_targetColor == "Black") then { _finalID = _ID + 10000; };
			
			// Stores the ID's in an array
			_keyID = _keyID + [_finalID];
			_removedID = _removedID + [_ID];
        };
    };
} forEach ["Black","Yellow","Blue","Green","Red"];

// Delete any previous vehicle map markers
_i = 0;
for "_i" from 0 to 10 do {deleteMarkerLocal ("vehicleMarker"+ (str _i));};

if (_count == 0) exitWith { systemChat "No key found!";};

// Prints the number of vehicles keys that have been found
if (_count == 1) then { systemChat format ["Found: %1 vehicle key",_count];}
else {systemChat format ["Found: %1 vehicle keys",_count];};

// Loops for the number of vehicle keys that have been detected
_count = _count - 1;
_i = 0;
for "_i" from 0 to _count do {

	// Gets the key ID's and the key colours from the arrays
	_finalID = _keyID select _i;
	_ID = _removedID select _i;
	_targetColor = _keyColor select _i;
	_key = format["ItemKey%1%2",_targetColor,_ID];
	_keyName = getText (configFile >> "CfgWeapons" >> _key >> "displayName");
	_found = 0;
	
	// Performs a search of all the vehicles to find a match for the key
	{
		private ["_tID","_vehicle_type"];
		_vehicle_type = typeOf _x;
		_tID = parseNumber (_x getVariable ["CharacterID","0"]);
		
		// If the vehicle key matches a vehicle on the sever
		if ((_tID == _finalID) && ((_vehicle_type isKindOf "Air") || (_vehicle_type isKindOf "LandVehicle") || (_vehicle_type isKindOf "Ship"))) then {
		
			// Stores the vehicle and the vehicles position
			_targetPosition = getPosATL _x;
			_targetVehicle = _x;
			_found = 1;
		};
	} forEach vehicles;

	// If a key has been found
	if (_found != 0) then {
	
		// Gets the vehicles display name and creates a local map marker
		_vehicleName = gettext (configFile >> "CfgVehicles" >> (typeof _targetVehicle) >> "displayName");
		if (_showMapMarker) then {
			_Marker = "vehicleMarker" + (str _i);
			_vehicleMarker = createMarkerLocal [_Marker,[(_targetPosition select 0),(_targetPosition select 1)]];
			_vehicleMarker setMarkerShapeLocal "ICON";
			_vehicleMarker setMarkerTypeLocal "DOT";
			_vehicleMarker setMarkerColorLocal _markerColour;
			_vehicleMarker setMarkerSizeLocal [1.0, 1.0];
			_vehicleMarker setMarkerTextLocal format ["Here is %1's: %2",_playerName,_vehicleName];
			systemChat format ["%1 belongs to %2 - %3",_keyName,_vehicleName,_finalID];
		} else { systemChat format ["%1 belongs to %2 - %3",_keyName,_vehicleName,_finalID];};
	} else { systemChat format ["%1 - Vehicle ID: %2 - (This vehicle no longer exists in the database)",_keyName,_finalID];};	
};

if (_showMapMarker) then {
	if (_count == 0) then { systemChat format ["Check the map to locate %1's vehicle!",_playerName];}
	else {systemChat format ["Check the map to locate %1's vehicles!",_playerName];};
};

private ["_inv","_searchString","_ID","_found","_targetColor","_finalID","_targetPosition","_targetVehicle","_count","_key","_keyName","_showMapMarker","_markerColour","_locatorMarker"];

/****************************************| Config |**************************************************************************************/

_showMapMarker = True;            // True = display the map markers, False = just identify the keys
_markerColour = "ColorOrange";    // Alternatives = "ColorBlack", "ColorRed", "ColorGreen", "ColorBlue", "ColorYellow", "ColorWhite"

/****************************************| Config |**************************************************************************************/

if( isNil "locateVehicle") then {locateVehicle = true;} else {locateVehicle = !locateVehicle};

if(locateVehicle) then {

	_inv = [player] call BIS_fnc_invString;
	_keyColor = [];
	_keyID = [];
	_removedID = [];
	_count = 0;

	if (!("ItemGPS" in _inv)) then {player addweapon "ItemGPS";};

	{
		for "_i" from 1 to 2500 do {
			_searchString = format ["ItemKey%1%2",_x,str(_i)];
			if ((_searchString in _inv)) then {
				_count = _count + 1;
				_targetColor = _x;
				_keyColor = _keyColor + [_targetColor];
				_ID = str(_i);
				_ID = parseNumber _ID;
				if (_targetColor == "Green") then { _finalID = _ID; };
				if (_targetColor == "Red") then { _finalID = _ID + 2500; };
				if (_targetColor == "Blue") then { _finalID = _ID + 5000; };
				if (_targetColor == "Yellow") then { _finalID = _ID + 7500; };
				if (_targetColor == "Black") then { _finalID = _ID + 10000; };
				_keyID = _keyID + [_finalID];
				_removedID = _removedID + [_ID];
			};
		};
	} forEach ["Black","Yellow","Blue","Green","Red"];

	_i = 0;
	for "_i" from 0 to 10 do {deleteMarkerLocal ("locatorMarker"+ (str _i));};

	if (_count == 0) exitWith { systemChat "Place a key in your inventory to find that vehicle."; locateVehicle = false;};

	systemChat format ["Found: %1 vehicle key",_count];

	_count = _count - 1;

	_i = 0;
	for "_i" from 0 to _count do {
		_finalID = _keyID select _i;
		_ID = _removedID select _i;
		_targetColor = _keyColor select _i;
		_key = format["ItemKey%1%2",_targetColor,_ID];
		_keyName = getText (configFile >> "CfgWeapons" >> _key >> "displayName");
		_found = 0;
		
		{
			private ["_tID","_vehicle_type"];
			_vehicle_type = typeOf _x;
			_tID = parseNumber (_x getVariable ["CharacterID","0"]);
			if ((_tID == _finalID) && ((_vehicle_type isKindOf "Air") || (_vehicle_type isKindOf "LandVehicle") || (_vehicle_type isKindOf "Ship"))) then {
				_targetPosition = getPosATL _x;
				_targetVehicle = _x;
				_found = 1;
			};
		} forEach vehicles;

		if (_found != 0) then {
			_vehicleName = gettext (configFile >> "CfgVehicles" >> (typeof _targetVehicle) >> "displayName");
			if (_showMapMarker) then {
				_Marker = "locatorMarker" + (str _i);
				_locatorMarker = createMarkerLocal [_Marker,[(_targetPosition select 0),(_targetPosition select 1)]];
				_locatorMarker setMarkerShapeLocal "ICON";
				_locatorMarker setMarkerTypeLocal "DOT";
				_locatorMarker setMarkerColorLocal _markerColour;
				_locatorMarker setMarkerSizeLocal [1.0, 1.0];
				_locatorMarker setMarkerTextLocal format ["locator: %1",_vehicleName];
			} else { 
				systemChat format ["%1 belongs to %2 - %3",_keyName,_vehicleName,_finalID];
			};
		} else { 
			systemChat format ["%1 - Vehicle ID: %2 - (This vehicle no longer exists in the database)",_keyName,_finalID];
		};
	};

	if (_showMapMarker) then {
		systemChat "Map markers added. Run this again to remove them.";
	};
} else {
	_i=0;
	for "_i" from 0 to 10 do {deleteMarkerLocal ("locatorMarker"+ (str _i));};
	systemChat "Map markers removed";
};
private ["_done","_location"];
if (!("ItemGPS" in items player)) then {player addweapon "ItemGPS";};
_done = false;
_locOK = true;

teleport = {
	_pos = [_this select 0, _this select 1,_this select 2];

	if ((vehicle player) isKindOf "Air" && isEngineOn (vehicle player) && (speed (vehicle player)) > 20) then{
		(vehicle player) setpos [_pos select 0, _pos select 1, 1000];
		player setVariable["lastPos",0, true];
	} else {
		if ((vehicle player) != player) then {
			_location = [_pos select 0, _pos select 1] findEmptyPosition [0,10];
			if (count _location < 1) then {
				cutText["Unable to teleport here.","PLAIN DOWN"];
			} else {
				(vehicle player) setpos _location;
			};
		};
		if (((vehicle player) == player)) then {
			(vehicle player) setpos [_pos select 0, _pos select 1, 0];
		};
	};

	openMap [false, false];
	TitleText [format[""], "PLAIN DOWN"];
	_done = true;
};

closedialog 0;
sleep 0.5;
TitleText [format["Click on the map to Teleport"], "PLAIN DOWN"]; titleFadeOut 3;

if(!(visibleMap)) then {
	openMap [true, false];
};

onMapSingleClick '[_pos select 0, _pos select 1, _pos select 2] call teleport';
waitUntil{_done || !(visibleMap)};
onMapSingleClick "";
private ["_done"];
if (!("ItemGPS" in items player)) then {player addweapon "ItemGPS";};
_done = false;

teleport = {
	_pos = [_this select 0, _this select 1,_this select 2];

	if ((vehicle player isKindOf "Air" && isEngineOn (vehicle player))) then{
		(vehicle player) setpos [_pos select 0, _pos select 1, 100];
		player setVariable["lastPos",0, true];
	} else {    
		(vehicle player) setpos [_pos select 0, _pos select 1, 0];
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
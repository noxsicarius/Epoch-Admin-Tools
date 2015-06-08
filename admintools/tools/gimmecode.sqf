private ["_combo","_ct","_player"];
_ct = cursorTarget;
_player = player;
_combo = _ct getVariable ["CharacterID","0"];

if(_combo != "0") then {
	if (_ct isKindOf "LandVehicle" OR _ct isKindOf "Helicopter" OR _ct isKindOf "Plane" OR _ct isKindOf "Ship") then {
		if ((_combo > 0) && (_combo <= 2500)) then {_result = format["Green%1",_combo];}else{
		if ((_combo > 2500) && (_combo <= 5000)) then {_result = format["Red%1",_combo-2500];}else{
		if ((_combo > 5000) && (_combo <= 7500)) then {_result = format["Blue%1",_combo-5000];}else{
		if ((_combo > 7500) && (_combo <= 10000)) then {_result = format["Yellow%1",_combo-7500];}else{
		if ((_combo > 10000) && (_combo <= 12500)) then {_result = format["Black%1",_combo-10000];};};};};};
		cutText [format["Item Code: %1", _result], "PLAIN DOWN"];
	}else{
		cutText [format["Item Code: %1", _combo], "PLAIN DOWN"];
	};
	
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has viewed a locked item code: %3",name _player,getPlayerUID _player,_combo];
		[] spawn {publicVariable "usageLogger";};
	};
} else {
	cutText [format["Not a valid target.",_combo], "PLAIN DOWN"];
};
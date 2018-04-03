private ["_combo","_ct","_player"];
_ct = cursorTarget;
_player = player;
_combo = _ct getVariable ["CharacterID","0"];

if(isNull _ct) exitWith{"No target" call dayz_rollingMessages;};

if(_combo != "0") then {
	if (_ct isKindOf "LandVehicle" OR _ct isKindOf "Helicopter" OR _ct isKindOf "Plane" OR _ct isKindOf "Ship") then {
		if ((_combo > 0) && (_combo <= 2500)) then {_result = format["Green%1",_combo];}else{
		if ((_combo > 2500) && (_combo <= 5000)) then {_result = format["Red%1",_combo-2500];}else{
		if ((_combo > 5000) && (_combo <= 7500)) then {_result = format["Blue%1",_combo-5000];}else{
		if ((_combo > 7500) && (_combo <= 10000)) then {_result = format["Yellow%1",_combo-7500];}else{
		if ((_combo > 10000) && (_combo <= 12500)) then {_result = format["Black%1",_combo-10000];};};};};};
		format["Vehicle Key: %1", _result] call dayz_rollingMessages;
	}else{
		format["Item Code: %1", _combo] call dayz_rollingMessages;
	};
	
	// Tool use logger
	if(EAT_logMajorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has viewed a locked item: %3",name _player,getPlayerUID _player,_combo];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};
} else {
	format["Not a valid target.",_combo] call dayz_rollingMessages;
};
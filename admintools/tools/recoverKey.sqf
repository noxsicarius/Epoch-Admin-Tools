private ["_ct","_id","_result","_player"];
_ct = cursorTarget;
_player = player;

if (_ct isKindOf "LandVehicle" OR _ct isKindOf "Helicopter" OR _ct isKindOf "Plane" OR _ct isKindOf "Ship") then
{
	_id = _ct getVariable ["CharacterID","0"];
	_id = parsenumber _id;
	_result = "ItemKey";
	if (_id == 0) exitWith {cutText [format["%1 has ID 0 - No Key possible.",typeOF _ct], "PLAIN"];};
	if ((_id > 0) && (_id <= 2500)) then {_result = format["ItemKeyGreen%1",_id];}else{
	if ((_id > 2500) && (_id <= 5000)) then {_result = format["ItemKeyRed%1",_id-2500];}else{
	if ((_id > 5000) && (_id <= 7500)) then {_result = format["ItemKeyBlue%1",_id-5000];}else{
	if ((_id > 7500) && (_id <= 10000)) then {_result = format["ItemKeyYellow%1",_id-7500];}else{
	if ((_id > 10000) && (_id <= 12500)) then {_result = format["ItemKeyBlack%1",_id-10000];};};};};};
	
	cutText [format["id = %1, result = %2",_id,_result], "PLAIN"];

	_player addweapon _result;
	cutText [format["Key [%1] added to inventory!",_result], "PLAIN"];
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has generated %3 for a %4",name _player,getPlayerUID _player,_result,_ct];
		[] spawn {publicVariable "usageLogger";};
	};
};
private ["_ct","_id","_result","_inventory","_backpack"];

_ct = cursorTarget;
if (_ct isKindOf "LandVehicle" OR _ct isKindOf "Helicopter" OR _ct isKindOf "Plane" OR _ct isKindOf "Ship") then
{
	_id = _ct getVariable ["CharacterID","0"];
	_id = parsenumber _id;
	_result = "ItemKey";
	if (_id == 0) exitWith {cutText [format["%1 has ID 0 - No Key possible.",typeOF _ct], "PLAIN"];};
	if ((_id > 0) && (_id <= 2500)) then {_result = format["ItemKeyGreen%1",_id];};
	if ((_id > 2500) && (_id <= 5000)) then {_result = format["ItemKeyRed%1",_id-2500];};
	if ((_id > 5000) && (_id <= 7500)) then {_result = format["ItemKeyBlue%1",_id-5000];};
	if ((_id > 7500) && (_id <= 10000)) then {_result = format["ItemKeyYellow%1",_id-7500];};
	if ((_id > 10000) && (_id <= 12500)) then {_result = format["ItemKeyBlack%1",_id-10000];};
	
	cutText [format["id = %1, result = %2",_id,_result], "PLAIN"];

	_inventory = (weapons player);
	_backpack = ((getWeaponCargo unitbackpack player) select 0);
	if (_result in (_inventory+_backpack)) then
	{
		if (_result in _inventory) then {cutText [format["Key [%1] already in your inventory!",_result], "PLAIN"];};
		if (_result in _backpack) then {cutText [format["Key [%1] already in your backpack!",_result], "PLAIN"];};
	}
	else
	{
		player addweapon _result;
		cutText [format["Key [%1] added to inventory!",_result], "PLAIN"];
	};
};
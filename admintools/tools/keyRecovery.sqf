/*
	Recover lost key for purchased vehicles
*/

private ["_isOk","_player","_key","_target"];
_player = player;
_target = cursorTarget;

if(!(_target isKindOf "Motorcycle" || _target isKindOf "Car" || _target isKindOf "Air" || _target isKindOf "Ship"))exitWith{cutText["ERROR: Target not a vehicle","PLAIN DOWN"];};

_key = parseNumber (_target getVariable ["CharacterID","0"]);

if(_key == 0)exitWith{cutText["ERROR: Vehicle has no associated key","PLAIN DOWN"];};

if(_key < 2501) then {
	_key = format[("ItemKeyGreen%1"),_key];
}else{
	if(_key < 5001) then {
		_key = format[("ItemKeyRed%1"),_key-2500];
	}else{
		if(_key < 7501) then {
			_key = format[("ItemKeyBlue%1"),_key-5000];
		}else{
			if(_key < 10001) then {
				_key = format[("ItemKeyYellow%1"),_key-7500];
			}else{
				_key = format[("ItemKeyBlack%1"),_key-10000];
			};
		};
	};
};
_isOk = [_player,_key] call BIS_fnc_invAdd;

if(_isOk) then {
	cutText [format["Key added to toolbelt - %1",_key], "PLAIN DOWN"];
}else{
	if(!isNull (unitBackpack _player)) then {
		(unitBackpack (vehicle _player)) addWeaponCargoGlobal [_key,1];
		cutText [format["Key added to Backpack - %1",_key], "PLAIN DOWN"];
	}else{
		cutText["ERROR: Toobelt full OR key already in belt and no player backpack", "PLAIN DOWN"];
	};
};

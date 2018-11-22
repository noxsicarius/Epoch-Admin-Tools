private ["_handGuns","_gun","_ammo","_HEammo","_player"];
_handGuns = ["UZI_SD_EP1","G17_FL_DZ","Revolver_DZ","revolver_gold_EP1","PDW_DZ","Sa61_EP1","M9_DZ","M9_SD_DZ","M1911_DZ","Makarov_DZ","Makarov_SD_DZ"];
_gun = _this select 0;
_ammo = _this select 1;
_HEammo = _this select 2;
_player = player;

if(_gun in _handGuns) then {
{
    if (getNumber (configFile >> "CfgWeapons" >> _x >> "type") == 2) exitWith { // thanks Ebayshopper for this solution.
        _player removeWeapon _x;
    };
} count (weapons _player);
} else {_player removeWeapon (primaryWeapon _player);};

// Add Items
_player addMagazine _ammo;
_player addMagazine _ammo;
_player addWeapon _gun;
_player selectWeapon _gun;
if(!(isNil _HEammo)) then {
	_player addMagazine _HEammo;
};
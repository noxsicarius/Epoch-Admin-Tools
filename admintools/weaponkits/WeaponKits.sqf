private ["_gun","_ammo","_HEammo","_gear","_gunOne","_gunTwo","_player"];
_handGuns = ["UZI_SD_EP1","glock17_EP1","revolver_EP1","revolver_gold_EP1","UZI_EP1","Sa61_EP1","M9","M9SD","Colt1911","Makarov","MakarovSD"];
_gun = _this select 0;
_ammo = _this select 1;
_HEammo = _this select 2;
_player = player;

// Get player's weapons
_gunOne = (weapons _player) select 0;
_gunTwo = (weapons _player) select 1;

// Remove the correct player weapon
if(_gun in _handGuns) then{
	if(_gunOne in _handGuns) then {_player removeWeapon _gunOne;} else {_player removeWeapon _gunTwo;};
} else {
	if(_gunOne in _handGuns) then {_player removeWeapon _gunTwo;} else {_player removeWeapon _gunOne;};
};

// Add Items
_player addMagazine _ammo;
_player addMagazine _ammo;
_player addWeapon _gun;
_player selectWeapon _gun;
if(!(isNil _HEammo)) then {
	_player addMagazine _HEammo;
};
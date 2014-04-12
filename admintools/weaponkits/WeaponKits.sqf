private ["_gun","_ammo","_HEammo","_gear","_gunOne","_gunTwo"];
_handGuns = ["UZI_SD_EP1","glock17_EP1","revolver_EP1","revolver_gold_EP1","UZI_EP1","Sa61_EP1","M9","M9SD","Colt1911","Makarov","MakarovSD"];
_gun = _this select 0;
_ammo = _this select 1;
_HEammo = _this select 2;

// Get player's weapons
_gunOne = (weapons player) select 0;
_gunTwo = (weapons player) select 1;

// Remove the correct player weapon
if(_gun in _handGuns) then{
	if(_gunOne in _handGuns) then {player removeWeapon _gunOne;} else {player removeWeapon _gunTwo;};
} else {
	if(_gunOne in _handGuns) then {player removeWeapon _gunTwo;} else {player removeWeapon _gunOne;};
};

// Add Items
player addMagazine _ammo;
player addMagazine _ammo;
player addWeapon _gun;
player selectWeapon _gun;
if(!(isNil _HEammo)) then {
	player addMagazine _HEammo;
};
private ["LocalOrGlobal","spawnCrate"];
LocalOrGlobal = _this select 0;

// Name of this crate
_crateName = "Backpack Tent";

// Crate type
_classname = "TentStorageDomed2";

// Location of player and crate
_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];

if(LocalOrGlobal == "local") then {
	spawnCrate = _classname createVehicleLocal _pos;	
} else {
	spawnCrate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
};

spawnCrate setDir _dir;
spawnCrate setposATL _pos;

// Remove default items/weapons from current crate before adding custom gear
clearWeaponCargoGlobal spawnCrate;
clearMagazineCargoGlobal spawnCrate;
clearBackpackCargoGlobal spawnCrate;

spawnCrate addBackpackCargoGlobal ["DZ_Backpack_EP1", 1];
spawnCrate addBackpackCargoGlobal ["DZ_British_ACU", 1];
spawnCrate addBackpackCargoGlobal ["DZ_CivilBackpack_EP1", 1];
spawnCrate addBackpackCargoGlobal ["DZ_CompactPack_EP1", 1];
spawnCrate addBackpackCargoGlobal ["DZ_GunBag_EP1", 1];
spawnCrate addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];
spawnCrate addBackpackCargoGlobal ["DZ_TK_Assault_Pack_EP1", 1];

// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

selectDelayPack=0;
// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "selectDelayPack=30;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "selectDelayPack=60;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "selectDelayPack=180;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "selectDelayPack=300;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "selectDelayPack=600;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "selectDelayPack=1800;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "selectDelayPack=0;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{commandingMenu == ""};

if(selectDelayPack != 0) then {
	titleText [format[_crateName + " will disappear in %1 seconds.",selectDelayPack],"PLAIN DOWN"]; titleFadeOut 4;
	sleep selectDelayPack;
	// Delete crate after selectDelayPack seconds
	deletevehicle spawnCrate;
	titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	titleText [format[_crateName + " has no timer. Shoot it to destroy."],"PLAIN DOWN"]; titleFadeOut 4;
};
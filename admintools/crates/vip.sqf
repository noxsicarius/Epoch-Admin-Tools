// Name of this crate
_crateName = "Bambi Crate";

// Crate type
_classname = "USOrdnanceBox";

// Set the # of items
_numItems = 1;

// Location of player and crate
_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];
_spawnCrate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
_spawnCrate setDir _dir;
_spawnCrate setposATL _pos;

// Remove default items/weapons from current crate before adding custom gear
clearWeaponCargoGlobal _spawnCrate;
clearMagazineCargoGlobal _spawnCrate;
clearBackpackCargoGlobal _spawnCrate;

_spawnCrate addWeaponCargoGlobal ["Binocular", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemCompass", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemCrowbar", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemEtool", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemFlashlight", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemGPS", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemHatchet", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemKnife", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemMap", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemMatchbox", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemToolbox", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemWatch", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4A1_HWS_GL_camo", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4A1_HWS_GL_camo", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M9SD", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Mk_48_DZ", _numItems * 5];

_spawnCrate addMagazineCargoGlobal ["100Rnd_762x51_M240", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["1Rnd_HE_M203", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["FoodSteakCooked", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemAntibiotic", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemBandage", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemBloodbag", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemBriefcase100oz", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemEpinephrine", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemMorphine", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemPainkiller", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemSodaPepsi", _numItems * 20];


// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "SelectDelay=30;DelaySelected=true;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "SelectDelay=60;DelaySelected=true;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "SelectDelay=180;DelaySelected=true;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "SelectDelay=300;DelaySelected=true;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "SelectDelay=600;DelaySelected=true;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "SelectDelay=1800;DelaySelected=true;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "DelaySelected=false;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{DelaySelected};
DelaySelected=false;
titleText [format[_crateName + " will disappear in %1 seconds.",SelectDelay],"PLAIN DOWN"]; titleFadeOut 4;
sleep SelectDelay;

// Delete crate after SelectDelay seconds
deletevehicle _spawnCrate;
titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
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

_spawnCrate addWeaponCargoGlobal ["AK_74", _numItems * 1];
_spawnCrate addWeaponCargoGlobal ["huntingrifle", _numItems * 1];
_spawnCrate addWeaponCargoGlobal ["ItemKnife", _numItems * 1];
_spawnCrate addWeaponCargoGlobal ["ItemMatchbox", _numItems * 1];
_spawnCrate addWeaponCargoGlobal ["LeeEnfield", _numItems * 1];

_spawnCrate addMagazineCargoGlobal ["10x_303", _numItems * 5];
_spawnCrate addMagazineCargoGlobal ["30Rnd_545x39_AK", _numItems * 5];
_spawnCrate addMagazineCargoGlobal ["5x_22_LR_17_HMR", _numItems * 5];
_spawnCrate addMagazineCargoGlobal ["FoodSteakCooked", _numItems * 5];
_spawnCrate addMagazineCargoGlobal ["ItemAntibiotic", _numItems * 5];
_spawnCrate addMagazineCargoGlobal ["ItemBandage", _numItems * 5];
_spawnCrate addMagazineCargoGlobal ["ItemBloodbag", _numItems * 5];
_spawnCrate addMagazineCargoGlobal ["ItemEpinephrine", _numItems * 5];
_spawnCrate addMagazineCargoGlobal ["ItemHeatPack", _numItems * 5];
_spawnCrate addMagazineCargoGlobal ["ItemMorphine", _numItems * 5];
_spawnCrate addMagazineCargoGlobal ["ItemPainkiller", _numItems * 5];
_spawnCrate addMagazineCargoGlobal ["ItemSodaMdew", _numItems * 5];
_spawnCrate addMagazineCargoGlobal ["ItemTent", _numItems * 1];


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
private ["LocalOrGlobal","spawnCrate"];
LocalOrGlobal = _this select 0;

// Name of this crate
_crateName = "Your Crate";

// Crate type. Possibilities: MedBox0, FoodBox0, BAF_BasicWeapons, USSpecialWeaponsBox, USSpecialWeapons_EP1, USVehicleBox, RUSpecialWeaponsBox, RUVehicleBox, etc.
_classname = "USOrdnanceBox";

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

// Add weapon-slot items to crate
// Syntax: spawnCrate addWeaponCargoGlobal ["ITEM", number-of-items];
spawnCrate addWeaponCargoGlobal ["Binocular", 5];
spawnCrate addWeaponCargoGlobal ["ItemEtool", 5];

// Add magazine-slot items to crate
// Syntax: spawnCrate addMagazineCargoGlobal ["ITEM", number-of-items];
spawnCrate addMagazineCargoGlobal ["FoodSteakCooked", 5];
spawnCrate addMagazineCargoGlobal ["ItemAntibiotic", 5];

// Add only 1 backpack. The rest will fall out onto the ground. Do not use LargeGunBag here, the box will not hold it.
spawnCrate addBackpackCargoGlobal ["DZ_Backpack_EP1", 1];

// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

selectDelay=0;
// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "selectDelay=30;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "selectDelay=60;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "selectDelay=180;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "selectDelay=300;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "selectDelay=600;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "selectDelay=1800;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "selectDelay=0;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{commandingMenu == ""};

if(selectDelay != 0) then {
	titleText [format[_crateName + " will disappear in %1 seconds.",selectDelay],"PLAIN DOWN"]; titleFadeOut 4;
	sleep selectDelay;
	// Delete crate after selectDelay seconds
	deletevehicle spawnCrate;
	titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	titleText [format[_crateName + " has no timer. Shoot it to destroy."],"PLAIN DOWN"]; titleFadeOut 4;
};
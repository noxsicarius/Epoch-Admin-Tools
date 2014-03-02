// Name of this crate
_crateName = "Building Crate";

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

_spawnCrate addWeaponCargoGlobal ["ItemCrowbar", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemEtool", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemHatchet", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemMatchbox", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemSledge", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemToolbox", _numItems * 5];

_spawnCrate addMagazineCargoGlobal ["30m_plot_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["bulk_empty", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["bulk_ItemTankTrap", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["bulk_ItemWire",  _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["CinderBlocks", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["cinder_door_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["cinder_garage_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["cinder_wall_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["deer_stand_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["desert_large_net_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["desert_net_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["forest_large_net_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["forest_net_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["fuel_pump_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemBurlap", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemCanvas", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemComboLock", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemCorrugated", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemFireBarrel_Kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemFuelBarrelEmpty", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemFuelPump", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemGenerator", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemHotwireKit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemJerrycan", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemLockbox", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemPole", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemSandbag", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemSandbagExLarge",  _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemSandbagExLarge5x", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemSandbagLarge", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemTankTrap", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemTent", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemTentDomed",  _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemTentDomed2", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemTentOld",  _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemVault", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWire", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodFloor", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodFloorHalf", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodFloorQuarter", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodLadder", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodStairs", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodStairsSupport", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWall", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallDoor", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallDoorLg", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallGarageDoor", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallGarageDoorLocked", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallLg", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallThird", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallWindow", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallWindowLg", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallWithDoor", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallwithDoorLg", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallWithDoorLgLocked", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallWithDoorLocked", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["light_pole_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["m240_nest_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["metal_floor_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["metal_panel_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["MortarBucket", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["outhouse_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["park_bench_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["PartGeneric", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["PartPlankPack", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["PartPlywoodPack", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["PartWoodLumber", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["PartWoodPile", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["PartWoodPlywood", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["rusty_gate_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["sandbag_nest_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["stick_fence_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["storage_shed_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["sun_shade_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["wooden_shed_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["wood_ramp_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["wood_shack_kit", _numItems * 50];
_spawnCrate addMagazineCargoGlobal ["workbench_kit", _numItems * 50];

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
private ["LocalOrGlobal","spawnCrate"];
LocalOrGlobal = _this select 0;

// Name of this crate
_crateName = "Building Crate";

// Crate type
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

spawnCrate addWeaponCargoGlobal ["ItemCrowbar", 5];
spawnCrate addWeaponCargoGlobal ["ItemEtool", 5];
spawnCrate addWeaponCargoGlobal ["ItemHatchet", 5];
spawnCrate addWeaponCargoGlobal ["ItemMatchbox", 5];
spawnCrate addWeaponCargoGlobal ["ItemSledge", 5];
spawnCrate addWeaponCargoGlobal ["ItemToolbox", 5];

spawnCrate addMagazineCargoGlobal ["30m_plot_kit", 30];
spawnCrate addMagazineCargoGlobal ["bulk_empty", 30];
spawnCrate addMagazineCargoGlobal ["bulk_ItemTankTrap", 30];
spawnCrate addMagazineCargoGlobal ["bulk_ItemWire",  30];
spawnCrate addMagazineCargoGlobal ["CinderBlocks", 30];
spawnCrate addMagazineCargoGlobal ["cinder_door_kit", 30];
spawnCrate addMagazineCargoGlobal ["cinder_garage_kit", 30];
spawnCrate addMagazineCargoGlobal ["cinder_wall_kit", 30];
spawnCrate addMagazineCargoGlobal ["deer_stand_kit", 30];
spawnCrate addMagazineCargoGlobal ["desert_large_net_kit", 30];
spawnCrate addMagazineCargoGlobal ["desert_net_kit", 30];
spawnCrate addMagazineCargoGlobal ["forest_large_net_kit", 30];
spawnCrate addMagazineCargoGlobal ["forest_net_kit", 30];
spawnCrate addMagazineCargoGlobal ["fuel_pump_kit", 30];
spawnCrate addMagazineCargoGlobal ["ItemBurlap", 30];
spawnCrate addMagazineCargoGlobal ["ItemCanvas", 30];
spawnCrate addMagazineCargoGlobal ["ItemComboLock", 30];
spawnCrate addMagazineCargoGlobal ["ItemCorrugated", 30];
spawnCrate addMagazineCargoGlobal ["ItemFireBarrel_Kit", 30];
spawnCrate addMagazineCargoGlobal ["ItemFuelBarrelEmpty", 30];
spawnCrate addMagazineCargoGlobal ["ItemFuelPump", 30];
spawnCrate addMagazineCargoGlobal ["ItemGenerator", 30];
spawnCrate addMagazineCargoGlobal ["ItemHotwireKit", 30];
spawnCrate addMagazineCargoGlobal ["ItemJerrycan", 30];
spawnCrate addMagazineCargoGlobal ["ItemLockbox", 30];
spawnCrate addMagazineCargoGlobal ["ItemPole", 30];
spawnCrate addMagazineCargoGlobal ["ItemSandbag", 30];
spawnCrate addMagazineCargoGlobal ["ItemSandbagExLarge",  30];
spawnCrate addMagazineCargoGlobal ["ItemSandbagExLarge5x", 30];
spawnCrate addMagazineCargoGlobal ["ItemSandbagLarge", 30];
spawnCrate addMagazineCargoGlobal ["ItemTankTrap", 30];
spawnCrate addMagazineCargoGlobal ["ItemTent", 30];
spawnCrate addMagazineCargoGlobal ["ItemTentDomed",  30];
spawnCrate addMagazineCargoGlobal ["ItemTentDomed2", 30];
spawnCrate addMagazineCargoGlobal ["ItemTentOld",  30];
spawnCrate addMagazineCargoGlobal ["ItemVault", 30];
spawnCrate addMagazineCargoGlobal ["ItemWire", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodFloor", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodFloorHalf", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodFloorQuarter", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodLadder", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodStairs", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodStairsSupport", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWall", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWallDoor", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWallDoorLg", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWallGarageDoor", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWallGarageDoorLocked", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWallLg", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWallThird", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWallWindow", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWallWindowLg", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWallWithDoor", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWallwithDoorLg", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWallWithDoorLgLocked", 30];
spawnCrate addMagazineCargoGlobal ["ItemWoodWallWithDoorLocked", 30];
spawnCrate addMagazineCargoGlobal ["light_pole_kit", 30];
spawnCrate addMagazineCargoGlobal ["m240_nest_kit", 30];
spawnCrate addMagazineCargoGlobal ["metal_floor_kit", 30];
spawnCrate addMagazineCargoGlobal ["metal_panel_kit", 30];
spawnCrate addMagazineCargoGlobal ["MortarBucket", 30];
spawnCrate addMagazineCargoGlobal ["outhouse_kit", 30];
spawnCrate addMagazineCargoGlobal ["park_bench_kit", 30];
spawnCrate addMagazineCargoGlobal ["PartGeneric", 30];
spawnCrate addMagazineCargoGlobal ["PartPlankPack", 30];
spawnCrate addMagazineCargoGlobal ["PartPlywoodPack", 30];
spawnCrate addMagazineCargoGlobal ["PartWoodLumber", 30];
spawnCrate addMagazineCargoGlobal ["PartWoodPile", 30];
spawnCrate addMagazineCargoGlobal ["PartWoodPlywood", 30];
spawnCrate addMagazineCargoGlobal ["rusty_gate_kit", 30];
spawnCrate addMagazineCargoGlobal ["sandbag_nest_kit", 30];
spawnCrate addMagazineCargoGlobal ["stick_fence_kit", 30];
spawnCrate addMagazineCargoGlobal ["storage_shed_kit", 30];
spawnCrate addMagazineCargoGlobal ["sun_shade_kit", 30];
spawnCrate addMagazineCargoGlobal ["wooden_shed_kit", 30];
spawnCrate addMagazineCargoGlobal ["wood_ramp_kit", 30];
spawnCrate addMagazineCargoGlobal ["wood_shack_kit", 30];
spawnCrate addMagazineCargoGlobal ["workbench_kit", 30];

// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

selectDelayBuild=0;
// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "selectDelayBuild=30;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "selectDelayBuild=60;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "selectDelayBuild=180;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "selectDelayBuild=300;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "selectDelayBuild=600;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "selectDelayBuild=1800;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "selectDelayBuild=0;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{commandingMenu == ""};

if(selectDelayBuild != 0) then {
	titleText [format[_crateName + " will disappear in %1 seconds.",selectDelayBuild],"PLAIN DOWN"]; titleFadeOut 4;
	sleep selectDelayBuild;
	// Delete crate after selectDelayBuild seconds
	deletevehicle spawnCrate;
	titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	titleText [format[_crateName + " has no timer. Shoot it to destroy."],"PLAIN DOWN"]; titleFadeOut 4;
};
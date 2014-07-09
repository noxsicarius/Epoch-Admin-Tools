private ["LocalOrGlobal","buildingCrate"];
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
	buildingCrate = _classname createVehicleLocal _pos;	
} else {
	buildingCrate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
};

buildingCrate setDir _dir;
buildingCrate setposATL _pos;

// Remove default items/weapons from current crate before adding custom gear
clearWeaponCargoGlobal buildingCrate;
clearMagazineCargoGlobal buildingCrate;
clearBackpackCargoGlobal buildingCrate;

buildingCrate addWeaponCargoGlobal ["ItemCrowbar", 5];
buildingCrate addWeaponCargoGlobal ["ItemEtool", 5];
buildingCrate addWeaponCargoGlobal ["ItemHatchet", 5];
buildingCrate addWeaponCargoGlobal ["ItemMatchbox", 5];
buildingCrate addWeaponCargoGlobal ["ItemSledge", 5];
buildingCrate addWeaponCargoGlobal ["ItemToolbox", 5];

buildingCrate addMagazineCargoGlobal ["30m_plot_kit", 30];
buildingCrate addMagazineCargoGlobal ["bulk_empty", 30];
buildingCrate addMagazineCargoGlobal ["bulk_ItemTankTrap", 30];
buildingCrate addMagazineCargoGlobal ["bulk_ItemWire",  30];
buildingCrate addMagazineCargoGlobal ["CinderBlocks", 30];
buildingCrate addMagazineCargoGlobal ["cinder_door_kit", 30];
buildingCrate addMagazineCargoGlobal ["cinder_garage_kit", 30];
buildingCrate addMagazineCargoGlobal ["cinder_wall_kit", 30];
buildingCrate addMagazineCargoGlobal ["deer_stand_kit", 30];
buildingCrate addMagazineCargoGlobal ["desert_large_net_kit", 30];
buildingCrate addMagazineCargoGlobal ["desert_net_kit", 30];
buildingCrate addMagazineCargoGlobal ["forest_large_net_kit", 30];
buildingCrate addMagazineCargoGlobal ["forest_net_kit", 30];
buildingCrate addMagazineCargoGlobal ["fuel_pump_kit", 30];
buildingCrate addMagazineCargoGlobal ["ItemBurlap", 30];
buildingCrate addMagazineCargoGlobal ["ItemCanvas", 30];
buildingCrate addMagazineCargoGlobal ["ItemComboLock", 30];
buildingCrate addMagazineCargoGlobal ["ItemCorrugated", 30];
buildingCrate addMagazineCargoGlobal ["ItemFireBarrel_Kit", 30];
buildingCrate addMagazineCargoGlobal ["ItemFuelBarrelEmpty", 30];
buildingCrate addMagazineCargoGlobal ["ItemFuelPump", 30];
buildingCrate addMagazineCargoGlobal ["ItemGenerator", 30];
buildingCrate addMagazineCargoGlobal ["ItemHotwireKit", 30];
buildingCrate addMagazineCargoGlobal ["ItemJerrycan", 30];
buildingCrate addMagazineCargoGlobal ["ItemLockbox", 30];
buildingCrate addMagazineCargoGlobal ["ItemPole", 30];
buildingCrate addMagazineCargoGlobal ["ItemSandbag", 30];
buildingCrate addMagazineCargoGlobal ["ItemSandbagExLarge",  30];
buildingCrate addMagazineCargoGlobal ["ItemSandbagExLarge5x", 30];
buildingCrate addMagazineCargoGlobal ["ItemSandbagLarge", 30];
buildingCrate addMagazineCargoGlobal ["ItemTankTrap", 30];
buildingCrate addMagazineCargoGlobal ["ItemTent", 30];
buildingCrate addMagazineCargoGlobal ["ItemTentDomed",  30];
buildingCrate addMagazineCargoGlobal ["ItemTentDomed2", 30];
buildingCrate addMagazineCargoGlobal ["ItemTentOld",  30];
buildingCrate addMagazineCargoGlobal ["ItemVault", 30];
buildingCrate addMagazineCargoGlobal ["ItemWire", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodFloor", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodFloorHalf", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodFloorQuarter", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodLadder", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodStairs", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodStairsSupport", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWall", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWallDoor", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWallDoorLg", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWallGarageDoor", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWallGarageDoorLocked", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWallLg", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWallThird", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWallWindow", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWallWindowLg", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWallWithDoor", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWallwithDoorLg", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWallWithDoorLgLocked", 30];
buildingCrate addMagazineCargoGlobal ["ItemWoodWallWithDoorLocked", 30];
buildingCrate addMagazineCargoGlobal ["light_pole_kit", 30];
buildingCrate addMagazineCargoGlobal ["m240_nest_kit", 30];
buildingCrate addMagazineCargoGlobal ["metal_floor_kit", 30];
buildingCrate addMagazineCargoGlobal ["metal_panel_kit", 30];
buildingCrate addMagazineCargoGlobal ["MortarBucket", 30];
buildingCrate addMagazineCargoGlobal ["outhouse_kit", 30];
buildingCrate addMagazineCargoGlobal ["park_bench_kit", 30];
buildingCrate addMagazineCargoGlobal ["PartGeneric", 30];
buildingCrate addMagazineCargoGlobal ["PartPlankPack", 30];
buildingCrate addMagazineCargoGlobal ["PartPlywoodPack", 30];
buildingCrate addMagazineCargoGlobal ["PartWoodLumber", 30];
buildingCrate addMagazineCargoGlobal ["PartWoodPile", 30];
buildingCrate addMagazineCargoGlobal ["PartWoodPlywood", 30];
buildingCrate addMagazineCargoGlobal ["rusty_gate_kit", 30];
buildingCrate addMagazineCargoGlobal ["sandbag_nest_kit", 30];
buildingCrate addMagazineCargoGlobal ["stick_fence_kit", 30];
buildingCrate addMagazineCargoGlobal ["storage_shed_kit", 30];
buildingCrate addMagazineCargoGlobal ["sun_shade_kit", 30];
buildingCrate addMagazineCargoGlobal ["wooden_shed_kit", 30];
buildingCrate addMagazineCargoGlobal ["wood_ramp_kit", 30];
buildingCrate addMagazineCargoGlobal ["wood_shack_kit", 30];
buildingCrate addMagazineCargoGlobal ["workbench_kit", 30];

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
	deletevehicle buildingCrate;
	titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	titleText [format[_crateName + " has no timer. Shoot it to destroy."],"PLAIN DOWN"]; titleFadeOut 4;
};
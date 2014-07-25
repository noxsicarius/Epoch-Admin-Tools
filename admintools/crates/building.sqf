private ["_LocalOrGlobal","_buildingCrate","_crateName","_pos","_classname","_dir","_selectDelayBuild"];
_LocalOrGlobal = _this select 0;

// Name of this crate
_crateName = "Building Crate";

// Crate type
_classname = "USOrdnanceBox";

// Tool use logger
if(logMajorTool) then {
	usageLogger = format["%1 %2 -- has spawned a %3 %4",name player,getPlayerUID player,_LocalOrGlobal,_crateName];
	publicVariable "usageLogger";
};

// Location of player and crate
_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];

if(_LocalOrGlobal == "local") then {
	_buildingCrate = _classname createVehicleLocal _pos;	
} else {
	_buildingCrate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
};

_buildingCrate setDir _dir;
_buildingCrate setposATL _pos;

// Remove default items/weapons from current crate before adding custom gear
clearWeaponCargoGlobal _buildingCrate;
clearMagazineCargoGlobal _buildingCrate;
clearBackpackCargoGlobal _buildingCrate;

_buildingCrate addWeaponCargoGlobal ["ItemCrowbar", 5];
_buildingCrate addWeaponCargoGlobal ["ItemEtool", 5];
_buildingCrate addWeaponCargoGlobal ["ItemHatchet_DZE", 5];
_buildingCrate addWeaponCargoGlobal ["ItemMatchbox", 5];
_buildingCrate addWeaponCargoGlobal ["ItemSledge", 5];
_buildingCrate addWeaponCargoGlobal ["ItemToolbox", 5];

_buildingCrate addMagazineCargoGlobal ["30m_plot_kit", 30];
_buildingCrate addMagazineCargoGlobal ["bulk_empty", 30];
_buildingCrate addMagazineCargoGlobal ["bulk_ItemTankTrap", 30];
_buildingCrate addMagazineCargoGlobal ["bulk_ItemWire",  30];
_buildingCrate addMagazineCargoGlobal ["CinderBlocks", 30];
_buildingCrate addMagazineCargoGlobal ["cinder_door_kit", 30];
_buildingCrate addMagazineCargoGlobal ["cinder_garage_kit", 30];
_buildingCrate addMagazineCargoGlobal ["cinder_wall_kit", 30];
_buildingCrate addMagazineCargoGlobal ["deer_stand_kit", 30];
_buildingCrate addMagazineCargoGlobal ["desert_large_net_kit", 30];
_buildingCrate addMagazineCargoGlobal ["desert_net_kit", 30];
_buildingCrate addMagazineCargoGlobal ["forest_large_net_kit", 30];
_buildingCrate addMagazineCargoGlobal ["forest_net_kit", 30];
_buildingCrate addMagazineCargoGlobal ["fuel_pump_kit", 30];
_buildingCrate addMagazineCargoGlobal ["ItemBurlap", 30];
_buildingCrate addMagazineCargoGlobal ["ItemCanvas", 30];
_buildingCrate addMagazineCargoGlobal ["ItemComboLock", 30];
_buildingCrate addMagazineCargoGlobal ["ItemCorrugated", 30];
_buildingCrate addMagazineCargoGlobal ["ItemFireBarrel_Kit", 30];
_buildingCrate addMagazineCargoGlobal ["ItemFuelBarrelEmpty", 30];
_buildingCrate addMagazineCargoGlobal ["ItemFuelPump", 30];
_buildingCrate addMagazineCargoGlobal ["ItemGenerator", 30];
_buildingCrate addMagazineCargoGlobal ["ItemHotwireKit", 30];
_buildingCrate addMagazineCargoGlobal ["ItemJerrycan", 30];
_buildingCrate addMagazineCargoGlobal ["ItemLockbox", 30];
_buildingCrate addMagazineCargoGlobal ["ItemPole", 30];
_buildingCrate addMagazineCargoGlobal ["ItemSandbag", 30];
_buildingCrate addMagazineCargoGlobal ["ItemSandbagExLarge",  30];
_buildingCrate addMagazineCargoGlobal ["ItemSandbagExLarge5x", 30];
_buildingCrate addMagazineCargoGlobal ["ItemSandbagLarge", 30];
_buildingCrate addMagazineCargoGlobal ["ItemTankTrap", 30];
_buildingCrate addMagazineCargoGlobal ["ItemTent", 30];
_buildingCrate addMagazineCargoGlobal ["ItemTentDomed",  30];
_buildingCrate addMagazineCargoGlobal ["ItemTentDomed2", 30];
_buildingCrate addMagazineCargoGlobal ["ItemTentOld",  30];
_buildingCrate addMagazineCargoGlobal ["ItemVault", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWire", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodFloor", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodFloorHalf", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodFloorQuarter", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodLadder", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodStairs", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodStairsSupport", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWall", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWallDoor", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWallDoorLg", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWallGarageDoor", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWallGarageDoorLocked", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWallLg", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWallThird", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWallWindow", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWallWindowLg", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWallWithDoor", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWallwithDoorLg", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWallWithDoorLgLocked", 30];
_buildingCrate addMagazineCargoGlobal ["ItemWoodWallWithDoorLocked", 30];
_buildingCrate addMagazineCargoGlobal ["light_pole_kit", 30];
_buildingCrate addMagazineCargoGlobal ["m240_nest_kit", 30];
_buildingCrate addMagazineCargoGlobal ["metal_floor_kit", 30];
_buildingCrate addMagazineCargoGlobal ["metal_panel_kit", 30];
_buildingCrate addMagazineCargoGlobal ["MortarBucket", 30];
_buildingCrate addMagazineCargoGlobal ["outhouse_kit", 30];
_buildingCrate addMagazineCargoGlobal ["park_bench_kit", 30];
_buildingCrate addMagazineCargoGlobal ["PartGeneric", 30];
_buildingCrate addMagazineCargoGlobal ["PartPlankPack", 30];
_buildingCrate addMagazineCargoGlobal ["PartPlywoodPack", 30];
_buildingCrate addMagazineCargoGlobal ["PartWoodLumber", 30];
_buildingCrate addMagazineCargoGlobal ["PartWoodPile", 30];
_buildingCrate addMagazineCargoGlobal ["PartWoodPlywood", 30];
_buildingCrate addMagazineCargoGlobal ["rusty_gate_kit", 30];
_buildingCrate addMagazineCargoGlobal ["sandbag_nest_kit", 30];
_buildingCrate addMagazineCargoGlobal ["stick_fence_kit", 30];
_buildingCrate addMagazineCargoGlobal ["storage_shed_kit", 30];
_buildingCrate addMagazineCargoGlobal ["sun_shade_kit", 30];
_buildingCrate addMagazineCargoGlobal ["wooden_shed_kit", 30];
_buildingCrate addMagazineCargoGlobal ["wood_ramp_kit", 30];
_buildingCrate addMagazineCargoGlobal ["wood_shack_kit", 30];
_buildingCrate addMagazineCargoGlobal ["workbench_kit", 30];

// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

_selectDelayBuild=0;
// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "_selectDelayBuild=30;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "_selectDelayBuild=60;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "_selectDelayBuild=180;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "_selectDelayBuild=300;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "_selectDelayBuild=600;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "_selectDelayBuild=1800;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "_selectDelayBuild=0;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{commandingMenu == ""};

if(_selectDelayBuild != 0) then {
	titleText [format[_crateName + " will disappear in %1 seconds.",_selectDelayBuild],"PLAIN DOWN"]; titleFadeOut 4;
	sleep _selectDelayBuild;
	// Delete crate after _selectDelayBuild seconds
	deletevehicle _buildingCrate;
	titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	titleText [format[_crateName + " has no timer. Shoot it to destroy."],"PLAIN DOWN"]; titleFadeOut 4;
};
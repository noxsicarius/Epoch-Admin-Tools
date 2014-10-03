private ["_LocalOrGlobal","_spawnCrate","_crateName","_pos","_classname","_dir","_selectDelay"];
_LocalOrGlobal = _this select 0;

// Name of this crate
_crateName = "Building Crate";

// Crate type
_classname = "USOrdnanceBox";

// Tool use logger
if(logMajorTool) then {
	usageLogger = format["%1 %2 -- has spawned a %3 %4",name player,getPlayerUID player,_LocalOrGlobal,_crateName];
	[] spawn {publicVariable "usageLogger";};
};
// Tool use broadcaster
if(!((getPlayerUID player) in SuperAdminList) && broadcastToolUse) then {
	useBroadcaster = format["%1 -- has spawned a %2 %3",name player,_LocalOrGlobal,_crateName];
	[] spawn {publicVariableServer "useBroadcaster";};
};

// Location of player and crate
_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];

if(_LocalOrGlobal == "local") then {
	_spawnCrate = _classname createVehicleLocal _pos;	
} else {
	_spawnCrate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
};

_spawnCrate setDir _dir;
_spawnCrate setposATL _pos;

// Remove default items/weapons from current crate before adding custom gear
clearWeaponCargoGlobal _spawnCrate;
clearMagazineCargoGlobal _spawnCrate;
clearBackpackCargoGlobal _spawnCrate;

_spawnCrate addWeaponCargoGlobal ["ItemCrowbar", 5];
_spawnCrate addWeaponCargoGlobal ["ItemEtool", 5];
_spawnCrate addWeaponCargoGlobal ["ItemHatchet_DZE", 5];
_spawnCrate addWeaponCargoGlobal ["ItemMatchbox_DZE", 5];
_spawnCrate addWeaponCargoGlobal ["ItemSledge", 5];
_spawnCrate addWeaponCargoGlobal ["ItemToolbox", 5];

_spawnCrate addMagazineCargoGlobal ["30m_plot_kit", 30];
_spawnCrate addMagazineCargoGlobal ["bulk_empty", 30];
_spawnCrate addMagazineCargoGlobal ["bulk_ItemTankTrap", 30];
_spawnCrate addMagazineCargoGlobal ["bulk_ItemWire",  30];
_spawnCrate addMagazineCargoGlobal ["CinderBlocks", 30];
_spawnCrate addMagazineCargoGlobal ["cinder_door_kit", 30];
_spawnCrate addMagazineCargoGlobal ["cinder_garage_kit", 30];
_spawnCrate addMagazineCargoGlobal ["cinder_wall_kit", 30];
_spawnCrate addMagazineCargoGlobal ["deer_stand_kit", 30];
_spawnCrate addMagazineCargoGlobal ["desert_large_net_kit", 30];
_spawnCrate addMagazineCargoGlobal ["desert_net_kit", 30];
_spawnCrate addMagazineCargoGlobal ["forest_large_net_kit", 30];
_spawnCrate addMagazineCargoGlobal ["forest_net_kit", 30];
_spawnCrate addMagazineCargoGlobal ["fuel_pump_kit", 30];
_spawnCrate addMagazineCargoGlobal ["ItemBurlap", 30];
_spawnCrate addMagazineCargoGlobal ["ItemCanvas", 30];
_spawnCrate addMagazineCargoGlobal ["ItemComboLock", 30];
_spawnCrate addMagazineCargoGlobal ["ItemCorrugated", 30];
_spawnCrate addMagazineCargoGlobal ["ItemFireBarrel_Kit", 30];
_spawnCrate addMagazineCargoGlobal ["ItemFuelBarrelEmpty", 30];
_spawnCrate addMagazineCargoGlobal ["ItemGenerator", 30];
_spawnCrate addMagazineCargoGlobal ["ItemHotwireKit", 30];
_spawnCrate addMagazineCargoGlobal ["ItemJerrycan", 30];
_spawnCrate addMagazineCargoGlobal ["ItemLockbox", 30];
_spawnCrate addMagazineCargoGlobal ["ItemPole", 30];
_spawnCrate addMagazineCargoGlobal ["ItemSandbag", 30];
_spawnCrate addMagazineCargoGlobal ["ItemSandbagExLarge",  30];
_spawnCrate addMagazineCargoGlobal ["ItemSandbagExLarge5x", 30];
_spawnCrate addMagazineCargoGlobal ["ItemSandbagLarge", 30];
_spawnCrate addMagazineCargoGlobal ["ItemTankTrap", 30];
_spawnCrate addMagazineCargoGlobal ["ItemTent", 30];
_spawnCrate addMagazineCargoGlobal ["ItemTentDomed",  30];
_spawnCrate addMagazineCargoGlobal ["ItemTentDomed2", 30];
_spawnCrate addMagazineCargoGlobal ["ItemTentOld",  30];
_spawnCrate addMagazineCargoGlobal ["ItemVault", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWire", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodFloor", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodFloorHalf", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodFloorQuarter", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodLadder", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodStairs", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodStairsSupport", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWall", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallDoor", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallDoorLg", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallGarageDoor", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallGarageDoorLocked", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallLg", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallThird", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallWindow", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallWindowLg", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallWithDoor", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallwithDoorLg", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallWithDoorLgLocked", 30];
_spawnCrate addMagazineCargoGlobal ["ItemWoodWallWithDoorLocked", 30];
_spawnCrate addMagazineCargoGlobal ["light_pole_kit", 30];
_spawnCrate addMagazineCargoGlobal ["m240_nest_kit", 30];
_spawnCrate addMagazineCargoGlobal ["metal_floor_kit", 30];
_spawnCrate addMagazineCargoGlobal ["metal_panel_kit", 30];
_spawnCrate addMagazineCargoGlobal ["MortarBucket", 30];
_spawnCrate addMagazineCargoGlobal ["outhouse_kit", 30];
_spawnCrate addMagazineCargoGlobal ["park_bench_kit", 30];
_spawnCrate addMagazineCargoGlobal ["PartGeneric", 30];
_spawnCrate addMagazineCargoGlobal ["PartPlankPack", 30];
_spawnCrate addMagazineCargoGlobal ["PartPlywoodPack", 30];
_spawnCrate addMagazineCargoGlobal ["PartWoodLumber", 30];
_spawnCrate addMagazineCargoGlobal ["PartWoodPile", 30];
_spawnCrate addMagazineCargoGlobal ["PartWoodPlywood", 30];
_spawnCrate addMagazineCargoGlobal ["rusty_gate_kit", 30];
_spawnCrate addMagazineCargoGlobal ["sandbag_nest_kit", 30];
_spawnCrate addMagazineCargoGlobal ["stick_fence_kit", 30];
_spawnCrate addMagazineCargoGlobal ["storage_shed_kit", 30];
_spawnCrate addMagazineCargoGlobal ["sun_shade_kit", 30];
_spawnCrate addMagazineCargoGlobal ["wooden_shed_kit", 30];
_spawnCrate addMagazineCargoGlobal ["wood_ramp_kit", 30];
_spawnCrate addMagazineCargoGlobal ["wood_shack_kit", 30];
_spawnCrate addMagazineCargoGlobal ["workbench_kit", 30];

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
_selectDelay = selectDelay;

if(selectDelay != 0) then {
	titleText [format[_crateName + " will disappear in %1 seconds.",selectDelay],"PLAIN DOWN"]; titleFadeOut 4;
	sleep _selectDelay;
	// Delete crate after selectDelay seconds
	deletevehicle _spawnCrate;
	titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	titleText [format[_crateName + " has no timer. Shoot it to destroy."],"PLAIN DOWN"]; titleFadeOut 4;
};

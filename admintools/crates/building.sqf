_className = "USOrdnanceBox";
_mypos = getposATL player;
_dir = getdir player;
_mypos = [(_mypos select 0)+2*sin(_dir),(_mypos select 1)+2*cos(_dir), (_mypos select 2)];
_magicbox = createVehicle [_className, _mypos, [], 0, "CAN_COLLIDE"];
_magicbox setDir _dir;
_magicbox setposATL _mypos;

_dayz_wep =[
"ItemCrowbar",
"ItemEtool",
"ItemHatchet",
"ItemMatchbox",
"ItemSledge",
"ItemToolbox"
];

_dayz_mag =[
"30m_plot_kit",
"bulk_empty",
"bulk_ItemWire", 
"bulk_ItemTankTrap",
"CinderBlocks",
"cinder_door_kit",
"cinder_garage_kit",
"cinder_wall_kit",
"deer_stand_kit",
"desert_large_net_kit",
"desert_net_kit",
"forest_large_net_kit",
"forest_net_kit",
"fuel_pump_kit",
"ItemBurlap",
"ItemCanvas",
"ItemComboLock",
"ItemCorrugated",
"ItemFireBarrel_Kit",
"ItemFuelBarrelEmpty",
"ItemFuelPump",
"ItemGenerator",
"ItemHotwireKit",
"ItemJerrycan",
"ItemLockbox",
"ItemPole",
"ItemSandbag",
"ItemSandbagLarge",
"ItemSandbagExLarge", 
"ItemSandbagExLarge5x",
"ItemTankTrap",
"ItemTent",
"ItemTentOld", 
"ItemTentDomed", 
"ItemTentDomed2",
"ItemVault",
"ItemWire",
"ItemWoodFloor",
"ItemWoodFloorHalf",
"ItemWoodFloorQuarter",
"ItemWoodLadder",
"ItemWoodStairs",
"ItemWoodStairsSupport",
"ItemWoodWall",
"ItemWoodWallDoor",
"ItemWoodWallDoorLg",
"ItemWoodWallGarageDoor",
"ItemWoodWallGarageDoorLocked",
"ItemWoodWallLg",
"ItemWoodWallThird",
"ItemWoodWallWindow",
"ItemWoodWallWindowLg",
"ItemWoodWallWithDoor",
"ItemWoodWallwithDoorLg",
"ItemWoodWallWithDoorLgLocked",
"ItemWoodWallWithDoorLocked",
"light_pole_kit",
"m240_nest_kit",
"metal_floor_kit",
"metal_panel_kit",
"MortarBucket",
"outhouse_kit",
"park_bench_kit",
"PartGeneric",
"PartPlankPack",
"PartPlywoodPack",
"PartWoodLumber",
"PartWoodPile",
"PartWoodPlywood",
"rusty_gate_kit",
"sandbag_nest_kit",
"stick_fence_kit",
"storage_shed_kit",
"sun_shade_kit",
"wooden_shed_kit",
"wood_ramp_kit",
"wood_shack_kit",
"workbench_kit"
];

clearWeaponCargoGlobal _magicbox;
clearMagazineCargoGlobal _magicbox;
clearBackpackCargoGlobal _magicbox;

{_magicbox addWeaponCargoGlobal [_x,5];} forEach _dayz_wep;
{_magicbox addMagazineCargoGlobal [_x,50];} forEach _dayz_mag;

"MeleeHatchet" call dayz_meleeMagazineCheck;
"MeleeCrowbar" call dayz_meleeMagazineCheck;

//hint "Admin Building Crate Spawned";
cutText ["Building Crate Spawned", "PLAIN"];

//Wait 5 minutes, then remove crate
sleep 300;
deleteVehicle _magicbox;

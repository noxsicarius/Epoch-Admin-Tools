_className = "USOrdnanceBox";
_mypos = getposATL player;
_dir = getdir player;
_mypos = [(_mypos select 0)+2*sin(_dir),(_mypos select 1)+2*cos(_dir), (_mypos select 2)];
_magicbox = createVehicle [_className, _mypos, [], 0, "CAN_COLLIDE"];
_magicbox setDir _dir;
_magicbox setposATL _mypos;

 _dayz_wep =["ItemHatchet","ItemCrowbar","ItemEtool","ItemMatchbox","ItemToolbox","ItemSledge"];   
   
 _dayz_mag =["30m_plot_kit","ItemTent","ItemWire","ItemPole","ItemBurlap","ItemSandbagLarge","ItemTankTrap","ItemSandbag","ItemCanvas","PartWoodPile","ItemComboLock","ItemCorrugated","bulk_empty","metal_floor_kit","cinder_wall_kit","cinder_garage_kit","cinder_door_kit","workbench_kit","wood_ramp_kit","metal_panel_kit","deer_stand_kit","desert_large_net_kit","desert_net_kit","forest_large_net_kit","forest_net_kit","fuel_pump_kit","light_pole_kit","stick_fence_kit","wooden_shed_kit","storage_shed_kit","wood_shack_kit","m240_nest_kit","sun_shade_kit","park_bench_kit","rusty_gate_kit","sandbag_nest_kit","outhouse_kit","ItemGenerator","ItemFuelPump","ItemVault","ItemLockbox","ItemWoodFloor","ItemWoodFloorHalf","ItemWoodFloorQuarter","ItemWoodStairs","ItemWoodStairsSupport","ItemWoodLadder","ItemWoodWall","ItemWoodWallThird","ItemWoodWallDoor","ItemWoodWallWithDoor","ItemWoodWallWithDoorLocked","ItemWoodWallLg","ItemWoodWallGarageDoor","ItemWoodWallGarageDoorLocked","ItemWoodWallDoorLg","ItemWoodWallWithDoorLgLocked","ItemWoodWallWindowLg","PartPlankPack","PartPlywoodPack","CinderBlocks","MortarBucket","PartWoodLumber","PartWoodPlywood","ItemHotwireKit"];
   
clearWeaponCargoGlobal _magicbox;
clearMagazineCargoGlobal _magicbox;
clearBackpackCargoGlobal _magicbox;
 
{_magicbox addWeaponCargoGlobal [_x,50];} forEach _dayz_wep;  
{_magicbox addMagazineCargoGlobal [_x,50];} forEach _dayz_mag; 

"MeleeHatchet" call dayz_meleeMagazineCheck;
"MeleeCrowbar" call dayz_meleeMagazineCheck;

//hint "Admin Building Crate Spawned";
cutText ["Admin Building Crate Spawned", "PLAIN"];

//Wait 5 minutes, then remove crate
sleep 300;
deleteVehicle _magicbox;
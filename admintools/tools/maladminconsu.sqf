_className = "USOrdnanceBox";
_mypos = getposATL player;
_dir = getdir player;
_mypos = [(_mypos select 0)+2*sin(_dir),(_mypos select 1)+2*cos(_dir), (_mypos select 2)];
_magicbox = createVehicle [_className, _mypos, [], 0, "CAN_COLLIDE"];
_magicbox setDir _dir;
_magicbox setposATL _mypos;

 _dayz_wep =["Binocular","Binocular_Vector","ItemCompass","ItemEtool","ItemFlashlight","ItemFlashlightRed","ItemGPS","ItemKnife","ItemMap","ItemMatchbox","ItemRadio","ItemWatch","Laserdesignator","NVGoggles","ItemFishingPole","ItemKeyKit","ItemSledge"]; 
 
 _dayz_mag =["FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodSteakCooked","FoodSteakRaw","HandChemBlue","HandChemGreen","HandChemRed","HandRoadFlare","ItemAntibiotic","ItemBandage","ItemBloodbag","ItemEpinephrine","ItemHeatPack","ItemJerrycan","ItemMixOil","ItemMorphine","ItemPainkiller","ItemSodaCoke","ItemSodaEmpty","ItemSodaMdew","ItemSodaPepsi","ItemWaterbottle","PartEngine","PartFueltank","PartGeneric","PartGlass","PartWheel","PartVRotor","TrapBear","TrashTinCan","TrashJackDaniels","ItemFuelBarrel","ItemOilBarrel","ItemBriefcaseEmpty","ItemSilverBar","ItemSilverBar10oz","ItemGoldBar","ItemGoldBar10oz","ItemBriefcase100oz","Skin_Soldier1_DZ","Skin_Sniper1_DZ","Skin_Camo1_DZ","Skin_Bandit1_DZ","Skin_Pilot_EP1_DZ","Skin_SurvivorWcombat_DZ"];

clearWeaponCargoGlobal _magicbox;
clearMagazineCargoGlobal _magicbox;
clearBackpackCargoGlobal _magicbox;
 
{_magicbox addWeaponCargoGlobal [_x,50];} forEach _dayz_wep;  
{_magicbox addMagazineCargoGlobal [_x,50];} forEach _dayz_mag; 

"MeleeHatchet" call dayz_meleeMagazineCheck;
"MeleeCrowbar" call dayz_meleeMagazineCheck;

//hint "Admin Consumables Crate Spawned";
cutText ["Admin Consumables Crate Spawned", "PLAIN"];

//Wait 5 minutes, then remove crate
sleep 300;
deleteVehicle _magicbox;
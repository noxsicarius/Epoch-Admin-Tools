// Name of this crate
_crateName = "Items Crate";

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

_spawnCrate addWeaponCargoGlobal ["Binocular", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Binocular_Vector", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemCompass", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemCrowbar", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemEtool", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemFishingPole", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemFlashlight", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemFlashlightRed", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemGPS", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemHatchet", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemKeyKit", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemKnife", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemMap", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemMatchbox", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemRadio", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemSledge", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemToolbox", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemWatch", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Laserdesignator", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["NVGoggles", _numItems * 5];

_spawnCrate addMagazineCargoGlobal ["FoodSteakCooked", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["HandChemBlue", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["HandChemGreen", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["HandChemRed", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["HandRoadFlare", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemAntibiotic", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemBandage", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemBloodbag", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemBriefcase100oz", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemBriefcaseEmpty", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemCopperBar", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemCopperBar10oz", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemEpinephrine", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemFuelBarrel", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemGoldBar", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemGoldBar10oz", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemHeatPack", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemJerrycan", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemMorphine", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemOilBarrel", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemPainkiller", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemSilverBar", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemSilverBar10oz", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["ItemSodaMdew", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["PartEngine", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["PartFueltank", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["PartGeneric", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["PartGlass", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["PartVRotor", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["PartWheel", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Bandit1_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Bandit2_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_BanditW1_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_BanditW2_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_CZ_Soldier_Sniper_EP1_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Drake_Light_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_FR_OHara_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_FR_Rodriguez_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Functionary1_EP1_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Graves_Light_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_GUE_Commander_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_2_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_CO_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_Crew_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_MG_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_Sniper_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Haris_Press_EP1_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Ins_Soldier_GL_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Pilot_EP1_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Priest_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Rocker1_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Rocker2_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Rocker3_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Rocker4_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Rocket_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_RU_Policeman_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Sniper1_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Soldier_Bodyguard_AA12_PMC_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Soldier_Sniper_PMC_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_Soldier_TL_PMC_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorW2_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorW3_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWcombat_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWdesert_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWpink_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWsequishaD_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWsequisha_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_TK_INS_Soldier_EP1_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["Skin_TK_INS_Warlord_EP1_DZ", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["TrapBear", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["TrashJackDaniels", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["TrashTinCan", _numItems * 20];

_spawnCrate addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];


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
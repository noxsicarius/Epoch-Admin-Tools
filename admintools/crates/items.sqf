private ["LocalOrGlobal","spawnCrate"];
LocalOrGlobal = _this select 0;

// Name of this crate
_crateName = "Items Crate";

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

spawnCrate addWeaponCargoGlobal ["Binocular", 5];
spawnCrate addWeaponCargoGlobal ["Binocular_Vector", 5];
spawnCrate addWeaponCargoGlobal ["ItemCompass", 5];
spawnCrate addWeaponCargoGlobal ["ItemCrowbar", 5];
spawnCrate addWeaponCargoGlobal ["ItemEtool", 5];
spawnCrate addWeaponCargoGlobal ["ItemFishingPole", 5];
spawnCrate addWeaponCargoGlobal ["ItemFlashlight", 5];
spawnCrate addWeaponCargoGlobal ["ItemFlashlightRed", 5];
spawnCrate addWeaponCargoGlobal ["ItemGPS", 5];
spawnCrate addWeaponCargoGlobal ["ItemHatchet", 5];
spawnCrate addWeaponCargoGlobal ["ItemKeyKit", 5];
spawnCrate addWeaponCargoGlobal ["ItemKnife", 5];
spawnCrate addWeaponCargoGlobal ["ItemMap", 5];
spawnCrate addWeaponCargoGlobal ["ItemMatchbox", 5];
spawnCrate addWeaponCargoGlobal ["ItemRadio", 5];
spawnCrate addWeaponCargoGlobal ["ItemSledge", 5];
spawnCrate addWeaponCargoGlobal ["ItemToolbox", 5];
spawnCrate addWeaponCargoGlobal ["ItemWatch", 5];
spawnCrate addWeaponCargoGlobal ["Laserdesignator", 5];
spawnCrate addWeaponCargoGlobal ["NVGoggles", 5];

spawnCrate addMagazineCargoGlobal ["FoodSteakCooked", 10];
spawnCrate addMagazineCargoGlobal ["HandChemBlue", 10];
spawnCrate addMagazineCargoGlobal ["HandChemGreen", 10];
spawnCrate addMagazineCargoGlobal ["HandChemRed", 10];
spawnCrate addMagazineCargoGlobal ["HandRoadFlare", 10];
spawnCrate addMagazineCargoGlobal ["ItemAntibiotic", 10];
spawnCrate addMagazineCargoGlobal ["ItemBandage", 10];
spawnCrate addMagazineCargoGlobal ["ItemBloodbag", 10];
spawnCrate addMagazineCargoGlobal ["ItemBriefcase100oz", 10];
spawnCrate addMagazineCargoGlobal ["ItemBriefcaseEmpty", 10];
spawnCrate addMagazineCargoGlobal ["ItemCopperBar", 10];
spawnCrate addMagazineCargoGlobal ["ItemCopperBar10oz", 10];
spawnCrate addMagazineCargoGlobal ["ItemEpinephrine", 10];
spawnCrate addMagazineCargoGlobal ["ItemFuelBarrel", 10];
spawnCrate addMagazineCargoGlobal ["ItemGoldBar", 10];
spawnCrate addMagazineCargoGlobal ["ItemGoldBar10oz", 10];
spawnCrate addMagazineCargoGlobal ["ItemHeatPack", 10];
spawnCrate addMagazineCargoGlobal ["ItemJerrycan", 10];
spawnCrate addMagazineCargoGlobal ["ItemMorphine", 10];
spawnCrate addMagazineCargoGlobal ["ItemOilBarrel", 10];
spawnCrate addMagazineCargoGlobal ["ItemPainkiller", 10];
spawnCrate addMagazineCargoGlobal ["ItemSilverBar", 10];
spawnCrate addMagazineCargoGlobal ["ItemSilverBar10oz", 10];
spawnCrate addMagazineCargoGlobal ["ItemSodaMdew", 10];
spawnCrate addMagazineCargoGlobal ["PartEngine", 10];
spawnCrate addMagazineCargoGlobal ["PartFueltank", 10];
spawnCrate addMagazineCargoGlobal ["PartGeneric", 10];
spawnCrate addMagazineCargoGlobal ["PartGlass", 10];
spawnCrate addMagazineCargoGlobal ["PartVRotor", 10];
spawnCrate addMagazineCargoGlobal ["PartWheel", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Bandit1_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Bandit2_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_BanditW1_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_BanditW2_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_CZ_Soldier_Sniper_EP1_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Drake_Light_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_FR_OHara_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_FR_Rodriguez_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Functionary1_EP1_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Graves_Light_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_GUE_Commander_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_2_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_CO_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_Crew_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_MG_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_Sniper_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Haris_Press_EP1_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Ins_Soldier_GL_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Pilot_EP1_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Priest_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Rocker1_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Rocker2_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Rocker3_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Rocker4_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Rocket_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_RU_Policeman_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Sniper1_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Soldier_Bodyguard_AA12_PMC_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Soldier_Sniper_PMC_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_Soldier_TL_PMC_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_SurvivorW2_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_SurvivorW3_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWcombat_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWdesert_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWpink_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWsequishaD_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWsequisha_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_TK_INS_Soldier_EP1_DZ", 10];
spawnCrate addMagazineCargoGlobal ["Skin_TK_INS_Warlord_EP1_DZ", 10];
spawnCrate addMagazineCargoGlobal ["TrapBear", 10];
spawnCrate addMagazineCargoGlobal ["TrashJackDaniels", 10];
spawnCrate addMagazineCargoGlobal ["TrashTinCan", 10];

spawnCrate addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];


// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

selectDelayItems=0;
// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "selectDelayItems=30;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "selectDelayItems=60;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "selectDelayItems=180;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "selectDelayItems=300;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "selectDelayItems=600;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "selectDelayItems=1800;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "selectDelayItems=0;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{commandingMenu == ""};

if(selectDelayItems != 0) then {
	titleText [format[_crateName + " will disappear in %1 seconds.",selectDelayItems],"PLAIN DOWN"]; titleFadeOut 4;
	sleep selectDelayItems;
	// Delete crate after selectDelayItems seconds
	deletevehicle spawnCrate;
	titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	titleText [format[_crateName + " has no timer. Shoot it to destroy."],"PLAIN DOWN"]; titleFadeOut 4;
};
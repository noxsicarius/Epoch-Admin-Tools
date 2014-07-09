private ["LocalOrGlobal","itemsCrate"];
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
	itemsCrate = _classname createVehicleLocal _pos;	
} else {
	itemsCrate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
};

itemsCrate setDir _dir;
itemsCrate setposATL _pos;

// Remove default items/weapons from current crate before adding custom gear
clearWeaponCargoGlobal itemsCrate;
clearMagazineCargoGlobal itemsCrate;
clearBackpackCargoGlobal itemsCrate;

itemsCrate addWeaponCargoGlobal ["Binocular", 5];
itemsCrate addWeaponCargoGlobal ["Binocular_Vector", 5];
itemsCrate addWeaponCargoGlobal ["ItemCompass", 5];
itemsCrate addWeaponCargoGlobal ["ItemCrowbar", 5];
itemsCrate addWeaponCargoGlobal ["ItemEtool", 5];
itemsCrate addWeaponCargoGlobal ["ItemFishingPole", 5];
itemsCrate addWeaponCargoGlobal ["ItemFlashlight", 5];
itemsCrate addWeaponCargoGlobal ["ItemFlashlightRed", 5];
itemsCrate addWeaponCargoGlobal ["ItemGPS", 5];
itemsCrate addWeaponCargoGlobal ["ItemHatchet", 5];
itemsCrate addWeaponCargoGlobal ["ItemKeyKit", 5];
itemsCrate addWeaponCargoGlobal ["ItemKnife", 5];
itemsCrate addWeaponCargoGlobal ["ItemMap", 5];
itemsCrate addWeaponCargoGlobal ["ItemMatchbox", 5];
itemsCrate addWeaponCargoGlobal ["ItemRadio", 5];
itemsCrate addWeaponCargoGlobal ["ItemSledge", 5];
itemsCrate addWeaponCargoGlobal ["ItemToolbox", 5];
itemsCrate addWeaponCargoGlobal ["ItemWatch", 5];
itemsCrate addWeaponCargoGlobal ["Laserdesignator", 5];
itemsCrate addWeaponCargoGlobal ["NVGoggles", 5];

itemsCrate addMagazineCargoGlobal ["FoodSteakCooked", 10];
itemsCrate addMagazineCargoGlobal ["HandChemBlue", 10];
itemsCrate addMagazineCargoGlobal ["HandChemGreen", 10];
itemsCrate addMagazineCargoGlobal ["HandChemRed", 10];
itemsCrate addMagazineCargoGlobal ["HandRoadFlare", 10];
itemsCrate addMagazineCargoGlobal ["ItemAntibiotic", 10];
itemsCrate addMagazineCargoGlobal ["ItemBandage", 10];
itemsCrate addMagazineCargoGlobal ["ItemBloodbag", 10];
itemsCrate addMagazineCargoGlobal ["ItemBriefcase100oz", 10];
itemsCrate addMagazineCargoGlobal ["ItemBriefcaseEmpty", 10];
itemsCrate addMagazineCargoGlobal ["ItemCopperBar", 10];
itemsCrate addMagazineCargoGlobal ["ItemCopperBar10oz", 10];
itemsCrate addMagazineCargoGlobal ["ItemEpinephrine", 10];
itemsCrate addMagazineCargoGlobal ["ItemFuelBarrel", 10];
itemsCrate addMagazineCargoGlobal ["ItemGoldBar", 10];
itemsCrate addMagazineCargoGlobal ["ItemGoldBar10oz", 10];
itemsCrate addMagazineCargoGlobal ["ItemHeatPack", 10];
itemsCrate addMagazineCargoGlobal ["ItemJerrycan", 10];
itemsCrate addMagazineCargoGlobal ["ItemMorphine", 10];
itemsCrate addMagazineCargoGlobal ["ItemOilBarrel", 10];
itemsCrate addMagazineCargoGlobal ["ItemPainkiller", 10];
itemsCrate addMagazineCargoGlobal ["ItemSilverBar", 10];
itemsCrate addMagazineCargoGlobal ["ItemSilverBar10oz", 10];
itemsCrate addMagazineCargoGlobal ["ItemSodaMdew", 10];
itemsCrate addMagazineCargoGlobal ["PartEngine", 10];
itemsCrate addMagazineCargoGlobal ["PartFueltank", 10];
itemsCrate addMagazineCargoGlobal ["PartGeneric", 10];
itemsCrate addMagazineCargoGlobal ["PartGlass", 10];
itemsCrate addMagazineCargoGlobal ["PartVRotor", 10];
itemsCrate addMagazineCargoGlobal ["PartWheel", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Bandit1_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Bandit2_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_BanditW1_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_BanditW2_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_CZ_Soldier_Sniper_EP1_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Drake_Light_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_FR_OHara_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_FR_Rodriguez_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Functionary1_EP1_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Graves_Light_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_GUE_Commander_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_2_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_CO_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_Crew_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_MG_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_Sniper_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Haris_Press_EP1_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Ins_Soldier_GL_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Pilot_EP1_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Priest_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Rocker1_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Rocker2_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Rocker3_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Rocker4_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Rocket_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_RU_Policeman_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Sniper1_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Soldier_Bodyguard_AA12_PMC_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Soldier_Sniper_PMC_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_Soldier_TL_PMC_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_SurvivorW2_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_SurvivorW3_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_SurvivorWcombat_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_SurvivorWdesert_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_SurvivorWpink_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_SurvivorWsequishaD_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_SurvivorWsequisha_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_TK_INS_Soldier_EP1_DZ", 10];
itemsCrate addMagazineCargoGlobal ["Skin_TK_INS_Warlord_EP1_DZ", 10];
itemsCrate addMagazineCargoGlobal ["TrapBear", 10];
itemsCrate addMagazineCargoGlobal ["TrashJackDaniels", 10];
itemsCrate addMagazineCargoGlobal ["TrashTinCan", 10];

itemsCrate addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];


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
	deletevehicle itemsCrate;
	titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	titleText [format[_crateName + " has no timer. Shoot it to destroy."],"PLAIN DOWN"]; titleFadeOut 4;
};
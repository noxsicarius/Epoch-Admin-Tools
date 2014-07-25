private ["_LocalOrGlobal","_itemsCrate","_crateName","_pos","_classname","_dir","_selectDelayItems"];
_LocalOrGlobal = _this select 0;

// Name of this crate
_crateName = "Items Crate";

// Crate type
_classname = "USOrdnanceBox";

// Tool use logger
if(logToolUse) then {
	usageLogger = format["%1 %2 -- has spawned a %3 %4",name player,getPlayerUID player,_LocalOrGlobal,_crateName];
	publicVariable "usageLogger";
};

// Location of player and crate
_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];

if(_LocalOrGlobal == "local") then {
	_itemsCrate = _classname createVehicleLocal _pos;	
} else {
	_itemsCrate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
};

_itemsCrate setDir _dir;
_itemsCrate setposATL _pos;

// Remove default items/weapons from current crate before adding custom gear
clearWeaponCargoGlobal _itemsCrate;
clearMagazineCargoGlobal _itemsCrate;
clearBackpackCargoGlobal _itemsCrate;

_itemsCrate addWeaponCargoGlobal ["Binocular", 5];
_itemsCrate addWeaponCargoGlobal ["Binocular_Vector", 5];
_itemsCrate addWeaponCargoGlobal ["ItemCompass", 5];
_itemsCrate addWeaponCargoGlobal ["ItemCrowbar", 5];
_itemsCrate addWeaponCargoGlobal ["ItemEtool", 5];
_itemsCrate addWeaponCargoGlobal ["ItemFishingPole", 5];
_itemsCrate addWeaponCargoGlobal ["ItemFlashlight", 5];
_itemsCrate addWeaponCargoGlobal ["ItemFlashlightRed", 5];
_itemsCrate addWeaponCargoGlobal ["ItemGPS", 5];
_itemsCrate addWeaponCargoGlobal ["ItemHatchet_DZE", 5];
_itemsCrate addWeaponCargoGlobal ["ItemKeyKit", 5];
_itemsCrate addWeaponCargoGlobal ["ItemKnife", 5];
_itemsCrate addWeaponCargoGlobal ["ItemMap", 5];
_itemsCrate addWeaponCargoGlobal ["ItemMatchbox", 5];
_itemsCrate addWeaponCargoGlobal ["ItemRadio", 5];
_itemsCrate addWeaponCargoGlobal ["ItemSledge", 5];
_itemsCrate addWeaponCargoGlobal ["ItemToolbox", 5];
_itemsCrate addWeaponCargoGlobal ["ItemWatch", 5];
_itemsCrate addWeaponCargoGlobal ["Laserdesignator", 5];
_itemsCrate addWeaponCargoGlobal ["NVGoggles", 5];

_itemsCrate addMagazineCargoGlobal ["FoodSteakCooked", 10];
_itemsCrate addMagazineCargoGlobal ["HandChemBlue", 10];
_itemsCrate addMagazineCargoGlobal ["HandChemGreen", 10];
_itemsCrate addMagazineCargoGlobal ["HandChemRed", 10];
_itemsCrate addMagazineCargoGlobal ["HandRoadFlare", 10];
_itemsCrate addMagazineCargoGlobal ["ItemAntibiotic", 10];
_itemsCrate addMagazineCargoGlobal ["ItemBandage", 10];
_itemsCrate addMagazineCargoGlobal ["ItemBloodbag", 10];
_itemsCrate addMagazineCargoGlobal ["ItemBriefcase100oz", 10];
_itemsCrate addMagazineCargoGlobal ["ItemBriefcaseEmpty", 10];
_itemsCrate addMagazineCargoGlobal ["ItemCopperBar", 10];
_itemsCrate addMagazineCargoGlobal ["ItemCopperBar10oz", 10];
_itemsCrate addMagazineCargoGlobal ["ItemEpinephrine", 10];
_itemsCrate addMagazineCargoGlobal ["ItemFuelBarrel", 10];
_itemsCrate addMagazineCargoGlobal ["ItemGoldBar", 10];
_itemsCrate addMagazineCargoGlobal ["ItemGoldBar10oz", 10];
_itemsCrate addMagazineCargoGlobal ["ItemHeatPack", 10];
_itemsCrate addMagazineCargoGlobal ["ItemJerrycan", 10];
_itemsCrate addMagazineCargoGlobal ["ItemMorphine", 10];
_itemsCrate addMagazineCargoGlobal ["ItemOilBarrel", 10];
_itemsCrate addMagazineCargoGlobal ["ItemPainkiller", 10];
_itemsCrate addMagazineCargoGlobal ["ItemSilverBar", 10];
_itemsCrate addMagazineCargoGlobal ["ItemSilverBar10oz", 10];
_itemsCrate addMagazineCargoGlobal ["ItemSodaMdew", 10];
_itemsCrate addMagazineCargoGlobal ["PartEngine", 10];
_itemsCrate addMagazineCargoGlobal ["PartFueltank", 10];
_itemsCrate addMagazineCargoGlobal ["PartGeneric", 10];
_itemsCrate addMagazineCargoGlobal ["PartGlass", 10];
_itemsCrate addMagazineCargoGlobal ["PartVRotor", 10];
_itemsCrate addMagazineCargoGlobal ["PartWheel", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Bandit1_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Bandit2_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_BanditW1_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_BanditW2_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_CZ_Soldier_Sniper_EP1_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Drake_Light_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_FR_OHara_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_FR_Rodriguez_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Functionary1_EP1_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Graves_Light_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_GUE_Commander_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_2_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_CO_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_Crew_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_MG_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_Sniper_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Haris_Press_EP1_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Ins_Soldier_GL_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Pilot_EP1_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Priest_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Rocker1_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Rocker2_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Rocker3_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Rocker4_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Rocket_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_RU_Policeman_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Sniper1_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Soldier_Bodyguard_AA12_PMC_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Soldier_Sniper_PMC_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_Soldier_TL_PMC_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_SurvivorW2_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_SurvivorW3_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_SurvivorWcombat_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_SurvivorWdesert_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_SurvivorWpink_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_SurvivorWsequishaD_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_SurvivorWsequisha_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_TK_INS_Soldier_EP1_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["Skin_TK_INS_Warlord_EP1_DZ", 10];
_itemsCrate addMagazineCargoGlobal ["TrapBear", 10];
_itemsCrate addMagazineCargoGlobal ["TrashJackDaniels", 10];
_itemsCrate addMagazineCargoGlobal ["TrashTinCan", 10];

_itemsCrate addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];


// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

_selectDelayItems=0;
// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "_selectDelayItems=30;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "_selectDelayItems=60;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "_selectDelayItems=180;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "_selectDelayItems=300;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "_selectDelayItems=600;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "_selectDelayItems=1800;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "_selectDelayItems=0;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{commandingMenu == ""};

if(_selectDelayItems != 0) then {
	titleText [format[_crateName + " will disappear in %1 seconds.",_selectDelayItems],"PLAIN DOWN"]; titleFadeOut 4;
	sleep _selectDelayItems;
	// Delete crate after _selectDelayItems seconds
	deletevehicle _itemsCrate;
	titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	titleText [format[_crateName + " has no timer. Shoot it to destroy."],"PLAIN DOWN"]; titleFadeOut 4;
};
private ["_LocalOrGlobal","_spawnCrate","_crateName","_pos","_classname","_dir","_selectDelay"];
_LocalOrGlobal = _this select 0;

// Name of this crate
_crateName = "Items Crate";

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

_spawnCrate addWeaponCargoGlobal ["Binocular", 5];
_spawnCrate addWeaponCargoGlobal ["Binocular_Vector", 5];
_spawnCrate addWeaponCargoGlobal ["ItemCompass", 5];
_spawnCrate addWeaponCargoGlobal ["ItemCrowbar", 5];
_spawnCrate addWeaponCargoGlobal ["ItemEtool", 5];
_spawnCrate addWeaponCargoGlobal ["ItemFishingPole", 5];
_spawnCrate addWeaponCargoGlobal ["ItemFlashlight", 5];
_spawnCrate addWeaponCargoGlobal ["ItemFlashlightRed", 5];
_spawnCrate addWeaponCargoGlobal ["ItemGPS", 5];
_spawnCrate addWeaponCargoGlobal ["ItemHatchet_DZE", 5];
_spawnCrate addWeaponCargoGlobal ["ItemKeyKit", 5];
_spawnCrate addWeaponCargoGlobal ["ItemKnife", 5];
_spawnCrate addWeaponCargoGlobal ["ItemMap", 5];
_spawnCrate addWeaponCargoGlobal ["ItemMatchbox_DZE", 5];
_spawnCrate addWeaponCargoGlobal ["ItemRadio", 5];
_spawnCrate addWeaponCargoGlobal ["ItemSledge", 5];
_spawnCrate addWeaponCargoGlobal ["ItemToolbox", 5];
_spawnCrate addWeaponCargoGlobal ["ItemWatch", 5];
_spawnCrate addWeaponCargoGlobal ["Laserdesignator", 5];
_spawnCrate addWeaponCargoGlobal ["NVGoggles", 5];

_spawnCrate addMagazineCargoGlobal ["FoodSteakCooked", 10];
_spawnCrate addMagazineCargoGlobal ["HandChemBlue", 10];
_spawnCrate addMagazineCargoGlobal ["HandChemGreen", 10];
_spawnCrate addMagazineCargoGlobal ["HandChemRed", 10];
_spawnCrate addMagazineCargoGlobal ["HandRoadFlare", 10];
_spawnCrate addMagazineCargoGlobal ["ItemAntibiotic", 10];
_spawnCrate addMagazineCargoGlobal ["ItemBandage", 10];
_spawnCrate addMagazineCargoGlobal ["ItemBloodbag", 10];
_spawnCrate addMagazineCargoGlobal ["ItemBriefcase100oz", 10];
_spawnCrate addMagazineCargoGlobal ["ItemBriefcaseEmpty", 10];
_spawnCrate addMagazineCargoGlobal ["ItemCopperBar", 10];
_spawnCrate addMagazineCargoGlobal ["ItemCopperBar10oz", 10];
_spawnCrate addMagazineCargoGlobal ["ItemEpinephrine", 10];
_spawnCrate addMagazineCargoGlobal ["ItemFuelBarrel", 10];
_spawnCrate addMagazineCargoGlobal ["ItemGoldBar", 10];
_spawnCrate addMagazineCargoGlobal ["ItemGoldBar10oz", 10];
_spawnCrate addMagazineCargoGlobal ["ItemHeatPack", 10];
_spawnCrate addMagazineCargoGlobal ["ItemJerrycan", 10];
_spawnCrate addMagazineCargoGlobal ["ItemMorphine", 10];
_spawnCrate addMagazineCargoGlobal ["ItemOilBarrel", 10];
_spawnCrate addMagazineCargoGlobal ["ItemPainkiller", 10];
_spawnCrate addMagazineCargoGlobal ["ItemSilverBar", 10];
_spawnCrate addMagazineCargoGlobal ["ItemSilverBar10oz", 10];
_spawnCrate addMagazineCargoGlobal ["ItemSodaMdew", 10];
_spawnCrate addMagazineCargoGlobal ["PartEngine", 10];
_spawnCrate addMagazineCargoGlobal ["PartFueltank", 10];
_spawnCrate addMagazineCargoGlobal ["PartGeneric", 10];
_spawnCrate addMagazineCargoGlobal ["PartGlass", 10];
_spawnCrate addMagazineCargoGlobal ["PartVRotor", 10];
_spawnCrate addMagazineCargoGlobal ["PartWheel", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Bandit1_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Bandit2_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_BanditW1_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_BanditW2_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_CZ_Soldier_Sniper_EP1_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Drake_Light_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_FR_OHara_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_FR_Rodriguez_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Functionary1_EP1_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Graves_Light_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_GUE_Commander_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_2_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_CO_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_Crew_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_MG_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_GUE_Soldier_Sniper_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Haris_Press_EP1_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Ins_Soldier_GL_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Pilot_EP1_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Priest_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Rocker1_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Rocker2_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Rocker3_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Rocker4_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Rocket_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_RU_Policeman_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Sniper1_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Soldier_Bodyguard_AA12_PMC_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Soldier_Sniper_PMC_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_Soldier_TL_PMC_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorW2_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorW3_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWcombat_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWdesert_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWpink_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWsequishaD_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_SurvivorWsequisha_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_TK_INS_Soldier_EP1_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["Skin_TK_INS_Warlord_EP1_DZ", 10];
_spawnCrate addMagazineCargoGlobal ["TrapBear", 10];
_spawnCrate addMagazineCargoGlobal ["TrashJackDaniels", 10];
_spawnCrate addMagazineCargoGlobal ["TrashTinCan", 10];

_spawnCrate addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];


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

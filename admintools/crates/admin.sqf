_classname = "MedBox0";
_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];
_box = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
_box setDir _dir;
_box setposATL _pos;

_itemn = 10;

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addWeaponCargoGlobal ["Binocular", _itemn];
_box addWeaponCargoGlobal ["ItemEtool", _itemn];
_box addWeaponCargoGlobal ["ItemCompass", _itemn];
_box addWeaponCargoGlobal ["ItemFlashlight", _itemn];
_box addWeaponCargoGlobal ["ItemGPS", _itemn];
_box addWeaponCargoGlobal ["ItemHatchet", _itemn];
_box addWeaponCargoGlobal ["ItemKnife", _itemn];
_box addWeaponCargoGlobal ["ItemMap", _itemn];
_box addWeaponCargoGlobal ["ItemMatchbox", _itemn];
_box addWeaponCargoGlobal ["ItemToolbox", _itemn];
_box addWeaponCargoGlobal ["ItemCrowbar", _itemn];
_box addWeaponCargoGlobal ["ItemWatch", _itemn];

_box addMagazineCargoGlobal ["FoodSteakCooked", _itemn * 5];
_box addMagazineCargoGlobal ["ItemAntibiotic", _itemn * 5];
_box addMagazineCargoGlobal ["ItemBandage", _itemn * 5];
_box addMagazineCargoGlobal ["ItemBloodbag", _itemn * 5];
_box addMagazineCargoGlobal ["ItemEpinephrine", _itemn * 5];
_box addMagazineCargoGlobal ["ItemHeatPack", _itemn * 5];
_box addMagazineCargoGlobal ["ItemJerrycan", _itemn * 5];
_box addMagazineCargoGlobal ["ItemMorphine", _itemn * 5];
_box addMagazineCargoGlobal ["ItemVault", 5];
_box addMagazineCargoGlobal ["ItemPainkiller", _itemn * 5];
_box addMagazineCargoGlobal ["ItemSandbagLarge", _itemn * 5];
_box addMagazineCargoGlobal ["ItemSandbag", _itemn * 5];
_box addMagazineCargoGlobal ["ItemSodaCoke", _itemn * 5];
_box addMagazineCargoGlobal ["ItemSodaMdew", _itemn * 5];
_box addMagazineCargoGlobal ["ItemSodaPepsi", _itemn * 5];
_box addMagazineCargoGlobal ["ItemTankTrap", _itemn * 5];
_box addMagazineCargoGlobal ["ItemTent", _itemn * 5];
_box addMagazineCargoGlobal ["ItemWire", _itemn * 5];
_box addMagazineCargoGlobal ["ItemWaterbottle", _itemn * 5];
_box addMagazineCargoGlobal ["PartEngine", _itemn * 5];
_box addMagazineCargoGlobal ["PartFueltank", _itemn * 5];
_box addMagazineCargoGlobal ["PartGeneric", _itemn * 5];
_box addMagazineCargoGlobal ["PartGlass", _itemn * 5];
_box addMagazineCargoGlobal ["PartWheel", _itemn * 5];
_box addMagazineCargoGlobal ["PartWoodPile", _itemn * 5];
_box addMagazineCargoGlobal ["PartVRotor", _itemn * 5];
_box addMagazineCargoGlobal ["SmokeShellGreen", _itemn * 5];
_box addMagazineCargoGlobal ["ItemGoldBar10oz", _itemn * 5];
_box addMagazineCargoGlobal ["ItemBriefcase100oz", _itemn * 5];

_box addMagazineCargoGlobal ["ItemPole", _itemn * 5];
_box addMagazineCargoGlobal ["ItemLightBulb", _itemn * 5];
_box addMagazineCargoGlobal ["storage_shed_kit", _itemn];
_box addMagazineCargoGlobal ["30m_plot_kit", _itemn * 5];
_box addMagazineCargoGlobal ["PartWoodPlywood", _itemn * 5];
_box addMagazineCargoGlobal ["ItemCanvas", _itemn * 5];
_box addMagazineCargoGlobal ["PartWoodLumber", _itemn * 5];
_box addMagazineCargoGlobal ["storage_shed_kit", _itemn * 5];

_box addWeaponCargoGlobal ["ItemFishingPole", _itemn];


// Skins
_box addMagazineCargoGlobal ["Skin_Camo1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Soldier1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Sniper1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Survivor2_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_RU_Policeman_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Drake_Light_DZ", _itemn];

_box addBackpackCargoGlobal ["DZ_Backpack_EP1", 1];

_box addWeaponCargoGlobal ["AK_107_Kobra", _itemn];
_box addMagazineCargoGlobal ["30Rnd_545x39_AK", _itemn * 4];

_box addWeaponCargoGlobal ["DMR", _itemn];
_box addMagazineCargoGlobal ["20Rnd_762x51_DMR", _itemn * 4];

_box addWeaponCargoGlobal ["M4A1_AIM_SD_camo", _itemn];
_box addMagazineCargoGlobal ["30Rnd_556x45_StanagSD", _itemn * 4];

_box addWeaponCargoGlobal ["Mk_48_DZ", _itemn];
_box addMagazineCargoGlobal ["100Rnd_762x51_M240", _itemn * 4];

_box addWeaponCargoGlobal ["M9SD", _itemn];
_box addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _itemn * 4];

_box addWeaponCargoGlobal ["FN_FAL", _itemn];
_box addMagazineCargoGlobal ["20Rnd_762x51_FNFAL", _itemn * 4];

_box addWeaponCargoGlobal ["BAF_LRR_scoped", _itemn];
_box addMagazineCargoGlobal ["5Rnd_86x70_L115A1", _itemn * 4];

titleText [format["Admin Box spawned nearby."],"PLAIN DOWN"]; titleFadeOut 4;

delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["1 min", [2], "", -5, [["expression", "SelectDelay=60;DelaySelected=true;"]], "1", "1"],
	["2 min", [3], "", -5, [["expression", "SelectDelay=120;DelaySelected=true;"]], "1", "1"],
	["3 min", [4], "", -5, [["expression", "SelectDelay=180;DelaySelected=true;"]], "1", "1"],
	["4 min", [5], "", -5, [["expression", "SelectDelay=240;DelaySelected=true;"]], "1", "1"],
	["5 min", [6], "", -5, [["expression", "SelectDelay=300;DelaySelected=true;"]], "1", "1"],
	["10 min", [7], "", -5, [["expression", "SelectDelay=600;DelaySelected=true;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [11], "", -5, [["expression", "DelaySelected=false;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:delaymenu";

WaitUntil{DelaySelected};
DelaySelected=false;

sleep 3;
titleText [format["Admin Box will disappear in %1 seconds.",SelectDelay],"PLAIN DOWN"]; titleFadeOut 4;

sleep SelectDelay;

deletevehicle _box;

titleText [format["Admin Box disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
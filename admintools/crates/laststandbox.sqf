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
_box addMagazineCargoGlobal ["ItemMorphine", _itemn * 5];
_box addMagazineCargoGlobal ["ItemPainkiller", _itemn * 5];
_box addMagazineCargoGlobal ["ItemSodaPepsi", _itemn * 5];
_box addMagazineCargoGlobal ["ItemBriefcase100oz", _itemn * 1];

// Skins
_box addMagazineCargoGlobal ["Skin_Rocket_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Soldier1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Camo1_DZ", _itemn];

_box addWeaponCargoGlobal ["m8_Carbine", _itemn];
_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _itemn * 4];

_box addWeaponCargoGlobal ["m8_CarbineGL", _itemn];
_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _itemn * 4];

_box addWeaponCargoGlobal ["m8_Compact", _itemn];
_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _itemn * 4];

_box addWeaponCargoGlobal ["m8_Sharpshooter", _itemn];
_box addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag", _itemn * 4];

_box addWeaponCargoGlobal ["m8_SAW", _itemn];
_box addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag", _itemn * 4];

_box addMagazineCargoGlobal ["1Rnd_HE_M203", _itemn * 4];

_box addWeaponCargoGlobal ["M9SD", _itemn];
_box addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _itemn * 4];

_box addWeaponCargoGlobal ["m107", _itemn];
_box addMagazineCargoGlobal ["10Rnd_127x99_M107", _itemn * 4];

_box addMagazineCargoGlobal ["PipeBomb", _itemn * 4];


titleText [format["LS Event Box spawned nearby."],"PLAIN DOWN"]; titleFadeOut 4;

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
titleText [format["VIP Event Box will disappear in %1 seconds.",SelectDelay],"PLAIN DOWN"]; titleFadeOut 4;

sleep SelectDelay;

deletevehicle _box;

titleText [format["VIP Event Box disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
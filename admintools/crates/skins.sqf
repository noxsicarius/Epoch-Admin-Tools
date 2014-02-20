_classname = "MedBox0";
_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];
_box = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
_box setDir _dir;
_box setposATL _pos;

_itemn = 5;

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addMagazineCargoGlobal ["Skin_Sniper1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Rocket_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_RU_Policeman_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Pilot_EP1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Haris_Press_EP1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Ins_Soldier_GL_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_GUE_Commander_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Functionary1_EP1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Priest_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Rocker1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Rocker2_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Rocker3_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Rocker4_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Bandit1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Bandit2_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_GUE_Soldier_MG_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_GUE_Soldier_Sniper_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_GUE_Soldier_Crew_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_GUE_Soldier_CO_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_GUE_Soldier_2_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_BanditW1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_BanditW2_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_SurvivorW3_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_SurvivorW2_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_SurvivorWpink_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_SurvivorWsequisha_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_SurvivorWsequishaD_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_SurvivorWcombat_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_SurvivorWdesert_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_TK_INS_Warlord_EP1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_TK_INS_Soldier_EP1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Drake_Light_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Soldier_Bodyguard_AA12_PMC_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_FR_OHara_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_FR_Rodriguez_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_CZ_Soldier_Sniper_EP1_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Graves_Light_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Soldier_Sniper_PMC_DZ", _itemn];
_box addMagazineCargoGlobal ["Skin_Soldier_TL_PMC_DZ", _itemn];

titleText [format["Skins spawned nearby."],"PLAIN DOWN"]; titleFadeOut 4;

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
titleText [format["Bambi Box will disappear in %1 seconds.",SelectDelay],"PLAIN DOWN"]; titleFadeOut 4;

sleep SelectDelay;

deletevehicle _box;

titleText [format["Bambi Box disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
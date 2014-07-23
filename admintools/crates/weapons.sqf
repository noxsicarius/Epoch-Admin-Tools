private ["_LocalOrGlobal","_weaponsCrate","_crateName","_pos","_classname","_dir","_selectDelayWeapons"];
_LocalOrGlobal = _this select 0;

// Name of this crate
_crateName = "(Most) Weapons Crate";

// Crate type
_classname = "USOrdnanceBox";

// Location of player and crate
_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];

if(_LocalOrGlobal == "local") then {
	_weaponsCrate = _classname createVehicleLocal _pos;	
} else {
	_weaponsCrate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
};

_weaponsCrate setDir _dir;
_weaponsCrate setposATL _pos;

// Remove default items/weapons from current crate before adding custom gear
clearWeaponCargoGlobal _weaponsCrate;
clearMagazineCargoGlobal _weaponsCrate;
clearBackpackCargoGlobal _weaponsCrate;

_weaponsCrate addWeaponCargoGlobal ["AK_107_GL_Kobra", 5];
_weaponsCrate addWeaponCargoGlobal ["AK_107_GL_PSO", 5];
_weaponsCrate addWeaponCargoGlobal ["AK_107_Kobra", 5];
_weaponsCrate addWeaponCargoGlobal ["AK_107_PSO", 5];
_weaponsCrate addWeaponCargoGlobal ["AK_47_M", 5];
_weaponsCrate addWeaponCargoGlobal ["AK_47_S", 5];
_weaponsCrate addWeaponCargoGlobal ["AK_74", 5];
_weaponsCrate addWeaponCargoGlobal ["AK_74_GL", 5];
_weaponsCrate addWeaponCargoGlobal ["AK_74_GL_Kobra", 5];
_weaponsCrate addWeaponCargoGlobal ["AKS_74", 5];
_weaponsCrate addWeaponCargoGlobal ["AKS_74_Kobra", 5];
_weaponsCrate addWeaponCargoGlobal ["AKS_74_PSO", 5];
_weaponsCrate addWeaponCargoGlobal ["AKS_74_U", 5];
_weaponsCrate addWeaponCargoGlobal ["AKS_74_UN_Kobra", 5];
_weaponsCrate addWeaponCargoGlobal ["AKS_GOLD", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_AS50_scoped", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_AS50_TWS", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_L110A1_Aim", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_L7A2_GPMG", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_L85A2_RIS_ACOG", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_L85A2_RIS_CWS", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_L85A2_RIS_Holo", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_L85A2_RIS_SUSAT", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_L85A2_UGL_ACOG", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_L85A2_UGL_Holo", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_L85A2_UGL_SUSAT", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_L86A2_ACOG", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_LRR_scoped", 5];
_weaponsCrate addWeaponCargoGlobal ["BAF_LRR_scoped_W", 5];
_weaponsCrate addWeaponCargoGlobal ["bizon", 5];
_weaponsCrate addWeaponCargoGlobal ["bizon_silenced", 5];
_weaponsCrate addWeaponCargoGlobal ["Colt1911", 5];
_weaponsCrate addWeaponCargoGlobal ["Crossbow", 5];
_weaponsCrate addWeaponCargoGlobal ["DMR", 5];
_weaponsCrate addWeaponCargoGlobal ["G36_C_SD_camo", 5];
_weaponsCrate addWeaponCargoGlobal ["G36_C_SD_eotech", 5];
_weaponsCrate addWeaponCargoGlobal ["G36a", 5];
_weaponsCrate addWeaponCargoGlobal ["G36A_camo", 5];
_weaponsCrate addWeaponCargoGlobal ["G36C", 5];
_weaponsCrate addWeaponCargoGlobal ["G36C_camo", 5];
_weaponsCrate addWeaponCargoGlobal ["G36K", 5];
_weaponsCrate addWeaponCargoGlobal ["G36K_camo", 5];
_weaponsCrate addWeaponCargoGlobal ["FN_FAL", 5];
_weaponsCrate addWeaponCargoGlobal ["FN_FAL_ANPVS4", 5];
_weaponsCrate addWeaponCargoGlobal ["glock17_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["Huntingrifle", 5];
_weaponsCrate addWeaponCargoGlobal ["ksvk", 5];
_weaponsCrate addWeaponCargoGlobal ["LeeEnfield", 5];
_weaponsCrate addWeaponCargoGlobal ["M1014", 5];
_weaponsCrate addWeaponCargoGlobal ["m107", 5];
_weaponsCrate addWeaponCargoGlobal ["M14_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["M16A2", 5];
_weaponsCrate addWeaponCargoGlobal ["M16A2GL", 5];
_weaponsCrate addWeaponCargoGlobal ["m16a4", 5];
_weaponsCrate addWeaponCargoGlobal ["m16a4_acg", 5];
_weaponsCrate addWeaponCargoGlobal ["M16A4_ACG_GL", 5];
_weaponsCrate addWeaponCargoGlobal ["M16A4_GL", 5];
_weaponsCrate addWeaponCargoGlobal ["M24", 5];
_weaponsCrate addWeaponCargoGlobal ["M24_des_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["M240", 5];
_weaponsCrate addWeaponCargoGlobal ["m240_scoped_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["M249", 5];
_weaponsCrate addWeaponCargoGlobal ["M249_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["M249_m145_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["M40A3", 5];
_weaponsCrate addWeaponCargoGlobal ["M4A1", 5];
_weaponsCrate addWeaponCargoGlobal ["M4A1_Aim", 5];
_weaponsCrate addWeaponCargoGlobal ["M4A1_Aim_camo", 5];
_weaponsCrate addWeaponCargoGlobal ["M4A1_AIM_SD_camo", 5];
_weaponsCrate addWeaponCargoGlobal ["M4A1_HWS_GL", 5];
_weaponsCrate addWeaponCargoGlobal ["M4A1_HWS_GL_camo", 5];
_weaponsCrate addWeaponCargoGlobal ["M4A1_HWS_GL_SD_Camo", 5];
_weaponsCrate addWeaponCargoGlobal ["M4A1_RCO_GL", 5];
_weaponsCrate addWeaponCargoGlobal ["M4A3_CCO_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["M4A3_RCO_GL_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["M4SPR", 5];
_weaponsCrate addWeaponCargoGlobal ["M60A4_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["M9", 5];
_weaponsCrate addWeaponCargoGlobal ["M9SD", 5];
_weaponsCrate addWeaponCargoGlobal ["Makarov", 5];
_weaponsCrate addWeaponCargoGlobal ["MakarovSD", 5];
_weaponsCrate addWeaponCargoGlobal ["MeleeHatchet", 5];
_weaponsCrate addWeaponCargoGlobal ["MeleeCrowbar", 5];
_weaponsCrate addWeaponCargoGlobal ["MG36", 5];
_weaponsCrate addWeaponCargoGlobal ["Mk_48_DES_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["Mk_48_DZ", 5];
_weaponsCrate addWeaponCargoGlobal ["MP5A5", 5];
_weaponsCrate addWeaponCargoGlobal ["MP5SD", 5];
_weaponsCrate addWeaponCargoGlobal ["MR43", 5];
_weaponsCrate addWeaponCargoGlobal ["Pecheneg", 5];
_weaponsCrate addWeaponCargoGlobal ["PK", 5];
_weaponsCrate addWeaponCargoGlobal ["Remington870_lamp", 5];
_weaponsCrate addWeaponCargoGlobal ["revolver_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["revolver_gold_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["RPK_74", 5];
_weaponsCrate addWeaponCargoGlobal ["Sa61_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["Saiga12K", 5];
_weaponsCrate addWeaponCargoGlobal ["SVD", 5];
_weaponsCrate addWeaponCargoGlobal ["SVD_CAMO", 5];
_weaponsCrate addWeaponCargoGlobal ["SVD_des_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["SVD_NSPU_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["UZI_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["UZI_SD_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["Winchester1866", 5];
_weaponsCrate addWeaponCargoGlobal ["Sa58V_RCO_EP1", 5];
_weaponsCrate addWeaponCargoGlobal ["RPG7V", 5];
_weaponsCrate addWeaponCargoGlobal ["ItemMachete", 5];

_weaponsCrate addMagazineCargoGlobal ["2Rnd_shotgun_74Slug", 20];
_weaponsCrate addMagazineCargoGlobal ["2Rnd_shotgun_74Pellets", 20];
_weaponsCrate addMagazineCargoGlobal ["5Rnd_127x108_KSVK", 20];
_weaponsCrate addMagazineCargoGlobal ["5Rnd_127x99_as50", 20];
_weaponsCrate addMagazineCargoGlobal ["5Rnd_762x51_M24", 20];
_weaponsCrate addMagazineCargoGlobal ["5Rnd_86x70_L115A1", 20];
_weaponsCrate addMagazineCargoGlobal ["5x_22_LR_17_HMR", 20];
_weaponsCrate addMagazineCargoGlobal ["6Rnd_45ACP", 20];
_weaponsCrate addMagazineCargoGlobal ["7Rnd_45ACP_1911", 20];
_weaponsCrate addMagazineCargoGlobal ["8Rnd_9x18_Makarov", 20];
_weaponsCrate addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", 20];
_weaponsCrate addMagazineCargoGlobal ["8Rnd_B_Beneli_74Slug", 20];
_weaponsCrate addMagazineCargoGlobal ["8Rnd_B_Beneli_Pellets", 20];
_weaponsCrate addMagazineCargoGlobal ["8Rnd_B_Saiga12_74Slug", 20];
_weaponsCrate addMagazineCargoGlobal ["8Rnd_B_Saiga12_Pellets", 20];
_weaponsCrate addMagazineCargoGlobal ["10Rnd_127x99_M107", 20];
_weaponsCrate addMagazineCargoGlobal ["10Rnd_762x54_SVD", 20];
_weaponsCrate addMagazineCargoGlobal ["10x_303", 20];
_weaponsCrate addMagazineCargoGlobal ["15Rnd_9x19_M9", 20];
_weaponsCrate addMagazineCargoGlobal ["15Rnd_9x19_M9SD", 20];
_weaponsCrate addMagazineCargoGlobal ["15Rnd_W1866_Slug", 20];
_weaponsCrate addMagazineCargoGlobal ["15Rnd_W1866_Pellet", 20];
_weaponsCrate addMagazineCargoGlobal ["17Rnd_9x19_glock17", 20];
_weaponsCrate addMagazineCargoGlobal ["20Rnd_556x45_Stanag", 20];
_weaponsCrate addMagazineCargoGlobal ["20Rnd_762x51_DMR", 20];
_weaponsCrate addMagazineCargoGlobal ["20Rnd_762x51_FNFAL", 20];
_weaponsCrate addMagazineCargoGlobal ["20Rnd_B_765x17_Ball", 20];
_weaponsCrate addMagazineCargoGlobal ["30Rnd_545x39_AK", 20];
_weaponsCrate addMagazineCargoGlobal ["30Rnd_545x39_AKSD", 20];
_weaponsCrate addMagazineCargoGlobal ["30Rnd_556x45_G36", 20];
_weaponsCrate addMagazineCargoGlobal ["30Rnd_556x45_G36SD", 20];
_weaponsCrate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 20];
_weaponsCrate addMagazineCargoGlobal ["30Rnd_556x45_StanagSD", 20];
_weaponsCrate addMagazineCargoGlobal ["30Rnd_762x39_AK47", 20];
_weaponsCrate addMagazineCargoGlobal ["30Rnd_9x19_MP5", 20];
_weaponsCrate addMagazineCargoGlobal ["30Rnd_9x19_MP5SD", 20];
_weaponsCrate addMagazineCargoGlobal ["30Rnd_9x19_UZI", 20];
_weaponsCrate addMagazineCargoGlobal ["30Rnd_9x19_UZI_SD", 20];
_weaponsCrate addMagazineCargoGlobal ["50Rnd_127x108_KORD", 20];
_weaponsCrate addMagazineCargoGlobal ["64Rnd_9x19_Bizon", 20];
_weaponsCrate addMagazineCargoGlobal ["64Rnd_9x19_SD_Bizon", 20];
_weaponsCrate addMagazineCargoGlobal ["75Rnd_545x39_RPK", 20];
_weaponsCrate addMagazineCargoGlobal ["100Rnd_762x51_M240", 20];
_weaponsCrate addMagazineCargoGlobal ["100Rnd_762x54_PK", 20];
_weaponsCrate addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag", 20];
_weaponsCrate addMagazineCargoGlobal ["100Rnd_556x45_M249", 20];
_weaponsCrate addMagazineCargoGlobal ["200Rnd_556x45_L110A1", 20];
_weaponsCrate addMagazineCargoGlobal ["200Rnd_556x45_M249", 20];
_weaponsCrate addMagazineCargoGlobal ["BoltSteel", 20];
_weaponsCrate addMagazineCargoGlobal ["PG7V", 20];
_weaponsCrate addMagazineCargoGlobal ["1Rnd_HE_M203", 20];
_weaponsCrate addMagazineCargoGlobal ["HandGrenade_west", 20];
_weaponsCrate addMagazineCargoGlobal ["SmokeShell", 20];
_weaponsCrate addMagazineCargoGlobal ["SmokeShellGreen", 20];
_weaponsCrate addMagazineCargoGlobal ["SmokeShellRed", 20];
_weaponsCrate addMagazineCargoGlobal ["PipeBomb", 20];


// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

_selectDelayWeapons=0;
// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "_selectDelayWeapons=30;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "_selectDelayWeapons=60;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "_selectDelayWeapons=180;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "_selectDelayWeapons=300;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "_selectDelayWeapons=600;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "_selectDelayWeapons=1800;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "_selectDelayWeapons=0;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{commandingMenu == ""};

if(_selectDelayWeapons != 0) then {
	titleText [format[_crateName + " will disappear in %1 seconds.",_selectDelayWeapons],"PLAIN DOWN"]; titleFadeOut 4;
	sleep _selectDelayWeapons;
	// Delete crate after _selectDelayWeapons seconds
	deletevehicle _weaponsCrate;
	titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	titleText [format[_crateName + " has no timer. Shoot it to destroy."],"PLAIN DOWN"]; titleFadeOut 4;
};
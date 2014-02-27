// Name of this crate
_crateName = "(Most) Weapons Crate";

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

_spawnCrate addWeaponCargoGlobal ["AK_107_GL_Kobra", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AK_107_GL_PSO", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AK_107_Kobra", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AK_107_PSO", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AK_47_M", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AK_47_S", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AK_74", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AK_74_GL", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AK_74_GL_Kobra", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AKS_74", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AKS_74_Kobra", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AKS_74_PSO", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AKS_74_U", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AKS_74_UN_Kobra", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["AKS_GOLD", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_AS50_scoped", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_AS50_TWS", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_L110A1_Aim", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_L7A2_GPMG", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_L85A2_RIS_ACOG", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_L85A2_RIS_CWS", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_L85A2_RIS_Holo", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_L85A2_RIS_SUSAT", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_L85A2_UGL_ACOG", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_L85A2_UGL_Holo", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_L85A2_UGL_SUSAT", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_L86A2_ACOG", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_LRR_scoped", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["BAF_LRR_scoped_W", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["bizon", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["bizon_silenced", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Colt1911", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Crossbow", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["DMR", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["G36_C_SD_camo", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["G36_C_SD_eotech", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["G36a", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["G36A_camo", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["G36C", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["G36C_camo", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["G36K", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["G36K_camo", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["FN_FAL", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["FN_FAL_ANPVS4", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["glock17_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Huntingrifle", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ksvk", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["LeeEnfield", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M1014", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["m107", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M14_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M16A2", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M16A2GL", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["m16a4", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["m16a4_acg", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M16A4_ACG_GL", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M16A4_GL", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M24", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M24_des_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M240", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["m240_scoped_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M249", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M249_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M249_m145_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M40A3", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4A1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4A1_Aim", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4A1_Aim_camo", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4A1_AIM_SD_camo", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4A1_HWS_GL", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4A1_HWS_GL_camo", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4A1_HWS_GL_SD_Camo", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4A1_RCO_GL", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4A3_CCO_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4A3_RCO_GL_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M4SPR", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M60A4_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M9", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["M9SD", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Makarov", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["MakarovSD", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["MeleeHatchet", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["MeleeCrowbar", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["MG36", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Mk_48_DES_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Mk_48_DZ", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["MP5A5", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["MP5SD", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["MR43", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Pecheneg", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["PK", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Remington870_lamp", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["revolver_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["revolver_gold_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["RPK_74", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Sa61_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Saiga12K", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["SVD", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["SVD_CAMO", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["SVD_des_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["SVD_NSPU_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["UZI_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["UZI_SD_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Winchester1866", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["Sa58V_RCO_EP1", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["RPG7V", _numItems * 5];
_spawnCrate addWeaponCargoGlobal ["ItemMachete", _numItems * 5];

_spawnCrate addMagazineCargoGlobal ["2Rnd_shotgun_74Slug", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["2Rnd_shotgun_74Pellets", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["5Rnd_127x108_KSVK", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["5Rnd_127x99_as50", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["5Rnd_762x51_M24", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["5Rnd_86x70_L115A1", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["5x_22_LR_17_HMR", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["6Rnd_45ACP", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["7Rnd_45ACP_1911", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["8Rnd_9x18_Makarov", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["8Rnd_B_Beneli_74Slug", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["8Rnd_B_Beneli_Pellets", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["8Rnd_B_Saiga12_74Slug", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["8Rnd_B_Saiga12_Pellets", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["10Rnd_127x99_M107", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["10Rnd_762x54_SVD", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["10x_303", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["15Rnd_9x19_M9", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["15Rnd_9x19_M9SD", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["15Rnd_W1866_Slug", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["15Rnd_W1866_Pellet", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["17Rnd_9x19_glock17", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["20Rnd_556x45_Stanag", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["20Rnd_762x51_DMR", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["20Rnd_762x51_FNFAL", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["20Rnd_B_765x17_Ball", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_545x39_AK", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_545x39_AKSD", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_556x45_G36", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_556x45_G36SD", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_556x45_StanagSD", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_762x39_AK47", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_9x19_MP5", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_9x19_MP5SD", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_9x19_UZI", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["30Rnd_9x19_UZI_SD", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["50Rnd_127x108_KORD", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["64Rnd_9x19_Bizon", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["64Rnd_9x19_SD_Bizon", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["75Rnd_545x39_RPK", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["100Rnd_762x51_M240", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["100Rnd_762x54_PK", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["100Rnd_556x45_M249", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["200Rnd_556x45_L110A1", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["200Rnd_556x45_M249", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["BoltSteel", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["PG7V", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["1Rnd_HE_M203", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["HandGrenade_west", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["SmokeShell", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["SmokeShellGreen", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["SmokeShellRed", _numItems * 20];
_spawnCrate addMagazineCargoGlobal ["PipeBomb", _numItems * 20];


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
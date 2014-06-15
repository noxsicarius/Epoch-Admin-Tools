private ["LocalOrGlobal","spawnCrate"];
LocalOrGlobal = _this select 0;

// Name of this crate
_crateName = "(Most) Weapons Crate";

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

spawnCrate addWeaponCargoGlobal ["AK_107_GL_Kobra", 5];
spawnCrate addWeaponCargoGlobal ["AK_107_GL_PSO", 5];
spawnCrate addWeaponCargoGlobal ["AK_107_Kobra", 5];
spawnCrate addWeaponCargoGlobal ["AK_107_PSO", 5];
spawnCrate addWeaponCargoGlobal ["AK_47_M", 5];
spawnCrate addWeaponCargoGlobal ["AK_47_S", 5];
spawnCrate addWeaponCargoGlobal ["AK_74", 5];
spawnCrate addWeaponCargoGlobal ["AK_74_GL", 5];
spawnCrate addWeaponCargoGlobal ["AK_74_GL_Kobra", 5];
spawnCrate addWeaponCargoGlobal ["AKS_74", 5];
spawnCrate addWeaponCargoGlobal ["AKS_74_Kobra", 5];
spawnCrate addWeaponCargoGlobal ["AKS_74_PSO", 5];
spawnCrate addWeaponCargoGlobal ["AKS_74_U", 5];
spawnCrate addWeaponCargoGlobal ["AKS_74_UN_Kobra", 5];
spawnCrate addWeaponCargoGlobal ["AKS_GOLD", 5];
spawnCrate addWeaponCargoGlobal ["BAF_AS50_scoped", 5];
spawnCrate addWeaponCargoGlobal ["BAF_AS50_TWS", 5];
spawnCrate addWeaponCargoGlobal ["BAF_L110A1_Aim", 5];
spawnCrate addWeaponCargoGlobal ["BAF_L7A2_GPMG", 5];
spawnCrate addWeaponCargoGlobal ["BAF_L85A2_RIS_ACOG", 5];
spawnCrate addWeaponCargoGlobal ["BAF_L85A2_RIS_CWS", 5];
spawnCrate addWeaponCargoGlobal ["BAF_L85A2_RIS_Holo", 5];
spawnCrate addWeaponCargoGlobal ["BAF_L85A2_RIS_SUSAT", 5];
spawnCrate addWeaponCargoGlobal ["BAF_L85A2_UGL_ACOG", 5];
spawnCrate addWeaponCargoGlobal ["BAF_L85A2_UGL_Holo", 5];
spawnCrate addWeaponCargoGlobal ["BAF_L85A2_UGL_SUSAT", 5];
spawnCrate addWeaponCargoGlobal ["BAF_L86A2_ACOG", 5];
spawnCrate addWeaponCargoGlobal ["BAF_LRR_scoped", 5];
spawnCrate addWeaponCargoGlobal ["BAF_LRR_scoped_W", 5];
spawnCrate addWeaponCargoGlobal ["bizon", 5];
spawnCrate addWeaponCargoGlobal ["bizon_silenced", 5];
spawnCrate addWeaponCargoGlobal ["Colt1911", 5];
spawnCrate addWeaponCargoGlobal ["Crossbow", 5];
spawnCrate addWeaponCargoGlobal ["DMR", 5];
spawnCrate addWeaponCargoGlobal ["G36_C_SD_camo", 5];
spawnCrate addWeaponCargoGlobal ["G36_C_SD_eotech", 5];
spawnCrate addWeaponCargoGlobal ["G36a", 5];
spawnCrate addWeaponCargoGlobal ["G36A_camo", 5];
spawnCrate addWeaponCargoGlobal ["G36C", 5];
spawnCrate addWeaponCargoGlobal ["G36C_camo", 5];
spawnCrate addWeaponCargoGlobal ["G36K", 5];
spawnCrate addWeaponCargoGlobal ["G36K_camo", 5];
spawnCrate addWeaponCargoGlobal ["FN_FAL", 5];
spawnCrate addWeaponCargoGlobal ["FN_FAL_ANPVS4", 5];
spawnCrate addWeaponCargoGlobal ["glock17_EP1", 5];
spawnCrate addWeaponCargoGlobal ["Huntingrifle", 5];
spawnCrate addWeaponCargoGlobal ["ksvk", 5];
spawnCrate addWeaponCargoGlobal ["LeeEnfield", 5];
spawnCrate addWeaponCargoGlobal ["M1014", 5];
spawnCrate addWeaponCargoGlobal ["m107", 5];
spawnCrate addWeaponCargoGlobal ["M14_EP1", 5];
spawnCrate addWeaponCargoGlobal ["M16A2", 5];
spawnCrate addWeaponCargoGlobal ["M16A2GL", 5];
spawnCrate addWeaponCargoGlobal ["m16a4", 5];
spawnCrate addWeaponCargoGlobal ["m16a4_acg", 5];
spawnCrate addWeaponCargoGlobal ["M16A4_ACG_GL", 5];
spawnCrate addWeaponCargoGlobal ["M16A4_GL", 5];
spawnCrate addWeaponCargoGlobal ["M24", 5];
spawnCrate addWeaponCargoGlobal ["M24_des_EP1", 5];
spawnCrate addWeaponCargoGlobal ["M240", 5];
spawnCrate addWeaponCargoGlobal ["m240_scoped_EP1", 5];
spawnCrate addWeaponCargoGlobal ["M249", 5];
spawnCrate addWeaponCargoGlobal ["M249_EP1", 5];
spawnCrate addWeaponCargoGlobal ["M249_m145_EP1", 5];
spawnCrate addWeaponCargoGlobal ["M40A3", 5];
spawnCrate addWeaponCargoGlobal ["M4A1", 5];
spawnCrate addWeaponCargoGlobal ["M4A1_Aim", 5];
spawnCrate addWeaponCargoGlobal ["M4A1_Aim_camo", 5];
spawnCrate addWeaponCargoGlobal ["M4A1_AIM_SD_camo", 5];
spawnCrate addWeaponCargoGlobal ["M4A1_HWS_GL", 5];
spawnCrate addWeaponCargoGlobal ["M4A1_HWS_GL_camo", 5];
spawnCrate addWeaponCargoGlobal ["M4A1_HWS_GL_SD_Camo", 5];
spawnCrate addWeaponCargoGlobal ["M4A1_RCO_GL", 5];
spawnCrate addWeaponCargoGlobal ["M4A3_CCO_EP1", 5];
spawnCrate addWeaponCargoGlobal ["M4A3_RCO_GL_EP1", 5];
spawnCrate addWeaponCargoGlobal ["M4SPR", 5];
spawnCrate addWeaponCargoGlobal ["M60A4_EP1", 5];
spawnCrate addWeaponCargoGlobal ["M9", 5];
spawnCrate addWeaponCargoGlobal ["M9SD", 5];
spawnCrate addWeaponCargoGlobal ["Makarov", 5];
spawnCrate addWeaponCargoGlobal ["MakarovSD", 5];
spawnCrate addWeaponCargoGlobal ["MeleeHatchet", 5];
spawnCrate addWeaponCargoGlobal ["MeleeCrowbar", 5];
spawnCrate addWeaponCargoGlobal ["MG36", 5];
spawnCrate addWeaponCargoGlobal ["Mk_48_DES_EP1", 5];
spawnCrate addWeaponCargoGlobal ["Mk_48_DZ", 5];
spawnCrate addWeaponCargoGlobal ["MP5A5", 5];
spawnCrate addWeaponCargoGlobal ["MP5SD", 5];
spawnCrate addWeaponCargoGlobal ["MR43", 5];
spawnCrate addWeaponCargoGlobal ["Pecheneg", 5];
spawnCrate addWeaponCargoGlobal ["PK", 5];
spawnCrate addWeaponCargoGlobal ["Remington870_lamp", 5];
spawnCrate addWeaponCargoGlobal ["revolver_EP1", 5];
spawnCrate addWeaponCargoGlobal ["revolver_gold_EP1", 5];
spawnCrate addWeaponCargoGlobal ["RPK_74", 5];
spawnCrate addWeaponCargoGlobal ["Sa61_EP1", 5];
spawnCrate addWeaponCargoGlobal ["Saiga12K", 5];
spawnCrate addWeaponCargoGlobal ["SVD", 5];
spawnCrate addWeaponCargoGlobal ["SVD_CAMO", 5];
spawnCrate addWeaponCargoGlobal ["SVD_des_EP1", 5];
spawnCrate addWeaponCargoGlobal ["SVD_NSPU_EP1", 5];
spawnCrate addWeaponCargoGlobal ["UZI_EP1", 5];
spawnCrate addWeaponCargoGlobal ["UZI_SD_EP1", 5];
spawnCrate addWeaponCargoGlobal ["Winchester1866", 5];
spawnCrate addWeaponCargoGlobal ["Sa58V_RCO_EP1", 5];
spawnCrate addWeaponCargoGlobal ["RPG7V", 5];
spawnCrate addWeaponCargoGlobal ["ItemMachete", 5];

spawnCrate addMagazineCargoGlobal ["2Rnd_shotgun_74Slug", 20];
spawnCrate addMagazineCargoGlobal ["2Rnd_shotgun_74Pellets", 20];
spawnCrate addMagazineCargoGlobal ["5Rnd_127x108_KSVK", 20];
spawnCrate addMagazineCargoGlobal ["5Rnd_127x99_as50", 20];
spawnCrate addMagazineCargoGlobal ["5Rnd_762x51_M24", 20];
spawnCrate addMagazineCargoGlobal ["5Rnd_86x70_L115A1", 20];
spawnCrate addMagazineCargoGlobal ["5x_22_LR_17_HMR", 20];
spawnCrate addMagazineCargoGlobal ["6Rnd_45ACP", 20];
spawnCrate addMagazineCargoGlobal ["7Rnd_45ACP_1911", 20];
spawnCrate addMagazineCargoGlobal ["8Rnd_9x18_Makarov", 20];
spawnCrate addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD", 20];
spawnCrate addMagazineCargoGlobal ["8Rnd_B_Beneli_74Slug", 20];
spawnCrate addMagazineCargoGlobal ["8Rnd_B_Beneli_Pellets", 20];
spawnCrate addMagazineCargoGlobal ["8Rnd_B_Saiga12_74Slug", 20];
spawnCrate addMagazineCargoGlobal ["8Rnd_B_Saiga12_Pellets", 20];
spawnCrate addMagazineCargoGlobal ["10Rnd_127x99_M107", 20];
spawnCrate addMagazineCargoGlobal ["10Rnd_762x54_SVD", 20];
spawnCrate addMagazineCargoGlobal ["10x_303", 20];
spawnCrate addMagazineCargoGlobal ["15Rnd_9x19_M9", 20];
spawnCrate addMagazineCargoGlobal ["15Rnd_9x19_M9SD", 20];
spawnCrate addMagazineCargoGlobal ["15Rnd_W1866_Slug", 20];
spawnCrate addMagazineCargoGlobal ["15Rnd_W1866_Pellet", 20];
spawnCrate addMagazineCargoGlobal ["17Rnd_9x19_glock17", 20];
spawnCrate addMagazineCargoGlobal ["20Rnd_556x45_Stanag", 20];
spawnCrate addMagazineCargoGlobal ["20Rnd_762x51_DMR", 20];
spawnCrate addMagazineCargoGlobal ["20Rnd_762x51_FNFAL", 20];
spawnCrate addMagazineCargoGlobal ["20Rnd_B_765x17_Ball", 20];
spawnCrate addMagazineCargoGlobal ["30Rnd_545x39_AK", 20];
spawnCrate addMagazineCargoGlobal ["30Rnd_545x39_AKSD", 20];
spawnCrate addMagazineCargoGlobal ["30Rnd_556x45_G36", 20];
spawnCrate addMagazineCargoGlobal ["30Rnd_556x45_G36SD", 20];
spawnCrate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 20];
spawnCrate addMagazineCargoGlobal ["30Rnd_556x45_StanagSD", 20];
spawnCrate addMagazineCargoGlobal ["30Rnd_762x39_AK47", 20];
spawnCrate addMagazineCargoGlobal ["30Rnd_9x19_MP5", 20];
spawnCrate addMagazineCargoGlobal ["30Rnd_9x19_MP5SD", 20];
spawnCrate addMagazineCargoGlobal ["30Rnd_9x19_UZI", 20];
spawnCrate addMagazineCargoGlobal ["30Rnd_9x19_UZI_SD", 20];
spawnCrate addMagazineCargoGlobal ["50Rnd_127x108_KORD", 20];
spawnCrate addMagazineCargoGlobal ["64Rnd_9x19_Bizon", 20];
spawnCrate addMagazineCargoGlobal ["64Rnd_9x19_SD_Bizon", 20];
spawnCrate addMagazineCargoGlobal ["75Rnd_545x39_RPK", 20];
spawnCrate addMagazineCargoGlobal ["100Rnd_762x51_M240", 20];
spawnCrate addMagazineCargoGlobal ["100Rnd_762x54_PK", 20];
spawnCrate addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag", 20];
spawnCrate addMagazineCargoGlobal ["100Rnd_556x45_M249", 20];
spawnCrate addMagazineCargoGlobal ["200Rnd_556x45_L110A1", 20];
spawnCrate addMagazineCargoGlobal ["200Rnd_556x45_M249", 20];
spawnCrate addMagazineCargoGlobal ["BoltSteel", 20];
spawnCrate addMagazineCargoGlobal ["PG7V", 20];
spawnCrate addMagazineCargoGlobal ["1Rnd_HE_M203", 20];
spawnCrate addMagazineCargoGlobal ["HandGrenade_west", 20];
spawnCrate addMagazineCargoGlobal ["SmokeShell", 20];
spawnCrate addMagazineCargoGlobal ["SmokeShellGreen", 20];
spawnCrate addMagazineCargoGlobal ["SmokeShellRed", 20];
spawnCrate addMagazineCargoGlobal ["PipeBomb", 20];


// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

selectDelayWeapons=0;
// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "selectDelayWeapons=30;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "selectDelayWeapons=60;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "selectDelayWeapons=180;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "selectDelayWeapons=300;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "selectDelayWeapons=600;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "selectDelayWeapons=1800;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "selectDelayWeapons=0;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{commandingMenu == ""};

if(selectDelayWeapons != 0) then {
	titleText [format[_crateName + " will disappear in %1 seconds.",selectDelayWeapons],"PLAIN DOWN"]; titleFadeOut 4;
	sleep selectDelayWeapons;
	// Delete crate after selectDelayWeapons seconds
	deletevehicle spawnCrate;
	titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	titleText [format[_crateName + " has no timer. Shoot it to destroy."],"PLAIN DOWN"]; titleFadeOut 4;
};
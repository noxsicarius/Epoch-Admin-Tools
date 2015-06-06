private["_EXECgenTools","_EXECweapons","_EXECbackpacks","_EXECgear","_EXECcrates","_EXECadminBuild","_EXECbuildings","_EXECskins","_EXECdate","_EXECcloud","_EXECfog","_EXECtempVeh"];

_EXECgenTools = 'player execVM "admintools\tools\%1"';
_EXECweapons = '["%1","%2","%3"] execVM "admintools\weaponkits\WeaponKits.sqf"';
_EXECbackpacks = '["%1"] execVM "admintools\weaponkits\BackPack.sqf"';
_EXECgear = 'player execVM "admintools\weaponkits\%1"';
_EXECcrates = '["%1"] execVM "admintools\crates\%2"';
/* _EXECadminBuild */ if(isNil "snap_build") then {_EXECadminBuild = '["%1",false,true] execVM "admintools\tools\AdminBuild\adminBuild.sqf"';}else{_EXECadminBuild = '["%1",false,true] execVM "admintools\tools\AdminBuild\adminBuildPro.sqf"';}; // Auto-detect raymix's snap pro
_EXECbuildings = 'player execVM "admintools\tools\AdminBuild\%1"';
_EXECskins = '["%1"] execVM "admintools\tools\skinChanger.sqf"';
_EXECdate = 'EAT_SetDateServer = [%1,%2,%3,%4,0]; publicVariableServer "EAT_SetDateServer"';
_EXECcloud = 'EAT_SetOvercastServer = %1; publicVariableServer "EAT_SetOvercastServer"';
_EXECfog = 'EAT_SetFogServer = %1; publicVariableServer "EAT_SetFogServer"';
_EXECtempVeh = '["%1"] execVM "admintools\tools\addtempvehicle.sqf"';

// Main menu
if ((getPlayerUID player) in AdminList) then { // Administrators
	epochmenustart = [["",true],["-- Epoch Admin Tools (Level: Admin) --", [], "", -5, [["expression", ""]], "1", "0"]];
	epochmenustart = epochmenustart + [["Admin Menu >>", [], "#USER:AdminMenu", -5, [["expression", ""]], "1", "1"]];
	epochmenustart = epochmenustart + [["Vehicle Menu >>",[],"#USER:VehicleMenu",-5,[["expression",""]],"1","1"]];
	epochmenustart = epochmenustart + [["Crate Menu >>",[],"#USER:CrateMenu",-5,[["expression",""]],"1","1"]];
	epochmenustart = epochmenustart + [["Epoch Menu >>", [], "#USER:EpochMenu", -5, [["expression", ""]], "1", "1"]];
	epochmenustart = epochmenustart + [["Weapon/Item Kits >>", [], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"]];
	epochmenustart = epochmenustart + [["Skin Change Menu >>", [], "#USER:AdminSkinsMenu", -5, [["expression", ""]], "1", "1"]];
	if(enableWeatherTimeChanger)then{ epochmenustart = epochmenustart + [["Weather/Time Menu >>", [], "#USER:WTMenu", -5, [["expression", ""]], "1", "1"]];};
	epochmenustart = epochmenustart + [["Player Ticket Menu >>", [], "", -5, [["expression", format[_EXECgenTools,"contactAdminTickets.sqf"]]], "1", "1"]];
	epochmenustart = epochmenustart + [["", [], "", -5, [["expression", ""]], "1", "0"]];
	epochmenustart = epochmenustart + [["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]];
} else {
	if ((getPlayerUID player) in ModList) then { // Moderators
		epochmenustart = [["",true],["-- Epoch Admin Tools (Level: Mod) --", [], "", -5, [["expression", ""]], "1", "0"]];
		epochmenustart = epochmenustart + [["Mod Menu >>", [], "#USER:ModMenu", -5, [["expression", ""]], "1", "1"]];
		epochmenustart = epochmenustart + [["Temporary Vehicle Menu >>", [], "#USER:VehicleTempMenu", -5, [["expression", ""]], "1", "1"]];
		epochmenustart = epochmenustart + [["Skin Change Menu >>", [], "#USER:AdminSkinsMenu", -5, [["expression", ""]], "1", "1"]];
		epochmenustart = epochmenustart + [["Player Ticket Menu >>", [], "", -5, [["expression", format[_EXECgenTools,"contactAdminTickets.sqf"]]], "1", "1"]];
		epochmenustart = epochmenustart + [["", [], "", -5, [["expression", ""]], "1", "0"]];
		epochmenustart = epochmenustart + [["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]];
	};
};

AdminMenu =
[
["",true],
	["Admin Mode (F4 for options)",[],"", -5,[["expression",format[_EXECgenTools,"AdminMode\adminMode.sqf"]]],"1","1"],
	["Point to Repair(Perm)",[],"", -5,[["expression", format[_EXECgenTools,"PointToRepairPERM.sqf"]]], "1", "1"],
	["Point to Delete(Perm)",[],"", -5,[["expression",format[_EXECgenTools,"DatabaseRemove.sqf"]]],"1","1"],
	["Spectate player (F6 to cancel)",[],"", -5,[["expression", format[_EXECgenTools,"spectate.sqf"]]], "1", "1"],
//	["Safe Zone Create/Delete",[],"", -5, [["expression", format[_EXECgenTools,"SafeZoneArea.sqf"]]], "1", "1"],
	["Zombie Shield",[],"", -5,[["expression",format[_EXECgenTools,"zombieshield.sqf"]]],"1","1"],
	["Zombie Spawner", [], "", -5, [["expression", format[_EXECgenTools,"zombieSpawn.sqf"]]], "1", "1"],
	["Heal Players",[],"", -5, [["expression", format[_EXECgenTools,"healp.sqf"]]], "1", "1"],
	["Send Server Message",[],"", -5,[["expression",format[_EXECgenTools,"messageDialog.sqf"]]],"1","1"],
	["Teleport Menu >>",[],"#USER:TeleportMenu", -5, [["expression", ""]], "1", "1"],
	["Humanity Menu >>",[],"#USER:HumanityMenu", -5, [["expression", ""]], "1", "1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
ModMenu =
[
["",true],
	["Mod Mode (F4 for options)",[],"", -5,[["expression",format[_EXECgenTools,"AdminMode\modMode.sqf"]]],"1","1"],
	["Point to Repair (Temp)",[],"",-5,[["expression", format[_EXECgenTools,"PointToRepair.sqf"]]], "1", "1"],
	["Point to Delete (Perm)",[],"",-5,[["expression",format[_EXECgenTools,"DatabaseRemove.sqf"]]],"1","1"],
	["Spectate player (F6 to cancel)",[],"", -5,[["expression", format[_EXECgenTools,"spectate.sqf"]]], "1", "1"],
	["Heal Players",[],"",-5,[["expression", format[_EXECgenTools,"healp.sqf"]]], "1", "1"],
	["Teleport Menu >>",[],"#USER:TeleportMenu", -5, [["expression", ""]], "1", "1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu",[20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Main vehicle selection menu
VehicleMenu =
[
["",true],	
	["Graphical Vehicle Menu", [],"", -5, [["expression", format[_EXECgenTools,"addvehicleDialog.sqf"]]], "1", "1"],
	["Temporary Vehicle Menu >>", [], "#USER:VehicleTempMenu", -5, [["expression", ""]], "1", "1"],
	["Locked Vehicle Menu >>", [], "#USER:VehiclekeyMenu", -5, [["expression", ""]], "1", "1"],
	["Vehicle Tools >>", [], "#USER:VehicleTools", -5, [["expression", ""]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Different tools for working with vehicles
VehicleTools =
[
["",true],	
	["Vehicle Locator",[],"",-5,[["expression", format[_EXECgenTools,"vehicleLocator.sqf"]]], "1", "1"],
	["Point to Repair (Temp)", [],"", -5, [["expression", format[_EXECgenTools,"PointToRepair.sqf"]]], "1", "1"],
	["Point to Repair (Perm)", [],"", -5, [["expression", format[_EXECgenTools,"PointToRepairPERM.sqf"]]], "1", "1"],
	["Point to Revive Vehicle",[],"", -5,[["expression", format[_EXECgenTools,"PointToReviveVeh.sqf"]]], "1", "1"],
	["Point to Delete (Temp)", [],"", -5, [["expression", format[_EXECgenTools,"PointToDelete.sqf"]]], "1", "1"],
	["Point to Delete (Perm)",[],"",-5,[["expression",format[_EXECgenTools,"DatabaseRemove.sqf"]]],"1","1"],
	["Point to only Refuel (Temp)", [],"", -5, [["expression", format[_EXECgenTools,"PointToRefuel.sqf"]]], "1", "1"],
	["Flip Vehicle", [],"", -5, [["expression", format[_EXECgenTools,"flipvehicle.sqf"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Sub vehicle selection menu for permanent vehicles
VehiclekeyMenu =
[
["",true],
	["Neutral Trader Menu", [],"", -5, [["expression", format[_EXECgenTools,"malveh\malvehiclemenuneutral.sqf"]]], "1", "1"],
	["Friendly Trader Menu", [],"", -5, [["expression", format[_EXECgenTools,"malveh\malvehiclemenufriendly.sqf"]]], "1", "1"],
	["Hero Trader Menu", [],"", -5, [["expression", format[_EXECgenTools,"malveh\malvehiclemenuhero.sqf"]]], "1", "1"],
	["Bandit Trader Menu", [],"", -5, [["expression", format[_EXECgenTools,"malveh\malvehiclemenubandit.sqf"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

//Main menu to handle humanity changing
HumanityMenu =
[
["",true],
	["Add Humanity to self or target", [],"", -5, [["expression", '["add"] execVM "admintools\tools\humanityChanger.sqf"']], "1", "1"],
	["Remove Humanity from self or target", [],"", -5, [["expression", '["remove"] execVM "admintools\tools\humanityChanger.sqf"']], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu for teleport options
TeleportMenu =
[
["",true],
//	Example: ["Name",[],"", -5, [["expression", '[x,y,z] execVM "admintools\tools\Teleport\teleportToLocation.sqf"']], "1", "1"],
	["Teleport (F1)",[],"", -5,[["expression", format[_EXECgenTools,"Teleport\Teleport.sqf"]]], "1", "1"],
	["Teleport To Me (F2)",[],"", -5, [["expression", format[_EXECgenTools, "Teleport\TPtoME.sqf"]]], "1", "1"],
	["Teleport To Player (F3)",[],"", -5, [["expression", format[_EXECgenTools, "Teleport\TpToPlayer.sqf"]]], "1", "1"],
//	["Teleport To Starry",[],"", -5, [["expression", '[6325.6772,7807.7412,0] execVM "admintools\tools\Teleport\teleportToLocation.sqf"']], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu2 for changing skins.
AdminSkinsMenu =
[
["",true],
	// Entry Format:["Entry Name",[],"",-5,[["expression",'["Skin_class_name"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Survivor",[],"",-5,[["expression",format[_EXECskins,"Survivor2_DZ"]]],"1","1"],
	["Hero",[],"",-5,[["expression",format[_EXECskins,"Survivor3_DZ"]]],"1","1"],
	["Bandit",[],"",-5,[["expression",format[_EXECskins,"Bandit1_DZ"]]],"1","1"],
	["Soldier",[],"",-5,[["expression",format[_EXECskins,"Soldier1_DZ"]]],"1","1"],
	["Ghillie",[],"",-5,[["expression",format[_EXECskins,"Sniper1_DZ"]]],"1","1"],
	["Special Forces",[],"",-5,[["expression",format[_EXECskins,"CZ_Special_Forces_GL_DES_EP1_DZ"]]],"1","1"],
	["Pilot",[],"",-5,[["expression",format[_EXECskins,"Pilot_EP1_DZ"]]],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Next page", [], "#USER:AdminSkinsMenu2", -5, [["expression", ""]], "1", "1"]
];

// Menu2 for changing skins.
AdminSkinsMenu2 =
[
["",true],
	["Camo",[],"",-5,[["expression",format[_EXECskins,"Camo1_DZ"]]],"1","1"],
	["Bodyguard",[],"",-5,[["expression",format[_EXECskins,"Soldier_Bodyguard_AA12_PMC_DZ"]]],"1","1"],
	["Officer",[],"",-5,[["expression",format[_EXECskins,"Rocket_DZ"]]],"1","1"],
	["Alejandria",[],"",-5,[["expression",format[_EXECskins,"SurvivorWcombat_DZ"]]],"1","1"],
	["Savannah",[],"",-5,[["expression",format[_EXECskins,"SurvivorWdesert_DZ"]]],"1","1"],
	["Melly",[],"",-5,[["expression",format[_EXECskins,"SurvivorWpink_DZ"]]],"1","1"],
	["Bandit Jane",[],"",-5,[["expression",format[_EXECskins,"BanditW2_DZ"]]],"1","1"],
	["Invisible",[],"",-5,[["expression",format[_EXECskins,"Survivor1_DZ"]]],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Weapon menu select
WeaponMenu =[
["",true],
	["Primary Weapons Menu >>",[],"#USER:PrimaryWeaponMenu", -5, [["expression", ""]], "1", "1"],
	["Secondary Weapons Menu >>",[],"#USER:SecondaryWeaponMenu", -5, [["expression", ""]], "1", "1"],
	["Gear/Items Menu >>",[],"#USER:GearMenu", -5, [["expression", ""]], "1", "1"]
];

// Main weapons like the M4
PrimaryWeaponMenu =[
["",true],
	// Entry Format:["Name", [],"", -5, [["expression", format[_EXECweapons,"Gun_Calss_Name","Ammo_Class_Name","Explosive_Round_Class_Name"]]], "1", "1"],
	// If there is no explosive 203 round then put "nil" in place of "Explosive_Round_Class_Name" 
	["M4 Holo", [],"", -5, [["expression", format[_EXECweapons,"M4A1_HWS_GL","30Rnd_556x45_Stanag","1Rnd_HE_M203"]]], "1", "1"],
//	["M4 CCO SD", [],"", -5, [["expression", format[_EXECweapons,"M4A1_AIM_SD","30Rnd_556x45_StanagSD","nil"]]], "1", "1"],
	["M4A1 GL SD Camo", [],"", -5, [["expression", format[_EXECweapons,"M4A1_HWS_GL_SD_Camo","30Rnd_556x45_StanagSD","1Rnd_HE_M203"]]], "1", "1"],
	["Sa58V ACOG", [],"", -5, [["expression", format[_EXECweapons,"Sa58V_RCO_EP1","30Rnd_762x39_SA58","nil"]]], "1", "1"],
//	["M16 ACOG", [],"", -5, [["expression", format[_EXECweapons,"m16a4_acg","30Rnd_556x45_Stanag","nil"]]], "1", "1"],
	["Aks Kobra", [],"", -5, [["expression", format[_EXECweapons,"AKS_74_kobra","30Rnd_545x39_AK","nil"]]], "1", "1"],
	["FN FAL", [],"", -5, [["expression", format[_EXECweapons,"FN_FAL","20Rnd_762x51_FNFAL","nil"]]], "1", "1"],
//	["Pecheneg 50 cal", [],"", -5, [["expression", format[_EXECweapons,"Pecheneg_DZ","100Rnd_762x54_PK","nil"]]], "1", "1"],
	["Mk 48", [],"", -5, [["expression", format[_EXECweapons,"Mk_48_DES_EP1","100Rnd_762x51_M240","nil"]]], "1", "1"],
	["AS50", [],"", -5, [["expression", format[_EXECweapons,"BAF_AS50_scoped","5Rnd_127x99_AS50","nil"]]], "1", "1"],
	[".338 LAPUA", [],"", -5, [["expression", format[_EXECweapons,"BAF_LRR_scoped","5Rnd_86x70_L115A1","nil"]]], "1", "1"],
	["DMR", [],"", -5, [["expression", format[_EXECweapons,"DMR","20Rnd_762x51_DMR","nil"]]], "1", "1"],
//	["M14 Aim", [],"", -5, [["expression", format[_EXECweapons,"M14_EP1","20Rnd_762x51_DMR","nil"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Secondary Weapons", [], "#USER:SecondaryWeaponMenu", -5, [["expression", ""]], "1", "1"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Sidearm weapons like the Makarov
SecondaryWeaponMenu =[
["",true],
	["PDW SD", [],"", -5, [["expression", format[_EXECweapons,"UZI_SD_EP1","30Rnd_9x19_UZI_SD"]]], "1", "1"],
	["PDW", [],"", -5, [["expression", format[_EXECweapons,"UZI_EP1","30Rnd_9x19_UZI"]]], "1", "1"],
	["Glock", [],"", -5, [["expression", format[_EXECweapons,"glock17_EP1","17Rnd_9x19_glock17"]]], "1", "1"],
	["M9 SD", [],"", -5, [["expression", format[_EXECweapons,"M9SD","15Rnd_9x19_M9SD"]]], "1", "1"],
	["Makarov", [],"", -5, [["expression", format[_EXECweapons,"Makarov","8Rnd_9x18_Makarov"]]], "1", "1"],
	["Makarov SD", [],"", -5, [["expression", format[_EXECweapons,"MakarovSD","8Rnd_9x18_Makarov"]]], "1", "1"],
		["Gear/Items", [], "#USER:GearMenu", -5, [["expression", ""]], "1", "1"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu for spawning items to the admin like bags and tools
GearMenu=[
["",true],
	["ToolBelt gear", [],"", -5, [["expression", format[_EXECgear,"toolBeltItems.sqf"]]], "1", "1"],
	["Medical gear", [],"", -5, [["expression", format[_EXECgear,"medical.sqf"]]], "1", "1"],
	["Alice Pack", [],"", -5, [["expression", format[_EXECbackpacks,"DZ_ALICE_Pack_EP1"]]], "1", "1"],
	["Large Gun Bag", [],"", -5, [["expression", format[_EXECbackpacks,"DZ_LargeGunBag_EP1"]]], "1", "1"],
	["Delete all gear", [],"", -5, [["expression", format[_EXECgear,"removeGear.sqf"]]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Main crate menu
CrateMenu =[
["",true],
	["Private Crate Menu >>",[],"#USER:CrateMenuPrivate", -5, [["expression", ""]], "1", "1"],
	["Public Crate Menu >>",[],"#USER:CrateMenuPublic", -5, [["expression", ""]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// This menu creates a local (private) crate of items that ONLY the user can see
CrateMenuPrivate=[
	["",true],
	// Entry Format: ["name",[],"",-5,[["expression",format[_EXECcrates,"local","fileNAME.sqf"]]],"1","1"],
	["-- Private Crates --", [], "", -5, [["expression", ""]], "1", "0"],
	["Weapons Crate",[],"",-5,[["expression",format[_EXECcrates,"local","weapons.sqf"]]],"1","1"],
	["Items Crate",[],"",-5,[["expression",format[_EXECcrates,"local","items.sqf"]]],"1","1"],
	["ALL Weapons/Items Crate",[],"",-5,[["expression",format[_EXECcrates,"local","allweapons.sqf"]]],"1","1"],
	["Building Crate",[],"",-5,[["expression",format[_EXECcrates,"local","building.sqf"]]],"1","1"],
	["Backpack Tent",[],"",-5,[["expression",format[_EXECcrates,"local","backpack.sqf"]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Public Crates >>", [], "#USER:CrateMenuPublic", -5, [["expression", ""]], "1", "1"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// This menu creates a global (public) crate of items that EVERYONE can see
CrateMenuPublic=[
	["",true],
	// Entry Format: ["name",[],"",-5,[["expression",format[_EXECcrates,"global","fileNAME.sqf"]]],"1","1"],
	["-- Public Crates --", [], "", -5, [["expression", ""]], "1", "0"],
	["Weapons Crate",[],"",-5,[["expression",format[_EXECcrates,"global","weapons.sqf"]]],"1","1"],
	["Items Crate",[],"",-5,[["expression",format[_EXECcrates,"global","items.sqf"]]],"1","1"],
	["ALL Weapons/Items Crate",[],"",-5,[["expression",format[_EXECcrates,"global","allweapons.sqf"]]],"1","1"],
	["Building Crate",[],"",-5,[["expression",format[_EXECcrates,"global","building.sqf"]]],"1","1"],
	["Backpack Tent",[],"",-5,[["expression",format[_EXECcrates,"global","backpack.sqf"]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Private Crates >>", [], "#USER:CrateMenuPrivate", -5, [["expression", ""]], "1", "1"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu for changing time and weather
// These are set every other hour to keep the menu short
WTMenu=[
	["",true],
	["Day Menu >>",[],"#USER:DayMenu",-5,[["expression",""]], "1", "1"],
	["Full-Moon Nights Menu >>",[],"#USER:FullMoonNights",-5,[["expression",""]], "1", "1"],
	["No-Moon Nights Menu >>",[],"#USER:NoMoonNights",-5,[["expression",""]], "1", "1"],
	["Weather Menu >>",[],"#USER:WeatherMenu",-5,[["expression",""]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

NoMoonNights = [
	["",true],
	["No moon night:", [], "", -5, [["expression", ""]], "1", "0"],
	["8pm",[],"",-5,[["expression",format[_EXECdate,2012, 6, 19, 20]]],"1","1"],
	["10pm",[],"",-5,[["expression",format[_EXECdate,2012, 6, 19, 22]]],"1","1"],
	["Midnight",[],"",-5,[["expression",format[_EXECdate,2012, 6, 19, 0]]],"1","1"],
	["2am",[],"",-5,[["expression",format[_EXECdate,2012, 6, 19, 2]]],"1","1"],
	["4am",[],"",-5,[["expression",format[_EXECdate,2012, 6, 19, 4]]],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

FullMoonNights = [
	["",true],
	["Full moon night:", [], "", -5, [["expression", ""]], "1", "0"],
	["8pm",[],"",-5,[["expression",format[_EXECdate,2012,6,4,20]]],"1","1"],
	["10pm",[],"",-5,[["expression",format[_EXECdate,2012,6,4,22]]],"1","1"],
	["Midnight",[],"",-5,[["expression",format[_EXECdate,2012,6,4,4]]],"1","1"],
	["2am",[],"",-5,[["expression",format[_EXECdate,2012,6,4,2]]],"1","1"],
	["4am",[],"",-5,[["expression",format[_EXECdate,2012,6,4,4]]],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

DayMenu = [
	["",true],
	["Set Day Time:", [], "", -5, [["expression", ""]], "1", "0"],
	["5am",[],"",-5,[["expression",format[_EXECdate,2012,6,4,5]]],"1","1"],
	["7am",[],"",-5,[["expression",format[_EXECdate,2012,6,4,7]]],"1","1"],
	["9am",[],"",-5,[["expression",format[_EXECdate,2012,6,4,9]]],"1","1"],
	["11am",[],"",-5,[["expression",format[_EXECdate,2012,6,4,11]]],"1","1"],
	["Noon",[],"",-5,[["expression",format[_EXECdate,2012,6,4,12]]],"1","1"],
	["1pm",[],"",-5,[["expression",format[_EXECdate,2012,6,4,13]]],"1","1"],
	["3pm",[],"",-5,[["expression",format[_EXECdate,2012,6,4,15]]],"1","1"],
	["5pm",[],"",-5,[["expression",format[_EXECdate,2012,6,4,17]]],"1","1"],
	["7pm",[],"",-5,[["expression",format[_EXECdate,2012,6,4,19]]],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

WeatherMenu = [
	["",true],
	["Set Weather:",[],"",-5,[["expression",""]],"1","0"],
	["Clear Sky",[],"",-5,[["expression",format[_EXECcloud,0]]],"1","1"],
	["Slightly Cloudy",[],"",-5,[["expression",format[_EXECcloud,0.25]]],"1","1"],
	["Cloudy",[],"",-5,[["expression",format[_EXECcloud,0.5]]],"1","1"],
	["Very Cloudy",[],"",-5,[["expression",format[_EXECcloud,0.75]]],"1","1"],
	["Storm",[],"",-5,[["expression",format[_EXECcloud,1]]],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
	["Set Fog:", [], "", -5, [["expression", ""]], "1", "0"],
	["Off",[],"",-5,[["expression",format[_EXECfog,0]]],"1","1"],
	["Thin",[],"",-5,[["expression",format[_EXECfog,0.25]]],"1","1"],
	["Medium",[],"",-5,[["expression",format[_EXECfog,0.5]]],"1","1"],
	["Thick",[],"",-5,[["expression",format[_EXECfog,0.75]]],"1","1"],
	["Maximum",[],"",-5,[["expression",format[_EXECfog,1]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
// Menu that deals with epoch specific items like locks and safes
EpochMenu=[
	["",true],
	["Admin Build Menu >> ",[],"#USER:BuildMenu", -5,[["expression",""]],"1","1"],
	["Base Manager Menu >>", [], "", -5, [["expression",format[_EXECgenTools,"base_manager.sqf"]]], "1", "1"],
	["Point to Delete Item",[],"", -5,[["expression",format[_EXECgenTools,"DatabaseRemove.sqf"]]],"1","1"],
	["Point to display code",[],"",-5,[["expression",format[_EXECgenTools,"gimmecode.sqf"]]],"1","1"],
	["Point to make new key",[],"",-5,[["expression",format[_EXECgenTools,"givekey.sqf"]]],"1","1"],
	["Point to lock object",[],"",-5,[["expression",format[_EXECgenTools,"PointToLock.sqf"]]],"1","1"],
	["Point to unlock object",[],"",-5,[["expression",format[_EXECgenTools,"PointToUnlock.sqf"]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Base menu for Admin Build functions
BuildMenu =
[
["",true],
	["Rebuild last item",[],"", -5,[["expression",format[_EXECadminBuild,"rebuild"]]],"1","1"],
	["Building GUI", [],"", -5, [["expression", format[_EXECbuildings,"buildingsDialog.sqf"]]], "1", "1"],
	["Base Materials >>",[],"#USER:BaseItems", -5,[["expression",""]],"1","1"],
	["Storage >>",[],"#USER:BuildStorage", -5,[["expression",""]],"1","1"],
	["Netting >>",[],"#USER:BuildNetting", -5,[["expression",""]],"1","1"],
	["Sandbags >>",[],"#USER:BuildSandbag", -5,[["expression",""]],"1","1"],
	["Extras >>",[],"#USER:BuildExtras", -5,[["expression",""]],"1","1"],
	["Point To Upgrade",[],"", -5,[["expression",format[_EXECbuildings,"pointToUpgrade.sqf"]]],"1","1"],
	["Point To Downgrade",[],"", -5,[["expression",format[_EXECbuildings,"pointToDowngrade.sqf"]]],"1","1"],
	["Maintain Base",[],"", -5,[["expression",format[_EXECbuildings,"maintainArea.sqf"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Standard base building epoch items
BaseItems =
[
["",true],
	["Cinder >>",[],"#USER:BuildablesCinder", -5,[["expression",""]],"1","1"],
	["Wood >>",[],"#USER:BuildablesWood", -5,[["expression",""]],"1","1"],
	["Other >>",[],"#USER:BuildablesOther", -5,[["expression",""]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Wood epoch base items
BuildablesWood = [
["",true],
	["Floor (Full)",[],"", -5,[["expression",format[_EXECadminBuild,"WoodFloor_DZ"]]],"1","1"],
	["Floor (1/2)",[],"", -5,[["expression",format[_EXECadminBuild,"WoodFloorHalf_DZ"]]],"1","1"],
	["Floor (1/4)",[],"", -5,[["expression",format[_EXECadminBuild,"WoodFloorQuarter_DZ"]]],"1","1"],
	["Wall (Large)",[],"", -5,[["expression",format[_EXECadminBuild,"WoodLargeWall_DZ"]]],"1","1"],
	["Wall (Small)",[],"", -5,[["expression",format[_EXECadminBuild,"WoodSmallWall_DZ"]]],"1","1"],
	["Wall (1/3)",[],"", -5,[["expression",format[_EXECadminBuild,"WoodSmallWallThird_DZ"]]],"1","1"],
	["Wall /w Window (Large)",[],"", -5,[["expression",format[_EXECadminBuild,"WoodLargeWallWin_DZ"]]],"1","1"],
	["Wall /w Window (Small)",[],"", -5,[["expression",format[_EXECadminBuild,"WoodSmallWallWin_DZ"]]],"1","1"],
	["Garage Doorway",[],"", -5,[["expression",format[_EXECadminBuild,"WoodLargeWallDoor_DZ"]]],"1","1"],
	["Normal Doorway",[],"", -5,[["expression",format[_EXECadminBuild,"WoodSmallWallDoor_DZ"]]],"1","1"],
	["Stairs",[],"", -5,[["expression",format[_EXECadminBuild,"WoodStairsSans_DZ"]]],"1","1"],
	["Stairs /w Rails",[],"", -5,[["expression",format[_EXECadminBuild,"WoodStairsRails_DZ"]]],"1","1"],
	["Stairs /w Stilts",[],"", -5,[["expression",format[_EXECadminBuild,"WoodStairs_DZ"]]],"1","1"],
	["Ramp",[],"", -5,[["expression",format[_EXECadminBuild,"WoodRamp_DZ"]]],"1","1"],
	["Ladder",[],"", -5,[["expression",format[_EXECadminBuild,"WoodLadder_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Cinder epoch base items
BuildablesCinder = [
["",true],
	["Wall (Full)",[],"", -5,[["expression",format[_EXECadminBuild,"CinderWall_DZ"]]],"1","1"],
	["Wall (Half)",[],"", -5,[["expression",format[_EXECadminBuild,"CinderWallHalf_DZ"]]],"1","1"],
	["Garage Doorway",[],"", -5,[["expression",format[_EXECadminBuild,"CinderWallDoorway_DZ"]]],"1","1"],
	["Normal Doorway",[],"", -5,[["expression",format[_EXECadminBuild,"CinderWallSmallDoorway_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Anything that does not fit into the BaseItems categories
BuildablesOther = [
["",true],
	["Metal Floor",[],"", -5,[["expression",format[_EXECadminBuild,"MetalFloor_DZ"]]],"1","1"],
	["Metal Panel",[],"", -5,[["expression",format[_EXECadminBuild,"MetalPanel_DZ"]]],"1","1"],
	["Tank Trap",[],"", -5,[["expression",format[_EXECadminBuild,"Hedgehog_DZ"]]],"1","1"],
	["Wire Fence",[],"", -5,[["expression",format[_EXECadminBuild,"Fort_RazorWire"]]],"1","1"],
	["Plot Pole",[],"", -5,[["expression",format[_EXECadminBuild,"Plastic_Pole_EP1_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Storage items for base
BuildStorage =
[
["",true],
	["Wooden Shed",[],"", -5,[["expression",format[_EXECadminBuild,"Wooden_shed_DZ"]]],"1","1"],
	["Wooden Shack",[],"", -5,[["expression",format[_EXECadminBuild,"WoodShack_DZ"]]],"1","1"],
	["Storage Shed",[],"", -5,[["expression",format[_EXECadminBuild,"StorageShed_DZ"]]],"1","1"],
	["Wood Crate",[],"", -5,[["expression",format[_EXECadminBuild,"WoodCrate_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Any buildable dealing with sand bags
BuildSandbag =
[
["",true],
	["Sandbag Fence",[],"", -5,[["expression",format[_EXECadminBuild,"Sandbag1_DZ"]]],"1","1"],
	["Sandbag Fence (round)",[],"", -5,[["expression",format[_EXECadminBuild,"BagFenceRound_DZ"]]],"1","1"],
	["H-barrier Cube",[],"", -5,[["expression",format[_EXECadminBuild,"Land_HBarrier1_DZ"]]],"1","1"],
	["H-barrier (short)",[],"", -5,[["expression",format[_EXECadminBuild,"Land_HBarrier3_DZ"]]],"1","1"],
	["H-barrier (long)",[],"", -5,[["expression",format[_EXECadminBuild,"Land_HBarrier5_DZ"]]],"1","1"],
	["H-Barrier (Huge)",[],"", -5,[["expression",format[_EXECadminBuild,"Base_WarfareBBarrier10xTall","building"]]],"1","1"],
	["Sandbag Nest",[],"", -5,[["expression",format[_EXECadminBuild,"SandNest_DZ"]]],"1","1"],
	["M240 Nest",[],"", -5,[["expression",format[_EXECadminBuild,"M240Nest_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Cloth nets/huts
BuildNetting =
[
["",true],
	["Camo Net (Desert)",[],"", -5,[["expression",format[_EXECadminBuild,"DesertCamoNet_DZ"]]],"1","1"],
	["Camo Net (Forest)",[],"", -5,[["expression",format[_EXECadminBuild,"ForestCamoNet_DZ"]]],"1","1"],
	["Camo Net Large (Desert)",[],"", -5,[["expression",format[_EXECadminBuild,"DesertLargeCamoNet_DZ"]]],"1","1"],
	["Camo Net Large (Forest)",[],"", -5,[["expression",format[_EXECadminBuild,"ForestLargeCamoNet_DZ"]]],"1","1"],
	["Canvas Hut",[],"", -5,[["expression",format[_EXECadminBuild,"CanvasHut_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Anything that does not fall into the other categories
BuildExtras =
[
["",true],
	["Fire Barrel",[],"", -5,[["expression",format[_EXECadminBuild,"FireBarrel_DZ"]]],"1","1"],
	["Workbench",[],"", -5,[["expression",format[_EXECadminBuild,"WorkBench_DZ"]]],"1","1"],
	["Generator",[],"", -5,[["expression",format[_EXECadminBuild,"Generator_DZ"]]],"1","1"],
	["Fuel Pump",[],"", -5,[["expression",format[_EXECadminBuild,"FuelPump_DZ"]]],"1","1"],
	["Deer Stand",[],"", -5,[["expression",format[_EXECadminBuild,"DeerStand_DZ"]]],"1","1"],
	["Park Bench",[],"", -5,[["expression",format[_EXECadminBuild,"ParkBench_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu that spawns TEMPORARY air vehicles
VehicleTempMenu=
[
["",true],
	["Spawn Temporary Vehicle -- AIR",[],"",-5,[["expression",""]],"1","0"],
	["MH-6J Little Bird",[],"",-5,[["expression",format[_EXECtempVeh,"MH6J_EP1"]]],"1","1"],
	["UH-60M Black Hawk",[],"",-5,[["expression",format[_EXECtempVeh,"UH60M_EP1"]]],"1","1"],
	["CH-47F Chinook",[],"",-5,[["expression",format[_EXECtempVeh,"CH_47F_EP1"]]],"1","1"],
	["MV-22 Osprey",[],"",-5,[["expression",format[_EXECtempVeh,"MV22"]]],"1","1"],
	["A-10 Jet",[],"",-5,[["expression",format[_EXECtempVeh,"A10"]]],"1","1"],
	["C-130J Super Hercules",[],"",-5,[["expression",format[_EXECtempVeh,"C130J"]]],"1","1"],
	["",[],"",-5,[["expression",""]],"1","0"],
		["Next page",[],"#USER:VehicleTempMenu2",-5,[["expression",""]],"1","1"],
			["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu2 that spawns TEMPORARY wheeled vehicles
VehicleTempMenu2 =
[
["",true],
	["Spawn Temporary Vehicle -- WHEELED",[],"",-5,[["expression",""]],"1","0"],
	["SUV (Camo)",[],"",-5,[["expression",format[_EXECtempVeh,"SUV_Camo"]]],"1","1"],
	["Armored SUV",[],"",-5,[["expression",format[_EXECtempVeh,"ArmoredSUV_PMC_DZE"]]],"1","1"],
	["MTVR (Fuel)",[],"",-5,[["expression",format[_EXECtempVeh,"MTVR_Refuel_DES_EP1"]]],"1","1"],
	["Ural Truck",[],"",-5,[["expression",format[_EXECtempVeh,"Ural_TK_CIV_EP1"]]],"1","1"],
	["Ikarus Bus",[],"",-5,[["expression",format[_EXECtempVeh,"Ikarus_TK_CIV_EP1"]]],"1","1"],
	["Mountain Bike",[],"",-5,[["expression",format[_EXECtempVeh,"MMT_USMC"]]],"1","1"],
	["Motorcycle",[],"",-5,[["expression",format[_EXECtempVeh,"M1030"]]],"1","1"],
	["ATV",[],"",-5,[["expression",format[_EXECtempVeh,"ATV_US_EP1"]]],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Next page", [], "#USER:VehicleTempMenu3", -5, [["expression", ""]], "1", "1"],
			["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu that spawns TEMPORARY vehicles with treads (tanks)
VehicleTempMenu3 =
[
["",true],
	["Spawn Temporary Vehicle -- TRACKED",[],"",-5,[["expression",""]],"1","0"],
	["M1A1",[],"",-5,[["expression",format[_EXECtempVeh,"M1A1_US_DES_EP1"]]],"1","1"],
	["M1A2 TUSK",[],"",-5,[["expression",format[_EXECtempVeh,"M1A2_US_TUSK_MG_EP1"]]],"1","1"],
	["M270 MLRS",[],"",-5,[["expression",format[_EXECtempVeh,"MLRS_DES_EP1"]]],"1","1"],
	["T-34",[],"",-5,[["expression",format[_EXECtempVeh,"T34_TK_EP1"]]],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		//["Next page", [], "#USER:VehicleTempMenu4", -5, [["expression", ""]], "1", "1"],
			["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:epochmenustart";
_EXECscript1 = 'player execVM "admintools\tools\%1"';
_EXECscript2 = '["%1","%2","%3"] execVM "admintools\weaponkits\WeaponKits.sqf"';
_EXECscript3 = '["%1"] execVM "admintools\weaponkits\BackPack.sqf"';
_EXECscript4 = 'player execVM "admintools\weaponkits\%1"';
_EXECscript5 = 'player execVM "admintools\vehicles\%1"';
_EXECscript6 = '["%1"] execVM "admintools\crates\%2"';
_EXECscript7 = '["%1","%2"] execVM "admintools\tools\AdminBuild\adminBuild.sqf"';
_EXECscript8 = 'player execVM "admintools\tools\AdminBuild\%1"';

if ((getPlayerUID player) in AdminList) then { // Admins
	epochmenustart = [
	["",true],
		["-- Epoch Admin Tools (Level: Admin) --", [], "", -5, [["expression", ""]], "1", "0"],
		["Admin Menu >>", [], "#USER:AdminMenu", -5, [["expression", ""]], "1", "1"],
		["Vehicle Menu >>",[],"#USER:VehicleMenu",-5,[["expression",""]],"1","1"],
		["Crate Menu >>",[],"#USER:CrateMenu",-5,[["expression",""]],"1","1"],
		["Epoch Menu >>", [], "#USER:EpochMenu", -5, [["expression", ""]], "1", "1"],
		["Weapon/Item Kits >>", [], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"],
		["Skin Change Menu >>", [], "#USER:AdminSkinsMenu", -5, [["expression", ""]], "1", "1"],
		["Weather/Time Menu >>", [], "#USER:WTMenu", -5, [["expression", ""]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
			["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
	];
} else {
	if ((getPlayerUID player) in ModList) then { // Admin Level 3
		epochmenustart = [
		["",true],
			["-- Epoch Admin Tools (Level: Mod) --", [],"", -5, [["expression", ""]], "1", "0"],
			["Mod Menu >>", [], "#USER:ModMenu", -5, [["expression", ""]], "1", "1"],
			["Temporary Vehicle Menu >>", [], "#USER:VehicleTempMenu", -5, [["expression", ""]], "1", "1"],
			["Skin Change Menu >>", [], "#USER:AdminSkinsMenu", -5, [["expression", ""]], "1", "1"],
			["", [], "", -5, [["expression", ""]], "1", "0"],
				["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
		];
	};
};
AdminMenu =
[
["",true],
	["Admin Mode (F4 for options)",[],"", -5,[["expression",format[_EXECscript1,"AdminMode\adminMode.sqf"]]],"1","1"],
	["Point to Repair(Perm)",[],"", -5,[["expression", format[_EXECscript1,"PointToRepairPERM.sqf"]]], "1", "1"],
	["Point to Delete(Perm)",[],"", -5,[["expression",format[_EXECscript1,"DatabaseRemove.sqf"]]],"1","1"],
	["Spectate player (F6 to cancel)",[],"", -5,[["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
//	["Safe Zone Create/Delete",[],"", -5, [["expression", format[_EXECscript1,"SafeZoneArea.sqf"]]], "1", "1"],
	["Zombie Shield",[],"", -5,[["expression",format[_EXECscript1,"zombieshield.sqf"]]],"1","1"],
	["Zombie Spawner", [], "", -5, [["expression", format[_EXECscript1,"zombieSpawn.sqf"]]], "1", "1"],
	["Heal Players",[],"", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
	["Teleport Menu >>",[],"#USER:TeleportMenu", -5, [["expression", ""]], "1", "1"],
	["Humanity Menu >>",[],"#USER:HumanityMenu", -5, [["expression", ""]], "1", "1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
ModMenu =
[
["",true],
	["Mod Mode (F4 for options)",[],"", -5,[["expression",format[_EXECscript1,"AdminMode\modMode.sqf"]]],"1","1"],
	["Point to Repair (Temp)",[],"",-5,[["expression", format[_EXECscript1,"PointToRepair.sqf"]]], "1", "1"],
	["Point to Delete (Perm)",[],"",-5,[["expression",format[_EXECscript1,"DatabaseRemove.sqf"]]],"1","1"],
	["Spectate player (F6 to cancel)",[],"", -5,[["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
	["Heal Players",[],"",-5,[["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
	["Teleport Menu >>",[],"#USER:TeleportMenu", -5, [["expression", ""]], "1", "1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu",[20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Main vehicle selection menu
VehicleMenu =
[
["",true],	
	["Graphical Vehicle Menu", [],"", -5, [["expression", format[_EXECscript1,"addvehicleDialog.sqf"]]], "1", "1"],
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
	["Point to Repair (Temp)", [],"", -5, [["expression", format[_EXECscript1,"PointToRepair.sqf"]]], "1", "1"],
	["Point to Repair (Perm)", [],"", -5, [["expression", format[_EXECscript1,"PointToRepairPERM.sqf"]]], "1", "1"],
	["Point to Delete (Temp)", [],"", -5, [["expression", format[_EXECscript1,"PointToDelete.sqf"]]], "1", "1"],
	["Point to Delete (Perm)",[],"",-5,[["expression",format[_EXECscript1,"DatabaseRemove.sqf"]]],"1","1"],
	["Point to only Refuel (Temp)", [],"", -5, [["expression", format[_EXECscript1,"PointToRefuel.sqf"]]], "1", "1"],
	["Flip Vehicle", [],"", -5, [["expression", format[_EXECscript1,"flipvehicle.sqf"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Sub vehicle selection menu for permanent vehicles
VehiclekeyMenu =
[
["",true],
	["Neutral Trader Menu", [],"", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenuneutral.sqf"]]], "1", "1"],
	["Friendly Trader Menu", [],"", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenufriendly.sqf"]]], "1", "1"],
	["Hero Trader Menu", [],"", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenuhero.sqf"]]], "1", "1"],
	["Bandit Trader Menu", [],"", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenubandit.sqf"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

//Main menu to handle humanity changing
HumanityMenu =
[
["",true],
	["Add Humanity to self or target", [],"", -5, [["expression", format[_EXECscript1,"humanity.sqf"]]], "1", "1"],
	["Remove Humanity from self or target", [],"", -5, [["expression", format[_EXECscript1,"humanity_remove.sqf"]]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu for teleport options
TeleportMenu =
[
["",true],
//	Example: ["Name",[],"", -5, [["expression", '[x,y,z] execVM "admintools\tools\Teleport\teleportToLocation.sqf"']], "1", "1"],
	["Teleport (F1)",[],"", -5,[["expression", format[_EXECscript1,"Teleport\Teleport.sqf"]]], "1", "1"],
	["Teleport To Me (F2)",[],"", -5, [["expression", format[_EXECscript1, "Teleport\TPtoME.sqf"]]], "1", "1"],
	["Teleport To Player (F3)",[],"", -5, [["expression", format[_EXECscript1, "Teleport\TpToPlayer.sqf"]]], "1", "1"],
//	["Teleport To Starry",[],"", -5, [["expression", '[6325.6772,7807.7412,0] execVM "admintools\tools\Teleport\teleportToLocation.sqf"']], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu2 for changing skins.
AdminSkinsMenu =
[
["",true],
	// Entry Format:["Entry Name",[],"",-5,[["expression",'["Skin_class_name"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Survivor",[],"",-5,[["expression",'["Survivor2_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Hero",[],"",-5,[["expression",'["Survivor3_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Bandit",[],"",-5,[["expression",'["Bandit1_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Soldier",[],"",-5,[["expression",'["Soldier1_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Ghillie",[],"",-5,[["expression",'["Sniper1_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Special Forces",[],"",-5,[["expression",'["CZ_Special_Forces_GL_DES_EP1_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Pilot",[],"",-5,[["expression",'["Pilot_EP1_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Next page", [], "#USER:AdminSkinsMenu2", -5, [["expression", ""]], "1", "1"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu2 for changing skins.
AdminSkinsMenu2 =
[
["",true],
	["Camo",[],"",-5,[["expression",'["Camo1_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Bodyguard",[],"",-5,[["expression",'["Soldier_Bodyguard_AA12_PMC_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Officer",[],"",-5,[["expression",'["Rocket_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Alejandria",[],"",-5,[["expression",'["SurvivorWcombat_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Savannah",[],"",-5,[["expression",'["SurvivorWdesert_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Melly",[],"",-5,[["expression",'["SurvivorWpink_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Bandit Jane",[],"",-5,[["expression",'["BanditW2_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
	["Invisible",[],"",-5,[["expression",'["Survivor1_DZ"] execVM "admintools\tools\skinChanger.sqf"']],"1","1"],
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
	// Entry Format:["Name", [],"", -5, [["expression", format[_EXECscript2,"Gun_Calss_Name","Ammo_Class_Name","Explosive_Round_Class_Name"]]], "1", "1"],
	// If there is no explosive 203 round then put "nil" in place of "Explosive_Round_Class_Name" 
	["M4 Holo", [],"", -5, [["expression", format[_EXECscript2,"M4A1_HWS_GL","30Rnd_556x45_Stanag","1Rnd_HE_M203"]]], "1", "1"],
//	["M4 CCO SD", [],"", -5, [["expression", format[_EXECscript2,"M4A1_AIM_SD","30Rnd_556x45_StanagSD","nil"]]], "1", "1"],
	["M4A1 GL SD Camo", [],"", -5, [["expression", format[_EXECscript2,"M4A1_HWS_GL_SD_Camo","30Rnd_556x45_StanagSD","1Rnd_HE_M203"]]], "1", "1"],
	["Sa58V ACOG", [],"", -5, [["expression", format[_EXECscript2,"Sa58V_RCO_EP1","30Rnd_762x39_SA58","nil"]]], "1", "1"],
//	["M16 ACOG", [],"", -5, [["expression", format[_EXECscript2,"m16a4_acg","30Rnd_556x45_Stanag","nil"]]], "1", "1"],
	["Aks Kobra", [],"", -5, [["expression", format[_EXECscript2,"AKS_74_kobra","30Rnd_545x39_AK","nil"]]], "1", "1"],
	["FN FAL", [],"", -5, [["expression", format[_EXECscript2,"FN_FAL","20Rnd_762x51_FNFAL","nil"]]], "1", "1"],
//	["Pecheneg 50 cal", [],"", -5, [["expression", format[_EXECscript2,"Pecheneg_DZ","100Rnd_762x54_PK","nil"]]], "1", "1"],
	["Mk 48", [],"", -5, [["expression", format[_EXECscript2,"Mk_48_DES_EP1","100Rnd_762x51_M240","nil"]]], "1", "1"],
	["AS50", [],"", -5, [["expression", format[_EXECscript2,"BAF_AS50_scoped","5Rnd_127x99_AS50","nil"]]], "1", "1"],
	[".338 LAPUA", [],"", -5, [["expression", format[_EXECscript2,"BAF_LRR_scoped","5Rnd_86x70_L115A1","nil"]]], "1", "1"],
	["DMR", [],"", -5, [["expression", format[_EXECscript2,"DMR","20Rnd_762x51_DMR","nil"]]], "1", "1"],
//	["M14 Aim", [],"", -5, [["expression", format[_EXECscript2,"M14_EP1","20Rnd_762x51_DMR","nil"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Secondary Weapons", [], "#USER:SecondaryWeaponMenu", -5, [["expression", ""]], "1", "1"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Sidearm weapons like the Makarov
SecondaryWeaponMenu =[
["",true],
	["PDW SD", [],"", -5, [["expression", format[_EXECscript2,"UZI_SD_EP1","30Rnd_9x19_UZI_SD"]]], "1", "1"],
	["PDW", [],"", -5, [["expression", format[_EXECscript2,"UZI_EP1","30Rnd_9x19_UZI"]]], "1", "1"],
	["Glock", [],"", -5, [["expression", format[_EXECscript2,"glock17_EP1","17Rnd_9x19_glock17"]]], "1", "1"],
	["M9 SD", [],"", -5, [["expression", format[_EXECscript2,"M9SD","15Rnd_9x19_M9SD"]]], "1", "1"],
	["Makarov", [],"", -5, [["expression", format[_EXECscript2,"Makarov","8Rnd_9x18_Makarov"]]], "1", "1"],
	["Makarov SD", [],"", -5, [["expression", format[_EXECscript2,"MakarovSD","8Rnd_9x18_Makarov"]]], "1", "1"],
		["Gear/Items", [], "#USER:GearMenu", -5, [["expression", ""]], "1", "1"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu for spawning items to the admin like bags and tools
GearMenu=[
["",true],
	["ToolBelt gear", [],"", -5, [["expression", format[_EXECscript4,"toolBeltItems.sqf"]]], "1", "1"],
	["Medical gear", [],"", -5, [["expression", format[_EXECscript4,"medical.sqf"]]], "1", "1"],
	["Alice Pack", [],"", -5, [["expression", format[_EXECscript3,"DZ_ALICE_Pack_EP1"]]], "1", "1"],
	["Large Gun Bag", [],"", -5, [["expression", format[_EXECscript3,"DZ_LargeGunBag_EP1"]]], "1", "1"],
	["Delete all gear", [],"", -5, [["expression", format[_EXECscript4,"removeGear.sqf"]]], "1", "1"],
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
	// Entry Format: ["name",[],"",-5,[["expression",format[_EXECscript6,"local","fileNAME.sqf"]]],"1","1"],
	["-- Private Crates --", [], "", -5, [["expression", ""]], "1", "0"],
	["Weapons Crate",[],"",-5,[["expression",format[_EXECscript6,"local","weapons.sqf"]]],"1","1"],
	["Items Crate",[],"",-5,[["expression",format[_EXECscript6,"local","items.sqf"]]],"1","1"],
	["ALL Weapons/Items Crate",[],"",-5,[["expression",format[_EXECscript6,"local","allweapons.sqf"]]],"1","1"],
	["Building Crate",[],"",-5,[["expression",format[_EXECscript6,"local","building.sqf"]]],"1","1"],
	["Backpack Tent",[],"",-5,[["expression",format[_EXECscript6,"local","backpack.sqf"]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Public Crates >>", [], "#USER:CrateMenuPublic", -5, [["expression", ""]], "1", "1"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// This menu creates a global (public) crate of items that EVERYONE can see
CrateMenuPublic=[
	["",true],
	// Entry Format: ["name",[],"",-5,[["expression",format[_EXECscript6,"global","fileNAME.sqf"]]],"1","1"],
	["-- Public Crates --", [], "", -5, [["expression", ""]], "1", "0"],
	["Weapons Crate",[],"",-5,[["expression",format[_EXECscript6,"global","weapons.sqf"]]],"1","1"],
	["Items Crate",[],"",-5,[["expression",format[_EXECscript6,"global","items.sqf"]]],"1","1"],
	["ALL Weapons/Items Crate",[],"",-5,[["expression",format[_EXECscript6,"global","allweapons.sqf"]]],"1","1"],
	["Building Crate",[],"",-5,[["expression",format[_EXECscript6,"global","building.sqf"]]],"1","1"],
	["Backpack Tent",[],"",-5,[["expression",format[_EXECscript6,"global","backpack.sqf"]]],"1","1"],
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
	["8pm",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 19, 20, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["10pm",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 19, 22, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["Midnight",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 19, 0, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["2am",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 19, 2, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["4am",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 19, 4, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

FullMoonNights = [
	["",true],
	["Full moon night:", [], "", -5, [["expression", ""]], "1", "0"],
	["8pm",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 20, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["10pm",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 22, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["Midnight",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 0, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["2am",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 2, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["4am",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 4, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

DayMenu = [
	["",true],
	["Set Day Time:", [], "", -5, [["expression", ""]], "1", "0"],
	["5am",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 5, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["7am",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 7, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["9am",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 9, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["11am",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 11, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["Noon",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 12, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["1pm",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 13, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["3pm",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 15, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["5pm",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 17, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["7pm",[],"",-5,[["expression",'EAT_SetDateServer = [2012, 6, 4, 19, 0]; publicVariableServer "EAT_SetDateServer"']],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

WeatherMenu = [
	["",true],
	["Set Weather:",[],"",-5,[["expression",""]],"1","0"],
	["Clear Sky",[],"",-5,[["expression",'EAT_SetOvercastServer = 0; publicVariableServer "EAT_SetOvercastServer"']],"1","1"],
	["Slightly Cloudy",[],"",-5,[["expression",'EAT_SetOvercastServer = 0.25; publicVariableServer "EAT_SetOvercastServer"']],"1","1"],
	["Cloudy",[],"",-5,[["expression",'EAT_SetOvercastServer = 0.5; publicVariableServer "EAT_SetOvercastServer"']],"1","1"],
	["Very Cloudy",[],"",-5,[["expression",'EAT_SetOvercastServer = 0.75; publicVariableServer "EAT_SetOvercastServer"']],"1","1"],
	["Storm",[],"",-5,[["expression",'EAT_SetOvercastServer = 1; publicVariableServer "EAT_SetOvercastServer"']],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
	["Set Fog:", [], "", -5, [["expression", ""]], "1", "0"],
	["Off",[],"",-5,[["expression",'EAT_SetFogServer = 0; publicVariableServer "EAT_SetFogServer"']],"1","1"],
	["Thin",[],"",-5,[["expression",'EAT_SetFogServer = 0.25; publicVariableServer "EAT_SetFogServer"']],"1","1"],
	["Medium",[],"",-5,[["expression",'EAT_SetFogServer = 0.5; publicVariableServer "EAT_SetFogServer"']],"1","1"],
	["Thick",[],"",-5,[["expression",'EAT_SetFogServer = 0.75; publicVariableServer "EAT_SetFogServer"']],"1","1"],
	["Maximum",[],"",-5,[["expression",'EAT_SetFogServer = 1; publicVariableServer "EAT_SetFogServer"']],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
// Menu that deals with epoch specific items like locks and safes
EpochMenu=[
	["",true],
	["Admin Build Menu >> ",[],"#USER:BuildMenu", -5,[["expression",""]],"1","1"],
	["Base Manager Menu >>", [], "", -5, [["expression",format[_EXECscript1,"base_manager.sqf"]]], "1", "1"],
	["Point to Delete Item",[],"", -5,[["expression",format[_EXECscript1,"DatabaseRemove.sqf"]]],"1","1"],
	["Point to display code",[],"",-5,[["expression",format[_EXECscript1,"gimmecode.sqf"]]],"1","1"],
	["Point to make new key",[],"",-5,[["expression",format[_EXECscript1,"givekey.sqf"]]],"1","1"],
	["Point to lock object",[],"",-5,[["expression",format[_EXECscript1,"PointToLock.sqf"]]],"1","1"],
	["Point to unlock object",[],"",-5,[["expression",format[_EXECscript1,"PointToUnlock.sqf"]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Base menu for Admin Build functions
BuildMenu =
[
["",true],
	["Rebuild last item",[],"", -5,[["expression",format[_EXECscript7,"rebuild"]]],"1","1"],
	["Base Materials >>",[],"#USER:BaseItems", -5,[["expression",""]],"1","1"],
	["Buildings >>",[],"#USER:BuildingsTemp", -5,[["expression",""]],"1","1"],
	["Storage >>",[],"#USER:BuildStorage", -5,[["expression",""]],"1","1"],
	["Netting >>",[],"#USER:BuildNetting", -5,[["expression",""]],"1","1"],
	["Sandbags >>",[],"#USER:BuildSandbag", -5,[["expression",""]],"1","1"],
	["Extras >>",[],"#USER:BuildExtras", -5,[["expression",""]],"1","1"],
	["Point To Upgrade",[],"", -5,[["expression",format[_EXECscript8,"pointToUpgrade.sqf"]]],"1","1"],
	["Point To Downgrade",[],"", -5,[["expression",format[_EXECscript8,"pointToDowngrade.sqf"]]],"1","1"],
	["Maintain Base",[],"", -5,[["expression",format[_EXECscript8,"maintainArea.sqf"]]],"1","1"],
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
	["Floor (Full)",[],"", -5,[["expression",format[_EXECscript7,"WoodFloor_DZ"]]],"1","1"],
	["Floor (1/2)",[],"", -5,[["expression",format[_EXECscript7,"WoodFloorHalf_DZ"]]],"1","1"],
	["Floor (1/4)",[],"", -5,[["expression",format[_EXECscript7,"WoodFloorQuarter_DZ"]]],"1","1"],
	["Wall (Large)",[],"", -5,[["expression",format[_EXECscript7,"WoodLargeWall_DZ"]]],"1","1"],
	["Wall (Small)",[],"", -5,[["expression",format[_EXECscript7,"WoodSmallWall_DZ"]]],"1","1"],
	["Wall (1/3)",[],"", -5,[["expression",format[_EXECscript7,"WoodSmallWallThird_DZ"]]],"1","1"],
	["Wall /w Window (Large)",[],"", -5,[["expression",format[_EXECscript7,"WoodLargeWallWin_DZ"]]],"1","1"],
	["Wall /w Window (Small)",[],"", -5,[["expression",format[_EXECscript7,"WoodSmallWallWin_DZ"]]],"1","1"],
	["Garage Doorway",[],"", -5,[["expression",format[_EXECscript7,"WoodLargeWallDoor_DZ"]]],"1","1"],
	["Normal Doorway",[],"", -5,[["expression",format[_EXECscript7,"WoodSmallWallDoor_DZ"]]],"1","1"],
	["Stairs",[],"", -5,[["expression",format[_EXECscript7,"WoodStairsSans_DZ"]]],"1","1"],
	["Stairs /w Rails",[],"", -5,[["expression",format[_EXECscript7,"WoodStairsRails_DZ"]]],"1","1"],
	["Stairs /w Stilts",[],"", -5,[["expression",format[_EXECscript7,"WoodStairs_DZ"]]],"1","1"],
	["Ramp",[],"", -5,[["expression",format[_EXECscript7,"WoodRamp_DZ"]]],"1","1"],
	["Ladder",[],"", -5,[["expression",format[_EXECscript7,"WoodLadder_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Cinder epoch base items
BuildablesCinder = [
["",true],
	["Wall (Full)",[],"", -5,[["expression",format[_EXECscript7,"CinderWall_DZ"]]],"1","1"],
	["Wall (Half)",[],"", -5,[["expression",format[_EXECscript7,"CinderWallHalf_DZ"]]],"1","1"],
	["Garage Doorway",[],"", -5,[["expression",format[_EXECscript7,"CinderWallDoorway_DZ"]]],"1","1"],
	["Normal Doorway",[],"", -5,[["expression",format[_EXECscript7,"CinderWallSmallDoorway_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Anything that does not fit into the BaseItems categories
BuildablesOther = [
["",true],
	["Metal Floor",[],"", -5,[["expression",format[_EXECscript7,"MetalFloor_DZ"]]],"1","1"],
	["Metal Panel",[],"", -5,[["expression",format[_EXECscript7,"MetalPanel_DZ"]]],"1","1"],
	["Tank Trap",[],"", -5,[["expression",format[_EXECscript7,"Hedgehog_DZ"]]],"1","1"],
	["Wire Fence",[],"", -5,[["expression",format[_EXECscript7,"Fort_RazorWire"]]],"1","1"],
	["Plot Pole",[],"", -5,[["expression",format[_EXECscript7,"Plastic_Pole_EP1_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Storage items for base
BuildStorage =
[
["",true],
	["Wooden Shed",[],"", -5,[["expression",format[_EXECscript7,"Wooden_shed_DZ"]]],"1","1"],
	["Wooden Shack",[],"", -5,[["expression",format[_EXECscript7,"WoodShack_DZ"]]],"1","1"],
	["Storage Shed",[],"", -5,[["expression",format[_EXECscript7,"StorageShed_DZ"]]],"1","1"],
	["Wood Crate",[],"", -5,[["expression",format[_EXECscript7,"WoodCrate_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Any buildable dealing with sand bags
BuildSandbag =
[
["",true],
	["Sandbag Fence",[],"", -5,[["expression",format[_EXECscript7,"Sandbag1_DZ"]]],"1","1"],
	["Sandbag Fence (round)",[],"", -5,[["expression",format[_EXECscript7,"BagFenceRound_DZ"]]],"1","1"],
	["H-barrier Cube",[],"", -5,[["expression",format[_EXECscript7,"Land_HBarrier1_DZ"]]],"1","1"],
	["H-barrier (short)",[],"", -5,[["expression",format[_EXECscript7,"Land_HBarrier3_DZ"]]],"1","1"],
	["H-barrier (long)",[],"", -5,[["expression",format[_EXECscript7,"Land_HBarrier5_DZ"]]],"1","1"],
	["H-Barrier (Huge)",[],"", -5,[["expression",format[_EXECscript7,"Base_WarfareBBarrier10xTall","building"]]],"1","1"],
	["Sandbag Nest",[],"", -5,[["expression",format[_EXECscript7,"SandNest_DZ"]]],"1","1"],
	["M240 Nest",[],"", -5,[["expression",format[_EXECscript7,"M240Nest_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Cloth nets/huts
BuildNetting =
[
["",true],
	["Camo Net (Desert)",[],"", -5,[["expression",format[_EXECscript7,"DesertCamoNet_DZ"]]],"1","1"],
	["Camo Net (Forest)",[],"", -5,[["expression",format[_EXECscript7,"ForestCamoNet_DZ"]]],"1","1"],
	["Camo Net Large (Desert)",[],"", -5,[["expression",format[_EXECscript7,"DesertLargeCamoNet_DZ"]]],"1","1"],
	["Camo Net Large (Forest)",[],"", -5,[["expression",format[_EXECscript7,"ForestLargeCamoNet_DZ"]]],"1","1"],
	["Canvas Hut",[],"", -5,[["expression",format[_EXECscript7,"CanvasHut_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Anything that does not fall into the other categories
BuildExtras =
[
["",true],
	["Fire Barrel",[],"", -5,[["expression",format[_EXECscript7,"FireBarrel_DZ"]]],"1","1"],
	["Workbench",[],"", -5,[["expression",format[_EXECscript7,"WorkBench_DZ"]]],"1","1"],
	["Generator",[],"", -5,[["expression",format[_EXECscript7,"Generator_DZ"]]],"1","1"],
	["Fuel Pump",[],"", -5,[["expression",format[_EXECscript7,"FuelPump_DZ"]]],"1","1"],
	["Deer Stand",[],"", -5,[["expression",format[_EXECscript7,"DeerStand_DZ"]]],"1","1"],
	["Park Bench",[],"", -5,[["expression",format[_EXECscript7,"ParkBench_DZ"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Full buildings like a house
BuildingsTemp =
[
["",true],
	["Residential >>",[],"#USER:ResidentialBildings", -5,[["expression",""]],"1","1"],
	["Industrial >>",[],"#USER:IndustrialBuildings", -5,[["expression",""]],"1","1"],
	["Military >>",[],"#USER:MilitaryBuildings", -5,[["expression",""]],"1","1"],
	["Religious >>",[],"#USER:ReligiousBildings", -5,[["expression",""]],"1","1"],
	["Farm >>",[],"#USER:FarmBuildings", -5,[["expression",""]],"1","1"],
	["Ore Veins >>",[],"#USER:OreVein", -5,[["expression",""]],"1","1"],
	["Graves >>",[],"#USER:Graves", -5,[["expression",""]],"1","1"],
	["Other >>",[],"#USER:OtherBuildings", -5,[["expression",""]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

OtherBuildings =
[
["",true],
	["OutHouse",[],"", -5,[["expression",format[_EXECscript7,"Land_KBud","building"]]],"1","1"],
	["Statue Soldiers",[],"", -5,[["expression",format[_EXECscript7,"Land_A_statue01","building"]]],"1","1"],
	["Statue Tank",[],"", -5,[["expression",format[_EXECscript7,"Land_A_statue02","building"]]],"1","1"],
	["Archway",[],"", -5,[["expression",format[_EXECscript7,"Land_brana02nodoor","building"]]],"1","1"],
	["Sandbag Nest Big",[],"", -5,[["expression",format[_EXECscript7,"Land_fortified_nest_big","building"]]],"1","1"],
	["Red Marker Archway",[],"", -5,[["expression",format[_EXECscript7,"Sign_circle_EP1","building"]]],"1","1"],
	["Concrete Ramp Tall",[],"", -5,[["expression",format[_EXECscript7,"Land_ConcreteRamp","building"]]],"1","1"],
	["Concrete Ramp Short",[],"", -5,[["expression",format[_EXECscript7,"RampConcrete","building"]]],"1","1"],
	["Wood Ramp Small",[],"", -5,[["expression",format[_EXECscript7,"Land_WoodenRamp","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];


OreVein =
[
["",true],
	["Gold Vein",[],"", -5,[["expression",format[_EXECscript7,"Gold_Vein_DZE","building"]]],"1","1"],
	["Silver Vein",[],"", -5,[["expression",format[_EXECscript7,"Silver_Vein_DZE","building"]]],"1","1"],
	["Iron Vein",[],"", -5,[["expression",format[_EXECscript7,"Iron_Vein_DZE","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

IndustrialBuildings =
[
["",true],
	["1 Red Cargo Crate (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_Misc_Cargo1Bo","building"]]],"1","1"],
	["2 Red Cargo Crates (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_Misc_Cargo2D","building"]]],"1","1"],
	["Open Cargo Crate",[],"", -5,[["expression",format[_EXECscript7,"Land_Misc_Cargo1D","building"]]],"1","1"],
	["Military Cargo Crate",[],"", -5,[["expression",format[_EXECscript7,"US_WarfareBVehicleServicePoint_Base_EP1","building"]]],"1","1"],
	["Metal Overhang",[],"", -5,[["expression",format[_EXECscript7,"Land_Ind_Shed_02_main","building"]]],"1","1"],
	["Metal Arch",[],"", -5,[["expression",format[_EXECscript7,"Land_Ind_Shed_01_end","building"]]],"1","1"],
	["RoadcCheck Station",[],"", -5,[["expression",format[_EXECscript7,"Land_Hlidac_budka","building"]]],"1","1"],
	["2 Story Sandbag /w Net",[],"", -5,[["expression",format[_EXECscript7,"Land_Fort_Watchtower","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
MilitaryBuildings =
[
["",true],
	["L-Barracks",[],"", -5,[["expression",format[_EXECscript7,"Land_Mil_Barracks_L","building"]]],"1","1"],
	["Depot",[],"", -5,[["expression",format[_EXECscript7,"WarfareBDepot","building"]]],"1","1"],
	["Field Hospital",[],"", -5,[["expression",format[_EXECscript7,"INS_WarfareBFieldhHospital","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

ResidentialBildings =
[
["",true],
	["Houses >>",[],"#USER:ResidentialHouse", -5,[["expression",""]],"1","1"],
	["Offices >>",[],"#USER:ResidentialOffice", -5,[["expression",""]],"1","1"],
	["Sheds >>",[],"#USER:ResidentialShed", -5,[["expression",""]],"1","1"],
	["Pub",[],"", -5,[["expression",format[_EXECscript7,"Land_A_Pub_01","building"]]],"1","1"],
	["Hospital",[],"", -5,[["expression",format[_EXECscript7,"land_a_hospital","building"]]],"1","1"],
	["Supermarket 1",[],"", -5,[["expression",format[_EXECscript7,"Land_A_GeneralStore_01a","building"]]],"1","1"],
	["Supermarket 2",[],"", -5,[["expression",format[_EXECscript7,"Land_A_GeneralStore_01","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
Graves =
[
["",true],
	["Grave",[],"", -5,[["expression",format[_EXECscript7,"Grave","building"]]],"1","1"],
	["Grave Cross 1",[],"", -5,[["expression",format[_EXECscript7,"GraveCross1","building"]]],"1","1"],
	["Grave Cross 2",[],"", -5,[["expression",format[_EXECscript7,"GraveCross2","building"]]],"1","1"],
	["Grave Cross Helmet",[],"", -5,[["expression",format[_EXECscript7,"GraveCrossHelmet","building"]]],"1","1"],
	["Mass Grave",[],"", -5,[["expression",format[_EXECscript7,"Mass_grave_DZ","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
ResidentialShed =
[
["",true],
	["Nice Wood (Open)",[],"", -5,[["expression",format[_EXECscript7,"Land_Shed_Wooden","building"]]],"1","1"],
	["Rickety Wood (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_kulna","building"]]],"1","1"],
	["Old Large Wood (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_Shed_W4","building"]]],"1","1"],
	["Patchwork Wood (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_Shed_W03","building"]]],"1","1"],
	["Old Metal (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_Shed_m03","building"]]],"1","1"],
	["Grey Wood (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_Shed_W02","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
ResidentialHouse =
[
["",true],
	["Yellow Modern House (Open)",[],"", -5,[["expression",format[_EXECscript7,"Land_sara_domek_zluty","building"]]],"1","1"],
	[" Orange/Green (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseV_3I1","building"]]],"1","1"],
	["Damaged Red Brick",[],"", -5,[["expression",format[_EXECscript7,"land_r_housev2_04","building"]]],"1","1"],
	["Large orange brick (Open)",[],"", -5,[["expression",format[_EXECscript7,"Land_Housev2_02_Interier","building"]]],"1","1"],
	["Orange/Red (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseV_1I1","building"]]],"1","1"],
	["Barn (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseV_3I4","building"]]],"1","1"],
	["Yellow (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseV_1T","building"]]],"1","1"],
	["Red Brick (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseV_2I","building"]]],"1","1"],
	["Wood (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseV_1I3","building"]]],"1","1"],
	["Green (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseV_1L1","building"]]],"1","1"],
	["Wood Yellow (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseV_1I2","building"]]],"1","1"],
	["Yellow Stone",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseV_2L","building"]]],"1","1"],
	["Bage Wood (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseV_2T1","building"]]],"1","1"],
	["Wood Yellow (Open)",[],"", -5,[["expression",format[_EXECscript7,"land_housev_3i3","building"]]],"1","1"],
	["Green Wood (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseV_2T2","building"]]],"1","1"],
	["Green wood/concrete (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseV_3I2","building"]]],"1","1"],
	["Shanty",[],"", -5,[["expression",format[_EXECscript7,"Land_MBG_Shanty_BIG","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Next 20", [20], "#USER:ResidentialHouse2", -5, [["expression", ""]], "1", "1"]
];

ResidentialHouse2 =
[
["",true],
	["Burgandy (Open)",[],"", -5,[["expression",format[_EXECscript7,"land_housev_1l2","building"]]],"1","1"],
	["Middle-East 1",[],"", -5,[["expression",format[_EXECscript7,"Land_House_C_11_EP1","building"]]],"1","1"],
	["Middle-East 2",[],"", -5,[["expression",format[_EXECscript7,"Land_House_C_12_EP1","building"]]],"1","1"],
	["Old Stone 1",[],"", -5,[["expression",format[_EXECscript7,"Land_House_K_3_EP1","building"]]],"1","1"],
	["Old Stone 2",[],"", -5,[["expression",format[_EXECscript7,"Land_House_K_7_EP1","building"]]],"1","1"],
	["Old Stone 3",[],"", -5,[["expression",format[_EXECscript7,"Land_House_L_7_EP1","building"]]],"1","1"],
	["Old Stone 4",[],"", -5,[["expression",format[_EXECscript7,"Land_House_L_6_EP1","building"]]],"1","1"],
	["Old Stone 5",[],"", -5,[["expression",format[_EXECscript7,"Land_House_K_8_EP1","building"]]],"1","1"],
	["Old Stone 6",[],"", -5,[["expression",format[_EXECscript7,"Land_House_K_5_EP1","building"]]],"1","1"],
	["Old Stone 7",[],"", -5,[["expression",format[_EXECscript7,"Land_House_K_1_EP1","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Next 20", [20], "#USER:ResidentialHouse3", -5, [["expression", ""]], "1", "1"]
];

ResidentialHouse3 =
[
["",true],
	["Old Stone 8",[],"", -5,[["expression",format[_EXECscript7,"Land_House_L_1_EP1","building"]]],"1","1"],
	["Old Stone 9",[],"", -5,[["expression",format[_EXECscript7,"Land_House_L_3_EP1","building"]]],"1","1"],
	["Old Stone 10",[],"", -5,[["expression",format[_EXECscript7,"Land_House_L_4_EP1","building"]]],"1","1"],
	["Old Stone 11",[],"", -5,[["expression",format[_EXECscript7,"Land_House_L_8_EP1","building"]]],"1","1"],
	["Old Stone Ruined",[],"", -5,[["expression",format[_EXECscript7,"Land_House_L_9_EP1","building"]]],"1","1"],
	["Ruined House",[],"", -5,[["expression",format[_EXECscript7,"Land_ruin_01","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

ResidentialHouse4 =
[
["",true],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

ResidentialHouseBlock =
[
["",true],
	["House Block 1",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_A1","building"]]],"1","1"],
	["House Block 2",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_A1_2","building"]]],"1","1"],
	["House Block 3",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_A2","building"]]],"1","1"],
	["House Block 4",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_A2_1","building"]]],"1","1"],
	["House Block 5",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_A3","building"]]],"1","1"],
	["House Block 6",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_B1","building"]]],"1","1"],
	["House Block 7",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_B2","building"]]],"1","1"],
	["House Block 8",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_B3","building"]]],"1","1"],
	["House Block 9",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_B4","building"]]],"1","1"],
	["House Block 10",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_B5","building"]]],"1","1"],
	["House Block 11",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_B6","building"]]],"1","1"],
	["House Block 12",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_C1","building"]]],"1","1"],
	["House Block 13",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_C2","building"]]],"1","1"],
	["House Block 14",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_C3","building"]]],"1","1"],
	["House Block 15",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_C4","building"]]],"1","1"],
	["House Block 16",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_C5","building"]]],"1","1"],
	["House Block 17",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseBlock_A1_1","building"]]],"1","1"],
	["Apartment 1",[],"", -5,[["expression",format[_EXECscript7,"Land_MBG_ApartmentsOne_W","building"]]],"1","1"],
	["Apartment 2",[],"", -5,[["expression",format[_EXECscript7,"Land_MBG_ApartmentsTwo_P","building"]]],"1","1"],
	["Apartment 3",[],"", -5,[["expression",format[_EXECscript7,"Land_MBG_ApartmentsTwo_G","building"]]],"1","1"],
	["Apartment 4",[],"", -5,[["expression",format[_EXECscript7,"Land_MBG_ApartmentsTwo_B","building"]]],"1","1"],
	["Apartment 5",[],"", -5,[["expression",format[_EXECscript7,"land_mbg_apartments_big_04","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

ResidentialOffice =
[
["",true],
	["International Hotel",[],"", -5,[["expression",format[_EXECscript7,"Land_HouseB_Tenement","building"]]],"1","1"],
	["Apartments Red Short",[],"", -5,[["expression",format[_EXECscript7,"Land_Panelak","building"]]],"1","1"],
	["Apartments Red Tall",[],"", -5,[["expression",format[_EXECscript7,"Land_Panelak2","building"]]],"1","1"],
	["Very tall apartments",[],"", -5,[["expression",format[_EXECscript7,"land_panelak3","building"]]],"1","1"],
	["Municipal Office",[],"", -5,[["expression",format[_EXECscript7,"Land_A_MunicipalOffice","building"]]],"1","1"],
	["School",[],"", -5,[["expression",format[_EXECscript7,"Land_A_Office01","building"]]],"1","1"],
	["Apartments Grey (Closed)",[],"", -5,[["expression",format[_EXECscript7,"Land_A_Office02","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

CastleBuildings =
[
["",true],
	["Bergfrit",[],"", -5,[["expression",format[_EXECscript7,"Land_A_Castle_Bergfrit","building"]]],"1","1"],
	["Stairs",[],"", -5,[["expression",format[_EXECscript7,"Land_A_Castle_Stairs_A","building"]]],"1","1"],
	["Gate",[],"", -5,[["expression",format[_EXECscript7,"Land_A_Castle_Gate","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

ReligiousBildings =
[
["",true],
	["Church Orange",[],"", -5,[["expression",format[_EXECscript7,"Land_Church_01","building"]]],"1","1"],
	["Church Closed",[],"", -5,[["expression",format[_EXECscript7,"Land_Church_02","building"]]],"1","1"],
	["Church Open",[],"", -5,[["expression",format[_EXECscript7,"Land_Church_03","building"]]],"1","1"],
	["Church Destroyed",[],"", -5,[["expression",format[_EXECscript7,"Land_Church_05R","building"]]],"1","1"],
	["Mosque Large",[],"", -5,[["expression",format[_EXECscript7,"Land_A_Mosque_big_hq_EP1","building"]]],"1","1"],
	["Mosque Addon",[],"", -5,[["expression",format[_EXECscript7,"Land_A_Mosque_big_addon_EP1","building"]]],"1","1"],
	["Mosque Wall",[],"", -5,[["expression",format[_EXECscript7,"Land_A_Mosque_big_wall_EP1","building"]]],"1","1"],
	["Mosque Medium",[],"", -5,[["expression",format[_EXECscript7,"Land_A_Mosque_small_1_EP1","building"]]],"1","1"],
	["Mosque Small",[],"", -5,[["expression",format[_EXECscript7,"Land_A_Mosque_small_2_EP1","building"]]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

FarmBuildings =
[
["",true],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];


// Menu that spawns TEMPORARY air vehicles
VehicleTempMenu=
[
["",true],
	["Spawn Temporary Vehicle -- AIR",[],"",-5,[["expression",""]],"1","0"],
	["MH-6J Little Bird",[],"",-5,[["expression",'["MH6J_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["UH-60M Black Hawk",[],"",-5,[["expression",'["UH60M_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["CH-47F Chinook",[],"",-5,[["expression",'["CH_47F_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["MV-22 Osprey",[],"",-5,[["expression",'["MV22"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["A-10",[],"",-5,[["expression",'["A10"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["C-130J Super Hercules",[],"",-5,[["expression",'["C130J"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["",[],"",-5,[["expression",""]],"1","0"],
		["Next page",[],"#USER:VehicleTempMenu2",-5,[["expression",""]],"1","1"],
			["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu2 that spawns TEMPORARY wheeled vehicles
VehicleTempMenu2 =
[
["",true],
	["Spawn Temporary Vehicle -- WHEELED",[],"",-5,[["expression",""]],"1","0"],
	["SUV (Camo)",[],"",-5,[["expression",'["SUV_Camo"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Armored SUV",[],"",-5,[["expression",'["ArmoredSUV_PMC_DZE"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["MTVR (Fuel)",[],"",-5,[["expression",'["MTVR_Refuel_DES_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Ural Truck",[],"",-5,[["expression",'["Ural_TK_CIV_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Ikarus Bus",[],"",-5,[["expression",'["Ikarus_TK_CIV_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["HMMWV (Ambulance)",[],"",-5,[["expression",'["HMMWV_Ambulance"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Military Offroad Special",[],"",-5,[["expression",'["LandRover_Special_CZ_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Mountain Bike",[],"",-5,[["expression",'["MMT_USMC"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Motorcycle",[],"",-5,[["expression",'["M1030"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["ATV",[],"",-5,[["expression",'["ATV_US_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Next page", [], "#USER:VehicleTempMenu3", -5, [["expression", ""]], "1", "1"],
			["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu that spawns TEMPORARY vehicles with treads (tanks)
VehicleTempMenu3 =
[
["",true],
	["Spawn Temporary Vehicle -- TRACKED",[],"",-5,[["expression",""]],"1","0"],
	["M1A1",[],"",-5,[["expression",'["M1A1_US_DES_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["M1A2 TUSK",[],"",-5,[["expression",'["M1A2_US_TUSK_MG_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["M270 MLRS",[],"",-5,[["expression",'["MLRS_DES_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["T-34",[],"",-5,[["expression",'["T34_TK_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Next page", [], "#USER:VehicleTempMenu4", -5, [["expression", ""]], "1", "1"],
			["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];

// Menu that spawns TEMPORARY water vehicles
VehicleTempMenu4 =
[
["",true],
	["Spawn Temporary Vehicle -- WATER",[],"",-5,[["expression",""]],"1","0"],
	["Fishing Boat",[],"",-5,[["expression",'["Fishing_Boat"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["PBX",[],"",-5,[["expression",'["PBX"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["RHIB",[],"",-5,[["expression",'["RHIB"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Small boat",[],"",-5,[["expression",'["Smallboat_1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		// ["Next page", [], "#USER:VehicleTempMenu5", -5, [["expression", ""]], "1", "1"],
			["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:epochmenustart";
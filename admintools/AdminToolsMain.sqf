_EXECscript1 = 'player execVM "admintools\tools\%1"';
_EXECscript5 = 'player execVM "admintools\vehicles\%1"';
_EXECscript6 = '["%1"] execVM "admintools\crates\%2"';

if ((getPlayerUID player) in AdminList) then { // Admins
	epochmenustart = [
	["",true],
		["-- Epoch Admin Tools (Level: Admin) --", [], "", -5, [["expression", ""]], "1", "0"],
		["Admin Menu >>", [], "#USER:AdminMenu", -5, [["expression", ""]], "1", "1"],
		["Vehicle Menu >>",[],"#USER:VehicleMenu",-5,[["expression",""]],"1","1"],
		["Crate Menu >>",[],"#USER:CrateMenu",-5,[["expression",""]],"1","1"],
		["Epoch Menu >>", [], "#USER:EpochMenu", -5, [["expression", ""]], "1", "1"],
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
	["Zombie Shield",[],"", -5,[["expression",format[_EXECscript1,"zombieshield.sqf"]]],"1","1"],
	["Heal Players",[],"", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
	["Teleport Menu >>",[],"#USER:TeleportMenu", -5, [["expression", ""]], "1", "1"],
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

// Menu for teleport options
TeleportMenu =
[
["",true],
	["Teleport (F1)",[],"", -5,[["expression", format[_EXECscript1,"Teleport\Teleport.sqf"]]], "1", "1"],
	["Teleport To Me (F2)",[],"", -5, [["expression", format[_EXECscript1, "Teleport\TPtoME.sqf"]]], "1", "1"],
	["Teleport To Player (F3)",[],"", -5, [["expression", format[_EXECscript1, "Teleport\TpToPlayer.sqf"]]], "1", "1"],
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

// Menu that deals with epoch specific items like locks and safes
EpochMenu=[
	["",true],
	["Base Delete Menu >>", [], "", -5, [["expression",format[_EXECscript1,"deletebase.sqf"]]], "1", "1"],
	["Point to Delete Item",[],"", -5,[["expression",format[_EXECscript1,"DatabaseRemove.sqf"]]],"1","1"],
	["Point to display code",[],"",-5,[["expression",format[_EXECscript1,"gimmecode.sqf"]]],"1","1"],
	["Point to make new key",[],"",-5,[["expression",format[_EXECscript1,"givekey.sqf"]]],"1","1"],
	["Point to lock object",[],"",-5,[["expression",format[_EXECscript1,"PointToLock.sqf"]]],"1","1"],
	["Point to unlock object",[],"",-5,[["expression",format[_EXECscript1,"PointToUnlock.sqf"]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
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
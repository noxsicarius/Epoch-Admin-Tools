_pathtotools = "admintools\tools\";
_pathtoskins = "admintools\skins\";
_pathtoweapon = "admintools\weaponkits\";
// _pathtoshields = "admintools\shields\";
_pathtovehicles = "admintools\vehicles\";
_pathtocrates = "admintools\crates\";
_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';
_EXECscript2 = 'player execVM "'+_pathtoskins+'%1"';
_EXECscript3 = 'player execVM "'+_pathtoweapon+'%1"';
// _EXECscript4 = 'player execVM "'+_pathtoshields+'%1"';
_EXECscript5 = 'player execVM "'+_pathtovehicles+'%1"';
_EXECscript6 = 'player execVM "'+_pathtocrates+'%1"';
// if ((getPlayerUID player) in AllAdminList) then { // All Admins
if ((getPlayerUID player) in AdminList) then { // Admins
	epochmenustart =
	[
	["",true],
		["-- Epoch Admin Tools (Level: Admin) --", [], "", -5, [["expression", ""]], "1", "0"],
		["Admin Menu >>", [], "#USER:AdminMenu", -5, [["expression", ""]], "1", "1"],
		["ESP Menu >>", [],  "#USER:EspMenu", -5, [["expression", ""]], "1", "1"],			
		["Skin Change Menu >>", [], "#USER:AdminSkinsMenu", -5, [["expression", ""]], "1", "1"],
		["Weapon Kits >>", [], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"],
		["Crate Menu >>",[],"#USER:CrateMenu",-5,[["expression",""]],"1","1"],
		["Vehicle Menu >>",[],"#USER:VehicleMenu",-5,[["expression",""]],"1","1"],	
		["Epoch Menu >>", [], "#USER:EpochMenu", -5, [["expression", ""]], "1", "1"],			
		["", [], "", -5, [["expression", ""]], "1", "0"],
			["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]		
	];};
if ((getPlayerUID player) in ModList) then { // Admin Level 3
	epochmenustart =
	[
	["",true],
		["-- Epoch Admin Tools (Level: Mod) --", [],  "", -5, [["expression", ""]], "1", "0"],
		["Mod Menu >>", [], "#USER:ModMenu", -5, [["expression", ""]], "1", "1"],
		["Temporary Vehicle Menu >>", [], "#USER:VehicleTempMenu", -5, [["expression", ""]], "1", "1"],		
		["Skin Change Menu >>", [], "#USER:AdminSkinsMenu", -5, [["expression", ""]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
			["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]		
	];};			
// };
AdminMenu =
[
["",true],
	["Spectate player", [],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],	
	["Teleport", [],  "", -5, [["expression", format[_EXECscript1,"malteleport.sqf"]]], "1", "1"],
	["Teleport To Me", [], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],		
	["Toggle God Mode", [],  "", -5, [["expression", format[_EXECscript1,"malplayerGM.sqf"]]], "1", "1"],
	["Zombie Shield",[],"",-5,[["expression",format[_EXECscript1,"zombieshield.sqf"]]],"1","1"],
	["Toggle Flying", [],  "", -5, [["expression", format[_EXECscript1,"malfly.sqf"]]], "1", "1"],		
	["Point to Repair (Temp)", [],  "", -5, [["expression", format[_EXECscript1,"malpointrepair.sqf"]]], "1", "1"],
	["Point to Delete (Perm)",[],"",-5,[["expression",format[_EXECscript1,"DatabaseRemove.sqf"]]],"1","1"],
	["Heal (25m)", [],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],	
	["Invisibility", [],  "", -5, [["expression", format[_EXECscript1,"malinvisinit.sqf"]]], "1", "1"],			
	["Infinite Ammo", [],  "", -5, [["expression", format[_EXECscript1,"malinfammo.sqf"]]], "1", "1"],			
	["Toggle Grass Off", [],  "", -5, [["expression", format[_EXECscript1,"malgrassoff.sqf"]]], "1", "1"],	
	["Toggle Grass On", [],  "", -5, [["expression", format[_EXECscript1,"malgrasson.sqf"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
ModMenu =
[
["",true],
	["Spectate player", [],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],	
	["Teleport", [],  "", -5, [["expression", format[_EXECscript1,"malteleport.sqf"]]], "1", "1"],
	["Teleport To Me", [], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],		
	["Toggle God Mode", [],  "", -5, [["expression", format[_EXECscript1,"malplayerGM.sqf"]]], "1", "1"],
	["Point to Repair (Temp)", [],  "", -5, [["expression", format[_EXECscript1,"malpointrepair.sqf"]]], "1", "1"],
	["Point to Delete (Perm)",[],"",-5,[["expression",format[_EXECscript1,"DatabaseRemove.sqf"]]],"1","1"],
	["Heal (25m)", [],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
	["Invisibility", [],  "", -5, [["expression", format[_EXECscript1,"malinvisinit.sqf"]]], "1", "1"],			
	["Infinite Ammo", [],  "", -5, [["expression", format[_EXECscript1,"malinfammo.sqf"]]], "1", "1"],			
	["Toggle Grass Off", [],  "", -5, [["expression", format[_EXECscript1,"malgrassoff.sqf"]]], "1", "1"],	
	["Toggle Grass On", [],  "", -5, [["expression", format[_EXECscript1,"malgrasson.sqf"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
VehicleMenu =
[
["",true],	
	["Graphical Vehicle Menu", [],  "", -5, [["expression", format[_EXECscript1,"addvehicleDialog.sqf"]]], "1", "1"],	
	["Temporary Vehicle Menu >>", [], "#USER:VehicleTempMenu", -5, [["expression", ""]], "1", "1"],		
	["Locked Vehicle Menu >>", [], "#USER:VehiclekeyMenu", -5, [["expression", ""]], "1", "1"],		
	["Vehicle Tools >>", [], "#USER:VehicleTools", -5, [["expression", ""]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
VehicleTools =
[
["",true],	
	["Speedboost", [],  "", -5, [["expression", format[_EXECscript1,"speedboost.sqf"]]], "1", "1"],		
	["Toggle Vehicle God Mode",[],  "", -5, [["expression", format[_EXECscript1,"malvehicleGMon.sqf"]]], "1", "1"],		
	["Point to Repair (Temp)", [],  "", -5, [["expression", format[_EXECscript1,"malpointrepair.sqf"]]], "1", "1"],
	["Point to only Refuel (Temp)", [],  "", -5, [["expression", format[_EXECscript1,"malpointonlyrefuel.sqf"]]], "1", "1"],		
	["Point to Delete (Temp)", [],  "", -5, [["expression", format[_EXECscript1,"malpointdelete.sqf"]]], "1", "1"],		
	["Point to Delete (Perm)",[],"",-5,[["expression",format[_EXECscript1,"DatabaseRemove.sqf"]]],"1","1"],
	["Flip Vehicle", [],  "", -5, [["expression", format[_EXECscript1,"flipvehicle.sqf"]]], "1", "1"],		
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
VehiclekeyMenu =
[
["",true],
	["Neutral Trader Menu", [],  "", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenuneutral.sqf"]]], "1", "1"],
	["Friendly Trader Menu", [],  "", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenufriendly.sqf"]]], "1", "1"],		
	["Hero Trader Menu", [],  "", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenuhero.sqf"]]], "1", "1"],
	["Bandit Trader Menu", [],  "", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenubandit.sqf"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
EspMenu = 
[
["",true],
	["Modify ESP options in EnhancedESP.sqf",[],"",-5,[["expression",""]],"1","0"],
	["Enhanced ESP", [],  "", -5, [["expression", format[_EXECscript1,"EnhancedESP.sqf"]]], "1", "1"],
	["Player ESP Only", [],  "", -5, [["expression", format[_EXECscript1,"mallightesp.sqf"]]], "1", "1"],		
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
AdminSkinsMenu =
[
["",true],
	["Survivor", [],  "", -5, [["expression", format[_EXECscript2,"Survivor.sqf"]]], "1", "1"],	
	["Hero", [],  "", -5, [["expression", format[_EXECscript2,"Hero.sqf"]]], "1", "1"],	
	["Bandit", [],  "", -5, [["expression", format[_EXECscript2,"Bandit.sqf"]]], "1", "1"],
	["Soldier", [],  "", -5, [["expression", format[_EXECscript2,"Soldier.sqf"]]], "1", "1"],		
	["Ghillie", [],  "", -5, [["expression", format[_EXECscript2,"Ghillie.sqf"]]], "1", "1"],
	["Special Forces", [],  "", -5, [["expression", format[_EXECscript2,"Specialforces.sqf"]]], "1", "1"],
	["Pilot", [],  "", -5, [["expression", format[_EXECscript2,"Pilot.sqf"]]], "1", "1"],			
	["Invisible", [],  "", -5, [["expression", format[_EXECscript2,"invisible.sqf"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Next page", [], "#USER:AdminSkinsMenu2", -5, [["expression", ""]], "1", "1"],		
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
AdminSkinsMenu2 =
[
["",true],
	["Camo", [],  "", -5, [["expression", format[_EXECscript2,"Camo.sqf"]]], "1", "1"],		
	["Bodyguard", [],  "", -5, [["expression", format[_EXECscript2,"Bodyguard.sqf"]]], "1", "1"],
	["Officer", [],  "", -5, [["expression", format[_EXECscript2,"Officer.sqf"]]], "1", "1"],	
	["Alejandria", [],  "", -5, [["expression", format[_EXECscript2,"Alejandria.sqf"]]], "1", "1"],
	["Savannah", [],  "", -5, [["expression", format[_EXECscript2,"Savannah.sqf"]]], "1", "1"],	
	["Melly", [],  "", -5, [["expression", format[_EXECscript2,"Melly.sqf"]]], "1", "1"],
	["Bandit Jane", [],  "", -5, [["expression", format[_EXECscript2,"BanditJane.sqf"]]], "1", "1"],		
	["Invisible", [],  "", -5, [["expression", format[_EXECscript2,"invisible.sqf"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
WeaponMenu =
[
["",true],
	["Delete all gear", [],  "", -5, [["expression", format[_EXECscript3,"cleanme.sqf"]]], "1", "1"],	
	["M4 Holo", [],  "", -5, [["expression", format[_EXECscript3,"itemz.sqf"]]], "1", "1"],
	["M4 CCO SD", [],  "", -5, [["expression", format[_EXECscript3,"itemz2.sqf"]]], "1", "1"],
	["AS50", [],  "", -5, [["expression", format[_EXECscript3,"itemz3.sqf"]]], "1", "1"],
	["FN FAL", [],  "", -5, [["expression", format[_EXECscript3,"itemz4.sqf"]]], "1", "1"],
	["M16 ACOG", [],  "", -5, [["expression", format[_EXECscript3,"itemz5.sqf"]]], "1", "1"],
	["Pecheneg 50 cal", [],  "", -5, [["expression", format[_EXECscript3,"itemz6.sqf"]]], "1", "1"],
	["Mk 48", [],  "", -5, [["expression", format[_EXECscript3,"item7.sqf"]]], "1", "1"],
	["Gold AK", [],  "", -5, [["expression", format[_EXECscript3,"item8.sqf"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Next page", [], "#USER:WeaponMenu2", -5, [["expression", ""]], "1", "1"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
WeaponMenu2 =
[
["",true],
	["Aks Kobra", [],  "", -5, [["expression", format[_EXECscript3,"item9.sqf"]]], "1", "1"],
	[".338 LAPUA", [],  "", -5, [["expression", format[_EXECscript3,"item10.sqf"]]], "1", "1"],
	["DMR", [],  "", -5, [["expression", format[_EXECscript3,"item11.sqf"]]], "1", "1"],
	["M4A1 HWS GL SD Camo", [],  "", -5, [["expression", format[_EXECscript3,"item12.sqf"]]], "1", "1"],
	["M14 Aim", [],  "", -5, [["expression", format[_EXECscript3,"item13.sqf"]]], "1", "1"],
	["Alice", [],  "", -5, [["expression", format[_EXECscript3,"bp2.sqf"]]], "1", "1"],
	["Coyote", [],  "", -5, [["expression", format[_EXECscript3,"bp1.sqf"]]], "1", "1"],
	["No Weapons", [],  "", -5, [["expression", format[_EXECscript3,"items.sqf"]]], "1", "1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
CrateMenu=[
	["",true],
	["Admin Crate",[],"",-5,[["expression",format[_EXECscript6,"admin.sqf"]]],"1","1"],
	["VIP Crate",[],"",-5,[["expression",format[_EXECscript6,"vipbox.sqf"]]],"1","1"],
	["Bambi Crate",[],"",-5,[["expression",format[_EXECscript6,"bambi.sqf"]]],"1","1"],
	["ALL Weapons/Items Crate (LAG)",[],"",-5,[["expression",format[_EXECscript6,"allweapons.sqf"]]],"1","1"],
	["Building Crate",[],"",-5,[["expression",format[_EXECscript6,"building.sqf"]]],"1","1"],
	["Food/Water Crate",[],"",-5,[["expression",format[_EXECscript6,"food.sqf"]]],"1","1"],
	["Medical Crate",[],"",-5,[["expression",format[_EXECscript6,"medical.sqf"]]],"1","1"],
	["Money Crate",[],"",-5,[["expression",format[_EXECscript6,"moneybox.sqf"]]],"1","1"],
	["Repair Crate",[],"",-5,[["expression",format[_EXECscript6,"repair.sqf"]]],"1","1"],
	["Skins Crate",[],"",-5,[["expression",format[_EXECscript6,"skins.sqf"]]],"1","1"],
	["Tools Crate",[],"",-5,[["expression",format[_EXECscript6,"tools.sqf"]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
EpochMenu=[
	["",true],
	["Base Destruction Menu >>", [], "#USER:BaseDestructionMenu", -5, [["expression", ""]], "1", "1"],			
	["Point to display code",[],"",-5,[["expression",format[_EXECscript1,"gimmecode.sqf"]]],"1","1"],
	["Point to make new key",[],"",-5,[["expression",format[_EXECscript1,"givekey.sqf"]]],"1","1"],
	["Point to lock vehicle",[],"",-5,[["expression",format[_EXECscript1,"vehicle_lock.sqf"]]],"1","1"],
	["Point to unlock vehicle",[],"",-5,[["expression",format[_EXECscript1,"vehicle_unlock.sqf"]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
BaseDestructionMenu=
[
["BaseDestruction",true],
	["SetCenter",[],"",-5,[["expression",'["center"] execVM "admintools\tools\deletebase.sqf"']],"1","1"],
	["SetRadius",[],"",-5,[["expression",'["radius"] execVM "admintools\tools\deletebase.sqf"']],"1","1"],
	["ShowDome",[],"",-5,[["expression",'["dome"] execVM "admintools\tools\deletebase.sqf"']],"1","1"],
	[format["IncludeVehicles(%1)",BD_vehicles],[],"",-5,[["expression","BD_vehicles=!BD_vehicles;"]],"1","1"],
	["DESTROY ALL Inside Dome",[],"",-5,[["expression",'["destroy"] execVM "admintools\tools\deletebase.sqf"']],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
VehicleTempMenu=
[
["",true],
	["Spawn Temporary Vehicle -- AIR",[],"",-5,[["expression",""]],"1","0"],
	["A-10",[],"",-5,[["expression",'["A10"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["MH-6J Little Bird",[],"",-5,[["expression",'["MH6J_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["CH-47F Chinook",[],"",-5,[["expression",'["CH_47F_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["UH-60M Black Hawk",[],"",-5,[["expression",'["UH60M_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["MV-22 Osprey",[],"",-5,[["expression",'["MV22"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["C-130J Super Hercules",[],"",-5,[["expression",'["C130J"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["",[],"",-5,[["expression",""]],"1","0"],
		["Next page",[],"#USER:VehicleTempMenu2",-5,[["expression",""]],"1","1"],
			["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
VehicleTempMenu2 =
[
["",true],
	["Spawn Temporary Vehicle -- WHEELED",[],"",-5,[["expression",""]],"1","0"],
	["MTVR (Ammo)",[],"",-5,[["expression",'["MTVR_Reammo_DES_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["MTVR (Repair)",[],"",-5,[["expression",'["MTVR_Repair_DES_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["MTVR (Fuel)",[],"",-5,[["expression",'["MTVR_Refuel_DES_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Ural Truck",[],"",-5,[["expression",'["Ural_TK_CIV_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Ikarus Bus",[],"",-5,[["expression",'["Ikarus_TK_CIV_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["HMMWV (Ambulance)",[],"",-5,[["expression",'["HMMWV_Ambulance"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Military Offroad Special",[],"",-5,[["expression",'["LandRover_Special_CZ_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Mountain Bike",[],"",-5,[["expression",'["MMT_USMC"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Motorcycle",[],"",-5,[["expression",'["M1030"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["ATV",[],"",-5,[["expression",'["ATV_US_EP1"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["Towing Tractor",[],"",-5,[["expression",'["TowingTractor"] execVM "admintools\tools\addtempvehicle.sqf"']],"1","1"],
	["", [], "", -5, [["expression", ""]], "1", "0"],
		["Next page", [], "#USER:VehicleTempMenu3", -5, [["expression", ""]], "1", "1"],
			["Main Menu", [20], "#USER:epochmenustart", -5, [["expression", ""]], "1", "1"]
];
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
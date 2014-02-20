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
			["-- Epoch Admin Tools (Level: Admin) --", [],  "", -5, [["expression", format[_EXECscript1,"null.sqf"]]], "1", "0"],
			["Admin Menu >>", [2], "#USER:AdminMenu", -5, [["expression", ""]], "1", "1"],
			["ESP Menu >>", [3],  "#USER:EspMenu", -5, [["expression", ""]], "1", "1"],			
			["Skin Change Menu >>", [4], "#USER:AdminSkinsMenu", -5, [["expression", ""]], "1", "1"],
			["Weapon Kits >>", [5], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"],
			["Crate Menu >>",[6],"#USER:CrateMenu",-5,[["expression",""]],"1","1"],
			["Temporary Vehicle Menu >>", [7], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],		
			["Locked Vehicle Menu >>", [8], "#USER:VehiclekeyMenu", -5, [["expression", ""]], "1", "1"],		
			["Vehicle Tools >>", [9], "#USER:VehicleTools", -5, [["expression", ""]], "1", "1"],
			["Epoch Menu >>", [10], "#USER:EpochMenu", -5, [["expression", ""]], "1", "1"],			
			["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Exit", [20], "", -3, [["expression", ""]], "1", "1"]		
	];};
if ((getPlayerUID player) in ModList) then { // Admin Level 3
	epochmenustart =
	[
		["",true],
			["-- Epoch Admin Tools (Level: Mod) --", [],  "", -5, [["expression", format[_EXECscript1,"null.sqf"]]], "1", "0"],
			["Mod Menu >>", [2], "#USER:ModMenu", -5, [["expression", ""]], "1", "1"],
			["Temporary Vehicle Menu >>", [3], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],		
			["Skin Change Menu >>", [4], "#USER:AdminSkinsMenu", -5, [["expression", ""]], "1", "1"],
			["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Exit", [20], "", -3, [["expression", ""]], "1", "1"]		
	];};			
// };
AdminMenu =
[
	["",true],
		["Spectate player", [2],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],	
		["Teleport", [3],  "", -5, [["expression", format[_EXECscript1,"malteleport.sqf"]]], "1", "1"],
		["Teleport To Me", [4], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],		
		["Toggle God Mode", [5],  "", -5, [["expression", format[_EXECscript1,"malplayerGM.sqf"]]], "1", "1"],
		["Zombie Shield",[6],"",-5,[["expression",format[_EXECscript1,"zombieshield.sqf"]]],"1","1"],
		["Toggle Flying", [7],  "", -5, [["expression", format[_EXECscript1,"malfly.sqf"]]], "1", "1"],		
		["Point to Repair (Temp)", [8],  "", -5, [["expression", format[_EXECscript1,"malpointrepair.sqf"]]], "1", "1"],
		["Point to Delete (Perm)",[9],"",-5,[["expression",format[_EXECscript1,"DatabaseRemove.sqf"]]],"1","1"],
		// ["Point to Delete", [8],  "", -5, [["expression", format[_EXECscript1,"malpointdelete.sqf"]]], "1", "1"],
		["Heal (25m)", [10],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],	
		["Invisibility", [11],  "", -5, [["expression", format[_EXECscript1,"malinvisinit.sqf"]]], "1", "1"],			
		["Infinite Ammo", [12],  "", -5, [["expression", format[_EXECscript1,"malinfammo.sqf"]]], "1", "1"],			
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [16], "#USER:AdminMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
AdminMenu2 =
[
	["",true],
		// ["Spawn Building Crate", [4],  "", -5, [["expression", format[_EXECscript1,"maladminbuilding.sqf"]]], "1", "1"],		
		// ["Spawn Weapon Crate", [5], "", -5, [["expression", format[_EXECscript1,"maladminweapons.sqf"]]], "1", "1"],
		// ["Spawn Consumable Crate", [6],  "", -5, [["expression", format[_EXECscript1,"maladminconsu.sqf"]]], "1", "1"],
		["Toggle Grass Off", [2],  "", -5, [["expression", format[_EXECscript1,"malgrassoff.sqf"]]], "1", "1"],	
		["Toggle Grass On", [3],  "", -5, [["expression", format[_EXECscript1,"malgrasson.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
VehicleTools =
[
	["",true],	
		["Speedboost", [2],  "", -5, [["expression", format[_EXECscript1,"speedboost.sqf"]]], "1", "1"],		
		["Turn on Vehicle God Mode",[3],  "", -5, [["expression", format[_EXECscript1,"malvehicleGMon.sqf"]]], "1", "1"],
		["Turn off Vehicle God Mode",[4],  "", -5, [["expression", format[_EXECscript1,"malvehicleGMoff.sqf"]]], "1", "1"],		
		["Point to Repair (Temp)", [5],  "", -5, [["expression", format[_EXECscript1,"malpointrepair.sqf"]]], "1", "1"],
		["Point to only Refuel (Temp)", [6],  "", -5, [["expression", format[_EXECscript1,"malpointonlyrefuel.sqf"]]], "1", "1"],		
		["Point to Delete (Temp)", [7],  "", -5, [["expression", format[_EXECscript1,"malpointdelete.sqf"]]], "1", "1"],		
		["Flip Vehicle", [8],  "", -5, [["expression", format[_EXECscript1,"flipvehicle.sqf"]]], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
VehiclekeyMenu =
[
	["",true],
		["Neutral Trader Menu", [2],  "", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenuneutral.sqf"]]], "1", "1"],
		["Friendly Trader Menu", [3],  "", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenufriendly.sqf"]]], "1", "1"],		
		["Hero Trader Menu", [4],  "", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenuhero.sqf"]]], "1", "1"],
		["Bandit Trader Menu", [5],  "", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenubandit.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
EspMenu = 
[
["",true],
		["Enhanced ESP", [2],  "", -5, [["expression", format[_EXECscript1,"EnhancedESP.sqf"]]], "1", "1"],
		["Player ESP Only", [3],  "", -5, [["expression", format[_EXECscript1,"mallightesp.sqf"]]], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],		
			["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
ModMenu =
[
	["",true],
		["Teleport", [2],  "", -5, [["expression", format[_EXECscript1,"malteleport.sqf"]]], "1", "1"],
		["Teleport To Me", [3], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],		
		["Toggle God Mode", [4],  "", -5, [["expression", format[_EXECscript1,"malplayerGM.sqf"]]], "1", "1"],
		["Toggle Flying", [5],  "", -5, [["expression", format[_EXECscript1,"malfly.sqf"]]], "1", "1"],		
		["Point to Repair", [6],  "", -5, [["expression", format[_EXECscript1,"malpointrepair.sqf"]]], "1", "1"],
		["Point to Delete", [7],  "", -5, [["expression", format[_EXECscript1,"malpointdelete.sqf"]]], "1", "1"],
		["Heal (25m)", [8],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
		["Invisibility", [9],  "", -5, [["expression", format[_EXECscript1,"malinvisinit.sqf"]]], "1", "1"],			
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ModMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
ModMenu2 =
[
	["",true],
		["Spawn Building Crate", [4],  "", -5, [["expression", format[_EXECscript1,"maladminbuilding.sqf"]]], "1", "1"],		
		["Spawn Weapon Crate", [5], "", -5, [["expression", format[_EXECscript1,"maladminweapons.sqf"]]], "1", "1"],
		["Spawn Consumable Crate", [6],  "", -5, [["expression", format[_EXECscript1,"maladminconsu.sqf"]]], "1", "1"],
		["ESP Menu >>", [7],  "#USER:EspMenu", -5, [["expression", ""]], "1", "1"],	
		["Toggle Grass Off", [8],  "", -5, [["expression", format[_EXECscript1,"malgrassoff.sqf"]]], "1", "1"],	
		["Toggle Grass On", [9],  "", -5, [["expression", format[_EXECscript1,"malgrasson.sqf"]]], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
AdminSkinsMenu =
[
	["",true],
		["Survivor", [2],  "", -5, [["expression", format[_EXECscript2,"Survivor.sqf"]]], "1", "1"],	
		["Hero", [3],  "", -5, [["expression", format[_EXECscript2,"Hero.sqf"]]], "1", "1"],	
		["Bandit", [4],  "", -5, [["expression", format[_EXECscript2,"Bandit.sqf"]]], "1", "1"],
		["Soldier", [5],  "", -5, [["expression", format[_EXECscript2,"Soldier.sqf"]]], "1", "1"],		
		["Ghillie", [6],  "", -5, [["expression", format[_EXECscript2,"Ghillie.sqf"]]], "1", "1"],
		["Special Forces", [7],  "", -5, [["expression", format[_EXECscript2,"Specialforces.sqf"]]], "1", "1"],
		["Pilot", [8],  "", -5, [["expression", format[_EXECscript2,"Pilot.sqf"]]], "1", "1"],			
		["Invisible", [9],  "", -5, [["expression", format[_EXECscript2,"invisible.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:AdminSkinsMenu2", -5, [["expression", ""]], "1", "1"],		
			["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
AdminSkinsMenu2 =
[
	["",true],
		["Camo", [2],  "", -5, [["expression", format[_EXECscript2,"Camo.sqf"]]], "1", "1"],		
		["Bodyguard", [3],  "", -5, [["expression", format[_EXECscript2,"Bodyguard.sqf"]]], "1", "1"],
		["Officer", [4],  "", -5, [["expression", format[_EXECscript2,"Officer.sqf"]]], "1", "1"],	
		["Alejandria", [5],  "", -5, [["expression", format[_EXECscript2,"Alejandria.sqf"]]], "1", "1"],
		["Savannah", [6],  "", -5, [["expression", format[_EXECscript2,"Savannah.sqf"]]], "1", "1"],	
		["Melly", [7],  "", -5, [["expression", format[_EXECscript2,"Melly.sqf"]]], "1", "1"],
		["Bandit Jane", [8],  "", -5, [["expression", format[_EXECscript2,"BanditJane.sqf"]]], "1", "1"],		
		["Invisible", [9],  "", -5, [["expression", format[_EXECscript2,"invisible.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
WeaponMenu =
[
	["",true],
		["Delete all gear", [2],  "", -5, [["expression", format[_EXECscript3,"cleanme.sqf"]]], "1", "1"],	
		["M4 Holo", [3],  "", -5, [["expression", format[_EXECscript3,"itemz.sqf"]]], "1", "1"],
		["M4 CCO SD", [4],  "", -5, [["expression", format[_EXECscript3,"itemz2.sqf"]]], "1", "1"],
		["AS50", [5],  "", -5, [["expression", format[_EXECscript3,"itemz3.sqf"]]], "1", "1"],
		["FN FAL", [6],  "", -5, [["expression", format[_EXECscript3,"itemz4.sqf"]]], "1", "1"],
		["M16 ACOG", [7],  "", -5, [["expression", format[_EXECscript3,"itemz5.sqf"]]], "1", "1"],
		["Pecheneg 50 cal", [8],  "", -5, [["expression", format[_EXECscript3,"itemz6.sqf"]]], "1", "1"],
		["Mk 48", [9],  "", -5, [["expression", format[_EXECscript3,"item7.sqf"]]], "1", "1"],
		["Gold AK", [10],  "", -5, [["expression", format[_EXECscript3,"item8.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:WeaponMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
WeaponMenu2 =
[
	["",true],
		["Aks Kobra", [2],  "", -5, [["expression", format[_EXECscript3,"item9.sqf"]]], "1", "1"],
		[".338 LAPUA", [3],  "", -5, [["expression", format[_EXECscript3,"item10.sqf"]]], "1", "1"],
		["DMR", [4],  "", -5, [["expression", format[_EXECscript3,"item11.sqf"]]], "1", "1"],
		["M4A1 HWS GL SD Camo", [5],  "", -5, [["expression", format[_EXECscript3,"item12.sqf"]]], "1", "1"],
		["M14 Aim", [6],  "", -5, [["expression", format[_EXECscript3,"item13.sqf"]]], "1", "1"],
		["Alice", [7],  "", -5, [["expression", format[_EXECscript3,"bp2.sqf"]]], "1", "1"],
		["Coyote", [8],  "", -5, [["expression", format[_EXECscript3,"bp1.sqf"]]], "1", "1"],
		["No Weapons", [9],  "", -5, [["expression", format[_EXECscript3,"items.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			// ["Next page", [12], "#USER:WeaponMenu3", -5, [["expression", ""]], "1", "1"],
			["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
WeaponMenu3 =
[
	["",true],
			//["", [2],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [3],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [4],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [5],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [6],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [7],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [8],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [9],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
CrateMenu=[
	["",true],
	["Admin Crate",[2],"",-5,[["expression",format[_EXECscript6,"admin.sqf"]]],"1","1"],
	["VIP Crate",[3],"",-5,[["expression",format[_EXECscript6,"vipbox.sqf"]]],"1","1"],
	["Bambi Crate",[4],"",-5,[["expression",format[_EXECscript6,"bambi.sqf"]]],"1","1"],
	["ALL Weapons/Items Crate (LAG)",[5],"",-5,[["expression",format[_EXECscript6,"allweapons.sqf"]]],"1","1"],
	["Building Crate",[6],"",-5,[["expression",format[_EXECscript6,"building.sqf"]]],"1","1"],
	["Food/Water Crate",[7],"",-5,[["expression",format[_EXECscript6,"food.sqf"]]],"1","1"],
	["Medical Crate",[8],"",-5,[["expression",format[_EXECscript6,"medical.sqf"]]],"1","1"],
	["Money Crate",[9],"",-5,[["expression",format[_EXECscript6,"moneybox.sqf"]]],"1","1"],
	["Repair Crate",[10],"",-5,[["expression",format[_EXECscript6,"repair.sqf"]]],"1","1"],
	["Skins Crate",[11],"",-5,[["expression",format[_EXECscript6,"skins.sqf"]]],"1","1"],
	["Tools Crate",[12],"",-5,[["expression",format[_EXECscript6,"tools.sqf"]]],"1","1"],
		["Exit",[20],"",-3,[["expression",""]],"1","1"]
];
EpochMenu=[
	["",true],
	["Base Destruction Menu >>", [2], "#USER:BaseDestructionMenu", -5, [["expression", ""]], "1", "1"],			
	["Point to display code",[3],"",-5,[["expression",format[_EXECscript1,"gimmecode.sqf"]]],"1","1"],
	["Point to make new key",[4],"",-5,[["expression",format[_EXECscript1,"givekey.sqf"]]],"1","1"],
		["Exit",[20],"",-3,[["expression",""]],"1","1"]
];
BaseDestructionMenu=
[
["BaseDestruction",true],
	["SetCenter",[2],"",-5,[["expression",'["center"] execVM "admintools\tools\deletebase.sqf"']],"1","1"],
	["SetRadius",[3],"",-5,[["expression",'["radius"] execVM "admintools\tools\deletebase.sqf"']],"1","1"],
	["ShowDome",[4],"",-5,[["expression",'["dome"] execVM "admintools\tools\deletebase.sqf"']],"1","1"],
	[format["IncludeVehicles(%1)",BD_vehicles],[5],"",-5,[["expression","BD_vehicles=!BD_vehicles;"]],"1","1"],
	["DESTROYALLINSIDEDOME",[6],"",-5,[["expression",'["destroy"] execVM "admintools\tools\deletebase.sqf"']],"1","1"],
	["",[-1],"",-5,[["expression",""]],"1","0"],
		["Exit",[20],"",-3,[["expression",""]],"1","1"]
];
VehicleMenu = 
[
	["",true],
		["A10", [2],  "", -5, [["expression", format[_EXECscript5,"A10.sqf"]]], "1", "1"],
		["Little Bird", [3],  "", -5, [["expression", format[_EXECscript5,"AH64.sqf"]]], "1", "1"],
		["an2", [4],  "", -5, [["expression", format[_EXECscript5,"an2_prop.sqf"]]], "1", "1"],
		["Apache", [5],  "", -5, [["expression", format[_EXECscript5,"APACHE.sqf"]]], "1", "1"],
		["MTVR fors", [6],  "", -5, [["expression", format[_EXECscript5,"MTVRf.sqf"]]], "1", "1"],
		["MTVR des", [7],  "", -5, [["expression", format[_EXECscript5,"MTVR.sqf"]]], "1", "1"],
		["ATV", [8],  "", -5, [["expression", format[_EXECscript5,"ATV.sqf"]]], "1", "1"],
		["Bike", [9],  "", -5, [["expression", format[_EXECscript5,"Bike.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu2", -5, [["expression", ""]], "1", "1"],
				["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu2 =
[
["",true],
		["Bus", [2],  "", -5, [["expression", format[_EXECscript5,"bus.sqf"]]], "1", "1"],
		["C130", [3],  "", -5, [["expression", format[_EXECscript5,"C130.sqf"]]], "1", "1"],
		["Chinook", [4],  "", -5, [["expression", format[_EXECscript5,"chinook.sqf"]]], "1", "1"],
		["F35", [5],  "", -5, [["expression", format[_EXECscript5,"F35.sqf"]]], "1", "1"],
		["Boat 1", [6],  "", -5, [["expression", format[_EXECscript5,"FISH.sqf"]]], "1", "1"],
		["Boat 2", [7],  "", -5, [["expression", format[_EXECscript5,"FISH2.sqf"]]], "1", "1"],
		["Boat 3", [8],  "", -5, [["expression", format[_EXECscript5,"FISH3.sqf"]]], "1", "1"],
		["Gaz", [9],  "", -5, [["expression", format[_EXECscript5,"Gaz.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu3", -5, [["expression", ""]], "1", "1"],
				["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu3 =
[
["",true],
		["Hatchback", [2],  "", -5, [["expression", format[_EXECscript5,"Hatchback.sqf"]]], "1", "1"],
		["HMMV fors", [3],  "", -5, [["expression", format[_EXECscript5,"HMMV.sqf"]]], "1", "1"],
		["HMMV des", [4],  "", -5, [["expression", format[_EXECscript5,"HMMV_Fallu.sqf"]]], "1", "1"],
		["KA60 Namal", [5],  "", -5, [["expression", format[_EXECscript5,"KA60_namalsk.sqf"]]], "1", "1"],
		["Red Lada", [6],  "", -5, [["expression", format[_EXECscript5,"ladared.sqf"]]], "1", "1"],
		["White Lada", [7],  "", -5, [["expression", format[_EXECscript5,"Ladawhite.sqf"]]], "1", "1"],
		["Little Bird", [8],  "", -5, [["expression", format[_EXECscript5,"littleBird.sqf"]]], "1", "1"],
		["MI17", [9],  "", -5, [["expression", format[_EXECscript5,"MI17civ.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu4", -5, [["expression", ""]], "1", "1"],
				["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu4 =
[
["",true],
		["MI24", [2],  "", -5, [["expression", format[_EXECscript5,"MI24.sqf"]]], "1", "1"],
		["Mill Offroad", [3],  "", -5, [["expression", format[_EXECscript5,"militrayOffroad.sqf"]]], "1", "1"],
		["UH60", [4],  "", -5, [["expression", format[_EXECscript5,"UH60.sqf"]]], "1", "1"],
		["VW Golf", [5],  "", -5, [["expression", format[_EXECscript5,"miniHB.sqf"]]], "1", "1"],
		["Moto", [6],  "", -5, [["expression", format[_EXECscript5,"Moto.sqf"]]], "1", "1"],
		["Moto 2", [7],  "", -5, [["expression", format[_EXECscript5,"Moto2.sqf"]]], "1", "1"],
		["Moto 3", [8],  "", -5, [["expression", format[_EXECscript5,"Moto3.sqf"]]], "1", "1"],
		["Moto 4", [9],  "", -5, [["expression", format[_EXECscript5,"Moto4.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu5", -5, [["expression", ""]], "1", "1"],
				["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu5 =
[
["",true],
		["MV22", [2],  "", -5, [["expression", format[_EXECscript5,"MV22.sqf"]]], "1", "1"],
		["Offroad", [3],  "", -5, [["expression", format[_EXECscript5,"Offroad.sqf"]]], "1", "1"],
		["Offroad 2", [4],  "", -5, [["expression", format[_EXECscript5,"OFFROAD_d.sqf"]]], "1", "1"],
		["Offroad 3", [5],  "", -5, [["expression", format[_EXECscript5,"OFFROAD_w"]]], "1", "1"],
		["Red Offroad", [6],  "", -5, [["expression", format[_EXECscript5,"offroadRed.sqf"]]], "1", "1"],
		["Offroad Saffari", [7],  "", -5, [["expression", format[_EXECscript5,"offroadSaffari.sqf"]]], "1", "1"],
		["Offroad Tan", [8],  "", -5, [["expression", format[_EXECscript5,"offroadTan.sqf"]]], "1", "1"],
		["PBX", [9],  "", -5, [["expression", format[_EXECscript5,"PBX.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu6", -5, [["expression", ""]], "1", "1"],
				["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu6 =
[
["",true],
		["Sedan", [2],  "", -5, [["expression", format[_EXECscript5,"sedan.sqf"]]], "1", "1"],
		["SUV", [3],  "", -5, [["expression", format[_EXECscript5,"SUV.sqf"]]], "1", "1"],
		["MH6J", [4],  "", -5, [["expression", format[_EXECscript5,"MH6J.sqf"]]], "1", "1"],
		["Tank", [5],  "", -5, [["expression", format[_EXECscript5,"tank.sqf"]]], "1", "1"],
		["Tank Fallu", [6],  "", -5, [["expression", format[_EXECscript5,"TANKfall.sqf"]]], "1", "1"],
		["Tank Namal", [7],  "", -5, [["expression", format[_EXECscript5,"TANKnam.sqf"]]], "1", "1"],
		["Taxi", [8],  "", -5, [["expression", format[_EXECscript5,"taxi.sqf"]]], "1", "1"],
		["Tour Car", [9],  "", -5, [["expression", format[_EXECscript5,"tourcar.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu7", -5, [["expression", ""]], "1", "1"],
				["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu7 =
[
["",true],
		["SU25", [2],  "", -5, [["expression", format[_EXECscript5,"SU25.sqf"]]], "1", "1"],
		["Tractor 2", [3],  "", -5, [["expression", format[_EXECscript5,"Tractor.sqf"]]], "1", "1"],
		["Pickup Tubeframe", [4],  "", -5, [["expression", format[_EXECscript5,"tubeframe.sqf"]]], "1", "1"],
		["UAZ", [5],  "", -5, [["expression", format[_EXECscript5,"UAZ.sqf"]]], "1", "1"],
		["L39", [6],  "", -5, [["expression", format[_EXECscript5,"L39.sqf"]]], "1", "1"],
		["UH1H camo", [7],  "", -5, [["expression", format[_EXECscript5,"UH1H_TK.sqf"]]], "1", "1"],
		["UH1", [8],  "", -5, [["expression", format[_EXECscript5,"UH1.sqf"]]], "1", "1"],
		["Ural", [9],  "", -5, [["expression", format[_EXECscript5,"Ural.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu8", -5, [["expression", ""]], "1", "1"],
				["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu8 =
[
["",true],	
		["V3S", [2],  "", -5, [["expression", format[_EXECscript5,"V3S.sqf"]]], "1", "1"],
		["Van 2", [3],  "", -5, [["expression", format[_EXECscript5,"Van.sqf"]]], "1", "1"],
		["F35", [4],  "", -5, [["expression", format[_EXECscript5,"F35.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Exit", [20], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:epochmenustart";
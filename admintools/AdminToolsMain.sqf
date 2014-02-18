_pathtotools = "admintools\tools\";
_pathtoskins = "admintools\skins\";
_pathtoweapon = "admintools\weaponkits\";
_pathtoshields = "admintools\shields\";
_pathtovehicles = "admintools\vehicles\";
_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';
_EXECscript2 = 'player execVM "'+_pathtoskins+'%1"';
_EXECscript3 = 'player execVM "'+_pathtoweapon+'%1"';
_EXECscript4 = 'player execVM "'+_pathtoshields+'%1"';
_EXECscript5 = 'player execVM "'+_pathtovehicles+'%1"';
if ((getPlayerUID player) in AllAdminList) then { // All Admins
	if ((getPlayerUID player) in SuperAdminList) then { // Super Admins
		adminmenu =
		[
			["",true],
				["--Malory's Admin Menu--", [],  "", -5, [["expression", format[_EXECscript1,"null.sqf"]]], "1", "1"],
				["Super Admin Menu", [2], "#USER:SuperAdminMenu", -5, [["expression", ""]], "1", "1"],
				["Skin Change Menu", [3], "#USER:AdminSkinsMenu", -5, [["expression", ""]], "1", "1"],
				["Weapon Kits", [4], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"],
				["Temporary Vehicle Menu", [5], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],		
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
		];};
	if ((getPlayerUID player) in AdminList3) then { // Admin Level 3
		adminmenu =
		[
			["",true],
				["--Level 3 Admin Menu--", [],  "", -5, [["expression", format[_EXECscript1,"null.sqf"]]], "1", "1"],
				["Admin Menu", [2], "#USER:AdminMenu3", -5, [["expression", ""]], "1", "1"],
				["Temporary Vehicle Menu", [3], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],
				["Skin Change Menu", [4], "#USER:AdminSkinsMenu", -5, [["expression", ""]], "1", "1"],				
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
		];};
	if ((getPlayerUID player) in AdminList2) then { // Admin Level 2
		adminmenu =
		[
			["",true],
				["--Level 2 Admin Menu--", [],  "", -5, [["expression", format[_EXECscript1,"null.sqf"]]], "1", "1"],
				["Admin Menu", [2], "#USER:AdminMenu2", -5, [["expression", ""]], "1", "1"],	
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
		];};	
	if ((getPlayerUID player) in AdminList1) then { // Admin Level 1
		adminmenu =
		[
			["",true],
				["--Level 1 Admin Menu--", [],  "", -5, [["expression", format[_EXECscript1,"null.sqf"]]], "1", "1"],
				["Admin Menu", [2], "#USER:AdminMenu1", -5, [["expression", ""]], "1", "1"],	
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
		];};			
};
SuperAdminMenu =
[
	["",true],
		["Spectate player", [2],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],	
		["Teleport", [3],  "", -5, [["expression", format[_EXECscript1,"malteleport.sqf"]]], "1", "1"],
		["Teleport To Me", [4], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],		
		["Toggle God Mode", [5],  "", -5, [["expression", format[_EXECscript1,"malplayerGM.sqf"]]], "1", "1"],
		["Toggle Flying", [6],  "", -5, [["expression", format[_EXECscript1,"malfly.sqf"]]], "1", "1"],		
		["Point to Repair", [7],  "", -5, [["expression", format[_EXECscript1,"malpointrepair.sqf"]]], "1", "1"],
		["Point to Delete", [8],  "", -5, [["expression", format[_EXECscript1,"malpointdelete.sqf"]]], "1", "1"],
		["Heal (25m)", [9],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],	
		["Invisibility", [10],  "", -5, [["expression", format[_EXECscript1,"malinvisinit.sqf"]]], "1", "1"],			
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:SuperAdminMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
SuperAdminMenu2 =
[
	["",true],
		["Spawn Vehicle with Key", [2], "#USER:VehiclekeyMenu", -5, [["expression", ""]], "1", "1"],
		["Vehicle Tools", [3], "#USER:VehicleTools", -5, [["expression", ""]], "1", "1"],			
		["Spawn Building Crate", [4],  "", -5, [["expression", format[_EXECscript1,"maladminbuilding.sqf"]]], "1", "1"],		
		["Spawn Weapon Crate", [5], "", -5, [["expression", format[_EXECscript1,"maladminweapons.sqf"]]], "1", "1"],
		["Spawn Consumable Crate", [6],  "", -5, [["expression", format[_EXECscript1,"maladminconsu.sqf"]]], "1", "1"],
		["ESP Menu", [7],  "#USER:EspMenu", -5, [["expression", ""]], "1", "1"],			
		["Toggle Grass Off", [8],  "", -5, [["expression", format[_EXECscript1,"malgrassoff.sqf"]]], "1", "1"],	
		["Toggle Grass On", [9],  "", -5, [["expression", format[_EXECscript1,"malgrasson.sqf"]]], "1", "1"],
		["Infinite Ammo", [10],  "", -5, [["expression", format[_EXECscript1,"malinfammo.sqf"]]], "1", "1"],			
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleTools =
[
	["",true],	
		["Speedboost", [2],  "", -5, [["expression", format[_EXECscript1,"speedboost.sqf"]]], "1", "1"],		
		["Turn on Vehicle God Mode",[3],  "", -5, [["expression", format[_EXECscript1,"malvehicleGMon.sqf"]]], "1", "1"],
		["Turn off Vehicle God Mode",[4],  "", -5, [["expression", format[_EXECscript1,"malvehicleGMoff.sqf"]]], "1", "1"],		
		["Point to Repair", [5],  "", -5, [["expression", format[_EXECscript1,"malpointrepair.sqf"]]], "1", "1"],
		["Point to only Refuel", [6],  "", -5, [["expression", format[_EXECscript1,"malpointonlyrefuel.sqf"]]], "1", "1"],		
		["Point to Delete", [7],  "", -5, [["expression", format[_EXECscript1,"malpointdelete.sqf"]]], "1", "1"],		
		["Flip Vehicle", [8],  "", -5, [["expression", format[_EXECscript1,"flipvehicle.sqf"]]], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehiclekeyMenu =
[
	["",true],
		["Neutral Trader Menu", [2],  "", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenuneutral.sqf"]]], "1", "1"],
		["Friendly Trader Menu", [4],  "", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenufriendly.sqf"]]], "1", "1"],		
		["Hero Trader Menu", [3],  "", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenuhero.sqf"]]], "1", "1"],
		["Bandit Trader Menu", [5],  "", -5, [["expression", format[_EXECscript1,"malveh\malvehiclemenubandit.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
EspMenu = 
[
["",true],
		["Full ESP", [2],  "", -5, [["expression", format[_EXECscript1,"dayzesp.sqf"]]], "1", "1"],
		["Player ESP Only", [3],  "", -5, [["expression", format[_EXECscript1,"mallightesp.sqf"]]], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],		
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
AdminMenu3 =
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
			["Next page", [12], "#USER:AdminMenu32", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
AdminMenu32 =
[
	["",true],
		["Spawn Vehicle with Key", [2], "#USER:VehiclekeyMenu", -5, [["expression", ""]], "1", "1"],
		["Vehicle Tools", [3], "#USER:VehicleTools", -5, [["expression", ""]], "1", "1"],			
		["Spawn Building Crate", [4],  "", -5, [["expression", format[_EXECscript1,"maladminbuilding.sqf"]]], "1", "1"],		
		["Spawn Weapon Crate", [5], "", -5, [["expression", format[_EXECscript1,"maladminweapons.sqf"]]], "1", "1"],
		["Spawn Consumable Crate", [6],  "", -5, [["expression", format[_EXECscript1,"maladminconsu.sqf"]]], "1", "1"],
		["ESP Menu", [7],  "#USER:EspMenu", -5, [["expression", ""]], "1", "1"],	
		["Toggle Grass Off", [8],  "", -5, [["expression", format[_EXECscript1,"malgrassoff.sqf"]]], "1", "1"],	
		["Toggle Grass On", [9],  "", -5, [["expression", format[_EXECscript1,"malgrasson.sqf"]]], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
AdminMenu2 =
[
	["",true],
		["Teleport", [2],  "", -5, [["expression", format[_EXECscript1,"malteleport.sqf"]]], "1", "1"],
		["Teleport To Me", [3], "", -5, [["expression", format[_EXECscript1, "TPtoME.sqf"]]], "1", "1"],			
		["Point to Repair", [4],  "", -5, [["expression", format[_EXECscript1,"malpointrepair.sqf"]]], "1", "1"],
		["Point to Delete", [5],  "", -5, [["expression", format[_EXECscript1,"malpointdelete.sqf"]]], "1", "1"],
		["Heal (25m)", [6],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],	
		["Invisibility", [7],  "", -5, [["expression", format[_EXECscript1,"malinvisinit.sqf"]]], "1", "1"],			
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:AdminMenu22", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
AdminMenu22 =
[
	["",true],
		["Spawn Vehicle with Key", [2], "#USER:VehiclekeyMenu", -5, [["expression", ""]], "1", "1"],		
		["Point to Refuel", [3],  "", -5, [["expression", format[_EXECscript1,"malpointonlyrefuel.sqf"]]], "1", "1"],			
		["Flip Vehicle", [4],  "", -5, [["expression", format[_EXECscript1,"flipvehicle.sqf"]]], "1", "1"],		
		["Player ESP", [5],  "", -5, [["expression", format[_EXECscript1,"mallightesp.sqf"]]], "1", "1"],	
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
AdminMenu1 =
[
	["",true],
		["Teleport", [2],  "", -5, [["expression", format[_EXECscript1,"malteleport.sqf"]]], "1", "1"],	
		["Point to Refuel", [3],  "", -5, [["expression", format[_EXECscript1,"malpointonlyrefuel.sqf"]]], "1", "1"],		
		["Heal (25m)", [4],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
		["Flip Vehicle", [5],  "", -5, [["expression", format[_EXECscript1,"flipvehicle.sqf"]]], "1", "1"],				
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
			["Next page", [12], "#USER:WeaponMenu3", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu8 =
[
["",true],	
		["V3S", [2],  "", -5, [["expression", format[_EXECscript5,"V3S.sqf"]]], "1", "1"],
		["Van 2", [3],  "", -5, [["expression", format[_EXECscript5,"Van.sqf"]]], "1", "1"],
		["F35", [4],  "", -5, [["expression", format[_EXECscript5,"F35.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:adminmenu";
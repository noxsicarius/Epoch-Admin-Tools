//////////////////////////////////////////////////////////////////////////////////////
/////////// Malory's Modded Vehicle Spawn Menu (Friendly Traders) ///////////////////
////////////////////////////////////////////////////////////////////////////////////
if ((getPlayerUID player) in AdminList) then { // Vehicle Admins ///////////////
Malvsm =
[
	["Add Vehicle",true],
	
		["--Locked Friendly Trader Vehicles--", [],  "", -5, [["expression", ""]], "1", "0"],
		["Airplanes", [2], "#USER:Malfair", -5, [["expression", ""]], "1", "1"],
		["Helicopters Unarmed", [3], "#USER:Malfheli", -5, [["expression", ""]], "1", "1"],		
		["Military Unarmed", [4], "#USER:Malmu", -5, [["expression", ""]], "1", "1"],
		["Utility (SUV)", [5], "#USER:Malutil", -5, [["expression", ""]], "1", "1"],
		["Cargo Trucks", [6], "#USER:Malcargo", -5, [["expression", ""]], "1", "1"],
		["Trucks and Tractor", [7], "#USER:Maltrucks", -5, [["expression", ""]], "1", "1"],
		["Fuel/Van/Bus", [8], "#USER:Malfvb", -5, [["expression", ""]], "1", "1"],
		["Bikes and ATVs", [9], "#USER:Malbike", -5, [["expression", ""]], "1", "1"],
		["Cars", [10], "#USER:Malcars", -5, [["expression", ""]], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malfair = 
[
	["Add Vehicle",true],

		["--Air Planes--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["AN2", [2], "", -5, [["expression", '["AN2_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["C130J", [3], "", -5, [["expression", '["C130J_US_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["MV22", [4], "", -5, [["expression", '["MV22_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["C185", [5], "", -5, [["expression", '["GNT_C185"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["C185U", [6], "", -5, [["expression", '["GNT_C185U"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["C185R", [7], "", -5, [["expression", '["GNT_C185R"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["C185C", [8], "", -5, [["expression", '["GNT_C185C"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malfheli = 
[
	["Add Vehicle",true],

		["--Helicopters--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["Mi17 Civilian", [2], "", -5, [["expression", '["Mi17_Civilian_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["AH6X", [3], "", -5, [["expression", '["AH6X_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["MH6J", [4], "", -5, [["expression", '["MH6J_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Gyro", [5], "", -5, [["expression", '["CSJ_GyroC"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["GyroC", [6], "", -5, [["expression", '["CSJ_GyroCover"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["GyroP", [7], "", -5, [["expression", '["CSJ_GyroP"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malmu = 
[
	["Add Vehicle",true],

		["--Military Unarmed--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["HMMWV M1035", [2], "", -5, [["expression", '["HMMWV_M1035_DES_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["HMMWV Ambulance", [3], "", -5, [["expression", '["HMMWV_Ambulance"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["HMMWV Ambulance CZ", [4], "", -5, [["expression", '["HMMWV_Ambulance_CZ_DES_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["HMMWV", [5], "", -5, [["expression", '["HMMWV_DES_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["HMMWV DZ", [6], "", -5, [["expression", '["HMMWV_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Vodnik MedEvac", [7], "", -5, [["expression", '["GAZ_Vodnik_MedEvac"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["LandRover CZ", [8], "", -5, [["expression", '["LandRover_CZ_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["LandRover TK", [9], "", -5, [["expression", '["LandRover_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malutil = 
[
	["Add Vehicle",true],

		["--Utility 1/2--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["SUV Black", [2], "", -5, [["expression", '["SUV_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["SUV Blue", [3], "", -5, [["expression", '["SUV_Blue"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["SUV Charcoal", [4], "", -5, [["expression", '["SUV_Charcoal"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["SUV Green", [5], "", -5, [["expression", '["SUV_Green"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["SUV Orange", [6], "", -5, [["expression", '["SUV_Orange"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["SUV Pink", [7], "", -5, [["expression", '["SUV_Pink"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["SUV Red", [8], "", -5, [["expression", '["SUV_Red"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["SUV Silver", [9], "", -5, [["expression", '["SUV_Silver"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [11], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Next page", [12], "#USER:Malutil2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malutil2 = 
[
	["Add Vehicle",true],

		["--Utility 2/2--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["SUV Yellow", [2], "", -5, [["expression", '["SUV_Yellow"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["SUV Camo", [3], "", -5, [["expression", '["SUV_Camo"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["UAZ Civ", [4], "", -5, [["expression", '["UAZ_Unarmed_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["UAZ CDF", [5], "", -5, [["expression", '["UAZ_CDF"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["UAZ INS", [6], "", -5, [["expression", '["UAZ_INS"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["UAZ RU", [7], "", -5, [["expression", '["UAZ_RU"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["UAZ TK", [8], "", -5, [["expression", '["UAZ_Unarmed_TK_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["UAZ UN", [9], "", -5, [["expression", '["UAZ_Unarmed_UN_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malutil", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malcargo = 
[
	["Add Vehicle",true],

		["--Cargo Trucks--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["Ural CDF", [2], "", -5, [["expression", '["Ural_CDF"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Ural TK", [3], "", -5, [["expression", '["Ural_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Ural UN", [4], "", -5, [["expression", '["Ural_UN_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["V3S TK", [5], "", -5, [["expression", '["V3S_Open_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["V3S TK", [6], "", -5, [["expression", '["V3S_Open_TK_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Kamaz", [7], "", -5, [["expression", '["Kamaz"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["MTVR", [8], "", -5, [["expression", '["MTVR_DES_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Maltrucks = 
[
	["Add Vehicle",true],

		["--Trucks and Tractor--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["Hilux Open", [2], "", -5, [["expression", '["hilux1_civil_3_open_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Hilux Civil", [3], "", -5, [["expression", '["hilux1_civil_1_open"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Hilux Covered", [4], "", -5, [["expression", '["hilux1_civil_2_covered"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Datsun Open", [5], "", -5, [["expression", '["datsun1_civil_3_open"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Datsun Civil", [6], "", -5, [["expression", '["datsun1_civil_1_open"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],		
		["Datsun Covered", [7], "", -5, [["expression", '["datsun1_civil_2_covered"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Tractor", [8], "", -5, [["expression", '["tractor"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malfvb = 
[
	["Add Vehicle",true],

		["--Fuel Trucks, Vans and Buses--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["Kamaz Refuel", [2], "", -5, [["expression", '["KamazRefuel_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Mtvr Refuel", [3], "", -5, [["expression", '["MtvrRefuel_DES_EP1_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Ural Refuel", [4], "", -5, [["expression", '["UralRefuel_TK_EP1_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["V3S Refuel", [5], "", -5, [["expression", '["V3S_Refuel_TK_GUE_EP1_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Ikarus", [6], "", -5, [["expression", '["Ikarus"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Ikarus TK", [7], "", -5, [["expression", '["Ikarus_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["S1203 TK", [8], "", -5, [["expression", '["S1203_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],		
		["S1203 Ambulance", [9], "", -5, [["expression", '["S1203_ambulance_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malbike = 
[
	["Add Vehicle",true],

		["--Bikes and ATVs--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["MMT Civ", [2], "", -5, [["expression", '["MMT_Civ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Old Bike", [3], "", -5, [["expression", '["Old_bike_TK_INS_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Old Moto", [4], "", -5, [["expression", '["Old_moto_TK_Civ_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["TT650 Civ", [5], "", -5, [["expression", '["TT650_Civ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["TT650 Ins", [6], "", -5, [["expression", '["TT650_Ins"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["TT650 TK", [7], "", -5, [["expression", '["TT650_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["M1030", [8], "", -5, [["expression", '["M1030_US_DES_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],		
		["ATV CZ", [9], "", -5, [["expression", '["ATV_CZ_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],		
		["ATV US", [10], "", -5, [["expression", '["ATV_US_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malcars = 
[
	["Add Vehicle",true],

		["--Cars 1/2--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["Skoda", [2], "", -5, [["expression", '["Skoda"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Skoda Blue", [3], "", -5, [["expression", '["SkodaBlue"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Skoda Green", [4], "", -5, [["expression", '["SkodaGreen"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Skoda Red", [5], "", -5, [["expression", '["SkodaRed"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Volha TK", [6], "", -5, [["expression", '["Volha_1_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Volha CIV", [7], "", -5, [["expression", '["Volha_2_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Hatchback", [8], "", -5, [["expression", '["car_hatchback"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Sedan", [9], "", -5, [["expression", '["car_sedan"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [11], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Next page", [12], "#USER:Malcars2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malcars2 = 
[
	["Add Vehicle",true],

		["--Cars 2/2--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["VWGolf", [2], "", -5, [["expression", '["VWGolf"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["GLT M300 LT", [3], "", -5, [["expression", '["GLT_M300_LT"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["GLT M300 ST", [4], "", -5, [["expression", '["GLT_M300_ST"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Lada", [5], "", -5, [["expression", '["Lada1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Lada TK", [6], "", -5, [["expression", '["Lada1_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Lada CIV", [7], "", -5, [["expression", '["Lada2"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Lada TK CIV", [8], "", -5, [["expression", '["Lada2_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Lada LM", [9], "", -5, [["expression", '["LadaLM"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Limo", [10], "", -5, [["expression", '["VolhaLimo_TK_CIV_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malcars", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:Malvsm";
};

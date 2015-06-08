private["_EXECvehicle"];
_EXECvehicle = '["%1"] execVM "admintools\tools\addvehicle.sqf"';

Malvsm =	
[
	["Add Vehicle",true],
	
		["--Locked Neutral Trader Vehicles--", [],  "", -5, [["expression", ""]], "1", "0"],		
		["Military Unarmed", [2], "#USER:Malmu", -5, [["expression", ""]], "1", "1"],
		["Utility (SUV)", [3], "#USER:Malutil", -5, [["expression", ""]], "1", "1"],
		["Cargo Trucks", [4], "#USER:Malcargo", -5, [["expression", ""]], "1", "1"],
		["Trucks and Tractor", [5], "#USER:Maltrucks", -5, [["expression", ""]], "1", "1"],
		["Fuel/Van/Bus", [6], "#USER:Malfvb", -5, [["expression", ""]], "1", "1"],
		["Bikes and ATVs", [7], "#USER:Malbike", -5, [["expression", ""]], "1", "1"],
		["Cars", [8], "#USER:Malcars", -5, [["expression", ""]], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malmu = 
[
	["Add Vehicle",true],

		["--Military Unarmed--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["HMMWV M1035", [2], "", -5, [["expression", format[_EXECvehicle,"HMMWV_M1035_DES_EP1"]]], "1", "1"],
		["HMMWV Ambulance", [3], "", -5, [["expression", format[_EXECvehicle,"HMMWV_Ambulance"]]], "1", "1"],
		["HMMWV Ambulance CZ", [4], "", -5, [["expression", format[_EXECvehicle,"HMMWV_Ambulance_CZ_DES_EP1"]]], "1", "1"],
		["HMMWV", [5], "", -5, [["expression", format[_EXECvehicle,"HMMWV_DES_EP1"]]], "1", "1"],
		["HMMWV DZ", [6], "", -5, [["expression", format[_EXECvehicle,"HMMWV_DZ"]]], "1", "1"],
		["Vodnik MedEvac", [7], "", -5, [["expression", format[_EXECvehicle,"GAZ_Vodnik_MedEvac"]]], "1", "1"],
		["LandRover CZ", [8], "", -5, [["expression", format[_EXECvehicle,"LandRover_CZ_EP1"]]], "1", "1"],
		["LandRover TK", [9], "", -5, [["expression", format[_EXECvehicle,"LandRover_TK_CIV_EP1"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malutil = 
[
	["Add Vehicle",true],

		["--Utility 1/2--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["SUV Black", [2], "", -5, [["expression", format[_EXECvehicle,"SUV_TK_CIV_EP1"]]], "1", "1"],
		["SUV Blue", [3], "", -5, [["expression", format[_EXECvehicle,"SUV_Blue"]]], "1", "1"],
		["SUV Charcoal", [4], "", -5, [["expression", format[_EXECvehicle,"SUV_Charcoal"]]], "1", "1"],
		["SUV Green", [5], "", -5, [["expression", format[_EXECvehicle,"SUV_Green"]]], "1", "1"],
		["SUV Orange", [6], "", -5, [["expression", format[_EXECvehicle,"SUV_Orange"]]], "1", "1"],
		["SUV Pink", [7], "", -5, [["expression", format[_EXECvehicle,"SUV_Pink"]]], "1", "1"],
		["SUV Red", [8], "", -5, [["expression", format[_EXECvehicle,"SUV_Red"]]], "1", "1"],
		["SUV Silver", [9], "", -5, [["expression", format[_EXECvehicle,"SUV_Silver"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [11], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Next page", [12], "#USER:Malutil2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malutil2 = 
[
	["Add Vehicle",true],

		["--Utility 2/2--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["SUV Yellow", [2], "", -5, [["expression", format[_EXECvehicle,"SUV_Yellow"]]], "1", "1"],
		["SUV Camo", [3], "", -5, [["expression", format[_EXECvehicle,"SUV_Camo"]]], "1", "1"],
		["UAZ Civ", [4], "", -5, [["expression", format[_EXECvehicle,"UAZ_Unarmed_TK_CIV_EP1"]]], "1", "1"],
		["UAZ CDF", [5], "", -5, [["expression", format[_EXECvehicle,"UAZ_CDF"]]], "1", "1"],
		["UAZ INS", [6], "", -5, [["expression", format[_EXECvehicle,"UAZ_INS"]]], "1", "1"],
		["UAZ RU", [7], "", -5, [["expression", format[_EXECvehicle,"UAZ_RU"]]], "1", "1"],
		["UAZ TK", [8], "", -5, [["expression", format[_EXECvehicle,"UAZ_Unarmed_TK_EP1"]]], "1", "1"],
		["UAZ UN", [9], "", -5, [["expression", format[_EXECvehicle,"UAZ_Unarmed_UN_EP1"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malutil", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malcargo = 
[
	["Add Vehicle",true],

		["--Cargo Trucks--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["Ural CDF", [2], "", -5, [["expression", format[_EXECvehicle,"Ural_CDF"]]], "1", "1"],
		["Ural TK", [3], "", -5, [["expression", format[_EXECvehicle,"Ural_TK_CIV_EP1"]]], "1", "1"],
		["Ural UN", [4], "", -5, [["expression", format[_EXECvehicle,"Ural_UN_EP1"]]], "1", "1"],
		["V3S TK", [5], "", -5, [["expression", format[_EXECvehicle,"V3S_Open_TK_CIV_EP1"]]], "1", "1"],
		["V3S TK", [6], "", -5, [["expression", format[_EXECvehicle,"V3S_Open_TK_EP1"]]], "1", "1"],
		["Kamaz", [7], "", -5, [["expression", format[_EXECvehicle,"Kamaz"]]], "1", "1"],
		["MTVR", [8], "", -5, [["expression", format[_EXECvehicle,"MTVR_DES_EP1"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Maltrucks = 
[
	["Add Vehicle",true],

		["--Trucks and Tractor--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["Hilux Open", [2], "", -5, [["expression", format[_EXECvehicle,"hilux1_civil_3_open_EP1"]]], "1", "1"],
		["Hilux Civil", [3], "", -5, [["expression", format[_EXECvehicle,"hilux1_civil_1_open"]]], "1", "1"],
		["Hilux Covered", [4], "", -5, [["expression", format[_EXECvehicle,"hilux1_civil_2_covered"]]], "1", "1"],
		["Datsun Open", [5], "", -5, [["expression", format[_EXECvehicle,"datsun1_civil_3_open"]]], "1", "1"],
		["Datsun Civil", [6], "", -5, [["expression", format[_EXECvehicle,"datsun1_civil_1_open"]]], "1", "1"],		
		["Datsun Covered", [7], "", -5, [["expression", format[_EXECvehicle,"datsun1_civil_2_covered"]]], "1", "1"],
		["Tractor", [8], "", -5, [["expression", format[_EXECvehicle,"tractor"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malfvb = 
[
	["Add Vehicle",true],

		["--Fuel Trucks, Vans and Buses--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["Kamaz Refuel", [2], "", -5, [["expression", format[_EXECvehicle,"KamazRefuel_DZ"]]], "1", "1"],
		["Mtvr Refuel", [3], "", -5, [["expression", format[_EXECvehicle,"MtvrRefuel_DES_EP1_DZ"]]], "1", "1"],
		["Ural Refuel", [4], "", -5, [["expression", format[_EXECvehicle,"UralRefuel_TK_EP1_DZ"]]], "1", "1"],
		["V3S Refuel", [5], "", -5, [["expression", format[_EXECvehicle,"V3S_Refuel_TK_GUE_EP1_DZ"]]], "1", "1"],
		["Ikarus", [6], "", -5, [["expression", format[_EXECvehicle,"Ikarus"]]], "1", "1"],
		["Ikarus TK", [7], "", -5, [["expression", format[_EXECvehicle,"Ikarus_TK_CIV_EP1"]]], "1", "1"],
		["S1203 TK", [8], "", -5, [["expression", format[_EXECvehicle,"S1203_TK_CIV_EP1"]]], "1", "1"],		
		["S1203 Ambulance", [9], "", -5, [["expression", format[_EXECvehicle,"S1203_ambulance_EP1"]]], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malbike = 
[
	["Add Vehicle",true],

		["--Bikes and ATVs--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["MMT Civ", [2], "", -5, [["expression", format[_EXECvehicle,"MMT_Civ"]]], "1", "1"],
		["Old Bike", [3], "", -5, [["expression", format[_EXECvehicle,"Old_bike_TK_INS_EP1"]]], "1", "1"],
		["Old Moto", [4], "", -5, [["expression", format[_EXECvehicle,"Old_moto_TK_Civ_EP1"]]], "1", "1"],
		["TT650 Civ", [5], "", -5, [["expression", format[_EXECvehicle,"TT650_Civ"]]], "1", "1"],
		["TT650 Ins", [6], "", -5, [["expression", format[_EXECvehicle,"TT650_Ins"]]], "1", "1"],
		["TT650 TK", [7], "", -5, [["expression", format[_EXECvehicle,"TT650_TK_CIV_EP1"]]], "1", "1"],
		["M1030", [8], "", -5, [["expression", format[_EXECvehicle,"M1030_US_DES_EP1"]]], "1", "1"],		
		["ATV CZ", [9], "", -5, [["expression", format[_EXECvehicle,"ATV_CZ_EP1"]]], "1", "1"],		
		["ATV US", [10], "", -5, [["expression", format[_EXECvehicle,"ATV_US_EP1"]]], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malcars = 
[
	["Add Vehicle",true],

		["--Cars 1/2--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["Skoda", [2], "", -5, [["expression", format[_EXECvehicle,"Skoda"]]], "1", "1"],
		["Skoda Blue", [3], "", -5, [["expression", format[_EXECvehicle,"SkodaBlue"]]], "1", "1"],
		["Skoda Green", [4], "", -5, [["expression", format[_EXECvehicle,"SkodaGreen"]]], "1", "1"],
		["Skoda Red", [5], "", -5, [["expression", format[_EXECvehicle,"SkodaRed"]]], "1", "1"],
		["Volha TK", [6], "", -5, [["expression", format[_EXECvehicle,"Volha_1_TK_CIV_EP1"]]], "1", "1"],
		["Volha CIV", [7], "", -5, [["expression", format[_EXECvehicle,"Volha_2_TK_CIV_EP1"]]], "1", "1"],
		["Hatchback", [8], "", -5, [["expression", format[_EXECvehicle,"car_hatchback"]]], "1", "1"],
		["Sedan", [9], "", -5, [["expression", format[_EXECvehicle,"car_sedan"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [11], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Next page", [12], "#USER:Malcars2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Malcars2 = 
[
	["Add Vehicle",true],

		["--Cars 2/2--", [],  "", -5, [["expression", ""]], "1", "1"],	
		["VWGolf", [2], "", -5, [["expression", format[_EXECvehicle,"VWGolf"]]], "1", "1"],
		["GLT M300 LT", [3], "", -5, [["expression", format[_EXECvehicle,"GLT_M300_LT"]]], "1", "1"],
		["GLT M300 ST", [4], "", -5, [["expression", format[_EXECvehicle,"GLT_M300_ST"]]], "1", "1"],
		["Lada", [5], "", -5, [["expression", format[_EXECvehicle,"Lada1"]]], "1", "1"],
		["Lada TK", [6], "", -5, [["expression", format[_EXECvehicle,"Lada1_TK_CIV_EP1"]]], "1", "1"],
		["Lada CIV", [7], "", -5, [["expression", format[_EXECvehicle,"Lada2"]]], "1", "1"],
		["Lada TK CIV", [8], "", -5, [["expression", format[_EXECvehicle,"Lada2_TK_CIV_EP1"]]], "1", "1"],
		["Lada LM", [9], "", -5, [["expression", format[_EXECvehicle,"LadaLM"]]], "1", "1"],
		["Limo", [10], "", -5, [["expression", format[_EXECvehicle,"VolhaLimo_TK_CIV_EP1"]]], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malcars", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:Malvsm";

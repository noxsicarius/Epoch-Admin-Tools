//////////////////////////////////////////////////////////////////////////////////////
/////////// Malory's Modded Vehicle Spawn Menu (Bandit Traders) /////////////////////
////////////////////////////////////////////////////////////////////////////////////
if ((getPlayerUID player) in AdminList) then { // Vehicle Admins
Malvsm =
[
	["Add Vehicle",true],

		["--Locked Bandit Trader Vehicles--", [],  "", -5, [["expression", ""]], "1", "0"],          
		["Helicopters Armed", [2], "#USER:MalHA", -5, [["expression", ""]], "1", "1"],
		["Trucks Armed", [3], "#USER:MalTR", -5, [["expression", ""]], "1", "1"],
		["Military Armed", [4], "#USER:MalMA", -5, [["expression", ""]], "1", "1"],            
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
MalHA =
[
	["Add Vehicle",true],

		["--Helicopters Armed--", [],  "", -5, [["expression", ""]], "1", "1"],      
		["CH 47F", [2], "", -5, [["expression", '["CH_47F_EP1_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["UH1H DZ", [3], "", -5, [["expression", '["UH1H_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["MI17 DZ", [4], "", -5, [["expression", '["MI17_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["UH60M DZ", [5], "", -5, [["expression", '["UH60M_EP1_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["UH1Y DZ", [6], "", -5, [["expression", '["UH1Y_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [11], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
MalTR =
[
	["Add Vehicle",true],

		["--Trucks Armed--", [],  "", -5, [["expression", ""]], "1", "1"],      
		["Pickup PK GUE", [2], "", -5, [["expression", '["Pickup_PK_GUE"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Pickup PK INS", [3], "", -5, [["expression", '["Pickup_PK_INS"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Armored SUV", [4], "", -5, [["expression", '["ArmoredSUV_PMC_DZ"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Pickup PKT TK", [5], "", -5, [["expression", '["Pickup_PKT_TK_GUE_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["Offroad DSHKM", [6], "", -5, [["expression", '["Offroad_DSHKM_Gue"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],          
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
MalMA =
[
	["Add Vehicle",true],

		["--Military Armed--", [],  "", -5, [["expression", ""]], "1", "1"],      
		["HMMWV M998A2 SOV", [2], "", -5, [["expression", '["HMMWV_M998A2_SOV_DES_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["HMMWV M1151 M2", [3], "", -5, [["expression", '["HMMWV_M1151_M2_CZ_DES_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["LandRover Special CZ", [4], "", -5, [["expression", '["LandRover_Special_CZ_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["LandRover MG TK", [5], "", -5, [["expression", '["LandRover_MG_TK_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["UAZ MG TK", [6], "", -5, [["expression", '["UAZ_MG_TK_EP1"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["GAZ Vodnik", [7], "", -5, [["expression", '["GAZ_Vodnik"] execVM "admintools\tools\malvehiclespawn.sqf"']], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Back", [12], "#USER:Malvsm", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
				
];
showCommandingMenu "#USER:Malvsm";
};

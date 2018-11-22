private ["_kindOf", "_filter", "_cfgvehicles","_dialog","_vehicle"];
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };}forEach _types;_res}
#define Epoch_Array call {if (_kindOf == "Air") then {_veharray = EAT_epochairvehicles}; if (_kindOf == "LandVehicle") then {_veharray = EAT_epochlandvehicles}; if (_kindOf == "Ship") then {_veharray = EAT_epochmarinevehicles}}

PermDialogSelected = -1;
TempDialogSelected = -1;
AdminDialogList = 13000;
EAT_epochairvehicles = ["Mi17_DZE","UH1H_DZE","UH1Y_DZE","UH60M_EP1_DZE","MH60S_DZE","CH_47F_EP1_DZE","CH53_DZE","CSJ_GyroC","CSJ_GyroCover","CSJ_GyroP","AH6X_DZ","MH6J_DZ","UH60M_MEV_EP1_DZ","Mi17_Civilian_DZ","BAF_Merlin_DZE","GNT_C185U_DZ","GNT_C185_DZ","GNT_C185R_DZ","GNT_C185C_DZ","AN2_DZ","AN2_2_DZ","An2_2_TK_CIV_EP1_DZ","MV22_DZ","C130J_US_EP1_DZ"];
EAT_epochlandvehicles = ["LandRover_MG_TK_EP1_DZE","LandRover_Special_CZ_EP1_DZE","UAZ_MG_TK_EP1_DZE","GAZ_Vodnik_DZE","HMMWV_M998A2_SOV_DES_EP1_DZE","HMMWV_M1151_M2_CZ_DES_EP1_DZE","Pickup_PK_TK_GUE_EP1_DZE","Pickup_PK_GUE_DZE","Pickup_PK_INS_DZE","Offroad_DSHKM_Gue_DZE","ArmoredSUV_PMC_DZE","LandRover_CZ_EP1","LandRover_TK_CIV_EP1","HMMWV_M1035_DES_EP1","HMMWV_Ambulance","HMMWV_Ambulance_CZ_DES_EP1","HMMWV_DES_EP1","HMMWV_DZ","BTR40_TK_INS_EP1","GAZ_Vodnik_MedEvac","MMT_Civ","Old_bike_TK_INS_EP1","TT650_Civ","TT650_Ins","TT650_TK_CIV_EP1","ATV_CZ_EP1","ATV_US_EP1","M1030_US_DES_EP1","Old_moto_TK_Civ_EP1","tractor","Ikarus","Ikarus_TK_CIV_EP1","S1203_TK_CIV_EP1","S1203_ambulance_EP1","Ural_CDF","Ural_TK_CIV_EP1","Ural_UN_EP1","UralCivil_DZE","UralCivil2_DZE","V3S_Open_TK_CIV_EP1","V3S_Open_TK_EP1","V3S_Civ","V3S_RA_TK_GUE_EP1_DZE","V3S_TK_EP1_DZE","Kamaz_DZE","KamazOpen_DZE","MTVR_DES_EP1","MTVR","UralRefuel_TK_EP1_DZ","V3S_Refuel_TK_GUE_EP1_DZ","KamazRefuel_DZ","MtvrRefuel_DES_EP1_DZ","MtvrRefuel_DZ","hilux1_civil_3_open_DZE","datsun1_civil_3_open_DZE","hilux1_civil_1_open_DZE","datsun1_civil_2_covered_DZE","datsun1_civil_1_open_DZE","hilux1_civil_2_covered_DZE","Skoda","SkodaBlue","SkodaGreen","SkodaRed","VolhaLimo_TK_CIV_EP1","Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","VWGolf","car_hatchback","car_sedan","GLT_M300_LT","GLT_M300_ST","Lada1","Lada1_TK_CIV_EP1","Lada2","Lada2_TK_CIV_EP1","LadaLM","SUV_TK_CIV_EP1","SUV_Blue","SUV_Charcoal","SUV_Green","SUV_Orange","SUV_Pink","SUV_Red","SUV_Silver","SUV_White","SUV_Yellow","SUV_Camo","UAZ_CDF","UAZ_INS","UAZ_RU","UAZ_Unarmed_TK_CIV_EP1","UAZ_Unarmed_TK_EP1","UAZ_Unarmed_UN_EP1"];
EAT_epochmarinevehicles = ["RHIB","Smallboat_1","Smallboat_2","Zodiac","Fishing_Boat","PBX","JetSkiYanahui_Case_Red","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue"];
EAT_allepochvehicles = EAT_epochairvehicles + EAT_epochlandvehicles + EAT_epochmarinevehicles;
if (isNil "EAT_EpochOnlyVehicles") then {EAT_EpochOnlyVehicles = false;};
if (isNil "vhnlist") then {vhnlist = [];};

LoadAllVehiclesList = {
	vhnlist = [];
	lbClear AdminDialogList;
	_kindOf = ["LandVehicle","Air","Ship"];
	_filter = ["BIS_Steerable_Parachute","ParachuteBase","StaticWeapon"];
	_cfgvehicles = configFile >> "cfgVehicles";
	"Generating Vehicle list... Please wait ..." call dayz_rollingMessages;
	for "_i" from 0 to (count _cfgvehicles)-1 do 
	{
		private ["_vehicle", "_veh_type", "_textPart"];
		_vehicle = _cfgvehicles select _i;
		//				diag_log(_vehicle);
		if (isClass _vehicle) then {
			_veh_type = configName(_vehicle);
			if ((getNumber(_vehicle >> "scope") == 2) and (getText(_vehicle >> "picture") != "") and (KINDOF_ARRAY(_veh_type,_kindOf)) and !(KINDOF_ARRAY(_veh_type,_filter))) then {
				_textPart =	getText(configFile >> "cfgVehicles" >> _veh_type >> "displayName");
				_image = (gettext (configFile >> "CfgVehicles" >> _veh_type >> "picture"));
				vhnlist set [count vhnlist,[_veh_type, _textPart, _image]];
			};
		};
	};
	lbClear AdminDialogList;
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [AdminDialogList, format["%2 (%1)", _x select 0, _x select 1]];
	  lbSetPicture [AdminDialogList, _index, _image];
	} forEach vhnlist;
};

LoadEpochOnlyList = {
		private ["_cfgvehicles","_dialog","_vehicle","_allepochvehicles"];
		lbClear AdminDialogList;
		vhnlist = [];
		for "_i" from 0 to (count EAT_allepochvehicles)-1 do 
		{
			private ["_vehicle", "_veh_type", "_textPart","_image"];
			_vehicle = EAT_allepochvehicles select _i;
			_textPart =	getText(configFile >> "cfgVehicles" >> _vehicle >> "displayName");
			_image = (gettext (configFile >> "CfgVehicles" >> _vehicle >> "picture"));
			vhnlist set [count vhnlist,[_vehicle, _textPart, _image]];
		};
	
	lbClear AdminDialogList;
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [AdminDialogList, format["%2 (%1)", _x select 0, _x select 1]];
	  lbSetPicture [AdminDialogList, _index, _image];
	} forEach vhnlist;
};

if ((getPlayerUID player) in EAT_adminList) then {
	_dialog = createdialog "EAT_Veh_AdminDialog";
	call LoadAllVehiclesList;
} else {
	_dialog = createdialog "EAT_Veh_ModDialog";
	call LoadEpochOnlyList;
	EAT_EpochOnlyVehicles = true;
};
{
	private ["_index", "_x","_image"];
	_image = _x select 2;
	_index = lbAdd [AdminDialogList, format["%2 (%1)", _x select 0, _x select 1]];
  lbSetPicture [AdminDialogList, _index, _image];
	
} forEach vhnlist;

LoadSpecificList = {
	private ["_kindOf", "_filter", "_cfgvehicles","_dialog","_vehicle","_veharray"];
	lbClear AdminDialogList;
	vhnlist = [];
	if (EAT_EpochOnlyVehicles) then {
		//_kindOf = ["LandVehicle","Air","Ship"];
		_kindOf = _this select 0;
		Epoch_Array;
		for "_i" from 0 to (count _veharray)-1 do 
	{
		private ["_vehicle", "_veh_type", "_textPart","_image"];
		_vehicle = _veharray select _i;
		_textPart =	getText(configFile >> "cfgVehicles" >> _vehicle >> "displayName");
		_image = (gettext (configFile >> "CfgVehicles" >> _vehicle >> "picture"));
		vhnlist set [count vhnlist,[_vehicle, _textPart, _image]];
	};
	} else {
		//_kindOf = ["LandVehicle","Air","Ship"];
		_kindOf = [_this select 0];
		_filter = ["BIS_Steerable_Parachute","ParachuteBase","StaticWeapon"];      
		_cfgvehicles = configFile >> "cfgVehicles";
		for "_i" from 0 to (count _cfgvehicles)-1 do 
		{
			private ["_vehicle", "_veh_type", "_textPart"];
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then {
				_veh_type = configName(_vehicle);
				if ((getNumber(_vehicle >> "scope") == 2) and (getText(_vehicle >> "picture") != "") and (KINDOF_ARRAY(_veh_type,_kindOf)) and !(KINDOF_ARRAY(_veh_type,_filter))) then {
					_textPart =	getText(configFile >> "cfgVehicles" >> _veh_type >> "displayName");
					_image = (gettext (configFile >> "CfgVehicles" >> _veh_type >> "picture"));
					vhnlist set [count vhnlist,[_veh_type, _textPart, _image]];
				};
			};
		};
	};
	lbClear AdminDialogList;
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [AdminDialogList, format["%2 (%1)", _x select 0, _x select 1]];
	  lbSetPicture [AdminDialogList, _index, _image];
	} forEach vhnlist;
};

waitUntil { !dialog };
if ((PermDialogSelected < 0) && (TempDialogSelected < 0)) exitWith {};

if (PermDialogSelected > -1) then {
	_vehicle = ((vhnlist select PermDialogSelected) select 0);
	hint format["Spawning Perm %1", _vehicle];
	[_vehicle] execVM "admintools\tools\addvehicle.sqf";
};

if (TempDialogSelected > -1) then {
	_vehicle = ((vhnlist select TempDialogSelected) select 0);
	hint format["Spawning Temp %1", _vehicle];
	[_vehicle] execVM "admintools\tools\addtempvehicle.sqf";
};

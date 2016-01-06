private ["_player"];
area = 0;
aCount = 0;

areaMenu =
[
["",true],
	["Set AI Movement Radius:", [-1], "", -5, [["expression", ""]], "1", "0"],
	["40m",[],"", -5,[["expression","area = 40;"]],"1","1"],
	["50m",[],"", -5,[["expression","area = 50;"]],"1","1"],
	["75m",[],"", -5,[["expression","area = 75;"]],"1","1"],
	["100m",[],"", -5,[["expression","area = 100;"]],"1","1"],
	["150m",[],"", -5,[["expression","area = 150;"]],"1","1"],
	["200m",[],"", -5,[["expression","area = 200;"]],"1","1"],
	["300m",[],"", -5,[["expression","area = 200;"]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", "area = -1;"]], "1", "1"]
];

amountMenu =
[
["",true],
	["Select AI count:", [-1], "", -5, [["expression", ""]], "1", "0"],
	["1",[],"", -5,[["expression","aCount = 1;"]],"1","1"],
	["2",[],"", -5,[["expression","aCount = 2;"]],"1","1"],
	["4",[],"", -5,[["expression","aCount = 4;"]],"1","1"],
	["6",[],"", -5,[["expression","aCount = 6;"]],"1","1"],
	["8",[],"", -5,[["expression","aCount = 8;"]],"1","1"],
	["10",[],"", -5,[["expression","aCount = 10;"]],"1","1"],
	["20",[],"", -5,[["expression","aCount = 20;"]],"1","1"],
	["30",[],"", -5,[["expression","aCount = 30;"]],"1","1"],
	["40",[],"", -5,[["expression","aCount = 40;"]],"1","1"],
	["50",[],"", -5,[["expression","aCount = 50;"]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", "aCount = -1;"]], "1", "1"]
];

showCommandingMenu "#USER:areaMenu";
waitUntil{(area != 0) || (commandingMenu == "")};
if(area == 0) exitWith{};

showCommandingMenu "#USER:amountMenu";
waitUntil{(aCount != 0) || (commandingMenu == "")};
if(aCount == 0) exitWith{};

_player = player;

if(EAT_logMajorTool) then {
	EAT_PVEH_usageLogger = format["%1 %2 -- has spawned %3 AI units",name _player,getPlayerUID _player,aCount];
	[] spawn {publicVariable "EAT_PVEH_usageLogger";};
};

unit_waypoints = {
	private ["_wp","_pos_x","_pos_y","_pos_z","_unitGroup","_position"];

	_unitGroup = _this select 0;
	_position = _this select 1;
	_pos_x = _position select 0;
	_pos_y = _position select 1;
	_pos_z = _position select 2;

	{
		_wp = _unitGroup addWaypoint [_x,10];
		_wp setWaypointType "MOVE";

	} count [[_pos_x,(_pos_y+area),0],[(_pos_x+area),_pos_y,0],[_pos_x,(_pos_y-area),0],[(_pos_x-area),_pos_y,0]];

	_wp = _unitGroup addWaypoint [[_pos_x,_pos_y,0],area];
	_wp setWaypointType "CYCLE";
};

spawnAI = {
	private ["_pos_x","_pos_y","_pos_z","_weaponandmag","_weapon","_magazine","_aigear","_unitGroup","_unit"];
	_aiSkill = [["aimingAccuracy",0.60],["aimingShake",0.60],["aimingSpeed",0.60],["endurance",1.00],["spotDistance",0.60],["spotTime",0.60],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];
	_aiAssault = [["M16A4_ACG","30Rnd_556x45_Stanag"],["Sa58V_RCO_EP1","30Rnd_762x39_AK47"],["SCAR_L_STD_Mk4CQT","30Rnd_556x45_Stanag"],["M8_sharpshooter","30Rnd_556x45_Stanag"],["M4A1_HWS_GL_camo","30Rnd_556x45_Stanag"],["SCAR_L_STD_HOLO","30Rnd_556x45_Stanag"],["M4A3_CCO_EP1","30Rnd_556x45_Stanag"],["M4A3_CCO_EP1","30Rnd_556x45_Stanag"],["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"],["M16A4","30Rnd_556x45_Stanag"],["m8_carbine","30Rnd_556x45_Stanag"],["BAF_L85A2_RIS_Holo","30Rnd_556x45_Stanag"],["Sa58V_CCO_EP1","30Rnd_762x39_AK47"]];
	_aiMachine = [["RPK_74","75Rnd_545x39_RPK"],["MK_48_DZ","100Rnd_762x51_M240"],["M249_EP1_DZ","200Rnd_556x45_M249"],["Pecheneg_DZ","100Rnd_762x54_PK"],["M240_DZ","100Rnd_762x51_M240"]];
	_aiSniper = [["M14_EP1","20Rnd_762x51_DMR"],["SCAR_H_LNG_Sniper_SD","20Rnd_762x51_SB_SCAR"],["M110_NVG_EP1","20rnd_762x51_B_SCAR"],["SVD_CAMO","10Rnd_762x54_SVD"],["VSS_Vintorez","20Rnd_9x39_SP5_VSS"],["DMR","20Rnd_762x51_DMR"],["M40A3","5Rnd_762x51_M24"]];
	_aiRandomWep = [_aiAssault,_aiAssault,_aiAssault,_aiSniper,_aiMachine];
	_aiBags = ["DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
	_aiSkin = ["Ins_Soldier_GL_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","GUE_Commander_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_2_DZ","GUE_Soldier_CO_DZ","BanditW1_DZ","BanditW2_DZ","Bandit1_DZ","Bandit2_DZ"];

	_divisor = _this select 0;
	_aiPosition = getPos _player;
	_pos_x = _aiPosition select 0;
	_pos_y = _aiPosition select 1;
	_pos_z = _aiPosition select 2;
	_weaponandmag = (_aiRandomWep call BIS_fnc_selectRandom) call BIS_fnc_selectRandom;
	_weapon = _weaponandmag select 0;
	_magazine = _weaponandmag select 1;
	_aigear = [["ItemBandage","ItemBandage","ItemPainkiller"],["ItemKnife","ItemMap"]];
	_unitGroup = createGroup EAST;

	for "_x" from 1 to (aCount/_divisor) do {
		_unit = _unitGroup createUnit [(_aiSkin call BIS_fnc_selectRandom),[_pos_x,_pos_y,_pos_z],[],(area/2),"CAN COLLIDE"];
		[_unit] joinSilent _unitGroup;
		_unit setVariable ["Bandit",true];
		_unit enableAI "TARGET";
		_unit enableAI "AUTOTARGET";
		_unit enableAI "MOVE";
		_unit enableAI "ANIM";
		_unit enableAI "FSM";
		_unit setCombatMode "YELLOW";
		_unit setBehaviour "COMBAT";
		removeAllWeapons _unit;
		removeAllItems _unit;
		_unit addweapon "NVGoggles";
		_i = 0;
		
		// Magazine count 3
		for "_i" from 1 to 3 do {
			_unit addMagazine _magazine;
		};
		
		_unit addweapon _weapon;
		_unit selectWeapon _weapon;
		_unit addBackpack (_aiBags call BIS_fnc_selectRandom);

		{
			_unit addMagazine _x
		} count (_aigear select 0);

		{
			_unit addweapon _x
		} count (_aigear select 1);
		{
			_unit setSkill [(_x select 0),(_x select 1)]
		} count _aiSkill;
		_unit addEventHandler ["Killed",{_unit removeWeapon "NVGoggles"; Sleep 900; deleteVehicle _unit;}]; // Delete units 15 minutes after death
	};
	_unitGroup setFormation "ECH LEFT";
	_unitGroup selectLeader ((units _unitGroup) select 0);
	[_unitGroup, [_pos_x,_pos_y,_pos_z]] spawn unit_waypoints;
};

if(aCount %5 == 0) then {
	[5] call spawnAI;
	[5] call spawnAI;
	[5] call spawnAI;
	[5] call spawnAI;
	[5] call spawnAI;
} else {
	if(aCount %4 == 0) then {
		[4] call spawnAI;
		[4] call spawnAI;
		[4] call spawnAI;
		[4] call spawnAI;
	} else {
		if(aCount %2 == 0) then {
			[2] call spawnAI;
			[2] call spawnAI;
		} else {
			[1] call spawnAI;
		};
	};
};

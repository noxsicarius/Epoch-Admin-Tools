private ["_aiPosition","_divisor","_playerUID","_clientKey","_playerPos","_activatingPlayer","_exitReason","_aiArea","_aiCount","_aiBags","_aiRandomWep","_aiSkill","_aiAssault","_aiMachine","_aiSniper","_weaponandmag","_weapon","_magazine","_aiItems","_aiTools","_unitGroup","_unit","_deadai","_banditSkin","_heroSkin","_killer"];

EAT_BanditorHero = _this select 0;
_aiArea = _this select 1;
_aiCount = _this select 2;
_divisor = _this select 3;
_aiPosition = _this select 4;
_activatingPlayer = _this select 5;
_playerPos = _this select 6;
_clientKey = _this select 7;
_playerUID = getPlayerUID _activatingPlayer;


_exitReason = [_this,"EAT_AiSpawn",_playerPos,_clientKey,_playerUID,_activatingPlayer] call server_verifySender;
if (_exitReason != "") exitWith {diag_log _exitReason};

if (!(_playerUID in EAT_adminList)) exitWith {diag_log format["Unauthorized player (%1 - %2) trying to spawn AI",_activatingPlayer,_playerUID];};

_aiSkill = [["aimingAccuracy",0.60],["aimingShake",0.60],["aimingSpeed",0.60],["endurance",1.00],["spotDistance",0.60],["spotTime",0.60],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];
_aiAssault = [["M16A4_ACOG_DZ","30Rnd_556x45_Stanag"],["Sa58V_RCO_EP1","30Rnd_762x39_AK47"],["SCAR_L_STD_Mk4CQT","30Rnd_556x45_Stanag"],["M8_sharpshooter","30Rnd_556x45_Stanag"],["M4A1_Holo_MFL_DZ","30Rnd_556x45_Stanag"],["SCAR_L_STD_HOLO","30Rnd_556x45_Stanag"],["M4A1_CCO_DZ","30Rnd_556x45_Stanag"],["G36C_ACOG_DZ","30Rnd_556x45_G36"],["AKM_Kobra_DZ","30Rnd_762x39_AK47"],["SA58_Holo_DZ","30Rnd_762x39_SA58"],["m8_carbine","30Rnd_556x45_Stanag"],["L85A2_CCO_FL_DZ","30Rnd_556x45_Stanag"],["AK74_GL_PSO1_DZ","30Rnd_545x39_AK"]];
_aiMachine = [["RPK74_Kobra_DZ","75Rnd_545x39_RPK"],["Mk48_CCO_DZ","100Rnd_762x51_M240"],["M249_DZ","200Rnd_556x45_M249"],["Pecheneg_DZ","100Rnd_762x54_PK"],["M240_DZ","100Rnd_762x51_M240"]];
_aiSniper = [["M14_Holo_DZ","20Rnd_762x51_DMR"],["SCAR_H_LNG_Sniper_SD","20Rnd_762x51_SB_SCAR"],["M110_NVG_EP1","20rnd_762x51_B_SCAR"],["SVD_PSO1_Gh_DZ","10Rnd_762x54_SVD"],["VSS_Vintorez","20Rnd_9x39_SP5_VSS"],["DMR_DZ","20Rnd_762x51_DMR"],["M40A3_DZ","5Rnd_762x51_M24"]];
_aiRandomWep = [_aiAssault,_aiAssault,_aiAssault,_aiSniper,_aiMachine];
_aiBags = ["DZ_Czech_Vest_Pouch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
_banditSkin = ["Ins_Soldier_GL_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","GUE_Commander_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_2_DZ","GUE_Soldier_CO_DZ","BanditW1_DZ","BanditW2_DZ","Bandit1_DZ","Bandit2_DZ"];
_heroSkin = ["Soldier_Sniper_PMC_DZ","FR_OHara_DZ","Soldier_Bodyguard_AA12_PMC_DZ","FR_R_DZ","FR_Sapper_DZ","FR_Marksman_DZ","FR_Assault_R_DZ","UN_CDF_Soldier_Guard_EP1_DZ","UN_CDF_Soldier_EP1_DZ","BAF_Soldier_N_MTP_DZ"];
_weaponandmag = (_aiRandomWep call BIS_fnc_selectRandom) call BIS_fnc_selectRandom;
_weapon = _weaponandmag select 0;
_magazine = _weaponandmag select 1;
_aiItems = ["ItemBandage","ItemAntibiotic","ItemPainkiller","ItemAntibacterialWipe","ItemMorphine","ItemEpinephrine","FoodCanBakedBeans","FoodCanPotatoes","ItemSodaMtngreen","ItemSodaLemonade"];
_aiTools = ["ItemKnife","ItemMap","ItemMatchbox","ItemHatchet","ItemToolbox","ItemCrowbar"];

EAT_unitWaypoints = {
	private ["_wp","_pos_x","_pos_y","_pos_z","_unitGroup","_position","_waypoint"];

	_unitGroup = _this select 0;
	_position = _this select 1;
	_pos_x = _position select 0;
	_pos_y = _position select 1;
	_pos_z = _position select 2;
	_waypoint = _this select 2;

	{
		_wp = _unitGroup addWaypoint [_x,10];
		_wp setWaypointType "MOVE";

	} count [[_pos_x,(_pos_y+_waypoint),0],[(_pos_x+_waypoint),_pos_y,0],[_pos_x,(_pos_y-_waypoint),0],[(_pos_x-_waypoint),_pos_y,0]];

	_wp = _unitGroup addWaypoint [[_pos_x,_pos_y,0],_waypoint];
	_wp setWaypointType "CYCLE";
};

_unitGroup = createGroup EAST;

for "_x" from 1 to (_aiCount/_divisor) do {
	if (EAT_BanditorHero == "Hero") then {
		_unit = _unitGroup createUnit [(_heroSkin call BIS_fnc_selectRandom),_aiPosition,[],(_aiArea/2),"CAN COLLIDE"];
	} else {
		_unit = _unitGroup createUnit [(_banditSkin call BIS_fnc_selectRandom),_aiPosition,[],(_aiArea/2),"CAN COLLIDE"];
	};
	[_unit] joinSilent _unitGroup;
	//_unit setVariable ["Bandit",true];
	_unit enableAI "TARGET";
	_unit enableAI "AUTOTARGET";
	_unit enableAI "MOVE";
	_unit enableAI "ANIM";
	_unit enableAI "FSM";
	_unit setCombatMode "YELLOW";
	_unit setBehaviour "COMBAT";
	removeAllWeapons _unit;
	removeAllItems _unit;
	if (sunOrMoon != 1) then {
		_unit addweapon "NVGoggles";
	};
	_i = 0;
	_j = 0;
	
	// Magazine count 3
	for "_i" from 1 to 3 do {
		_unit addMagazine _magazine;
	};
	
	_unit addweapon _weapon;
	_unit selectWeapon _weapon;
	_unit addBackpack (_aiBags call BIS_fnc_selectRandom);
	_unit addWeapon (_aiTools call BIS_fnc_selectRandom);
	
	for "_j" from 1 to 3 do {
		_unit addMagazine (_aiItems call BIS_fnc_selectRandom);
	};
	
	{
		_unit setSkill [(_x select 0),(_x select 1)]
	} count _aiSkill;
	
	_unit addEventHandler ["Killed",{
	_deadai = _this select 0;
	_killer = _this select 1;
	_deadai setVariable ["bodyName","unknown",false];
	[_deadai,_killer] spawn {
		private ["_humanity","_humankills","_banditkills","_player"];
		_player = _this select 1;
		if (isPlayer _player) then {
			_humanity = _player getVariable["humanity",0];
			if (EAT_BanditorHero == "Hero") then {
				_humankills = _player getVariable["humanKills",0];
				_player setVariable ["humanKills",(_humankills + 1),true];
				_player setVariable ["humanity",(_humanity - EAT_HumanityGainLoss),true];
			} else {
			_banditkills = _player getVariable ["banditKills", 0];
			_player setVariable ["banditKills",(_banditkills + 1),true];
			_player setVariable ["humanity",(_humanity + EAT_HumanityGainLoss),true];
			};
		};
		uiSleep EAT_aiDeleteTimer; deleteVehicle (_this select 0);};}];
};
_unitGroup setFormation "ECH LEFT";
_unitGroup selectLeader ((units _unitGroup) select 0);
[_unitGroup, _aiPosition, _aiArea] spawn EAT_unitWaypoints;
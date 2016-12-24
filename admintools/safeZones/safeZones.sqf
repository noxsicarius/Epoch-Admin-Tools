// This script was developed by analysing AGN safe zones, maca safe zones, infistar safe zones, and others like them
// to create the best possible combination of them all.

private ["_fnc_enterZoneVehicle","_fnc_clearZombies","_fnc_enterZonePlayer","_EH_weaponFirePlayer","_EH_weaponFireVehicle","_fnc_exitZone","_enterMsg","_exitMsg"];
if (isNil "inZone") then {inZone = false;};
if (isNil "canbuild") then {canbuild = true;};
if (isNil "EAT_playerGod2") then {EAT_playerGod2 = false;};
if (isNil "EAT_vehicleGod2") then {EAT_vehicleGod2 = false;};

_enterMsg = "*** PROTECTED ZONE! No stealing or shooting allowed ***";
_exitMsg = "*** GOD MODE DISABLED! You can now be damaged ***";
_EH_weaponFirePlayer = 1;
_EH_weaponFireVehicle = 1;

// handles players entering zone
_fnc_enterZonePlayer = {
	private["_player","_veh","_inZone"];

	inZone = true;
	_player = player;
	
	if(EAT_szUseHint) then {hint _enterMsg;} else { cutText[_enterMsg,"PLAIN DOWN"];};
	
	if(!EAT_isAdmin || (EAT_isAdmin && !EAT_szAdminWeapon)) then {_EH_weaponFirePlayer = _player addEventHandler ["Fired", {deleteVehicle (nearestObject [_this select 0,_this select 4]);cutText ["***ALL weapons disabled inside Safe Zones***","WHITE IN",2];}];};
	
	if (!EAT_playerGod2) then {
		player_zombieCheck = {};
		fnc_usec_damageHandler = {};
		_player removeAllEventHandlers "handleDamage";
		_player addEventHandler ["handleDamage", {false}];
		_player allowDamage false;
	};
};

// handles occupied vehicles in zone. This includes purchased ones.
// A player must enter the vehicle to enable god mode if it is purchased inside the zone.
_fnc_enterZoneVehicle = {
	private["_player","_veh","_inZone"];
	_player = player;
	_veh = vehicle _player;
	if (_player != _veh) then {
		_inZone = _veh getVariable ["inZone",false];
		if (!_inZone) then {
			_veh setVariable ["inZone",true,true];
			if(!EAT_isAdmin || (EAT_isAdmin && !EAT_szAdminWeapon)) then {_EH_weaponFireVehicle = _veh addEventHandler ["Fired", {deleteVehicle (nearestObject [_this select 0,_this select 4]);cutText ["***ALL weapons disabled inside Safe Zones***","WHITE IN",2];}];};
				
			if(EAT_szVehicleGod && !EAT_vehicleGod2) then {
				fnc_veh_handleDam = {};
				_veh removeAllEventHandlers "handleDamage";
				_veh addEventHandler ["handleDamage",{false}];
				_veh allowDamage false;
			};
		};
	};
};

// Handles players/vehicles leaving the zone
_fnc_exitZone = {
	private["_veh","_inZone","_player"];
	
	if(EAT_szUseHint) then {hint _exitMsg;} else { cutText[_exitMsg,"PLAIN DOWN"];};
	
	_player = player;
	_veh = vehicle _player;
	
	if (_player != _veh && EAT_szVehicleGod) then {
		_veh setVariable ["inZone",false,true];
		if(!EAT_isAdmin || (EAT_isAdmin && !EAT_szAdminWeapon)) then {_veh removeEventHandler ["Fired",_EH_weaponFireVehicle];};
		if(!EAT_vehicleGod2) then {
			fnc_veh_handleDam = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\veh_handleDam.sqf";
			_veh removeAllEventHandlers "handleDamage";
			_veh addEventHandler ["handleDamage",{_this call fnc_veh_handleDam}];
			_veh allowDamage true;
		};
	};
	
	if(!EAT_isAdmin || (EAT_isAdmin && !EAT_szAdminWeapon)) then {_player removeEventHandler ["Fired", _EH_weaponFirePlayer];};
	if (!EAT_playerGod2) then {
		player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
		fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
		_player removeAllEventHandlers "handleDamage";
		_player addEventHandler ["handleDamage",{_this call fnc_usec_damageHandler}];
		_player allowDamage true;
	};
	inZone = false;
};

// Deletes zombies near players
_fnc_clearZombies = {
	private["_zombies"];
	_zombies = (vehicle player) nearEntities ["zZombie_Base",EAT_szZombieDistance];
	
	// Kill and hide zombies
	if((count _zombies) > 0) then {
		{
			if (!isNull _x && !isPlayer _x) then {
				_x setDamage 1;
				hideObject _x;
			} else {
				_zombies = _zombies - [_x];
			};
		} forEach _zombies;

		if((count _zombies) > 0) then {
			// Failure to delay entity delete results in RPT spam of lost _agent
			Sleep 2;
			{
				deleteVehicle _x;
			} forEach _zombies;	
		};
	};
};

// Deletes AI near the zone
_fnc_clearAI = {
	private ["_aiUnits"];
	_aiUnits = player nearEntities ['Man',EAT_szAiDistance];
	
	if((count _aiUnits) > 0) then {
		{
			if ((!isNull group _x) && (getPlayerUID _x == '')) then
			{
				_x setDamage 1;
				hideObject _x;
			} else {
				_aiUnits = _aiUnits - [_x];
			};
		} forEach _aiUnits;
		
		if((count _aiUnits) > 0) then {
			Sleep 2;
			{
				deleteVehicle _x;
			}forEach _aiUnits;
		};
	};
};

// Forces speed limit on LAND vehicles
_fnc_speedLimitEnforcer = {
	private["_veh","_speed","_slowPercent"];
	while {inZone} do {
		_veh = vehicle player;
		_speed = speed _veh;
		if(_veh != player && !(_veh isKindOf "Air") && (_speed > EAT_szSpeedLimit)) then {
			_vel = velocity _veh;
			_slowPercent = 0.8;
			if(_speed > 70) then {_slowPercent = 0.4;}else{if(_speed>50)then{_slowPercent = 0.6;};};
			_veh setVelocity [(_vel select 0) * _slowPercent,(_vel select 1) * _slowPercent,(_vel select 2) * _slowPercent];
		};
		Sleep 0.3;
	};
};
	
_fnc_antiTheft = {
	private["_friend","_ct","_dist","_ctPlayerID","_friendlies"];
	while{inZone} do {
		_friend = false;
		_ct = cursorTarget;
			if(!isNull _ct && isPlayer _ct) then {
				_dist = _ct distance player;
			if(_dist < 7) then {
				_ctPlayerID = _ct getVariable["CharacterID","0"];
				_friendlies	= player getVariable ["friendlyTo",[]];
				if(_ctPlayerID in _friendlies) then {_friend = true;};
			} else {
				_ct = nil;
			};
		};
		if(!isNull (FindDisplay 106) && (!isNull _ct && !_friend)) then {
			(findDisplay 106) closeDisplay 1;
			waitUntil {isNull (FindDisplay 106)};
			createGearDialog [(player), 'RscDisplayGear'];
			systemChat("Redirecting to your inventory...");
			systemChat("To enter a player's gear add them as a friend");
		};
		waitUntil {isNull (FindDisplay 106)};
	};
};

diag_log("Admin Tools: safeZones.sqf loaded");

while {true} do	{
	private["_veh","_inZone"];
	
	_inZone = false;
	
	if (EAT_szUseCustomZones) then {
		{
			_z = _x select 0;
			_z = [_z select 0, _z select 2, 0];
			_r = _x select 1;
			if ((vehicle player) distance _z < _r) then {_inZone = true;};
		} forEach EAT_szCustomZones;
	};
	
	if (EAT_areaGodMode) then {
		{
			_z = _x select 0;
			_z = [_z select 0, _z select 1, 0];
			_r = _x select 1;
			if ((vehicle player) distance _z < _r) then {_inZone = true;};
		} forEach EAT_szAdminZone;
	};
	
	if (EAT_szDetectTraders) then {
		if (!canbuild) then {_inZone = true;};
	};

	if (_inZone) then {
		if(!inZone) then {
			call _fnc_enterZonePlayer;
			if(EAT_szAntiTheft && !EAT_isAdmin)then{[_fnc_antiTheft]spawn {call (_this select 0);};};
			if(EAT_szUseSpeedLimits)then{[_fnc_speedLimitEnforcer] spawn {call (_this select 0);};};
		};
		call _fnc_enterZoneVehicle; // Must be called continuously to god mode purchased vehicles
		if(EAT_szZombieShield) then {call _fnc_clearZombies;};
		if(EAT_szAiShield) then {call _fnc_clearAI;};
	} else {
		if(inZone) then {call _fnc_exitZone;};
	};
	Sleep 1;
};

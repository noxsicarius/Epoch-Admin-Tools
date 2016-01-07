// This script was developed by analysing AGN safe zones, maca safe zones, infistar safe zones, and others like them
// to create the best possible combination of them all.

waitUntil {!isNil "dayz_animalCheck"}; // Wait for the character to load all required items

private ["_fnc_enterZoneVehicle","_fnc_clearZombies","_fnc_enterZonePlayer","_fnc_exitZone","_enterMsg","_exitMsg"];
if (isNil "inZone") then {inZone = false;};
if (isNil "canbuild") then {canbuild = true;};
_enterMsg = "*** PROTECTED ZONE! No stealing or shooting allowed ***";
_exitMsg = "*** GODE MODE DISABLED! You can now be damaged ***";

// handles players entering zone
_fnc_enterZonePlayer = {
	private["_player","_veh","_inZone"];

	inZone = true;
	if(EAT_szUseHint) then {hint _enterMsg;} else { cutText[_enterMsg,"PLAIN DOWN"];};
		
	if(!EAT_isAdmin) then {
		player_Fired = {
			deleteVehicle (nearestObject [_this select 0,_this select 4]);
			cutText ["***ALL weapons disabled inside Safe Zones***","WHITE IN"];
		};
	};
		
	if (!playerGod2) then {
		_player = player;
		player_zombieCheck = {};
		fnc_usec_damageHandler = {};
		_player removeAllEventHandlers "handleDamage";
		_player addEventHandler ["handleDamage", {false}];
		_player allowDamage false;
	};
		
	_veh = vehicle player;
	if (player != _veh && !vehicleGod2) then {
		_inZone = _veh getVariable ["inZone",0];
		if (_inZone == 0) then {
			if(!EAT_isAdmin) then {
				_veh removeAllEventHandlers "Fired";
				_veh addEventHandler ["Fired", {_this call player_fired;}];
				{
					_x removeAllEventHandlers "Fired";
					_x addEventHandler ["Fired", {_this call player_fired;}];
				} forEach (crew _veh);
				_veh setVariable ["inZone",1];
			};
				
			if(SafeZoneVehicle) then {
				vehicle_handleDamage = {false};
				_veh removeAllEventHandlers "HandleDamage";
				_veh addeventhandler ["HandleDamage",{ _this call vehicle_handleDamage } ];
				_veh allowDamage false;
			};
		};
	};
};

// Handles players/vehicles leaving the zone
_fnc_exitZone = {
	private["_veh","_inZone","_player"];
	
	if(EAT_szUseHint) then {hint _exitMsg;} else { cutText[_exitMsg,"PLAIN DOWN"];};
	if(!EAT_isAdmin) then {player_fired = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_fired.sqf";};
	if (!playerGod2) then {fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";};
	object_monitorGear = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_monitorGear.sqf";
	
	_player = player;
	_veh = vehicle player;
	if (player != _veh && !vehicleGod2 && SafeZoneVehicle) then {
		vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
		_inZone = _veh getVariable ["inZone",0];
		if (_inZone == 1) then {
			_veh setVariable ["inZone",0];
			_veh removeAllEventHandlers "HandleDamage";
			_veh addeventhandler ["HandleDamage",{ _this call vehicle_handleDamage } ];
			_veh allowDamage true;
		};
	};
			
	if (!playerGod2) then {
		_player allowDamage true;
		player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
		fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
		_player removeAllEventHandlers "HandleDamage";
		_player addeventhandler ["HandleDamage",{_this call fnc_usec_damageHandler;} ];
	};
	inZone = false;
};

// Deletes zombies near players
_fnc_clearZombies = {
	private["_zombies"];
	_zombies = (vehicle player) nearEntities ["zZombie_Base",40];
		
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
	_aiUnits = player nearEntities ['Man',100];
		
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
			if(!isNil _ct && isPlayer _ct) then {
				_dist = _ct distance player;
			if(_dist < 7) then {
				_ctPlayerID = _ct getVariable["CharacterID","0"];
				_friendlies	= player getVariable ["friendlyTo",[]];
				if(_ctPlayerID in _friendlies) then {_friend = true;};
			} else {
				_ct = nil;
			};
		};
		if(!isNil (FindDisplay 106) && (!isNil _ct && !_friend)) then {
			(findDisplay 106) closeDisplay 1;
			waitUntil {isNil (FindDisplay 106)};
			createGearDialog [(player), 'RscDisplayGear'];
		};
		waitUntil {isNil (FindDisplay 106)};
	};
};
	
while {true} do	{
	private["_veh","_zoneChange"];
		
	_zoneChange = false;
		
	if (EAT_szUseCustomZones && !inZone) then {
		{
			_z = _x select 0;
			_z = [_z select 0, _z select 2, 0];
			_r = _x select 1;
			if ((vehicle player) distance _z < _r) then {_zoneChange = true;};
		} forEach EAT_szCustomZones;
	};
		
	if (EAT_szDetectTraders) then {
		if (!canbuild) then {_zoneChange = true;};
	};

	if (_zoneChange) then {
		if(!inZone) then {
			call _fnc_enterZonePlayer;
			if(EAT_szAntiTheft)then{[_fnc_antiTheft]spawn {call (_this select 0);};};
			if(EAT_szUseSpeedLimits)then{[_fnc_speedLimitEnforcer] spawn {call (_this select 0);};};
		};
		call _fnc_clearZombies;
		if (EAT_szAiShield) then {call _fnc_clearAI;};
	} else {
		if(inZone) then {call _fnc_exitZone;};
	};
};

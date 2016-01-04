/*
 * modified version of AGN Safezone Commander Script by AlienX
 */
 
Private ["_EH_Fired", "_ehID", "_fix","_inVehicle","_inVehicleLast","_EH_Fired_Vehicle",
		"_inVehicleDamage","_antiBackpackThread","_antiBackpackThread2","_antiZombieThread"];

disableSerialization;

waitUntil {!isNil "dayz_animalCheck"};

_inVehicle = objNull;
_inVehicleLast = objNull;

while {true} do {
	
	waitUntil { !canBuild };

	_thePlayer = player;

	systemChat ("Entering protected area");

	if (safeZoneGodmode && !playerGod2) then
	{
		player_zombieCheck = {};
		fnc_usec_damageHandler = {};
		_thePlayer removeAllEventHandlers "handleDamage";
		_thePlayer addEventHandler ["handleDamage", {false}];
		_thePlayer allowDamage false;
		{_x allowdamage false } foreach (nearestObjects [player,['building','LandVehicle','Air'], 400]);
	};
	
	_EH_Fired = _thePlayer addEventHandler ["Fired", {
		systemChat ("You can not fire your weapon in a Safe Zone");
		NearestObject [_this select 0,_this select 4] setPos[0,0,0];}];
	
	if (safeZoneZombieShield) then 
	{
		_antiZombieThread = [] spawn {
			private ["_pos","_zombies","_player"];
			_player = player;
			
			while {!canBuild} do{
				_pos = getPos _player;
				_zombies = _pos nearEntities ["zZombie_Base",40];

				{
					_x setDamage 1;
					hideObject _x;
				} forEach _zombies;
				
				Sleep 2;				
				{deletevehicle _x;} forEach _zombies;
				Sleep 3;
			};
		};
	};

	if (safeZoneAntiBackpack && !EAT_isAdmin) then
	{
		LastPlayerLookedAt = objNull;
		LastPlayerLookedAtCountDown = 3;
		_antiBackpackThread = [] spawn {
			private [ "_ct","_ip","_ia","_dis"] ;
			while {!canBuild} do
			{
				if ( isNull LastPlayerLookedAt ) then
				{
					waitUntil {!isNull cursorTarget};
					_ct = cursorTarget;
					_ip = isPlayer _ct;
					if ( _ip ) then { _ia = alive _ct; _dis = _ct distance player; } else { _ia = false; _dis = 1000; };
					
					if ( (_ip && _ia) && (_dis < 6.5) ) then
					{
						LastPlayerLookedAt = _ct;
					};
				} else {
					LastPlayerLookedAtCountDown = LastPlayerLookedAtCountDown - 1;
					if ( LastPlayerLookedAtCountDown < 0 ) then { LastPlayerLookedAtCountDown = 3; LastPlayerLookedAt = objNull; };
					sleep 1;
				};
			};
		};
			
		_antiBackpackThread2 = [] spawn {
			private ["_to","_dis","_inchk","_ip","_skip","_ct","_iv","_lp","_inv","_ctOwnerID","_friendlies","_if"];
			_ctOwnerID = 0;
			while {!canBuild} do
			{
				_ct = cursorTarget;
				_skip = false;
				_if = false;
				
				if ( !isNull (_ct) ) then
				{
					_to = typeOf _ct;
					_dis = _ct distance player;
					_inchk = ["WeaponHolder","ReammoBox"];
					
					_lp = false;
					{
						if ( (_to isKindOf _x) && (_dis < 10) && safeZoneLootPiles ) then
						{
							_lp = true;
						};
					} forEach ( _inchk );

					_ip = isPlayer _ct;
					_iv = _ct isKindOf "AllVehicles";
					_inv = (vehicle player != player);
					
					if ( _ip ) then {
						_ctOwnerID = _ct getVariable["CharacterID","0"];
						_friendlies	= player getVariable ["friendlyTo",[]];
						if(_ctOwnerID in _friendlies) then {	
							_if = true;
						};
					};
					
					//Lootpile check
					if ( _lp ) then {_skip = true;};
					
					//Vehicle check
					if ( _iv && (_dis < 10) && !(_ip)) then {_skip = true;};
					
					//In a vehicle check
					if ( _inv) then { _skip = true; };
					
					//Is player friendly?
					if ( _if ) then { _skip = true; };
				};
				
				if( !isNull (FindDisplay 106) && !_skip ) then
				{
					if ( isNull LastPlayerLookedAt ) then
					{
						(findDisplay 106) closeDisplay 1;
						waitUntil { isNull (FindDisplay 106) };
						createGearDialog [(player), 'RscDisplayGear'];
						systemChat ("Redirecting you to your own gear!");
						waitUntil { isNull (FindDisplay 106) };
					} else {
						systemChat (format["You cannot open your gear, look away from players, wait 5 seconds."]);
						(findDisplay 106) closeDisplay 1;
						waitUntil { isNull (FindDisplay 106) };
					};
				};
			};
		};
	};
	
	while { !canBuild } do
	{
		sleep 0.1;
		if ( !(isNull _inVehicle) && (vehicle player == player) && !EAT_isAdmin ) then
		{
			_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
			_inVehicleLast = _inVehicle;
			_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
			_inVehicle = objNull;
		};
			
		if ( vehicle player != player && isNull _inVehicle && !EAT_isAdmin ) then
		{
			systemChat ( "Vehicle weapons DISABLED" );
			_inVehicle = vehicle player;
			_inVehicleDamage = getDammage _inVehicle;
			_EH_Fired_Vehicle = _inVehicle addEventHandler ["Fired", {
				systemChat ("Vehicle weapons DISABLED in safe zone");
				NearestObject [_this select 0,_this select 4] setPos[0,0,0];}];
		};
	};

	LastPlayerLookedAt = objNull;
	LastPlayerLookedAtCountDown = 5;

	if(!EAT_isAdmin) then {
	terminate _antiBackpackThread;
	terminate _antiBackpackThread2;};
	terminate _antiZombieThread;
	systemChat ("Leaving Safe Zone");
	
	if ( !(isNull _inVehicle) && !EAT_isAdmin) then {
		systemChat ( "Vehicle weapons ENABLED" );
		_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
	};
		
	if ( !(isNull _inVehicleLast) && !EAT_isAdmin) then {
		systemChat ( "Vehicle weapons ENABLED" );
		_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
	};

	_thePlayer removeEventHandler ["Fired", _EH_Fired];
	
	if ( safeZoneGodmode  && !playerGod2) then {
		systemChat ( "Protection disabled, be careful!" );
		sleep antiCamper;
		{_x allowdamage true } foreach (nearestObjects [player,['LandVehicle','Air'], 75]);
		player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
		fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
		_thePlayer addEventHandler ["handleDamage", {true}];
		_thePlayer removeAllEventHandlers "handleDamage";
		_thePlayer allowDamage true;
	};
};
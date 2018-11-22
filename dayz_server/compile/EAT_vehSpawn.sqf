private ["_exitReason","_playerUID","_clientKey","_vehtospawn","_worldspace","_pos","_dir","_veh","_activatingPlayer"];

_vehtospawn = _this select 0;
_worldspace = _this select 1;
_activatingPlayer = _this select 2;
_clientKey = _this select 3;
_playerUID = getPlayerUID _activatingPlayer;
_dir = _worldspace select 0;
_pos = _worldspace select 1;


_exitReason = [_this,"EAT_vehSpawn",_pos,_clientKey,_playerUID,_activatingPlayer] call server_verifySender;
if (_exitReason != "") exitWith {diag_log _exitReason};

if (!(_playerUID in EAT_adminModList)) exitWith {diag_log format["Unauthorized player (%1 - %2) trying to spawn vehicles",_activatingPlayer,_playerUID];};

_veh = _vehtospawn createVehicle _pos;
//_veh setDir _dir;
_veh setVariable ["ObjectID", "1", true];
_veh setVariable ["ObjectUID", "1", true];
_veh setVariable ["EAT_Veh",1,true];
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;

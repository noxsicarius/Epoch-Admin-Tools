private ["_veh","_dist","_vehtospawn","_dir","_pos","_player"];

_vehtospawn = _this select 0; 
_dist = 7;
_player = player;
_dir = getDir vehicle _player;
_pos = getPosATL vehicle _player;
_pos = [(_pos select 0)+_dist*sin(_dir),(_pos select 1)+_dist*cos(_dir),0];

EAT_PVEH_vehSpawn = [_vehtospawn,[_dir,_pos],_player,dayz_authKey];
	publicVariableServer "EAT_PVEH_vehSpawn";

"Spawned a vehicle." call dayz_rollingMessages;

// Tool use logger
if(EAT_logMinorTool) then {
	EAT_PVEH_usageLogger = format["%1 %2 -- has spawned a temporary vehicle: %3",name _player,getPlayerUID _player,_vehtospawn];
	[] spawn {publicVariable "EAT_PVEH_usageLogger";};
};

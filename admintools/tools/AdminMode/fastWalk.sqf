if(isNil "fastWalkMove") then {fastWalkMove = true;} else {fastWalkMove = !fastWalkMove};

fastWalkForward = {
	_player = vehicle player;
	_dis = 5;
	_dir = getdir _player;
	_pos = getPosATL _player;
	_pos2 = getPos _player;
	_z2 = _pos2 select 2;
	_z = 0;

	if(_player isKindOf "Air" && _z2 < 20 && isEngineOn _player) then {_z = _z2 + 30;} else {if(_z2 > 3) then {_z = _z2;}else{if(surfaceIsWater _pos) then {_z = 2;} else {_z=0;};};};
	_pos = [(_pos select 0)+_dis*sin(_dir),(_pos select 1)+_dis*cos(_dir),_z];
	if (surfaceIsWater _pos) then {_player setPosASL _pos;} else {_player setPosATL _pos;};
};
fastWalkLeft = {
	_player = vehicle player;
	_player setdir (getdir _player) - 3;
};
fastWalkRight = {
	_player = vehicle player;
	_player setdir (getdir _player) + 3;
};

if(fastWalkMove) then {
	fastWalk_keyForward = (findDisplay 46) displayAddEventHandler ["KeyDown","if (((_this select 1) == 17) && (_this select 2)) then {call fastWalkForward;};"];
	fastWalk_keyLeft = (findDisplay 46) displayAddEventHandler ["KeyDown","if (((_this select 1) == 30) && (_this select 2)) then {call fastWalkLeft;}"];
	fastWalk_keyRight = (findDisplay 46) displayAddEventHandler ["KeyDown","if (((_this select 1) == 32) && (_this select 2)) then {call fastWalkRight;}"];
	2 cutText ["Hold shift and W","PLAIN",0.75];
} else {
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", fastWalk_keyForward];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", fastWalk_keyLeft];
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", fastWalk_keyRight];
};

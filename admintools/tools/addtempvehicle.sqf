private ["_veh","_location","_vehtospawn","_dir"];
 
 _vehtospawn = _this select 0; 
 _dist = 10;
 _charID = dayz_characterID;
 _dir = getDir vehicle player;
 _pos = getPosATL vehicle player;
 _pos = [(_pos select 0)+_dist*sin(_dir),(_pos select 1)+_dist*cos(_dir),0];
 _worldspace = [_dir,_pos];
  
_location = _pos;
 
_veh = createVehicle [_vehtospawn, _pos, [], 0, "CAN_COLLIDE"];
_veh setVariable ["MalSar",1,true];
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
 
cutText ["Spawned a vehicle.", "PLAIN DOWN"];
private ["_veh","_location","_isOk","_vehtospawn","_part_in","_qty_in","_qty","_obj","_objectID","_objectUID","_started","_finished","_animState","_isMedic","_dir","_removed","_keyColor","_keyNumber","_keySelected","_isKeyOK","_config","_textPartIn","_textPartOut"];
 
 _vehtospawn = _this select 0; 
 _dist = 10;
 _charID = dayz_characterID;
 _dir = getDir vehicle player;
 _pos = getPosATL vehicle player;
 _pos = [(_pos select 0)+_dist*sin(_dir),(_pos select 1)+_dist*cos(_dir),0];
 _worldspace = [_dir,_pos];
 
cutText ["Starting Spawn, stand still to complete spawn.", "PLAIN DOWN"];
 
_location = _pos;
 
_veh = createVehicle [_vehtospawn, _pos, [], 0, "CAN_COLLIDE"];
_veh setVariable ["MalSar",1,true];
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
 
cutText ["Spawned a vehicle.", "PLAIN DOWN"];

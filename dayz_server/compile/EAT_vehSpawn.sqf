private ["_vehtospawn","_pos","_veh","_activatingPlayer"];

_vehtospawn = _this select 0;
_pos = _this select 1;
_activatingPlayer = _this select 2;

if ((getPlayerUID _activatingPlayer) in EAT_adminList) then {
_veh = _vehtospawn createVehicle _pos;
//_veh = createVehicle [_vehtospawn, _pos, [], 0, "CAN_COLLIDE"];
_veh setVariable ["EAT_Veh",1,true];
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
};
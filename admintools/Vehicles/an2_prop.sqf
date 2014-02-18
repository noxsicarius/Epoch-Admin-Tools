_spawn = "AN2_DZ";
_posplr = [((getPos player) select 0) + 5, ((getPos player) select 1) + 5, 0];
_dirplr = getDir player;
_spwnveh = _spawn createVehicle (_posplr);
_spwnveh setVariable ["MalSar",1,true];

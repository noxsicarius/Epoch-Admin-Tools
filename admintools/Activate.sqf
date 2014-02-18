waituntil {!alive player ; !isnull (finddisplay 46)};

if ((getPlayerUID player) in AllAdminList) then { // All Admins
	sleep 2;
	player addaction [("<t color=""#585858"">" + ("Admin Menu") +"</t>"),"admintools\Eexcute.sqf","",0,false,true,"",""];
};

// [] spawn {
  // waituntil {!isnull player};
  // private ["_id","_veh"];
  // while {((getPlayerUID player) in AllAdminList)} do {
    // waituntil {vehicle player == player};
    // if (!isnil "_veh") then { _veh removeaction _id };
    // _id = player addaction [("<t color=""#585858"">" + ("Admin Menu") +"</t>"),"admintools\Eexcute.sqf","",0,false,true,"",""];
    // waituntil {vehicle player != player};
    // player removeaction _id;
    // _veh = vehicle player;
    // _id = _veh addaction [("<t color=""#585858"">" + ("Admin Menu") +"</t>"),"admintools\Eexcute.sqf","",0,false,true,"",""];
  // };
// };
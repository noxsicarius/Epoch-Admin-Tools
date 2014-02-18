_pos = [_this select 0, _this select 1,_this select 2];

		if ((vehicle player isKindOf "Air")) then{
		
		(vehicle player) setpos [_pos select 0, _pos select 1, 100];
		player setVariable["lastPos",0, true];
    }else
    {
    
    (vehicle player) setpos [_pos select 0, _pos select 1, 0];
    };
openMap [false, false];
TitleText [format[""], "PLAIN DOWN"];
onMapSingleClick "";


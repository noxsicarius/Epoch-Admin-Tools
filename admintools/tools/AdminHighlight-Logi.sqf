// This is still under development. The script works but it causes an additional glitchy arrow to appear near the player

if(isNil "AdminHighlightTool") then {AdminHighlightTool = true;} else {AdminHighlightTool = !AdminHighlightTool};

While {AdminHighlightTool} do 
{
	while {alive player} do
	{
		// Gets the players vehicle
		_playerVehicle = (vehicle player);
	
		// If the admin is in a vehicle the arrow will be attached to the vehicle, otherwise the arrow will be attached to the player
		if (player != vehicle player) then
		{
			{deleteVehicle _x;} forEach nearestObjects [player,["Sign_arrow_down_large_EP1"],10];
			
			_adminLocation = getPosATL (_playerVehicle);
			_adminArrow = createVehicle ["Sign_arrow_down_large_EP1",_adminLocation,[],0,"NONE"];
			_adminArrow setVariable ["ObjectID","1",true];
			_adminArrow setVariable ["ObjectUID","1",true];
			_adminArrow attachTo [_playerVehicle,[0.0,0.0,2.5]];
			player reveal _adminArrow;
		}
		else
		{
			{deleteVehicle _x;} forEach nearestObjects [player,["Sign_arrow_down_large_EP1"],10];
			
			_adminLocation = getPosATL (vehicle player);
			_adminArrow = createVehicle ["Sign_arrow_down_large_EP1",_adminLocation,[],0,"NONE"];
			_adminArrow setVariable ["ObjectID","1",true];
			_adminArrow setVariable ["ObjectUID","1",true];
			_adminArrow attachTo [vehicle player,[0.0,0.0,3.5]];
			player reveal _adminArrow;
		};
		Sleep 2;
	};
};

// If the admin highlight tool is disabled the admin arrow is removed
If (!AdminHighlightTool) then {{deleteVehicle _x;} forEach nearestObjects [player,["Sign_arrow_down_large_EP1"],10];};

if ((getPlayerUID player) in AdminList || (getPlayerUID player) in ModList) then {
	Sleep 5;
	private["_veh", "_idx"];
	_idx = -1;

	while {alive player} do
	{
		if(toolsAreActive) then
		{
			if (_idx == -1) then
			{
				[]execVM "admintools\KeyBindings\FunctionKeys.sqf";
				[]execVM "admintools\KeyBindings\NumberKeys.sqf";
				_idx = (vehicle player) addaction [("<t color=""#585858"">" + ("Admin Menu") +"</t>"),"admintools\AdminToolsMain.sqf","",7,false,true,"",""];
				_veh = vehicle player;
			};
			if (_veh != vehicle player) then
			{
				_veh removeAction _idx;
				_idx = -1;      
			};
		}else{
			if(_idx != -1) then {
				_veh removeAction _idx;
				_idx = -1;
			};
		};
		Sleep 2;
	};
	_veh removeAction _idx;
	_idx = -1;
};
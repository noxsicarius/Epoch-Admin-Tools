if ((getPlayerUID player) in AdminList || (getPlayerUID player) in ModList) then {
	[]spawn
	{
		private["_veh", "_idx"];
		_idx = -1;
		while {alive player} do
		{
			if (_idx == -1) then
			{
				[]execVM "admintools\KeyBindings\FunctionKeys.sqf";
				[]execVM "admintools\KeyBindings\NumberKeys.sqf";
				_idx = (vehicle player) addaction [("<t color=""#585858"">" + ("Admin Menu") +"</t>"),"admintools\AdminToolsMain.sqf","",6,false,true,"",""];
				_veh = vehicle player;
			};
			if (_veh != vehicle player) then
			{
				_veh removeAction _idx;
				_idx = -1;      
			};
			Sleep 2;
		};
	};
};
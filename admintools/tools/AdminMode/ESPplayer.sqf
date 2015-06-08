setGroupIconsVisible [true, true];
_color = "";
_color_green = [0,1,0,1];
_color_blue = [0,0,1,1];
_color_white = [1, 1, 1, 1];
_color_orange = [1,0.3,0,1];
_color_red = [1,0,0,1];

if (!("ItemGPS" in items player)) then {player addweapon "ItemGPS";};
if(isNil "playerESP2") then {playerESP2 = true;} else {playerESP2 = !playerESP2};

if(playerESP2) then {
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has ENABLED player ESP",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};
};


while {playerESP2} do
{
	{
		if (vehicle _x == _x) then {
			clearGroupIcons group _x;
			group _x addGroupIcon ["x_art"];
				
			if ((side _x == side player) && (side player != resistance)) then {
				_color = _color_red;
			} else {
				_color = _color_orange;
			};
			group _x setGroupIconParams [_color, format ["[%1]-[%2m]",name _x,round(_x distance player)], 0.5, true];

		} else {
			clearGroupIcons group _x;
			group _x addGroupIcon ["x_art"];
			
			_vehname = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'displayName'));
			
			_crewtotal = (crew (vehicle _x));
			_crew =	(name (crew (vehicle _x) select 0));
			_i = 1;
			
			{
				if(_i != 1) then {
					_crew = _crew + ", " + (name _x);
				};
				
				_i = _i + 1;
			
			} forEach _crewtotal;
				
			if ((side _x == side player) && (side player != resistance)) then {
				_color = _color_blue;
			} else {
				_color = _color_red;
			};
			
			group _x setGroupIconParams [_color, format ["[%2]-[%3%4%5%6%7%8%9%10%11]-[%1m]",round(_x distance player),_vehname,_crew], 0.5, true];

		};
	} forEach playableUnits;
	sleep 1;
};
{clearGroupIcons group _x;} forEach playableUnits;

if(!playerESP2) then {
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has DISABLED player ESP",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};
};

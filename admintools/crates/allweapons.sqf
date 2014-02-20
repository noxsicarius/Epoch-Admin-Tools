if (isNil "weapons_list") then
{
	weapons_list = [];
	_cfgweapons = configFile >> 'cfgWeapons';
	for "_i" from 0 to (count _cfgweapons)-1 do
	{
		_weapon = _cfgweapons select _i;
		if (isClass _weapon) then
		{
			_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
			if (getNumber (_weapon >> "scope") == 2 and getText(_weapon >> "picture") != "" and !(configName(inheritsFrom(_weapon)) in _key_colors)) then
			{
				_wpn_type = configName _weapon;
				weapons_list set [count weapons_list, _wpn_type];
			};
		};
	};
};
if (isNil "magazines_list") then
{
	magazines_list = [];
	_cfgmagazines = configFile >> 'cfgMagazines';
	for "_i" from 0 to (count _cfgmagazines)-1 do
	{
		_magazine = _cfgmagazines select _i;
		if (isClass _magazine) then
		{
			if (getNumber (_magazine >> "scope") == 2 and getText(_magazine >> "picture") != "") then
			{
				_mag_type = configName _magazine;
				magazines_list set [count magazines_list, _mag_type];
			};
		};
	};
};

_classname = "MedBox0";
_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];
_box = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
_box setDir _dir;
_box setposATL _pos;
			
{
	_box addWeaponCargoGlobal [_x, 5];
} forEach weapons_list;

{
	_box addMagazineCargoGlobal [_x, 20];
} forEach magazines_list;

titleText [format["All Box spawned nearby."],"PLAIN DOWN"]; titleFadeOut 4;

delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["1 min", [2], "", -5, [["expression", "SelectDelay=60;DelaySelected=true;"]], "1", "1"],
	["2 min", [3], "", -5, [["expression", "SelectDelay=120;DelaySelected=true;"]], "1", "1"],
	["3 min", [4], "", -5, [["expression", "SelectDelay=180;DelaySelected=true;"]], "1", "1"],
	["4 min", [5], "", -5, [["expression", "SelectDelay=240;DelaySelected=true;"]], "1", "1"],
	["5 min", [6], "", -5, [["expression", "SelectDelay=300;DelaySelected=true;"]], "1", "1"],
	["10 min", [7], "", -5, [["expression", "SelectDelay=600;DelaySelected=true;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [11], "", -5, [["expression", "DelaySelected=false;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:delaymenu";

WaitUntil{DelaySelected};
DelaySelected=false;

sleep 3;
titleText [format["All Box will disappear in %1 seconds.",SelectDelay],"PLAIN DOWN"]; titleFadeOut 4;

sleep SelectDelay;

deletevehicle _box;

titleText [format["All Box disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
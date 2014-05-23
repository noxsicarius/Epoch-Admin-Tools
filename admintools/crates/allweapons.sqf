private ["LocalOrGlobal","spawnCrate"];
LocalOrGlobal = _this select 0;

// Name of this crate
_crateName = "ALL Weapons/Items Crate";

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

// Crate type. Possibilities: MedBox0, FoodBox0, BAF_BasicWeapons, USSpecialWeaponsBox, USSpecialWeapons_EP1, USVehicleBox, RUSpecialWeaponsBox, RUVehicleBox, etc.
_classname = "USOrdnanceBox";

_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];

if(LocalOrGlobal == "local") then {
	spawnCrate = _classname createVehicleLocal _pos;	
} else {
	spawnCrate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
};

spawnCrate setDir _dir;
spawnCrate setposATL _pos;
			
{
	if(_x != "MeleeBaseBallBat") then{
		spawnCrate addWeaponCargoGlobal [_x, 5];
	};
} forEach weapons_list;

{
	if(_x != "AngelCookies") then{
		spawnCrate addMagazineCargoGlobal [_x, 20];
	};
} forEach magazines_list;

// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "SelectDelay=30;DelaySelected=true;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "SelectDelay=60;DelaySelected=true;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "SelectDelay=180;DelaySelected=true;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "SelectDelay=300;DelaySelected=true;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "SelectDelay=600;DelaySelected=true;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "SelectDelay=1800;DelaySelected=true;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "DelaySelected=false;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{DelaySelected};
DelaySelected=false;
titleText [format[_crateName + " will disappear in %1 seconds.",SelectDelay],"PLAIN DOWN"]; titleFadeOut 4;
sleep SelectDelay;

// Delete crate after SelectDelay seconds
deletevehicle spawnCrate;
titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
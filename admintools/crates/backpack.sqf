private ["_LocalOrGlobal","_backPackCrate","_crateName","_pos","_classname","_dir","_selectDelayPack"];
_LocalOrGlobal = _this select 0;

// Name of this crate
_crateName = "Backpack Tent";

// Crate type
_classname = "TentStorageDomed2";

// Tool use logger
if(logMajorTool) then {
	usageLogger = format["%1 %2 -- has spawned a %3 %4",name player,getPlayerUID player,_LocalOrGlobal,_crateName];
	publicVariable "usageLogger";
};

// Location of player and crate
_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];

if(_LocalOrGlobal == "local") then {
	_backPackCrate = _classname createVehicleLocal _pos;	
} else {
	_backPackCrate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
};

_backPackCrate setDir _dir;
_backPackCrate setposATL _pos;

// Remove default items/weapons from current crate before adding custom gear
clearWeaponCargoGlobal _backPackCrate;
clearMagazineCargoGlobal _backPackCrate;
clearBackpackCargoGlobal _backPackCrate;

_backPackCrate addBackpackCargoGlobal ["DZ_Backpack_EP1", 1];
_backPackCrate addBackpackCargoGlobal ["DZ_British_ACU", 1];
_backPackCrate addBackpackCargoGlobal ["DZ_CivilBackpack_EP1", 1];
_backPackCrate addBackpackCargoGlobal ["DZ_CompactPack_EP1", 1];
_backPackCrate addBackpackCargoGlobal ["DZ_GunBag_EP1", 1];
_backPackCrate addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];
_backPackCrate addBackpackCargoGlobal ["DZ_TK_Assault_Pack_EP1", 1];

// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

_selectDelayPack=0;
// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "_selectDelayPack=30;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "_selectDelayPack=60;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "_selectDelayPack=180;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "_selectDelayPack=300;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "_selectDelayPack=600;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "_selectDelayPack=1800;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "_selectDelayPack=0;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{commandingMenu == ""};

if(_selectDelayPack != 0) then {
	titleText [format[_crateName + " will disappear in %1 seconds.",_selectDelayPack],"PLAIN DOWN"]; titleFadeOut 4;
	sleep _selectDelayPack;
	// Delete crate after _selectDelayPack seconds
	deletevehicle _backPackCrate;
	titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
} else {
	titleText [format[_crateName + " has no timer. Shoot it to destroy."],"PLAIN DOWN"]; titleFadeOut 4;
};
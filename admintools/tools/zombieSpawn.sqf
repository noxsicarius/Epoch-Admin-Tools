private["_zCreate","_zPos","_setZedType","_zSpawnFnc","_zSpawnFnc","_player"];
zTypes = ["zZombie_Base","z_villager1","z_villager2","z_villager3","z_suit1","z_suit2","z_worker1","z_worker2","z_worker3","z_soldier","z_soldier_heavy","z_soldier_pilot","z_policeman","z_teacher","z_doctor","z_hunter","z_priest"];

area = 0;
zCount = 0;
_player = player;

areaMenu =
[
["",true],
	["Set Radius:", [-1], "", -5, [["expression", ""]], "1", "0"],
	["5m",[],"", -5,[["expression","area = 5;"]],"1","1"],
	["10m",[],"", -5,[["expression","area = 10;"]],"1","1"],
	["20m",[],"", -5,[["expression","area = 20;"]],"1","1"],
	["30m",[],"", -5,[["expression","area = 30;"]],"1","1"],
	["40m",[],"", -5,[["expression","area = 40;"]],"1","1"],
	["50m",[],"", -5,[["expression","area = 50;"]],"1","1"],
	["75m",[],"", -5,[["expression","area = 75;"]],"1","1"],
	["100m",[],"", -5,[["expression","area = 100;"]],"1","1"],
	["125m",[],"", -5,[["expression","area = 125;"]],"1","1"],
	["150m",[],"", -5,[["expression","area = 150;"]],"1","1"],
	["200m",[],"", -5,[["expression","area = 200;"]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", "area = -1;"]], "1", "1"]
];

amountMenu =
[
["",true],
	["Select zombie count:", [-1], "", -5, [["expression", ""]], "1", "0"],
	["1",[],"", -5,[["expression","zCount = 1;"]],"1","1"],
	["2",[],"", -5,[["expression","zCount = 2;"]],"1","1"],
	["3",[],"", -5,[["expression","zCount = 3;"]],"1","1"],
	["4",[],"", -5,[["expression","zCount = 4;"]],"1","1"],
	["5",[],"", -5,[["expression","zCount = 5;"]],"1","1"],
	["10",[],"", -5,[["expression","zCount = 10;"]],"1","1"],
	["20",[],"", -5,[["expression","zCount = 20;"]],"1","1"],
	["30",[],"", -5,[["expression","zCount = 30;"]],"1","1"],
	["40",[],"", -5,[["expression","zCount = 40;"]],"1","1"],
	["50",[],"", -5,[["expression","zCount = 50;"]],"1","1"],
	["100",[],"", -5,[["expression","zCount = 100;"]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", "zCount = -1;"]], "1", "1"]
];

showCommandingMenu "#USER:areaMenu";
waitUntil{(area != 0) || (commandingMenu == "")};
if(area == -1) exitWith{};

showCommandingMenu "#USER:amountMenu";
waitUntil{(zCount != 0) || (commandingMenu == "")};
if(zCount == -1) exitWith{};

if(logMajorTool) then {
	usageLogger = format["%1 %2 -- has spawned %3 zombies",name _player,getPlayerUID _player,zCount];
	[] spawn {publicVariable "usageLogger";};
};

_i = 1;
for "_i" from 1 to zCount do {
	[zTypes] spawn {
		zTypes = _this select 0;
		_setZedType = zTypes call BIS_fnc_selectRandom;
		_zCreate = createAgent [_setZedType, position player, [], area, "NONE"];
		_zPos = getPosATL _zCreate;
		[_zPos,_zCreate] execFSM "\z\addons\dayz_code\system\zombie_agent.fsm";
	};
};

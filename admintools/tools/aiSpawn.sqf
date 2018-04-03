private ["_player","_done"];
if (!("ItemGPS" in items player)) then {player addweapon "ItemGPS";};
EAT_aiArea = 0;
EAT_aiCount = 0;
_done = false;
EAT_aiSpawnType = "";

EAT_aiTypeMenu =
[
["",true],
	["Select AI Type:", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Hero",[],"", -5,[["expression","EAT_aiSpawnType = ""Hero"";"]],"1","1"],
	["Bandit",[],"", -5,[["expression","EAT_aiSpawnType = ""Bandit"";"]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", "EAT_aiArea = -1;"]], "1", "1"]
];

EAT_aiAreaMenu =
[
["",true],
	["Set AI Movement Radius:", [-1], "", -5, [["expression", ""]], "1", "0"],
	["40m",[],"", -5,[["expression","EAT_aiArea = 40;"]],"1","1"],
	["50m",[],"", -5,[["expression","EAT_aiArea = 50;"]],"1","1"],
	["75m",[],"", -5,[["expression","EAT_aiArea = 75;"]],"1","1"],
	["100m",[],"", -5,[["expression","EAT_aiArea = 100;"]],"1","1"],
	["150m",[],"", -5,[["expression","EAT_aiArea = 150;"]],"1","1"],
	["200m",[],"", -5,[["expression","EAT_aiArea = 200;"]],"1","1"],
	["300m",[],"", -5,[["expression","EAT_aiArea = 200;"]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", "EAT_aiArea = -1;"]], "1", "1"]
];

amountMenu =
[
["",true],
	["Select AI count:", [-1], "", -5, [["expression", ""]], "1", "0"],
	["1",[],"", -5,[["expression","EAT_aiCount = 1;"]],"1","1"],
	["2",[],"", -5,[["expression","EAT_aiCount = 2;"]],"1","1"],
	["4",[],"", -5,[["expression","EAT_aiCount = 4;"]],"1","1"],
	["6",[],"", -5,[["expression","EAT_aiCount = 6;"]],"1","1"],
	["8",[],"", -5,[["expression","EAT_aiCount = 8;"]],"1","1"],
	["10",[],"", -5,[["expression","EAT_aiCount = 10;"]],"1","1"],
	["20",[],"", -5,[["expression","EAT_aiCount = 20;"]],"1","1"],
	["30",[],"", -5,[["expression","EAT_aiCount = 30;"]],"1","1"],
	["40",[],"", -5,[["expression","EAT_aiCount = 40;"]],"1","1"],
	["50",[],"", -5,[["expression","EAT_aiCount = 50;"]],"1","1"],
	["", [], "", -5,[["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", "EAT_aiCount = -1;"]], "1", "1"]
];

showCommandingMenu "#USER:EAT_aiTypeMenu";
waitUntil{(EAT_aiSpawnType != "") || (commandingMenu == "")};
if(EAT_aiSpawnType == "") exitWith{};

showCommandingMenu "#USER:EAT_aiAreaMenu";
waitUntil{(EAT_aiArea != 0) || (commandingMenu == "")};
if(EAT_aiArea == 0) exitWith{};

showCommandingMenu "#USER:amountMenu";
waitUntil{(EAT_aiCount != 0) || (commandingMenu == "")};
if(EAT_aiCount == 0) exitWith{};


_player = player;

if(EAT_logMajorTool) then {
	EAT_PVEH_usageLogger = format["%1 %2 -- has added %3 AI units",name _player,getPlayerUID _player,EAT_aiCount];
	[] spawn {publicVariable "EAT_PVEH_usageLogger";};
};

EAT_SpawnAI = {
	private ["_divisor","_aiPosition"];
	_divisor = _this select 0;
	_aiPosition = [_this select 1, _this select 2,_this select 3];

	EAT_PVEH_aiSpawn = [EAT_aiSpawnType,EAT_aiArea,EAT_aiCount,_divisor,_aiPosition,player,(getPos player),dayz_authKey];
	publicVariableServer "EAT_PVEH_aiSpawn";

};

EAT_aiSpawnSelection = {
	private ["_pos1","_pos2","_pos3"];
	_pos1 = _this select 0;
	_pos2 = _this select 1;
	_pos3 = _this select 2;
	if(EAT_aiCount %5 == 0) then {
		[5,_pos1,_pos2,_pos3] call EAT_SpawnAI;
		[5,_pos1,_pos2,_pos3] call EAT_SpawnAI;
		[5,_pos1,_pos2,_pos3] call EAT_SpawnAI;
		[5,_pos1,_pos2,_pos3] call EAT_SpawnAI;
		[5,_pos1,_pos2,_pos3] call EAT_SpawnAI;
	} else {
		if(EAT_aiCount %4 == 0) then {
			[4,_pos1,_pos2,_pos3] call EAT_SpawnAI;
			[4,_pos1,_pos2,_pos3] call EAT_SpawnAI;
			[4,_pos1,_pos2,_pos3] call EAT_SpawnAI;
			[4,_pos1,_pos2,_pos3] call EAT_SpawnAI;
		} else {
			if(EAT_aiCount %2 == 0) then {
				[2,_pos1,_pos2,_pos3] call EAT_SpawnAI;
				[2,_pos1,_pos2,_pos3] call EAT_SpawnAI;
			} else {
				[1,_pos1,_pos2,_pos3] call EAT_SpawnAI;
			};
		};
	};
	openMap [false, false];
	TitleText [format[""], "PLAIN DOWN"];
	_done = true;
};

closedialog 0;
uiSleep 0.5;
format["Click on the map to spawn AI"] call dayz_rollingMessages;

if(!(visibleMap)) then {
	openMap [true, false];
};

onMapSingleClick '[_pos select 0, _pos select 1, _pos select 2] call EAT_aiSpawnSelection';
waitUntil{_done || !(visibleMap)};
onMapSingleClick "";
/*
	Add or remove the selected humanity amount from player.
*/

private ["_target","_player","_humanity","_addOrRemove"];
_addOrRemove = _this select 0;
_target = cursorTarget;
_player = player;

if(!isPlayer _target) then {_target = _player;};

humanityGain = -1;
_humanity = _target getVariable["humanity", 0];

if(_addOrRemove != "reset") then {
	EAT_humanityChange = [
		["",true],
		["Select humanity amount:", [-1], "", 0, [["expression", ""]], "1", "0"],
		["100", [2], "", -5, [["expression", "humanityGain=100;"]], "1", "1"],
		["500", [3], "", -5, [["expression", "humanityGain=500;"]], "1", "1"],
		["1000", [4], "", -5, [["expression", "humanityGain=1000;"]], "1", "1"],
		["2500", [5], "", -5, [["expression", "humanityGain=2500;"]], "1", "1"],
		["5000", [6], "", -5, [["expression", "humanityGain=5000;"]], "1", "1"],
		["Exit", [8], "", 0, [["expression", ""]], "1", "1"]
	];

	showCommandingMenu "#USER:EAT_humanityChange";
	waitUntil{(commandingMenu == "")};
	if((humanityGain == -1)) exitWith {};

	if(_addOrRemove == "remove") then {
		humanityGain = humanityGain - (humanityGain * 2);
	};

	_target setVariable["humanity", _humanity + humanityGain, true];
	cutText [format["%1 humanity has been added (total: %2) for player %3", humanityGain, _humanity + humanityGain, name _target],"PLAIN DOWN"]; titleFadeOut 10;

	// Tool use logger
	if(EAT_logMinorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has added %3 to %4's humanity (total %5)",name _player,getPlayerUID _player,humanityGain,name _target,_humanity + humanityGain];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};
}else{
	humanityGain = _humanity - (_humanity * 2);
	_target setVariable["humanity", 2500, true];
	cutText [format["Humanity reset to 2500 for player %1", name _target],"PLAIN DOWN"]; titleFadeOut 10;

	// Tool use logger
	if(EAT_logMinorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has RESET %3's humanity to 2500",name _player,getPlayerUID _player,name _target];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};
};


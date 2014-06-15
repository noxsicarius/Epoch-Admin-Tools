/*
	Adds the selected humanity to the current or targetted player (if one exists).
	Known issue: can set humanity on non-player targets such as AI (or traders in Epoch).
*/
_target = cursorTarget;

humanityAddScreen = [
	["",true],
	["Select humanity to add:", [-1], "", 0, [["expression", "humanity=false;"]], "1", "0"],
	["+100", [2], "", -5, [["expression", "humanityGain=100;selector=true;"]], "1", "1"],
	["+500", [3], "", -5, [["expression", "humanityGain=500;selector=true;"]], "1", "1"],
	["+1000", [4], "", -5, [["expression", "humanityGain=1000;selector=true;"]], "1", "1"],
	["+2500", [5], "", -5, [["expression", "humanityGain=2500;selector=true;"]], "1", "1"],
	["+5000", [6], "", -5, [["expression", "humanityGain=5000;selector=true;"]], "1", "1"],
	["+10000", [7], "", -5, [["expression", "humanityGain=10000;selector=true;"]], "1", "1"],
	["Exit", [8], "", 0, [["expression", "humanity=false;"]], "1", "1"]
];

showCommandingMenu "#USER:humanityAddScreen";
waitUntil{selector};

if(selector) then
{
	selector = false;
	
	if(isNull(_target)) then {
		_humanity = player getVariable["humanity", 0];
		player setVariable["humanity", _humanity + humanityGain, true];
		
		cutText [format["%1 humanity has been added (total: %2) for player %3", humanityGain, _humanity + humanityGain, name player],"PLAIN DOWN"]; titleFadeOut 10;
	} else {
		if(_target isKindOf "Man") then {
			_humanity = _target getVariable["humanity", 0];
			_target setVariable["humanity", _humanity + humanityGain, true];
			
			cutText [format["%1 humanity has been added (total: %2) for player %3", humanityGain, _humanity + humanityGain, name _target],"PLAIN DOWN"]; titleFadeOut 10;
		};
	};
};

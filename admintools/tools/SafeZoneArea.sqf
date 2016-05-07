/*
*	This script is similar to god mode safezone scripts for traders.
*	It will creates a safe zone of the selected radius with the admin as the center point.
*	The zone is static and does not move with the admin that created it.
*	The zone can be deleted by reselecting the option.
*	Players who leave the zone area lose god mode immediately.
*	If the zone is deleted, all players inside the zone will lose the god mode.
*/

EAT_areaGodMode = !EAT_areaGodMode;

radius = 0;

if(EAT_areaGodMode) then {
	_godModeRadius = 
	[
		["",true],
		["Select radius:", [-1], "", -5, [["expression", ""]], "1", "0"], 	
		["5", [2], "", -5, [["expression", "radius=5;"]], "1", "1"],
		["10", [3], "", -5, [["expression", "radius=10;"]], "1", "1"],
		["25", [4], "", -5, [["expression", "radius=25;"]], "1", "1"],
		["50", [5], "", -5, [["expression", "radius=50;"]], "1", "1"],
		["100", [6], "", -5, [["expression", "radius=100;"]], "1", "1"],
		["200", [7], "", -5, [["expression", "radius=200;"]], "1", "1"],
		["500", [8], "", -5, [["expression", "radius=500;"]], "1", "1"],	
		["Exit", [13], "", -3, [["expression", "radius = -1;"]], "1", "1"]	
	];
	showCommandingMenu "#USER:_godModeRadius";
	WaitUntil{(radius !=0) || (commandingMenu == "")};
	if(radius <= 0) exitWith{EAT_areaGodMode = true;};

	EAT_PVEH_safeZone = [[getPos player,radius]];
	[] spawn {publicVariableServer "EAT_PVEH_safeZone"};
} else {
	EAT_PVEH_safeZone = [[]];
	[] spawn {publicVariableServer "EAT_PVEH_safeZone"};
};
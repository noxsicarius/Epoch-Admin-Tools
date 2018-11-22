private ["_Secondary","_onLadder","_player"];

if (isInTraderCity) exitWith {"You cannot commit suicide in a Trader City" call dayz_rollingMessages};

_player = player;
_Secondary = currentWeapon _player;

suicide_answer=nil;

if (_player getVariable["inCombat",false]) exitWith {"You are in combat" call dayz_rollingMessages;};

DamiSpawn = 
[
	["Suicide Confirmation",true],
	["Are you sure?", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
	["No", [2], "", -5, 	[["expression", "suicide_answer=false;"]], "1", "1"],
	["Yes", [3], "", -5, 	[["expression", "suicide_answer=true;"]], "1", "1"],
	["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
	["Exit", [-1], "", -3, 	[["expression", "suicide_answer=false;"]], "1", "1"]
];
showCommandingMenu "#USER:DamiSpawn";

waitUntil {((!isNil 'suicide_answer')||(commandingMenu == ""))};

if (isNil 'suicide_answer') then {suicide_answer=false;};

if (suicide_answer) then {
	"You have grown tired of this endless battle." call dayz_rollingMessages;
	_player playmove "ActsPercMstpSnonWpstDnon_suicide1B";
	uiSleep 8.4;
	_player fire _Secondary;
	_selection = "body";
	[player,'suicide'] call player_death;
};

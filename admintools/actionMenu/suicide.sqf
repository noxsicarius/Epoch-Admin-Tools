private ["_Secondary","_onLadder","_canDo"];

_Secondary = currentWeapon player;
_canDo = call fnc_actionAllowed;

suicide_answer=nil;

if(!_canDo) exitWith {cutText ["You are already performing an action","PLAIN DOWN"];};
if (dayz_combat == 1) exitWith {cutText ["", "PLAIN DOWN"];};

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
	cutText["You have grown tired of this endless battle.","PLAIN DOWN"];
	player playmove "ActsPercMstpSnonWpstDnon_suicide1B";
	sleep 8.4;
	player fire _Secondary;
	_selection = "body";
	player setHit["body",1];
};

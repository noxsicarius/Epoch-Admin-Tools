private ["_obj","_objectID","_objectUID","_cnt","_player","_text"];

_obj = cursorTarget;
_player = player;
_cnt = 0;
_text = getText (configFile >> "CfgVehicles" >> typeOf _obj >> "displayName");
EAT_databaseRemove = 0;

if(isNull _obj) exitWith{"No object selected" call dayz_rollingMessages;};

_objectID = _obj getVariable["ObjectID","0"];
_objectUID = _obj getVariable["ObjectUID","0"];

_deleteMenu =
[
["",true],
	["Delete this Object?:", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Yes",[],"", -5,[["expression","EAT_databaseRemove = 1;"]],"1","1"],
	["No", [20], "", -5, [["expression", "EAT_databaseRemove = -1"]], "1", "1"]
];
showCommandingMenu "#USER:_deleteMenu";
waitUntil{(EAT_databaseRemove != 0) || (commandingMenu == "")};
if(EAT_databaseRemove <= 0) exitWith{};


// Tool use logger
if(EAT_logMinorTool && !isNull _obj) then {
	EAT_PVEH_usageLogger = format["%1 %2 -- has deleted object: %3 ID:%4 UID:%5 from database",name _player,getPlayerUID _player,_text,_objectID,_objectUID];
	publicVariableServer "EAT_PVEH_usageLogger";
};

format["Deleted %1",_text] call dayz_rollingMessages;

PVDZ_obj_Destroy = [_objectID,_objectUID,_player,_obj,dayz_authKey];
publicVariableServer "PVDZ_obj_Destroy";

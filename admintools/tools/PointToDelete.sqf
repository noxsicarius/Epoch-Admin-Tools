private ["_delobj","_player","_objectID","_objectUID"];
_player = player;

_delobj = cursorTarget;
deleteVehicle _delobj;

_objectID = _delobj getVariable ["ObjectID", "0"];
_objectUID = _delobj getVariable ["ObjectUID", "0"];

PVDZ_obj_Destroy = [_objectID, _objectUID, (name _player)];
publicVariableServer "PVDZ_obj_Destroy";

_dotxt = format["%1 Destroyed and Deleted", _delobj];
titleText [_dotxt,"PLAIN DOWN"]; titleFadeOut 4;

// Tool use logger
if(EAT_logMinorTool) then {
	EAT_PVEH_usageLogger = format["%1 %2 -- has deleted %3",name _player,getPlayerUID _player,_delobj];
	[] spawn {publicVariable "EAT_PVEH_usageLogger";};
};

_delobj = cursorTarget;
deleteVehicle _delobj;
cursorTarget setdamage 1;

_dotxt = format["%1 Destroyed and Deleted", _delobj];
titleText [_dotxt,"PLAIN DOWN"]; titleFadeOut 4;

// Tool use logger
if(logMinorTool) then {
	usageLogger = format["%1 %2 -- has deleted %3",name player,getPlayerUID player,_delobj];
	[] spawn {publicVariable "usageLogger";};
};
// Tool use broadcaster
if(broadcastToolUse) then {
	useBroadcaster = format["Admin -- has deleted a %1",_delobj];
	[] spawn {publicVariableServer "useBroadcaster";};
};

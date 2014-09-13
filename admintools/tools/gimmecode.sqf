private ["_ownerID"];
_ownerID = cursorTarget getVariable ["CharacterID","0"];

if(_ownerID != "0") then {
	cutText [format["The Code is: %1",_ownerID], "PLAIN DOWN"];
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has viewed a locked item code: %3",name player,getPlayerUID player,_ownerID];
		[] spawn {publicVariable "usageLogger";};
	};
	// Tool use broadcaster
	if(!((getPlayerUID player) in SuperAdminList) && broadcastToolUse) then {
		useBroadcaster = format["%1 -- has viewed a locked item code",name player];
		[] spawn {publicVariableServer "useBroadcaster";};
	};
} else {
	cutText [format["Not a valid target.",_ownerID], "PLAIN DOWN"];
};
private["_hide"];
if(isNil "invis") then {invis = true;} else {invis = !invis};

_hide = format["{ if(((getPlayerUID _x) == '%1')) then { _x hideObject %2; }; } forEach playableUnits;", (getPlayerUID player), invis];
sleep 0.1;
player setVehicleInit _hide;
sleep 0.1;
processInitCommands;
sleep 0.1;
clearVehicleInit player;

// Tool use broadcaster
if(!((getPlayerUID player) in SuperAdminList) && broadcastToolUse) then {
	useBroadcaster = format["%1 -- has used vehicle god mode",name player];
	[] spawn {publicVariableServer "useBroadcaster";};
};

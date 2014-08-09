// Temporary repair
private["_ct"];

_ct = cursorTarget;
_ct setdammage 0;
_ct setvehicleammo 1;
_ct setfuel 1;

cutText ["Repaired until next server restart.", "PLAIN DOWN"];

// Tool use logger
if(logMinorTool) then {
	usageLogger = format["%1 %2 -- has temporarily repaired/refueld %3",name player,getPlayerUID player,_ct];
	[] spawn {publicVariable "usageLogger";};
};

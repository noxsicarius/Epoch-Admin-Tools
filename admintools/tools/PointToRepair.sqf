// Temporary repair
private["_ct","_player"];

_ct = cursorTarget;

if(_ct isNull) exitWith{cutText ["No target", "PLAIN DOWN"];};

_ct setdammage 0;
_ct setvehicleammo 1;
_ct setfuel 1;
_player = player;

cutText ["Repaired until next server restart.", "PLAIN DOWN"];

// Tool use logger
if(logMinorTool) then {
	usageLogger = format["%1 %2 -- has temporarily repaired/refueld %3",name _player,getPlayerUID _player,_ct];
	[] spawn {publicVariable "usageLogger";};
};

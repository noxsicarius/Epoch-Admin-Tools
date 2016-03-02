_obj = _this select 0;
if(_obj isNull)exitWith{cutText["No target","PLAIN DOWN"];};

_pos = getPos _obj;
_text = format["Position of %1 is: %2",_obj,_pos];

cutText["Saved to client RPT and EAT logs","PLAIN DOWN"];
diag_log (_text);
usageLogger = _text;
[] spawn {publicVariable "usageLogger";};
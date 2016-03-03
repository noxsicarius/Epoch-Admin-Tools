_obj = _this select 0;

_pos = getPos _obj;
_text = format["Position of %1 is: %2",_obj,_pos];

cutText["Saved to client RPT and EAT logs","PLAIN DOWN"];
diag_log (_text);
EAT_PVEH_usageLogger = _text;
[] spawn {publicVariable "EAT_PVEH_usageLogger";};
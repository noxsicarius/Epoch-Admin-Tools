_obj = _this select 0;

_pos = getPos _obj;
_text = format["Position of %1 is: %2",_obj,_pos];
"Saved to client RPT and EAT logs" call dayz_rollingMessages;
diag_log (_text);

if (EAT_logMinorTool) then {
  EAT_PVEH_usageLogger = _text;
  publicVariableServer "EAT_PVEH_usageLogger";
};

_delobj = cursorTarget;
deleteVehicle _delobj;
cursorTarget setdamage 1;

_dotxt = format["%1 Destroyed and Deleted", _delobj];
titleText [_dotxt,"PLAIN DOWN"]; titleFadeOut 4;
_obj = cursortarget;

if (!isNull _obj) then {
	_charID = _obj getVariable ["CharacterID","0"];
	_objID 	= _obj getVariable["ObjectID","0"];
	_objUID	= _obj getVariable["ObjectUID","0"];
	_lastUpdate = _obj getVariable ["lastUpdate",time];
		
	systemchat format["%1: charID: %2, objID: %3, objUID: %4, lastUpdate: %5",typeOF _obj,_charID,_objID,_objUID,_lastUpdate];
};

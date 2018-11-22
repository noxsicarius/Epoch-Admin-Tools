_obj = cursortarget;

if (!isNull _obj) then {
	_charID = _obj getVariable ["CharacterID","0"];
	_objID 	= _obj getVariable["ObjectID","0"];
	_objUID	= _obj getVariable["ObjectUID","0"];
	_lastUpdate = _obj getVariable ["lastUpdate",time];
	_owner = _obj getVariable["ownerPUID","0"];
		
	systemChat format["%1: charID: %2, objID: %3, objUID: %4, Owner %5, lastUpdate: %6",typeOF _obj,_charID,_objID,_objUID,_owner,_lastUpdate];
};

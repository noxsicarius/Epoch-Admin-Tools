private ["_ownerID"];
_ownerID = cursorTarget getVariable ["CharacterID","0"];

if(_ownerID != "0") then {
	cutText [format["The Code is: %1",_ownerID], "PLAIN DOWN"];
} else {
	cutText [format["Not a valid target.",_ownerID], "PLAIN DOWN"];
};
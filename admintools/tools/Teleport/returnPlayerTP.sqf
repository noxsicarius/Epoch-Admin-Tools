private["_UID","_player","_pos"];

if(isNil "EAT_returnPlayer") exitWith {cutText ["No return player available", "PLAIN DOWN"];};

_player = (EAT_returnPlayer select 0);
_pos = (EAT_returnPlayer select 1);
_UID = (getPlayerUID _player);

EAT_PVEH_teleportFix = ["add",_UID];
publicVariableServer "EAT_PVEH_teleportFix";

titleText[format["Teleporting %1", name _player],"PLAIN DOWN"];

Sleep 1; // Give the clients time to receive the propagated antihack bypass.

_player setPos _pos;
EAT_returnPlayer = nil;

// Leave the client in the bypass list for a short time to let the server register their new position
Sleep 3;
EAT_PVEH_teleportFix = ["remove",_UID];
[] spawn {publicVariableServer "EAT_PVEH_teleportFix"};


private ["_skin"];
_skin = _this select 0;
[dayz_playerUID,dayz_characterID,_skin] spawn player_humanityMorph;
sleep 1;
private["_animal","_player","_vehicle"];

_animal = _this select 0;
_player = player;
_vehicle = vehicle _player;

if(_player == _vehicle) then {
	removeBackpack _vehicle;
	removeAllWeapons _vehicle;
	removeAllItems _vehicle;
	[dayz_playerUID,dayz_characterID,_animal]spawn player_humanityMorph;
};
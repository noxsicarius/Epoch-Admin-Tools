private["_bag","_player"];
_bag = _this select 0;
_player = player;
removebackpack _player;
_player addBackpack _bag;
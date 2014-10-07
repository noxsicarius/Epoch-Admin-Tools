private["_animal"];
_animal = _this select 0;
removeBackpack (vehicle player);
removeAllWeapons (vehicle player);
removeAllItems (vehicle player);
[dayz_playerUID,dayz_characterID,_animal]spawn player_humanityMorph;
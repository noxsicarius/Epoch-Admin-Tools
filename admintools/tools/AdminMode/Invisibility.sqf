private["_hide", "_skin"];
_skin = _this select 0;
_hide = format["{ if((getPlayerUID _x) == '%1') then { _x hideObject %2; }; } forEach playableUnits;", (getPlayerUID player), _skin];
sleep 0.1;
player setVehicleInit _hide;
sleep 0.1;
processInitCommands;
sleep 0.1;
clearVehicleInit player;
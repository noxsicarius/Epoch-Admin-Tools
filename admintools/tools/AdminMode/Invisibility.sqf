private["_nyan", "_mo"];
_mo = _this select 0;
_nyan = format["{ if((getPlayerUID _x) == '%1') then { _x hideObject %2; }; } forEach playableUnits;", (getPlayerUID player), _mo];
sleep 0.1;
player setVehicleInit _nyan;
sleep 0.1;
processInitCommands;
sleep 0.1;
clearVehicleInit player;
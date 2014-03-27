// Toggle grass on or off
private ["_grassToggle"];
_grassToggle = _this select 0;

if (_grassToggle) then {
	setterraingrid 50;
}else{
	setterraingrid 25;
};
// Toggle grass on or off for better visibility/performance
private ["_toggle"];
if(isNil "EAT_PlayerGrassToggle") then {EAT_PlayerGrassToggle = true;} else {EAT_PlayerGrassToggle = !EAT_PlayerGrassToggle};

if (EAT_PlayerGrassToggle) then {
	_toggle = "on";
	setterraingrid 50;
}else{
	_toggle = "off";
	setterraingrid 25;
};
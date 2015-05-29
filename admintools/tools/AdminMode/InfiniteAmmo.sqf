/* 
	Gives the user infinite ammo.
	It can often cause the user to lose all ammo after logout
	The possibility of ammo loss after logging can be lessened by turning off the script first
*/
if(isNil "infAmmo2") then {infAmmo2 = true;} else {infAmmo2 = !infAmmo2};
if(infAmmo2) then {
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has turned ON infinite ammo",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};
};

while {alive (vehicle player) && infAmmo2} do
{
	vehicle player setVehicleAmmo 1;
	vehicle player setUnitRecoilCoefficient 0;
	sleep 0.1;
};
vehicle player setUnitRecoilCoefficient 1;

// Tool use logger
if(logMajorTool) then {
	usageLogger = format["%1 %2 -- has turned OFF infinite ammo",name player,getPlayerUID player];
	[] spawn {publicVariable "usageLogger";};
};

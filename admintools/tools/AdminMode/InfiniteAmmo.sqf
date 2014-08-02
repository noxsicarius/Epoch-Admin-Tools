/* 
	Gives the user infinite ammo.
	It can often cause the user to lose all ammo after logging out or
	after a server restart due to how the server handles this.
	The possibility of ammo loss after logging can be lessened by turning off the script 
	before leaving.
*/
	
infAmmo = _this select 0;

if(infAmmo) then {
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has turned ON infinite ammo",name player,getPlayerUID player];
		publicVariable "usageLogger";
	};
	// Tool use broadcaster
	if(broadcastToolUse) then {
		{
			systemChat "Admin -- has used infinite ammo";
		} forEach playableUnits;
	};

};

while {alive (vehicle player) && infAmmo} do
{
	vehicle player setVehicleAmmo 1;
	vehicle player setUnitRecoilCoefficient 0;
	sleep 0.1;
};
vehicle player setUnitRecoilCoefficient 1;
// Tool use logger
if(logMajorTool) then {
	usageLogger = format["%1 %2 -- has turned OFF infinite ammo",name player,getPlayerUID player];
	publicVariable "usageLogger";
};

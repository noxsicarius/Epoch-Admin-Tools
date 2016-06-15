/* 
	Gives the user infinite ammo.
	It can often cause the user to lose all ammo after logout
	The possibility of ammo loss after logging can be lessened by turning off the script first
*/
if(isNil "EAT_infAmmo2") then {EAT_infAmmo2 = true;} else {EAT_infAmmo2 = !EAT_infAmmo2};
if(EAT_infAmmo2) then {
	// Tool use logger
	if(EAT_logMajorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has turned ON infinite ammo",name player,getPlayerUID player];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};
};

while {alive (vehicle player) && EAT_infAmmo2} do
{
	vehicle player setVehicleAmmo 1;
	vehicle player setUnitRecoilCoefficient 0;
	sleep 0.1;
};
vehicle player setUnitRecoilCoefficient 1;

// Tool use logger
if(EAT_logMajorTool) then {
	EAT_PVEH_usageLogger = format["%1 %2 -- has turned OFF infinite ammo",name player,getPlayerUID player];
	[] spawn {publicVariable "EAT_PVEH_usageLogger";};
};

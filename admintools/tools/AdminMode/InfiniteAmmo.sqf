/* 
	Gives the user infinite ammo.
	It can often cause the user to lose all ammo after logging out or
	after a server restart due to how the server handles this.
	The possibility of ammo loss after logging can be lessened by turning off the script 
	before leaving.
*/
	
infAmmo = _this select 0;
while {alive (vehicle player) && infAmmo} do
{
	vehicle player setVehicleAmmo 1;
	vehicle player setUnitRecoilCoefficient 0;
	sleep 0.1;
};
vehicle player setUnitRecoilCoefficient 1;
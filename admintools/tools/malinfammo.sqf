infAmmo = _this select 0;
while {alive (vehicle player) && infAmmo} do
{
	vehicle player setVehicleAmmo 1;
	vehicle player setUnitRecoilCoefficient 0;
	sleep 0.01;
};
vehicle player setUnitRecoilCoefficient 1;
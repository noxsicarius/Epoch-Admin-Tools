infAmmo = _this select 0;

if (infAmmo) then
{
	while {infAmmo} do
	{
	vehicle player setVehicleAmmo 0.99;
	vehicle player setUnitRecoilCoefficient 0;
	sleep 0.01;
	}
};





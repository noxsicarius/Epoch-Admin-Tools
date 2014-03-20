private ["_infAmmo"];
_infAmmo = _this select 0;

if (_infAmmo) then
{
	while {_infAmmo} do
	{
	vehicle player setVehicleAmmo 0.99;
	vehicle player setUnitRecoilCoefficient 0;
	sleep 0.01;
	}
};





// Malory's Infinite Ammo 

if (isnil "malinfam" ) then {malinfam=0};

if (malinfam==0) then
{
	malinfam=1;
	hint "Infinite Ammo and No Recoil - ON";
	while {malinfam==1} do
	{
	vehicle player setVehicleAmmo 0.99;
	vehicle player setUnitRecoilCoefficient 0;
	sleep 0.01;
	}

}
else
{
hint "Infinite Ammo and No Recoil - OFF";
malinfam=0;
};





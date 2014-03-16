// Malory's Infinite Ammo 

if (isnil "malinfam" ) then {malinfam=true;} else {malinfam = !malinfam;};

if (malinfam) then
{
	hint "Infinite Ammo and No Recoil - ON";
	while {malinfam} do
	{
	vehicle player setVehicleAmmo 0.99;
	vehicle player setUnitRecoilCoefficient 0;
	sleep 0.01;
	}

}
else{hint "Infinite Ammo and No Recoil - OFF";};





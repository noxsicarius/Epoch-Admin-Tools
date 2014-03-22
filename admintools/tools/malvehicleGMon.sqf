/*
Not 100% god mode. There is a chance the car can still be blown
up, but the chance is small. This will be a good script until
a better solution is found. DOES NOT interfere with normal god mode
*/
private ["_vehicleGod"];
_vehicleGod = _this select 0;

while{alive (vehicle player) && _vehicleGod} do
{
	vehicle player setfuel 1;
	vehicle player setdammage 0;
	vehicle player setvehicleammo 1;
	
	sleep 0.001;
};
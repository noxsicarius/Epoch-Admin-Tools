// Toggle grass on or off
// last edit: NoxSicarius

if(isNil "grassToggle") then
{
	grassToggle = 0;
};

if (grassToggle == 0) then 
{
	grassToggle = 1;
	cutText ["Grass - OFF", "PLAIN DOWN"];
	setterraingrid 50;
}
else
{
	grassToggle = 0;
	cutText ["Grass - ON", "PLAIN DOWN"];
	setterraingrid 25;};
};



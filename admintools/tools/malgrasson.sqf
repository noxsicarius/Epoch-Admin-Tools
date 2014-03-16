// Toggle grass on or off
if(isNil "grassToggle") then{grassToggle = true;} else {grassToggle = !grassToggle;};

if (grassToggle) then 
{
	cutText ["Grass - OFF", "PLAIN DOWN"];
	setterraingrid 50;
}
else
{
	cutText ["Grass - ON", "PLAIN DOWN"];
	setterraingrid 25;};
};
_max = 10; snext = false; plist = []; pselect5 = "";
{if ((_x != player) && (getPlayerUID _x != "")) then {plist set [count plist, name _x];};} forEach entities "CAManBase";
{if ((count crew _x) > 0) then {{if ((_x != player) && (getPlayerUID _x != "")) then {plist set [count plist, name _x];};} forEach crew _x;};} foreach (entities "LandVehicle" + entities "Air" + entities "Ship");

pMenuTitle = "Teleport to Player:";

_j = 0;

while {pselect5 == ""} do
{
	[_j, (_j + _max) min (count plist)] call fn_smenu; _j = _j + _max;
	WaitUntil {pselect5 != "" or snext};	
	snext = false;
};

if (pselect5 != "exit") then
{
	_name = pselect5;
	
	{
		if(name _x == _name) then
		{
			titleText[format["Teleporting to %1", _name],"PLAIN DOWN"];
			(vehicle player) attachTo [_x, [2, 2, 0]];
			sleep 0.25;
			detach (vehicle player);

			// Tool use logger
			if(logMajorTool) then {
				usageLogger = format["%1 %2 -- has teleported to %3_%4",name player,getPlayerUID player,_name,_x];
				[] spawn {publicVariable "usageLogger";};
			};
		};
	} forEach entities "CAManBase";
};
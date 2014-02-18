if (isnil "maltele" ) then {maltele=0};

if (maltele==0) then
{
	player addweapon "ItemGPS";
	maltele=1;
};

closedialog 0;
sleep 0.5;
TitleText [format["Click on the map to Tele-Port"], "PLAIN DOWN"];

openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] execVM ""admintools\tools\Malteleport1.sqf""; True";

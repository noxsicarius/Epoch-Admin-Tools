private ["_mycv","_n2sh","_n2c","_pmenu","_name"];

_mycv = cameraView;
_n2sh = 10;  
_n2c = "Select Player:";
shnext = false;
nlist = [];  
selecteditem = "";
spectate = true;

{if (_x != player) then {nlist set [count nlist, name _x];};} forEach playableUnits;
		
shnmenu = 
{
	_pmenu = [["",true],[_n2c, [-1], "", -5, [["expression", ""]], "1", "0"]];
	for "_i" from (_this select 0) to (_this select 1) do
	{_arr = [format['%1',nlist select (_i)], [_i - (_this select 0) + 2],  "", -5, [["expression", format["selecteditem = nlist select %1;",_i]]], "1", "1"];_pmenu set [_i+2, _arr];};
	if (count nlist >  (_this select 1)) then {_pmenu set [(_this select 1)+2, ["Next", [12], "", -5, [["expression", "shnext = true;"]], "1", "1"]];}
	else {_pmenu set [(_this select 1)+2, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];};
	_pmenu set [(_this select 1)+3, ["Exit", [13], "", -5, [["expression", "selecteditem = 'exitscript';"]], "1", "1"]];
	showCommandingMenu "#USER:_pmenu";
};
_j = 0; _n2sh = 10; if (_n2sh>9) then {_n2sh=10;};
while {selecteditem==""} do
{
	[_j,(_j+_n2sh) min (count nlist)] call shnmenu;_j=_j+_n2sh;
	WaitUntil {selecteditem!="" or shnext};	
	shnext = false;
};
	
if (selecteditem!= "exitscript") then
{
	_name = selecteditem;
	{
		if(format[name _x] == _name) then 
		{
			F6_Key = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 64) then {spectate = false;};"];	
			(vehicle _x) switchCamera "EXTERNAL";
			titleText ["F6 to return","PLAIN DOWN"];titleFadeOut 4;
			waitUntil { !(alive _x) or !(alive player) or !(spectate)};
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", F6_Key];
			player switchCamera _mycv;	

			// Tool use logger
			if(logMajorTool) then {
				usageLogger = format["%1 %2 -- has begun spectating %3",name player,getPlayerUID player,_name];
				[] spawn {publicVariable "usageLogger";};
			};
			// Tool use broadcaster
			if(!((getPlayerUID player) in SuperAdminList) && broadcastToolUse) then {
				useBroadcaster = format["%1 -- is spectating %2",name player,_name];
				[] spawn {publicVariableServer "useBroadcaster";};
			};
		};
	} forEach playableUnits;
};
spectate = false;
if (!spectate && selecteditem != "exitscript") then 
{	
	titleText ["Spectate done","PLAIN DOWN"];titleFadeOut 4;

	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has stopped spectating %3",name player,getPlayerUID player,_name];
		[] spawn {publicVariable "usageLogger";};
	};
};
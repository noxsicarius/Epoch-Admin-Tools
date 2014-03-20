if (isNil "godMode") then {godMode = true;};
if (isNil "carGodMode") then {carGodMode = true;};
if (isNil "playerESP") then {playerESP = true;};
if (isNil "grassOff") then {grassOff = true;};
if (isNil "infAmmo") then {infAmmo = true;};
if (isNil "invisibility") then {invisibility = false;};

if (isNil "modMode") then {modMode = true;}else{modMode = !modMode;};

godModeToggle = {
	godMode = !godMode;
	[godMode] execVM "admintools\tools\malplayerGM.sqf";
};
carGodModeToggle = {
	carGodMode = !carGodMode;
	[carGodMode] execVM "admintools\tools\malvehicleGMon.sqf";
};
playerESPToggle = {
	playerESP = !playerESP;
	[playerESP] execVM "admintools\tools\mallightesp.sqf";
};
grassOffToggle = {
	grassOff = !grassOff;
	[grassOff] execVM "admintools\tools\malgrasson.sqf";
};
infAmmoToggle = {
	infAmmo = !infAmmo;
	[infAmmo] execVM "admintools\tools\malinfammo.sqf";
};
invisibilityToggle = {
	invisibility = !invisibility;
	[] execVM "admintools\tools\malinvisinit.sqf";
};

optionMenu = 
{
	toggleMenu = 
	[
		["",true],
		["Toggle options:(current state)", [-1], "", -5, [["expression", ""]], "1", "0"],
		[format["Player ESP: %1",playerESP], [2], "", -5, [["expression", 'call playerESPToggle']], "1", "1"],
		[format["Invisibility ON: %1",invisibility], [3], "", -5, [["expression", 'call invisibilityToggle']], "1", "1"],
		[format["Infinite Ammo: %1",infAmmo], [4], "", -5, [["expression", 'call infAmmoToggle']], "1", "1"],
		[format["God Mode: %1",godMode], [5], "", -5, [["expression", 'call godModeToggle']], "1", "1"],
		[format["Car God Mode: %1",carGodMode], [6], "", -5, [["expression", 'call carGodModeToggle']], "1", "1"],
		[format["Grass Off: %1",grassOff], [7], "", -5, [["expression", 'call grassOffToggle']], "1", "1"]
	];
	showCommandingMenu "#USER:toggleMenu";
};

AdminToggle =
{
	if (playerESP) then {[playerESP] execVM "admintools\tools\mallightesp.sqf";};
	if (invisibility) then {[invisibility] execVM "admintools\tools\malinvisinit.sqf";};
	if (infAmmo) then {[infAmmo] execVM "admintools\tools\malinfammo.sqf";};
	if (godMode) then {[godMode] execVM "admintools\tools\malplayerGM.sqf";};
	if (carGodMode) then {[carGodMode] execVM "admintools\tools\malvehicleGMon.sqf";};
	if (grassOff) then {[grassOff] execVM "admintools\tools\malgrasson.sqf";};
};

if(AdminMode) then {
	cutText ["God Mode, Vehicle God Mode, ESP, Inf Ammo, and Grass OFF - ENABLED","PLAIN DOWN"];titleFadeOut 4;
	titleText ["***Press F4 to toggle Mod-Mode options***","PLAIN"];titleFadeOut 5;
	F4_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 62) then {call optionMenu;};"];
	call AdminToggle;
}
else{
	titleText ["Mod Mode - DISABLED","PLAIN DOWN"];titleFadeOut 3;
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", F4_KEY];
	call AdminToggle;
};

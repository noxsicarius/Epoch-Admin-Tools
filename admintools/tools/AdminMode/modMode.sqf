/* Below are the default ON/OFF toggles. Anything marked 
   true will turn on when you turn on AdminMode.
   To make an option default ON change = false to = true.
   To make an option default OFF change = true to = false.
*/

// START OF CONFIG
if (isNil "playerGod") then {playerGod = true;};
if (isNil "vehicleGod") then {vehicleGod = true;};
if (isNil "playerESP") then {playerESP = true;};
if (isNil "grassOff") then {grassOff = true;};
if (isNil "infAmmo") then {infAmmo = true;};
if (isNil "invisibility") then {invisibility = false;};
// END OF CONFIG

if (isNil "modMode") then {modMode = true;}else{modMode = !modMode;};

godModeToggle = {
	playerGod = !playerGod;
	[] execVM "admintools\tools\AdminMode\GodModePlayer.sqf";
};
carGodModeToggle = {
	vehicleGod = !vehicleGod;
	[] execVM "admintools\tools\AdminMode\GodModeVehicle.sqf";
};
playerESPToggle = {
	playerESP = !playerESP;
	[] execVM "admintools\tools\AdminMode\ESPplayer.sqf";
};
grassOffToggle = {
	grassOff = !grassOff;
	[] execVM "admintools\tools\AdminMode\GrassOFF.sqf";
};
infAmmoToggle = {
	infAmmo = !infAmmo;
	[] execVM "admintools\tools\AdminMode\InfiniteAmmo.sqf";
};
invisibilityToggle = {
	invisibility = !invisibility;
	[] execVM "admintools\tools\AdminMode\Invisibility.sqf";
};

// To disable an option for mods place a // in the front of the line below
// and change the initialization to false in the config at the top of this file
optionMenu = 
{
	toggleMenu = 
	[
		["",true],
		["Toggle options:(current state)", [-1], "", -5, [["expression", ""]], "1", "0"],
		[format["Player ESP: %1",playerESP], [2], "", -5, [["expression", 'call playerESPToggle']], "1", "1"],
		[format["Invisibility ON: %1",invisibility], [3], "", -5, [["expression", 'call invisibilityToggle']], "1", "1"],
		[format["Infinite Ammo: %1",infAmmo], [4], "", -5, [["expression", 'call infAmmoToggle']], "1", "1"],
		[format["God Mode: %1",playerGod], [5], "", -5, [["expression", 'call godModeToggle']], "1", "1"],
		[format["Car God Mode: %1",vehicleGod], [6], "", -5, [["expression", 'call carGodModeToggle']], "1", "1"],
		[format["Grass Off: %1",grassOff], [7], "", -5, [["expression", 'call grassOffToggle']], "1", "1"]
	];
	showCommandingMenu "#USER:toggleMenu";
};

modToggleON =
{
	if (playerESP) then {[] execVM "admintools\tools\AdminMode\ESPplayer.sqf";};
	if (invisibility) then {[] execVM "admintools\tools\AdminMode\Invisibility.sqf";};
	if (infAmmo) then {[] execVM "admintools\tools\AdminMode\InfiniteAmmo.sqf";};
	if (playerGod) then {[] execVM "admintools\tools\AdminMode\GodModePlayer.sqf";};
	if (vehicleGod) then {[] execVM "admintools\tools\AdminMode\GodModeVehicle.sqf";};
	if (grassOff) then {[] execVM "admintools\tools\AdminMode\GrassOFF.sqf";};
};

modToggleOFF =
{
	if (playerESP) then {[] execVM "admintools\tools\AdminMode\ESPplayer.sqf";};
	if (invisibility) then {[] execVM "admintools\tools\AdminMode\Invisibility.sqf";};
	if (infAmmo) then {[] execVM "admintools\tools\AdminMode\InfiniteAmmo.sqf";};
	if (playerGod) then {[] execVM "admintools\tools\AdminMode\GodModePlayer.sqf";};
	if (vehicleGod) then {[] execVM "admintools\tools\AdminMode\GodModeVehicle.sqf";};
	if (grassOff) then {[] execVM "admintools\tools\AdminMode\GrassOFF.sqf";};
};

if(modMode) then {
	cutText ["God Mode, Vehicle God Mode, ESP, Inf Ammo, and Grass OFF - ENABLED","PLAIN DOWN"];titleFadeOut 4;
	titleText ["***Press F4 to toggle Mod-Mode options***","PLAIN"];titleFadeOut 5;
	F4_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 62) then {call optionMenu;};"];
	call modToggleON;
}
else{
	titleText ["Mod Mode - DISABLED","PLAIN DOWN"];titleFadeOut 3;
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", F4_KEY];
	call modToggleOFF;
};

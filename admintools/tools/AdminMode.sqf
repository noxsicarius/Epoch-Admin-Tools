/* Below are the default ON/OFF toggles. Anything marked 
   true will turn on when you turn on AdminMode.
   To make an option default ON change = false to = true.
   To make an option default OFF change = true to = false.
*/

// START OF CONFIG
if (isNil "godMode") then {godMode = true;};
if (isNil "carGodMode") then {carGodMode = true;};
if (isNil "playerESP") then {playerESP = true;};
if (isNil "enhancedESP") then {enhancedESP = false;};
if (isNil "grassOff") then {grassOff = true;};
if (isNil "infAmmo") then {infAmmo = true;};
if (isNil "speedBoost") then {speedBoost = false;};
if (isNil "invisibility") then {invisibility = false;};
if (isNil "flying") then {flying = false;};
// END OF CONFIG

if (isNil "AdminMode") then {AdminMode = true;}else{AdminMode = !AdminMode;};

godModeToggle = {
	godMode = !godMode;
	[godMode] execVM "admintools\tools\GodModePlayer.sqf";
};
carGodModeToggle = {
	carGodMode = !carGodMode;
	[carGodMode] execVM "admintools\tools\GodModeVehicle.sqf";
};
playerESPToggle = {
	playerESP = !playerESP;
	[playerESP] execVM "admintools\tools\ESPplayer.sqf";
};
enhancedESPToggle = {
	enhancedESP = !enhancedESP;
	[enhancedESP] execVM "admintools\tools\ESPenhanced.sqf";
};
grassOffToggle = {
	grassOff = !grassOff;
	[grassOff] execVM "admintools\tools\GrassOFF.sqf";
};
infAmmoToggle = {
	infAmmo = !infAmmo;
	[infAmmo] execVM "admintools\tools\InfiniteAmmo.sqf";
};
speedBoostToggle = {
	speedBoost = !speedBoost;
	[speedBoost] execVM "admintools\tools\speedboost.sqf";
};
invisibilityToggle = {
	invisibility = !invisibility;
	[invisibility] execVM "admintools\tools\Invisibility.sqf";
};
flyingToggle = {
	flying = !flying;
	[flying] execVM "admintools\tools\Flying.sqf";
};

// To disable an option for admins place a // in the front of the line below
// and change the initialization to false in the config at the top of this file

optionMenu = 
{
	toggleMenu = 
	[
		["",true],
		["Toggle options:(current state)", [-1], "", -5, [["expression", ""]], "1", "0"],
		[format["Vehicle Speed Boost: %1",speedBoost],[2],"", -5, [["expression", 'call speedBoostToggle']], "1", "1"],		
		[format["Enhanced ESP: %1",enhancedESP], [3], "", -5, [["expression", 'call enhancedESPToggle']], "1", "1"],
		[format["Player ESP: %1",playerESP], [4], "", -5, [["expression", 'call playerESPToggle']], "1", "1"],
		[format["Invisibility ON: %1",invisibility], [5], "", -5, [["expression", 'call invisibilityToggle']], "1", "1"],
		[format["Infinite Ammo: %1",infAmmo], [6], "", -5, [["expression", 'call infAmmoToggle']], "1", "1"],
		[format["Flying ON: %1",flying], [7], "", -5, [["expression", 'call flyingToggle']], "1", "1"],
		[format["God Mode: %1",godMode], [8], "", -5, [["expression", 'call godModeToggle']], "1", "1"],
		[format["Car God Mode: %1",carGodMode], [9], "", -5, [["expression", 'call carGodModeToggle']], "1", "1"],
		[format["Grass Off: %1",grassOff], [10], "", -5, [["expression", 'call grassOffToggle']], "1", "1"]
	];
	showCommandingMenu "#USER:toggleMenu";
};

AdminToggleON =
{
	if (speedBoost) then {[speedBoost] execVM "admintools\tools\speedboost.sqf";};
	if (enhancedESP) then {[enhancedESP] execVM "admintools\tools\ESPenhanced.sqf";};
	if (playerESP) then {[playerESP] execVM "admintools\tools\ESPplayer.sqf";};
	if (invisibility) then {[invisibility] execVM "admintools\tools\Invisibility.sqf";};
	if (infAmmo) then {[infAmmo] execVM "admintools\tools\InfiniteAmmo.sqf";};
	if (flying) then {[flying] execVM "admintools\tools\Flying.sqf";};
	if (godMode) then {[godMode] execVM "admintools\tools\GodModePlayer.sqf";};
	if (carGodMode) then {[carGodMode] execVM "admintools\tools\GodModeVehicle.sqf";};
	if (grassOff) then {[grassOff] execVM "admintools\tools\GrassOFF.sqf";};
};

AdminToggleOFF =
{
	if (speedBoost) then {[!speedBoost] execVM "admintools\tools\speedboost.sqf";};
	if (enhancedESP) then {[!enhancedESP] execVM "admintools\tools\ESPenhanced.sqf";};
	if (playerESP) then {[!playerESP] execVM "admintools\tools\ESPplayer.sqf";};
	if (invisibility) then {[!invisibility] execVM "admintools\tools\Invisibility.sqf";};
	if (infAmmo) then {[!infAmmo] execVM "admintools\tools\InfiniteAmmo.sqf";};
	if (flying) then {[!flying] execVM "admintools\tools\Flying.sqf";};
	if (godMode) then {[!godMode] execVM "admintools\tools\GodModePlayer.sqf";};
	if (carGodMode) then {[!carGodMode] execVM "admintools\tools\GodModeVehicle.sqf";};
	if (grassOff) then {[!grassOff] execVM "admintools\tools\GrassOFF.sqf";};
};

if(AdminMode) then {
	cutText ["God Mode, Vehicle God Mode, ESP, Inf Ammo, and Grass OFF - ENABLED","PLAIN DOWN"];titleFadeOut 4;
	titleText ["***Press F4 to toggle AdminMode options***","PLAIN"];titleFadeOut 5;
	F4_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 62) then {call optionMenu;};"];
	call AdminToggleON;
}
else{
	titleText ["Admin Mode - DISABLED","PLAIN DOWN"];titleFadeOut 3;
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", F4_KEY];
	call AdminToggleOFF;
};
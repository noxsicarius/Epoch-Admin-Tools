/* Below are the default ON/OFF toggles. Anything marked 
   true will turn on when you turn on AdminMode.
   To make an option default ON change = false to = true.
   To make an option default OFF change = true to = false.
*/

if (isNil "modMode") then {modMode = true;}else{modMode = !modMode;};

// To disable an option for mods place a // in the front of the line below
// and change the initialization to false in the config at the top of this file
optionMenu = 
{
	toggleMenu = 
	[
		["",true],
		["Toggle options:(current state)", [-1], "", -5, [["expression", ""]], "1", "0"],
		[format["Player ESP: %1",EAT_playerESP], [4], "", -5, [["expression", 'call EAT_playerESPToggle']], "1", "1"],
		[format["Fast Walk: %1",EAT_fastWalk],[2],"", -5, [["expression", 'call EAT_fastWalkToggle']], "1", "1"],
		[format["Invisibility ON: %1",EAT_invisibility], [5], "", -5, [["expression", 'call EAT_invisibilityToggle']], "1", "1"],
		[format["Infinite Ammo: %1",EAT_infAmmo], [7], "", -5, [["expression", 'call EAT_infAmmoToggle']], "1", "1"],
		[format["God Mode: %1",EAT_playerGod], [8], "", -5, [["expression", 'call EAT_playerGodToggle']], "1", "1"],
		[format["Car God Mode: %1",EAT_vehicleGod], [9], "", -5, [["expression", 'call EAT_vehicleGodToggle']], "1", "1"],
		[format["Grass Off: %1",EAT_grassOff], [10], "", -5, [["expression", 'call EAT_grassOffToggle']], "1", "1"]
	];
	showCommandingMenu "#USER:toggleMenu";
};

if(modMode) then {
	titleText ["***Press F4 to toggle Mod-Mode options***","PLAIN"];titleFadeOut 5;
	F4_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 62) then {call optionMenu;};"];
}else{
	titleText ["Mod Mode - DISABLED","PLAIN DOWN"];titleFadeOut 3;
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", F4_KEY];
};

call EAT_AdminToggle;

if (isNil "AdminModeToggle") then {AdminModeToggle = true;}else{AdminModeToggle = !AdminModeToggle};
[] execVM "admintools\tools\malplayerGM.sqf";
[] execVM "admintools\tools\malvehicleGMon.sqf";
[] execVM "admintools\tools\malinfammo.sqf";
[] execVM "admintools\tools\malgrasson.sqf";
[] execVM "admintools\tools\mallightesp.sqf";

if(AdminModeToggle) then {
	titleText ["God Mode, Vehicle God Mode, ESP, Inf Ammo, and Gross OFF - ENABLED","PLAIN DOWN"];titleFadeOut 6;
}
else{
	titleText ["God Mode, Vehicle God Mode, ESP, Inf Ammo, and Gross OFF - DISABLED","PLAIN DOWN"];titleFadeOut 3;
};
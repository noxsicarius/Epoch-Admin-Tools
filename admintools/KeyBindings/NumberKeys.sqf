/***************This file is customizable**************
	Required knowledge: Low to moderate
	
	To bind an option to a number key:
	1. Remove the // infront of the key type you want to use
	2. Change DIRECTORY_HERE to the folder the sqf file is saved in (such as tools or skins)
	3. Change FILE_NAME_HERE.sqf to the file name you want to use ex. AdminMode.sqf
	You have now bound an option to that number key!
	
	Some files require special values to be passed to them to work correctly so not ALL actions can be
	configured into this file. If you wish to bind an Admin Mode or Mod Mode option such as god mode
	to these keys you will require more work to make it work correctly.
	
	To disable the use of a single key simply comment out the line by add // at the start of the line
	To remove all function key support simply delete or comment out the lines in this file.
*/

// 1_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 2) then {[] execVM ""admintools\DIRECTORY_HERE\FILE_NAME_HERE.sqf"";true};"];
Sleep 0.02;
// 2_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 3) then {[] execVM ""admintools\DIRECTORY_HERE\FILE_NAME_HERE.sqf"";true};"];
Sleep 0.02;
// 3_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 4) then {[] execVM ""admintools\DIRECTORY_HERE\FILE_NAME_HERE.sqf"";true};"];
Sleep 0.02;
// 4_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 5) then {[] execVM ""admintools\DIRECTORY_HERE\FILE_NAME_HERE.sqf"";true};"];
Sleep 0.02;
// 5_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 6) then {[] execVM ""admintools\DIRECTORY_HERE\FILE_NAME_HERE.sqf"";true};"];
Sleep 0.02;
// 6_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 7) then {[] execVM ""admintools\DIRECTORY_HERE\FILE_NAME_HERE.sqf"";true};"];
Sleep 0.02;
// 7_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 8) then {[] execVM ""admintools\DIRECTORY_HERE\FILE_NAME_HERE.sqf"";true};"];
Sleep 0.02;
// 8_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 9) then {[] execVM ""admintools\DIRECTORY_HERE\FILE_NAME_HERE.sqf"";true};"];
Sleep 0.02;
// 9_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 10) then {[] execVM ""admintools\DIRECTORY_HERE\FILE_NAME_HERE.sqf"";true};"];
Sleep 0.02;
// 0_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 11) then {[] execVM ""admintools\DIRECTORY_HERE\FILE_NAME_HERE.sqf"";true};"];

diag_log("Admin Tools: NumberKeys.sqf Loaded");

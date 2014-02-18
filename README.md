Epoch-Admin-Tools
=================

![Admin Tools](http://i.imgur.com/pfwIdkB.png)

([Click here for more screenshots](http://imgur.com/a/RH4cx#0))

An admin menu for DayZ Epoch for the purpose of testing and administrating a [DayZ Epoch](https://github.com/vbawol/DayZ-Epoch) server. 

## Notable features:
* Multiple Admin levels
* Godmode
* Teleport self (or others to you)
* Flying
* Delete or Repair object on crosshairs
* Heal self and others within X meters
* ESP
* Infinite Ammo
* Invisibility
* Change skins
* Spawn weapons and items
* Spawn a vehicle with a key
* ...and more!

## Installation

#### Mission.pbo:
1. Click "[Download Zip](https://github.com/gregariousjb/Epoch-Admin-Tools/archive/master.zip)" on the right sidebar
2. Extract the ***admintools*** folder into the root of your Epoch mission
3. Open your ***init.sqf*** and paste the following at the bottom:

~~~~java
// Epoch Admin Tools
AllAdminList = [
"111111111", // <Admin In-Game Name>
"999999999", // <Admin In-Game Name>
"999999999" // <Admin In-Game Name>
];
SuperAdminList = [
"111111111", // <Admin In-Game Name>
"999999999" // <Admin In-Game Name>
];
AdminList3 = [
"999999999", // <Admin In-Game Name>
"999999999" // <Admin In-Game Name>
];
AdminList2 = [
"999999999", // <Admin In-Game Name>
"999999999" // <Admin In-Game Name>
];
AdminList1 = [
"999999999", // <Admin In-Game Name>
"999999999" // <Admin In-Game Name>
];
[] execVM "admintools\Activate.sqf";
~~~~

4.) Replace the "111111111" in BOTH arrays (AllAdminList & SuperAdminList) with [your Player ID](http://i48.tinypic.com/2isxjkz.png) in order to have full access to the menu.

5.) Save the init.sqf

> The mission is now complete and can be repacked into a .pbo. Continue with ***Battleye Filters*** below.

#### Battleye Filters:
1. Return to the zip file and open the Battleye folder.
2. Extract the .txt files within to your server's Battleye configs folder (via FTP or web-based file manager) and replace the originals to prevent "script restriction" errors while using the menu. The location depends on the server and hosting. For some users, this may be in ***CONFIGFILES/Battleye***.

> Installation is now complete, but you may want to consider additional optional instructions below.

## Optional Steps

### Add more admins:
1. Get the PID of the admin.
2. Pick what access you want your admin to have. In order from MOST to LEAST number of commands: SuperAdminList > AdminList3 > AdminList2 > AdminList1. You can view which Admin has what commands in the ***admintools/AdminToolsMain.sqf***.
3. Place the PID in ***two*** areas of the init.sqf: *Always* in the AllAdminList, and also ***one*** other area - SuperAdminList, or AdminList3, or whatever you choose. 


### Fix teleport rubber-banding:
Here you have two options. ***Option #1*** is potentially hazardous as it disables Epoch's default antihack for you and everyone else. ***Option #2*** is more secure, but it will only fix teleporting for yourself and other people whose PID you add to the array (such as admins) - it will still prevent you from teleporting other people (outside the array) to you because they will still have the antihack enabled on them.

***Option #1)*** Open your ***init.sqf*** and comment out the following line so that the result looks like this:
~~~~
//[] execVM "\z\addons\dayz_code\system\antihack.sqf";
~~~~

***Option #2)*** Open your ***init.sqf*** and replace the above line with this:
~~~~
AT_all = ["111111111","222222222","333333333"];
if (not ((getPlayerUID player) in AT_all)) then {
    [] execVM "\z\addons\dayz_code\system\antihack.sqf";
};
~~~~
...then replace the above numbers with PIDs of players with whom you wish to have the antihack disabled.


### Fix temporary vehicles blowing up when getting in them:
(WIP)


### Make temporary vehicles permanent:
(WIP)

## Credits
This project is based heavily on [Malory's Custom Epoch Admin Tools](https://github.com/iforgotmywhat/Dayz-Epoch-Admin-Tools/), which itself is based on [BluePhoenix Admin Tools](https://github.com/BluePhoenix175/DayZ-Admin-Tools-). Special thanks to Malory for allowing a lowly script kiddie such as myself take over this project.

Epoch-Admin-Tools
=================

![Admin Tools](http://i.imgur.com/pfwIdkB.png)

([Click here for more screenshots](http://imgur.com/a/RH4cx#0))

An admin menu for the purpose of testing and administrating a [DayZ Epoch](https://github.com/vbawol/DayZ-Epoch) server. 

## A few of the features:
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
* Spawn locked vehicles with keys (saved even after restart)
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
    
4. Replace the "111111111" in BOTH arrays (AllAdminList & SuperAdminList) with [your Player ID](http://i48.tinypic.com/2isxjkz.png) in order to have full access to the menu.
5. Save the init.sqf

##### The mission is now complete and can be repacked into a .pbo. Continue with ***Battleye Filters*** below.

#### Battleye Filters:
1. Return to the zip file and open the Battleye folder.
2. Extract the .txt files within to your server's Battleye configs folder (via FTP or web-based file manager) and replace the originals to prevent "script restriction" errors while using the menu. The location depends on the server and hosting. For some users, this may be in ***CONFIGFILES/Battleye***.

##### Installation is now complete, but you may want to consider additional optional instructions below. 
##### IMPORTANT: It's common for the Admin Tools to be absent the first time a server is loaded. Abort to the lobby, then re-join the server to make the Admin Tools reappear.

## Optional Steps

### Add more admins:
1. Get the PID of the admin.
2. Pick what access you want your admin to have. In order from MOST to LEAST number of commands: SuperAdminList > AdminList3 > AdminList2 > AdminList1. You can view which Admin has what commands in the ***admintools/AdminToolsMain.sqf***.
3. Place the PID in ***two*** areas of the init.sqf: *Always* in the AllAdminList, and also ***one*** other area - SuperAdminList, or AdminList3, or whatever you choose. 


### Fix teleport rubber-banding:
This is caused by Epoch's default included antihack. Here you have two options. ***Option #1*** is potentially hazardous as it disables Epoch's default antihack for you and everyone else. ***Option #2*** is more secure, but it will only fix teleporting for yourself and other people whose PID you add to the array (such as admins) - it will still prevent you from teleporting other people (outside the array) to you because they will still have the antihack enabled on them.

***Option #1)*** Open your ***init.sqf*** and comment out the following line so that the result looks like this:

~~~~java
//[] execVM "\z\addons\dayz_code\system\antihack.sqf";
~~~~

***Option #2)*** Open your ***init.sqf*** and replace the above line with this:

~~~~java
AT_all = ["111111111","222222222","333333333"];
if (not ((getPlayerUID player) in AT_all)) then {
    [] execVM "\z\addons\dayz_code\system\antihack.sqf";
};
~~~~
    
...then replace the above numbers with PIDs of players with whom you wish to have the antihack disabled.


### Fix temporary vehicles blowing up when getting in them:
This is caused by Epoch's included antihack/cleanup script in the server pbo.

1. Open your server .pbo file with your preferred PBO editor.
2. Open the ***server_functions.sqf*** in the \init folder.
3. Search the file for the following:

~~~~java
    if(vehicle _x != _x && !(vehicle _x in PVDZE_serverObjectMonitor) && (isPlayer _x)  && !((typeOf vehicle _x) in DZE_safeVehicle)) then {
~~~~
    
4.) Comment out this line and/or replace it with the following:

~~~~java
    if(vehicle _x != _x && !(vehicle _x in PVDZE_serverObjectMonitor) && (isPlayer _x)  && !((typeOf vehicle _x) in DZE_safeVehicle) && (vehicle _x getVariable ["MalSar",0] !=1)) then {
~~~~

5.) Done. Repackage the server pbo and upload it to your server. 

* Note #1: In case the above line changes in the future and your searches have 0 results, try searching for ***server_checkHackers*** or ***CLEANUP: KILLING A HACKER***.
* Note #2: An alternative method to this solution is to set the nearby ***setDamage 1*** variables to ***setDamage 0*** (there should be 2 of them). The catch is, this is less secure. It will allow hackers to spawn vehicles and not be punished.


## FAQ
* My Admin Tools menu doesn't appear!
 * This is common, and I'm looking into a fix. Abort to the lobby and log back in. It should fix itself.
* I'm getting kicked with "Script Restriction #X"!
 * Make sure you've installed the Battleye Filters correctly. If everything looks good, create a new issue for me here on Github so I can look into a fix. If you're feeling independant, you can fix the error yourself with a little knowledge about [how the filters work](http://dayz.st/w/Battleye_Filters).

## Credits
This project is based heavily on [Malory's Custom Epoch Admin Tools](https://github.com/iforgotmywhat/Dayz-Epoch-Admin-Tools/), which itself is based on [BluePhoenix Admin Tools](https://github.com/BluePhoenix175/DayZ-Admin-Tools-). Special thanks to Malory for allowing a lowly script kiddie such as myself take over this project.

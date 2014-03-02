Epoch-Admin-Tools
=================

![Admin Tools](http://i.imgur.com/j0bTHPB.png)

([Click here for more screenshots](http://imgur.com/a/RH4cx#0))

An admin menu for the purpose of testing and administrating a [DayZ Epoch](https://github.com/vbawol/DayZ-Epoch) server. 

## Features:
#### For help with Administration:
* Multiple Admin levels
* Spectate players
* Spawn locked vehicles with keys (saved even after restart)
* "Display code" for locked vaults/doors
* "Create key" for vehicles with lost keys
* Force lock and unlock vehicles without keys
* Base Destruction - Destroy all buildables/vehicles within a customizable radius
* Spawnable crates with weapons, items, and supplies (e.g. "VIP crate", "Bambi crate", "Medical crate", etc.)
* Spawn locked or temporary vehicles via the menu or a custom-made graphical vehicle menu ([screenshot](https://f.cloud.github.com/assets/204934/2233637/43153c0a-9b2c-11e3-8a03-40d11239e1cb.png))


#### Other features:
* Godmode
* Teleport self (or others to you)
* Flying
* Invisibility
* Infinite Ammo / No recoil
* Change skins
* Delete, repair/refuel, or only refuel vehicle on crosshairs
* Heal self and others within 25 meters
* ESP - display players, zombies, safes, tents, vehicles, and AI on the map
* ...and more!

## Installation

#### Mission.pbo:
1. Click "[Download Zip](https://github.com/gregariousjb/Epoch-Admin-Tools/archive/master.zip)" on the right sidebar
2. Extract the ***admintools*** folder into the root of your Epoch mission
3. Open your ***init.sqf*** and paste the following at the bottom:

    ~~~~java
    // Epoch Admin Tools
    AdminList = [
    "111111111", // <Admin In-Game Name>
    "999999999" // <Admin In-Game Name>
    ];
    ModList = [
    "999999999", // <Admin In-Game Name>
    "999999999" // <Admin In-Game Name>
    ];
    [] execVM "admintools\Activate.sqf";
    ~~~~
    
4. Replace the "111111111" with [your Player ID](http://i48.tinypic.com/2isxjkz.png) in order to have full access to the menu.
5. Save the init.sqf
6. Open your description.ext
7. Paste the following at the bottom:

    ~~~~java
    #include "admintools\dialog.hpp"
    ~~~~

##### The mission PBO can now be repacked. Continue with ***Battleye Filters*** below.

#### Battleye Filters:
It's important that you *start* with updated filters. Many server hosts are still using old, outdated filters, which will likely cause "Script Restriction" errors if not updated. You can find these updated filters specifically made for Epoch in the Epoch Server download on the [Epoch Wiki](http://dayzepoch.com/wiki/index.php?title=Main_Page). Once downloaded, simply find the "Battleye" folder in the archive and extract the .txt files within to your server's Battleye folder, replacing the existing .txt files. The location of your Battleye filters depends on the server and hosting. For some users, this may be in ***CONFIGFILES/Battleye***.

1. Return to the Epoch Admin Tools zip file and open the Battleye folder.
2. Extract the .txt files within to your server's Battleye configs folder (via FTP or web-based file manager) and replace the originals.

##### Not done yet! Continue with ***Temporary vehicles despawning/blowing up fix*** below.

#### Temporary vehicles despawning/blowing up fix:
This is caused by Epoch's included antihack/cleanup script in the server pbo.

1. Open your server .pbo file with your preferred PBO editor.
2. Open ***init/server_functions.sqf*** and search the file for the following:

    ~~~~java
        if(vehicle _x != _x && !(vehicle _x in PVDZE_serverObjectMonitor) && (isPlayer _x)  && !((typeOf vehicle _x) in DZE_safeVehicle)) then {
    ~~~~
    
3. Comment out this line and/or replace it with the following:

    ~~~~java
        if(vehicle _x != _x && !(vehicle _x in PVDZE_serverObjectMonitor) && (isPlayer _x)  && !((typeOf vehicle _x) in DZE_safeVehicle) && (vehicle _x getVariable ["MalSar",0] !=1)) then {
    ~~~~

4. Now open your ***compile/server_updateObject.sqf*** and place this:


    ~~~~java
    if (_object getVariable "MalSar" == 1) exitWith {};
    ~~~~

    ...immediately above this:

    ~~~~java
    if (!_parachuteWest and !(locked _object)) then {
    ~~~~

Done. Repackage the server pbo and upload it to your server. 

#### Installation complete! ...But you might want to consider additional optional instructions below:


## Optional Steps

### Fix teleport/flying rubber-banding:
If this step is not done, you will not be able to use "Teleport" OR "Teleport to Me". This is caused by Epoch's default included antihack, which sends teleported people right back to where they were - hence "rubber-banding". Here you have two options. ***Option #1*** will allow "Teleport" and "Teleport to Me" for all players, but is potentially more hazardous than Option #2 as it disables Epoch's default antihack (which prevents unauthorized teleporting, among other things). ***Option #2*** is more secure, but it will only allow "Teleport" and "Teleport to Me" for players whose PIDs you add to the array - it will still prevent "Teleport to Me" on players not in the list of PIDs because they will still have the antihack enabled on them.

***Option #1)*** Open your ***init.sqf*** and comment out the following line so that the result looks like this:

~~~~java
//[] execVM "\z\addons\dayz_code\system\antihack.sqf";
~~~~

***Option #2)*** Open your ***init.sqf*** and replace the above line with this:

~~~~java
	if (not ((getPlayerUID player) in AdminList)) then 
	{
		if (not ((getPlayerUID player) in tempList)) then
		{
			[] execVM "\z\addons\dayz_code\system\antihack.sqf";
		};
	};
~~~~
    
...then replace the above numbers with PIDs of players with whom you wish to have the antihack disabled.

### Add more admins:
1. Get the [PID](http://i48.tinypic.com/2isxjkz.png) of the admin.
2. Pick what access you want your admin to have. In order from MOST to LEAST number of commands: AdminList > ModList. You can view/edit commands in ***admintools/AdminToolsMain.sqf***.
3. Place the PID in the chosen section of your ***init.sqf***. 

***Important: Take note of how the array's commas are used in the init.sqf. The last string in the array should not have a comma. Noncompliance will cause the Admin Menu to break.***


## FAQ
* I'm getting kicked with "Script Restriction #X"!
 * Make sure you've installed the Battleye Filters correctly. If everything looks good, create a new issue for me here on Github so I can look into a fix. If you're feeling independant, you can fix the error yourself with a little knowledge about [how the filters work](http://dayz.st/w/Battleye_Filters).

## Credits
This project is based heavily on [Malory's Custom Epoch Admin Tools](https://github.com/iforgotmywhat/Dayz-Epoch-Admin-Tools/), which itself is based on [BluePhoenix Admin Tools](https://github.com/BluePhoenix175/DayZ-Admin-Tools-). Special thanks to Malory for allowing a lowly script kiddie such as myself take over this project.

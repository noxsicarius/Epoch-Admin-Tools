Epoch-Admin-Tools
=================

![Admin Tools](http://i.imgur.com/j0bTHPB.png)

([Click here for more screenshots](http://imgur.com/a/RH4cx#0))

An admin menu with powerful tools for the purpose of testing and/or administrating a [DayZ Epoch Mod](http://epochmod.com/) server. Most tools will also be compatible with original DayZMod servers and other derivatives.

#### For guides and help: [Epoch Admin Tools Wiki](https://github.com/gregariousjb/Epoch-Admin-Tools/wiki)

# Features:
#### For help with Administration:
* Multiple Admin levels
* Spectate players
* "Display code" for locked vaults/doors
* "Create key" for vehicles with lost keys
* Force lock and unlock vehicles without keys
* Base Destruction - Destroy all buildables/vehicles within a customizable radius
* Spawnable crates with weapons, items, and supplies
* Spawn vehicles via the menu or a custom-made graphical vehicle menu ([screenshot](https://f.cloud.github.com/assets/204934/2233637/43153c0a-9b2c-11e3-8a03-40d11239e1cb.png)) (Thanks @Sandbird!)


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

# Installation

###  Each installation step is CRITICAL to installing this tool. ANY deviation from the following steps WILL break it. 99% of reported errors are due to users not following these instructions PERFECTLY!


#### A video install tutorial can be found here: http://youtu.be/hV_vwvp_vFs


1. Click ***[Download Zip](https://github.com/gregariousjb/Epoch-Admin-Tools/archive/master.zip)*** on the right sidebar of this Github page.

	> Recommended PBO tool for all "pack", "repack", or "unpack" steps: ***[PBO Manager](http://www.armaholic.com/page.php?id=16369)***

1. Log into your server via FTP or your host's File Manager. Locate, download, and unpack (using PBO Manager or a similar PBO editor) your ***MPMissions/Your_Mission.pbo***, and open the resulting folder.
 
	> Note: "Your_Mission.pbo" is a placeholder name. Your mission might be called "DayZ_Epoch_11.Chernarus", "DayZ_Epoch_13.Tavi", or "dayz_mission" depending on hosting and chosen map.

1. Extract the ***admintools*** folder from the Epoch Admin Tools project zip into the root of your mission folder.
1. Open the ***init.sqf*** in the root of your mission folder and paste the following at the bottom:

	~~~~java
	// Epoch Admin Tools
	[] execVM "admintools\Activate.sqf";
	~~~~

1. And replace this:

	~~~~java
	[] execVM "\z\addons\dayz_code\system\antihack.sqf";
	~~~~

	...with this:

	~~~~java
	// Epoch Admin Tools
	[] execVM "admintools\AdminList.sqf";
	if ( !((getPlayerUID player) in AdminList) && !((getPlayerUID player) in ModList) && !((getPlayerUID player) in tempList)) then 
	{
		[] execVM "\z\addons\dayz_code\system\antihack.sqf";
	};
	~~~~

1. Save the init.sqf
1. Open your ***description.ext***
1. Paste the following at the bottom:

    ~~~~java
    // Epoch Admin Tools
    #include "admintools\dialog.hpp"
    ~~~~
	
1. Open ***admintools\AdminList.sqf***
1. Replace the "111111111" with [your Player ID](http://i48.tinypic.com/2isxjkz.png) in order to have full access to the menu.
1. The mission pbo is done. Repack it and upload it to your server (FTP or host's File Manager).
1. Download the latest Epoch Server build from the [Epoch Wiki](http://dayzepoch.com/wiki/index.php?title=Main_Page) and open the archive.
1. Find the ***Battleye*** folder inside the archive and extract the .txt files within to your server's Battleye folder (via FTP or host's File Manager), overwriting the existing .txt files. 

	> Note: The location of your server's Battleye folder depends on the server and hosting. For some users, this may be in ***CONFIGFILES/Battleye***.
	
1. Return to the Epoch-Admin-Tools zip file (downloaded in step #1) and open the ***Battleye*** folder. Again, extract the .txt files from the ***Epoch-Admin-Tools/Battleye*** folder into the same Battleye folder in the previous step and overwrite everything when prompted.
1. Locate your ***@DayZ_Epoch_Server/addons/dayz_server.pbo*** on your server host, download and unpack it, and open the resulting ***dayz_server*** folder.
1. Open ***init/server_functions.sqf*** and replace this:

    ~~~~java
        if(vehicle _x != _x && !(vehicle _x in PVDZE_serverObjectMonitor) && (isPlayer _x)  && !((typeOf vehicle _x) in DZE_safeVehicle)) then {
    ~~~~
    
	...with this:

    ~~~~java
    	// Epoch Admin Tools
        if(vehicle _x != _x && !(vehicle _x in PVDZE_serverObjectMonitor) && (isPlayer _x)  && !((typeOf vehicle _x) in DZE_safeVehicle) && (vehicle _x getVariable ["MalSar",0] !=1)) then {
    ~~~~
    
	> Note: This step may not work well if you use other mods that modify this operator. The important code to fit into this operator is `(vehicle _x getVariable ["MalSar",0] !=1)` which can be added easily with a rudimentary knowledge of programming.

1. Now open your ***compile/server_updateObject.sqf*** and place this:


    ~~~~java
    // Epoch Admin Tools
    if (_object getVariable "MalSar" == 1) exitWith {};
    ~~~~

    ...immediately above this:

    ~~~~java
    if (!_parachuteWest and !(locked _object)) then {
    ~~~~

5. Repack the server pbo and upload it to your server. 


#### View the [Epoch Admin Tools Wiki](https://github.com/gregariousjb/Epoch-Admin-Tools/wiki) for additional configuration options and help.


## FAQ
* I'm getting kicked with "Script Restriction #X"!
 * Make sure you've installed the Battleye filters perfectly in the instructions. If it still fails, you can fix the error yourself with a little knowledge about [how the filters work](http://dayz.st/w/Battleye_Filters).
* The menu doesn't appear.
 * The most likely cause of this error is either a syntax error in your ***init.sqf*** (e.g. a missing semi-colon), a syntax error in your ***admintools\AdminList.sqf*** (e.g. a comma after the last string in the array of Admins/Mods - see above optional instruction) or forgetting to add your Player ID (or typing it wrong) into the ***admintools\AdminList.sqf***. Specific errors can be found by reading your server's [RPT file](https://community.bistudio.com/wiki/arma.RPT). Also see [Debugging Techniques](https://community.bistudio.com/wiki/Debugging_Techniques).


## Error Reporting
Before posting an issue on Github or on [the main discussion forum](http://epochmod.com/forum/index.php?/topic/7501-release-epoch-admin-tools/):

* Review the installation instructions and be sure you've done every step EXACTLY as stated. They are not forgiving. If one step is done incorrectly, it won't work.
* Check your server's RPT log for errors. This will identify 99% of problems with the menu. Be ready to copy/paste the RPT log into [Pastebin](http://pastebin.com/) or [Gist](https://gist.github.com/) in an issue or in the discussion forum for help with troubleshooting.
* If all else fails, install these tools onto a fresh, unedited mission.pbo and server.pbo to get it working, then start installing additional addons/mods one at a time until the admin tools break in order to identify the conflict.


## Credits
This project is based heavily on [Malory's Custom Epoch Admin Tools](https://github.com/iforgotmywhat/Dayz-Epoch-Admin-Tools/), which itself is based on [BluePhoenix Admin Tools](https://github.com/BluePhoenix175/DayZ-Admin-Tools-).

* Project Lead: Gregarious
* Project sub-lead: NoxSicarius (Nox)

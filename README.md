Epoch Admin Tools V-1.10.7
=================

![Admin Tools](http://i.imgur.com/j0bTHPB.png)

([Click here for more screenshots](http://imgur.com/a/RH4cx#0))

This is an admin menu with powerful tools for the purpose of testing and/or administrating a [DayZ Epoch Mod](http://epochmod.com/) server. Most tools will also be compatible with original DayZMod servers and other derivatives.

***You may use this script free of charge and modify for your own needs, however you MAY NOT distribute this code or any modified versions of it without my permission.*** If you have new features you think people may benefit from please open a pull request to have it added to this tool. The main reason for this is to be sure the tool is of the best possible quality and that harmful code is not distributed under the guise of my work. 
If you are worried about the integrity of the dll files look at the change log for MD5 hash values.

# Table of Contents:
* [Features](https://github.com/noxsicarius/Epoch-Admin-Tools#features)
* [Installing the tool](https://github.com/noxsicarius/Epoch-Admin-Tools#installation)
* [Updating the tool](https://github.com/noxsicarius/Epoch-Admin-Tools#updating)
* [FAQ](https://github.com/noxsicarius/Epoch-Admin-Tools#faq)
* [Error Reporting](https://github.com/noxsicarius/Epoch-Admin-Tools#error-reporting)
* [Credits](https://github.com/noxsicarius/Epoch-Admin-Tools#credits)

# Features:
#### For help with Administration:
* Multiple Admin levels
* Spectate players
* "Display code" for locked vaults/doors
* "Create key" for vehicles with lost keys
* Base management - Copy/Paste/Export/Import/Delete bases
* Spawn crates with weapons, items, and supplies
* Spawn vehicles via the menu or a custom-made graphical vehicle menu ([screenshot](https://f.cloud.github.com/assets/204934/2233637/43153c0a-9b2c-11e3-8a03-40d11239e1cb.png)) (Thanks @Sandbird!)
* Log admin tool use to combat possible abuse of the tool


#### Other features:
* Godmode
* Teleport
* Flying
* Invisibility
* Infinite Ammo / No recoil
* Change skins
* Delete, repair/refuel vehicle
* Heal players
* ESP - display players and objects on the map
* Spawn temporary buildings on the map
* ...and more!



# Installation


#### [DayZ Epoch Admin Tools Video Install Tutorial](http://youtu.be/hV_vwvp_vFs)


1. Click ***[Download Zip](https://github.com/gregariousjb/Epoch-Admin-Tools/archive/master.zip)*** on the right sidebar of this Github page.

	> Recommended PBO tool for all "pack", "repack", or "unpack" steps: ***[PBO Manager](http://www.armaholic.com/page.php?id=16369)***

1. Log into your server via FTP or your host's File Manager. Locate, download, and unpack (using PBO Manager or a similar PBO editor) your ***MPMissions/Your_Mission.pbo***, and open the resulting folder.
 
	> Note: "Your_Mission.pbo" is a placeholder name. Your mission might be called "DayZ_Epoch_11.Chernarus", "DayZ_Epoch_13.Tavi", or "dayz_mission" depending on hosting and chosen map.

1. Extract the ***admintools*** folder from the Epoch Admin Tools project zip into the root of your mission folder.
1. If you are allowed to use custom dll's (some hosts forbid it)
	
	> Copy all files ***inside the DLL folder*** (not the folder itself) to your ROOT server folder (where arma2oaserver.exe and @DayZ_Epoch is located)

	>> IMPORTANT: You may need to allow the dll through your antivirus because some antivirus block unknown dll's.
	 			  Windows may also require you to unblock it by right clicking it, selecting properties, and selecting unblock
	
1. Open the ***init.sqf*** in the root of your mission folder.

1. Paste the following 
	
	~~~~java
	call compile preprocessFileLineNumbers "admintools\config.sqf"; // Epoch admin Tools config file
	call compile preprocessFileLineNumbers "admintools\variables.sqf"; // Epoch admin Tools variables
	~~~~
	
	Directly *above* this:
	
	~~~~java
	initialized = true;
	~~~~

	So that it looks like this:
	~~~~java
	initialized = false;
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";
	progressLoadingScreen 0.05;
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";
	progressLoadingScreen 0.1;
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
	progressLoadingScreen 0.15;
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";
	progressLoadingScreen 0.25;
	call compile preprocessFileLineNumbers "server_traders.sqf";
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\system\mission\chernarus11.sqf"; //Add trader city objects 	locally on every machine early
	call compile preprocessFileLineNumbers "admintools\config.sqf"; // Epoch admin Tools config file
	call compile preprocessFileLineNumbers "admintools\variables.sqf"; // Epoch admin Tools variables
	initialized = true;
	~~~~
	
1. If you use the normal battleye antihack or similar do this step, if not then skip it.
	
	> Find the antihack line in your ***init.sqf***, it will be similar to the one below

	> ~~~~java
	> execVM "\z\addons\dayz_code\system\antihack.sqf";
	> ~~~~

	> if you have the line above ***replace it*** with this:

	> ~~~~java
	> // Epoch Admin Tools
	> [] execVM "admintools\antihack\antihack.sqf"; // Epoch Antihack with bypass
	> ~~~~
	
1. Paste the following at the bottom of the ***init***:

	~~~~java
	[] execVM "admintools\Activate.sqf"; // Epoch admin tools
	~~~~

1. Save the init.sqf
1. Open your ***description.ext***
1. Paste the following at the very bottom:

    ~~~~java
    // Epoch Admin Tools
    #include "admintools\dialog.hpp"
    ~~~~
	
1. Open ***admintools\config.sqf***
1. Replace the "111111111" with [your Player ID](http://i48.tinypic.com/2isxjkz.png) in order to have full access to the menu.
1. The mission pbo is done. Repack it and upload it to your server (FTP or host's File Manager).
1. Extract the .txt files from the ***Epoch-Admin-Tools/Battleye*** folder to your server's Battleye folder, overwriting the existing .txt files. 

	> Note: The location of your server's Battleye folder depends on the server and hosting. For some users, this may be in ***CONFIGFILES/Battleye***.
	> Note: In order to use the GUI based build menu, you will have to disabled at least one line in createvehicle.txt. It is line 16 or the one that starts with 5 "Land_" change it to 1 "Land_" for log only.
	> The only way around this is to make exceptions for all of the buildings listed in variables.sqf.
	
1. Locate your ***@DayZ_Epoch_Server/addons/dayz_server.pbo*** on your server host, download and unpack it, and open the resulting ***dayz_server*** folder.
1. Copy the ***EAT_vehSpawn.sqf, EAT_crateSpawn.sqf, and EAT_AiSpawn.sqf*** files contained in the downloaded directory dayz_server/compile to the same directory in the extracted dayz_server folder.

1. Now open your ***init/server_functions.sqf*** and find:

    ~~~~java
		spawn_vehicles = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\spawn_vehicles.sqf";
    ~~~~
	
	Place the following lines directly BELOW it.
	
    ~~~~java
		// Epoch Admin Tools
		EAT_vehSpawn = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\EAT_vehSpawn.sqf";
		EAT_CrateSpawn = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\EAT_crateSpawn.sqf";
		EAT_serverAiSpawn = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\EAT_serverAiSpawn.sqf";
    ~~~~

	The next step is ***very important*** for security. What this file does is compare the files in the downloaded mission PBO with the copy on the server to verify that they have not been overwritten by a common exploit.
	If you are not running a public server and have no need for security, then you can skip this step.
	
1. Open your ***init/mission_check.sqf*** and find:

	~~~~java
		_files = [
			'description.ext','init.sqf','mission.sqm','rules.sqf','server_traders.sqf'
		];
	~~~~
	
	Place the following list of files inside the brackets.
	
	~~~~java
		,'admintools\Activate.sqf','admintools\AdminToolsMain.sqf','admintools\config.sqf',
		'admintools\dialog.hpp','admintools\variables.sqf','admintools\weaponkits\Backpack.sqf','admintools\weaponkits\medical.sqf','admintools\weaponkits\removeGear.sqf',
		'admintools\weaponkits\toolBeltItems.sqf','admintools\weaponkits\WeaponKits.sqf','admintools\tools\addtempvehicle.sqf','admintools\tools\addvehicle.sqf',
		'admintools\tools\addvehicleDialog.sqf','admintools\tools\aiSpawn.sqf','admintools\tools\base_manager.sqf','admintools\tools\contactAdminTickets.sqf',
		'admintools\tools\DatabaseRemove.sqf','admintools\tools\displayLockCode.sqf','admintools\tools\ejectPlayers.sqf','admintools\tools\flipvehicle.sqf',
		'admintools\tools\getObjectDetails.sqf','admintools\tools\getPosition.sqf','admintools\tools\healp.sqf','admintools\tools\humanityChanger.sqf','admintools\tools\keyRecovery.sqf',
		'admintools\tools\messageDialog.sqf','admintools\tools\PointToLock.sqf','admintools\tools\PointToRepairPERM.sqf','admintools\tools\PointToUnlock.sqf','admintools\tools\recoverKey.sqf',
		'admintools\tools\SafeZoneArea.sqf','admintools\tools\skinChanger.sqf','admintools\tools\spectate.sqf','admintools\tools\vehicleLocator.sqf','admintools\tools\zombieshield.sqf',
		'admintools\tools\zombieSpawn.sqf','admintools\tools\Teleport\returnPlayerTP.sqf','admintools\tools\Teleport\Teleport.sqf','admintools\tools\Teleport\TPtoME.sqf',
		'admintools\tools\Teleport\TpToPlayer.sqf','admintools\tools\AdminMode\AdminFastBuild.sqf','admintools\tools\AdminMode\adminMode.sqf','admintools\tools\AdminMode\ESPenhanced.sqf',
		'admintools\tools\AdminMode\ESPplayer.sqf','admintools\tools\AdminMode\fastWalk.sqf','admintools\tools\AdminMode\Flying.sqf','admintools\tools\AdminMode\GodModePlayer.sqf',
		'admintools\tools\AdminMode\GodModeVehicle.sqf','admintools\tools\AdminMode\GrassOFF.sqf','admintools\tools\AdminMode\InfiniteAmmo.sqf','admintools\tools\AdminMode\Invisibility.sqf',
		'admintools\tools\AdminMode\modMode.sqf','admintools\tools\AdminMode\speedboost.sqf','admintools\tools\AdminBuild\adminBuild.sqf','admintools\tools\AdminBuild\buildingsDialog.sqf',
		'admintools\tools\AdminBuild\maintainArea.sqf','admintools\tools\AdminBuild\pointToDowngrade.sqf','admintools\tools\AdminBuild\pointToUpgrade.sqf','admintools\safeZones\safeZones.sqf',
		'admintools\KeyBindings\FunctionKeys.sqf','admintools\KeyBindings\NumberKeys.sqf','admintools\debug_monitor\debug_monitor.sqf','admintools\crates\spawnCrate.sqf','admintools\antihack\antihack.sqf',
		'admintools\actionMenu\ActionsMenu.sqf','admintools\actionMenu\contactAdmin.sqf','admintools\actionMenu\deployBike.sqf','admintools\actionMenu\deployMozzie.sqf','admintools\actionMenu\movements.sqf',
		'admintools\actionMenu\packBike.sqf','admintools\actionMenu\packMozzie.sqf','admintools\actionMenu\PlayerGrassToggle.sqf','admintools\actionMenu\serverRules.sqf','admintools\actionMenu\suicide.sqf'
	~~~~
	
	The end result should look like this:
	
	~~~~java
	_files = [
		'description.ext','init.sqf','mission.sqm','rules.sqf','server_traders.sqf','admintools\Activate.sqf','admintools\AdminToolsMain.sqf','admintools\config.sqf',
		'admintools\dialog.hpp','admintools\variables.sqf','admintools\weaponkits\Backpack.sqf','admintools\weaponkits\medical.sqf','admintools\weaponkits\removeGear.sqf',
		'admintools\weaponkits\toolBeltItems.sqf','admintools\weaponkits\WeaponKits.sqf','admintools\tools\addtempvehicle.sqf','admintools\tools\addvehicle.sqf',
		'admintools\tools\addvehicleDialog.sqf','admintools\tools\aiSpawn.sqf','admintools\tools\base_manager.sqf','admintools\tools\contactAdminTickets.sqf',
		'admintools\tools\DatabaseRemove.sqf','admintools\tools\displayLockCode.sqf','admintools\tools\ejectPlayers.sqf','admintools\tools\flipvehicle.sqf',
		'admintools\tools\getObjectDetails.sqf','admintools\tools\getPosition.sqf','admintools\tools\healp.sqf','admintools\tools\humanityChanger.sqf','admintools\tools\keyRecovery.sqf',
		'admintools\tools\messageDialog.sqf','admintools\tools\PointToLock.sqf','admintools\tools\PointToRepairPERM.sqf','admintools\tools\PointToUnlock.sqf','admintools\tools\recoverKey.sqf',
		'admintools\tools\SafeZoneArea.sqf','admintools\tools\skinChanger.sqf','admintools\tools\spectate.sqf','admintools\tools\vehicleLocator.sqf','admintools\tools\zombieshield.sqf',
		'admintools\tools\zombieSpawn.sqf','admintools\tools\Teleport\returnPlayerTP.sqf','admintools\tools\Teleport\Teleport.sqf','admintools\tools\Teleport\TPtoME.sqf',
		'admintools\tools\Teleport\TpToPlayer.sqf','admintools\tools\AdminMode\AdminFastBuild.sqf','admintools\tools\AdminMode\adminMode.sqf','admintools\tools\AdminMode\ESPenhanced.sqf',
		'admintools\tools\AdminMode\ESPplayer.sqf','admintools\tools\AdminMode\fastWalk.sqf','admintools\tools\AdminMode\Flying.sqf','admintools\tools\AdminMode\GodModePlayer.sqf',
		'admintools\tools\AdminMode\GodModeVehicle.sqf','admintools\tools\AdminMode\GrassOFF.sqf','admintools\tools\AdminMode\InfiniteAmmo.sqf','admintools\tools\AdminMode\Invisibility.sqf',
		'admintools\tools\AdminMode\modMode.sqf','admintools\tools\AdminMode\speedboost.sqf','admintools\tools\AdminBuild\adminBuild.sqf','admintools\tools\AdminBuild\buildingsDialog.sqf',
		'admintools\tools\AdminBuild\maintainArea.sqf','admintools\tools\AdminBuild\pointToDowngrade.sqf','admintools\tools\AdminBuild\pointToUpgrade.sqf','admintools\safeZones\safeZones.sqf',
		'admintools\KeyBindings\FunctionKeys.sqf','admintools\KeyBindings\NumberKeys.sqf','admintools\debug_monitor\debug_monitor.sqf','admintools\crates\spawnCrate.sqf','admintools\antihack\antihack.sqf',
		'admintools\actionMenu\ActionsMenu.sqf','admintools\actionMenu\contactAdmin.sqf','admintools\actionMenu\deployBike.sqf','admintools\actionMenu\deployMozzie.sqf','admintools\actionMenu\movements.sqf',
		'admintools\actionMenu\packBike.sqf','admintools\actionMenu\packMozzie.sqf','admintools\actionMenu\PlayerGrassToggle.sqf','admintools\actionMenu\serverRules.sqf','admintools\actionMenu\suicide.sqf'
	];
	
	Be mindful that all of the files are inside the brackets. All of the files should have a comma afterwards except for the last one in the list.
	If you start your server and get a message stating that a file could not be found, you probably have made an error here.
	
1. Open ***system/scheduler/sched_safetyVehicle.sqf*** and replace this:

    ~~~~java
		if (vehicle _x != _x && !(vehicle _x in dayz_serverObjectMonitor) && !((typeOf vehicle _x) in DZE_safeVehicle)) then {
    ~~~~
    
	...with this:

    ~~~~java
    	// Epoch Admin Tools
		if (vehicle _x != _x && !(vehicle _x in dayz_serverObjectMonitor) && !((typeOf vehicle _x) in DZE_safeVehicle) && (vehicle _x getVariable ["EAT_Veh",0] !=1)) then {
    ~~~~
    
	> Note: This step may not work well if you use other mods that modify this operator. The important code to fit into this operator is `(vehicle _x getVariable ["EAT_Veh",0] !=1)` which can be added easily with a rudimentary knowledge of programming.

1. Now open your ***compile/server_updateObject.sqf*** and find:

    ~~~~java
		_objectID = _object getVariable ["ObjectID","0"];
    ~~~~
	
	Place the following directly ABOVE it.
	
    ~~~~java
		// Epoch Admin Tools
		if (_object getVariable ["EAT_Veh",0] == 1) exitWith {};
    ~~~~

5. Repack the server pbo and upload it to your server.

Keybindings


~~~~java
	F2  	- Activate admin tools (if enabled by setting variable EAT_AdminMenuHotkey to true)
	F4  	- Admin mode/mod mode options - when toggled on
	F6  	- Cancel spectate
	4  		- Admin teleport
	5   	- Teleport player to admin
	6   	- Teleport to player
	7   	- Enhanced ESP options - when toggled on
	U   	- Unlock vehicle/safe/lockbox/door
	L   	- Lock vehicle/safe/lockbox/door
	J   	- Display object information in systemchat
	Del 	- Delete object
	Ins 	- Toggle Debug
	Tab 	- Activate action menu (if enabled by setting variable EAT_ActionMenuHotkey to true)
	Shift+w - Fastwalk or vehicle boost - when enabled
	q,w,a,s,d, and space bar are used if flying is toggled on
~~~~

## Install finished

#### View the [Epoch Admin Tools Wiki](https://github.com/gregariousjb/Epoch-Admin-Tools/wiki) for additional configuration options and help.

# Updating

### Current version only works with epoch 1.0.6 so no mod update is needed. Use a fresh install.
### If you want the 1.0.5 version go to the releases tab for this repo on github


## FAQ
* I'm getting kicked with "Script Restriction #X"!
 * Make sure you've installed the Battleye filters perfectly in the instructions. If it still fails, you can fix the error yourself with a little knowledge about [how the filters work](http://dayz.st/w/Battleye_Filters).
* The menu doesn't appear.
 * The most likely cause of this error is either a syntax error in your ***init.sqf*** (e.g. a missing semi-colon), a syntax error in your ***admintools\config.sqf*** (e.g. a comma after the last string in the array of Admins/Mods - see above optional instruction) or forgetting to add your Player ID (or typing it wrong) into the ***admintools\config.sqf***. Specific errors can be found by reading your server's [RPT file](https://community.bistudio.com/wiki/arma.RPT). Also see [Debugging Techniques](https://community.bistudio.com/wiki/Debugging_Techniques).
* I get stuck at the loading screen with the arma2oaserver.rpt error that I am missing files.
 * This is most often caused by a broken PBO packaging tool. Reinstall or use a different tool.
* How do I add something to my personal tools?
 * This is found in the [Epoch Admin Tools Wiki](https://github.com/gregariousjb/Epoch-Admin-Tools/wiki)
 
## Error Reporting
#### BEFORE posting an issue on Github or on [the main discussion forum](http://epochmod.com/forum/index.php?/topic/7501-release-epoch-admin-tools/):

* Review the installation instructions and be sure you've done every step EXACTLY as stated. They are not forgiving. If one step is done incorrectly, it won't work.
* If you think you might have installed it incorrectly, follow the [YouTube Video Install Tutorial](http://youtu.be/hV_vwvp_vFs)
* Check your server's RPT log for errors. This will identify 99% of problems with the menu. Be ready to copy/paste the RPT log into [Pastebin](http://pastebin.com/) or [Gist](https://gist.github.com/) in an issue or in the discussion forum for help with troubleshooting.
* If all else fails, install these tools onto a fresh, unedited mission.pbo and server.pbo to get it working, then start installing additional addons/mods one at a time until the admin tools break in order to identify the conflict.

#### If your problem persists after doing the above:
* Do a quick search on [the main discussion forum](http://epochmod.com/forum/index.php?/topic/7501-release-epoch-admin-tools/) for a fix to your problem.  
* If you do not find a fix to your problem: post your problem on [the main discussion forum](http://epochmod.com/forum/index.php?/topic/7501-release-epoch-admin-tools/)
* If the problem you are posting is a bug and not a general install problem then post it to [the main discussion forum](http://epochmod.com/forum/index.php?/topic/7501-release-epoch-admin-tools/) and to [the github issues page](https://github.com/gregariousjb/Epoch-Admin-Tools/issues?state=open).

## Credits
This project is based heavily on [Malory's Custom Epoch Admin Tools](https://github.com/iforgotmywhat/Dayz-Epoch-Admin-Tools/), which itself is based on [BluePhoenix Admin Tools](https://github.com/BluePhoenix175/DayZ-Admin-Tools-).

* Project Leader: NoxSicarius (Nox)
* A huge thanks goes out to Gregarious who began this project and did a huge amount of work on the tool. We were sad to see him go, but his generous contributions will be remembered.

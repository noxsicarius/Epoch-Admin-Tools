if(isNil "markers") then { markers = []};
if(isNil "vehList") then { vehList = []};
if(isNil "unlockedVehList") then { unlockedVehList = []};
if(isNil "lockedVehList") then { lockedVehList = []};
if(isNil "changed") then {changed = false};
if(isNil "toggleCheck") then {toggleCheck = 0};
if(isNil "delayTime") then {delayTime = 0};
if(isNil "poleList") then {poleList = [];};
if(isNil "storageList") then {storageList = [];};
if(isNil "buildableObjectsList") then {buildableObjectsList = [];};
if(isNil "crashList") then {crashList = [];};
if(isNil "storageObjects") then {storageObjects = ["TentStorage","TentStorageDomed","TentStorageDomed2","VaultStorageLocked","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","LockboxStorageLocked","GunRack_DZ","WoodCrate_DZ"];};
if(isNil "buildableObjects") then {buildableObjects = (dayz_allowedObjects - storageObjects) - ["LightPole_DZ","Plastic_Pole_EP1_DZ","Generator_DZ","TrapBear","ParkBench_DZ"];};

if (!("ItemGPS" in items player)) then {player addweapon "ItemGPS";};
if(isNil "enhancedESP2") then {enhancedESP2 = true;} else {enhancedESP2 = !enhancedESP2};

// START OF CONFIG
// Defines the default on and off of map markers
if (isNil "AddPlayersToMap") then {AddPlayersToMap = true;};
if (isNil "AddDeadPlayersToMap") then {AddDeadPlayersToMap = false;};
if (isNil "AddZombieToMap") then {AddZombieToMap = false;};
if (isNil "AddUnlockedVehiclesToMap") then {AddUnlockedVehiclesToMap = true;};
if (isNil "AddLockedVehiclesToMap") then {AddLockedVehiclesToMap = true;};
if (isNil "AddPlotPoleToMap") then {AddPlotPoleToMap = false;};
if (isNil "AddStorageToMap") then {AddStorageToMap = false;};
if (isNil "AddBuildablesToMap") then {AddBuildablesToMap = false;};
if (isNil "AddCrashesToMap") then {AddCrashesToMap = false;};
// END OF CONFIG


//GLOBAL VARS START

GlobalSleep=1;//Sleep between update markers
GlobalMarkerSize = [1.5,1.5];

//----------------------#Players#--------------------------
AddPlayersToScreen=true;
PlayersMarkerType=["x_art"];
PlayerMarkerColor=[1,0,0,1];//two in the fourth degree is equal to sixteen, so there are 16 colors
PlayerShowBloodInt=false;
PlayerShowDistance=true;
TheThicknessOfThePointPlayer=0.7;
//----------------------#Players#--------------------------

//--------------------#Dead Players#------------------------
DeadPlayersMarkerSize=[2,2];
DeadPlayersMarkerType="DestroyedVehicle";
DeadPlayerMarkerColor="ColorBlack";//two in the fourth degree is equal to sixteen, so there are 16 colors
//--------------------#Dead Players#------------------------

//----------------------#Zombies#--------------------------
ZombieVisibleDistance=100;
ZombieMarkerType="vehicle";
ZombieMarkerColor="ColorGreen";
ZombieName="Zombie";
//----------------------#Zombies#--------------------------

//----------------------#Unlocked-Vehicles#-------------------------
UnlockedVehicleMarkerType="vehicle";
UnlockedVehicleMarkerColor="ColorBlue";
//----------------------#Unlocked-Vehicles#-------------------------

//----------------------#Locked-Vehicles#-------------------------
LockedVehicleMarkerType="vehicle";
LockedVehicleMarkerColor="ColorRed";
//----------------------#Locked-Vehicles#-------------------------

//----------------------#PlottPole#-------------------------
PlotPoleMarkerType="mil_triangle";
PlotPoleMarkerColor="ColorWhite";
PlotPoleMarkerSize = [0.4,0.4];
//----------------------#PlotPole#-------------------------

//----------------------#Storage#----------------------------
StorageMarkerType="mil_box";
StorageMarkerColor="ColorYellow";
StorageMarkerSize = [0.25,0.25];
//----------------------#Storage#----------------------------

//----------------------#Buildables#----------------------------
BuildablesMarkerType="mil_box";
BuildablesMarkerColor="ColorYellow";
BuildablesMarkerSize = [0.5,0.5];
//----------------------#Buildables#----------------------------

//----------------------#Crashes#--------------------------
CrashesMarkerType="vehicle";
CrashesMarkerColor="ColorBrown";
//----------------------#Crashes#--------------------------

//GLOBAL VARS END


F5Menu = 
{
	F5OptionMenu = 
	[
		["",true],
		["Toggle options:(current state)", [-1], "", -5, [["expression", ""]], "1", "0"],
		[format["Show Dead Bodies: %1",AddDeadPlayersToMap], [2], "", -5, [["expression", "AddDeadPlayersToMap = !AddDeadPlayersToMap;changed = true;"]], "1", "1"],
		[format["Show Epoch Buildables: %1",AddBuildablesToMap], [4], "", -5, [["expression", "AddBuildablesToMap = !AddBuildablesToMap;changed = true;"]], "1", "1"],
		[format["Show Plot Poles: %1",AddPlotPoleToMap], [3], "", -5, [["expression", "AddPlotPoleToMap = !AddPlotPoleToMap;changed = true;"]], "1", "1"],
		[format["Show Player Storage: %1",AddStorageToMap], [4], "", -5, [["expression", "AddStorageToMap = !AddStorageToMap;changed = true;"]], "1", "1"],
		[format["Show Epoch Missions: %1",AddCrashesToMap], [5], "", -5, [["expression", "AddCrashesToMap = !AddCrashesToMap;changed = true;"]], "1", "1"],
		[format["Show Zombies: %1",AddZombieToMap], [6], "", -5, [["expression", "AddZombieToMap = !AddZombieToMap;changed = true;"]], "1", "1"],
		[format["Show Players: %1",AddPlayersToMap], [7], "", -5, [["expression", "AddPlayersToMap = !AddPlayersToMap;changed = true;"]], "1", "1"],
		[format["Show Locked Vehicles: %1",AddLockedVehiclesToMap], [8], "", -5, [["expression", "AddLockedVehiclesToMap = !AddLockedVehiclesToMap;changed = true;"]], "1", "1"],
		[format["Show Unlocked Vehicles: %1",AddUnlockedVehiclesToMap], [8], "", -5, [["expression", "AddUnlockedVehiclesToMap = !AddUnlockedVehiclesToMap;changed = true;"]], "1", "1"]
	];
	showCommandingMenu "#USER:F5OptionMenu";
};

if(enhancedESP2) then { 
	dList = []; //List of dead bodies
	dListMarkers = []; //List of Dead player markers
	F5_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 63) then {call F5Menu;};"];
	_player = player;
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has ENABLED enhanced ESP",name _player,getPlayerUID _player];
		[] spawn {publicVariable "usageLogger";};
	};
};

While {enhancedESP2} do 
{
	If (AddPlayersToMap) then 
	{
		{
			(group _x) addGroupIcon PlayersMarkerType;
			if (PlayerShowBloodInt && PlayerShowDistance) then 
			{
				BloodVal=round(_x getVariable["USEC_BloodQty",12000]);
				(group _x) setGroupIconParams [PlayerMarkerColor, format["%1(%2)-%3",name _x,BloodVal,round(player distance _x)],TheThicknessOfThePointPlayer,true];
			} else { 
				If (PlayerShowBloodInt && !PlayerShowDistance) then 
				{
					BloodVal=round(_x getVariable["USEC_BloodQty",12000]);
					(group _x) setGroupIconParams [PlayerMarkerColor, format ["%1(%2)",name _x, BloodVal],TheThicknessOfThePointPlayer,true];
				} else {
					If (PlayerShowDistance && !PlayerShowBloodInt) then 
					{
						//_text=parseText format ["%1<br/><t align='center'>%2</t>",name _x,round(player distance _x)];
						(group _x) setGroupIconParams [PlayerMarkerColor, format["%1-%2", name _x,round(player distance _x)],TheThicknessOfThePointPlayer,true];
					} else {
						//_text=parseText format ["%1",name _x];
						(group _x) setGroupIconParams [PlayerMarkerColor, format ["%1",name _x],TheThicknessOfThePointPlayer,true];
					};
				};
			};
			ParamsPlayersMarkers=[true,AddPlayersToScreen];
			setGroupIconsVisible ParamsPlayersMarkers;
		} forEach allUnits;
	};

	if (enhancedESP2 && visibleMap) then
	{
		if (AddDeadPlayersToMap && (delayTime == 0 || changed)) then {
			{
				if(!(_x isKindOf "zZombie_base") && (_x isKindOf "Man") && !(_x in dList)) then {
	
					private ["_pos"]; 
					_pos = getPos _x;
					deadMarker = createMarkerLocal [format ["DBP%1%2", _pos select 0, _pos select 1],[(_pos select 0) + 20, _pos select 1, 0]]; 
					deadMarker setMarkerTypeLocal DeadPlayersMarkerType;  
					deadMarker setMarkerSizeLocal DeadPlayersMarkerSize;
					deadMarker setMarkerColorLocal DeadPlayerMarkerColor;
					deadMarker setMarkerTextLocal format["%1", _x getVariable["bodyName","unknown"]]; 
					deadMarker setMarkerPosLocal ([(getPosATL _x select 0) + 15, getPosATL _x select 1, 0]); 
					dList set [count dList, _x];
					dListMarkers set [count dListMarkers, deadMarker];
				};
			}Foreach AllDead;
		};

		If (AddZombieToMap) then {
			_pos = getPos player;
			_zombies = _pos nearEntities ["zZombie_Base",ZombieVisibleDistance];
			k=0;
			{
				deleteMarkerLocal ("zmMarker"+ (str k));
				k=k+1;
			}forEach markers;
			
			k=0;
			{
				_text = format ["zmMarker%1", k];
				markers set [k, _text];

				if(alive _x) then 
				{
					pos = position _x;
					deleteMarkerLocal ("zmMarker"+ (str k));
					MarkerZm = "zmMarker" + (str k);
					ParamsZm=[MarkerZm,pos];
					MarkerZm = createMarkerLocal ParamsZm;
					MarkerZm setMarkerTypeLocal ZombieMarkerType;
					MarkerZm setMarkerSizeLocal GlobalMarkerSize;
					MarkerZm setMarkerPosLocal (pos);
					MarkerZm setMarkerColorLocal(ZombieMarkerColor);
					MarkerZm setMarkerTextLocal ZombieName;
					k=k+1;
				};

			}forEach _zombies;
		};

		/*	Old vehicle ESP
		If (AddVehicleToMap) then 
		{
			vehList = allmissionobjects "LandVehicle" + allmissionobjects "Air" + allmissionobjects "Boat";
			i = 0;
			{
				_name = gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
				pos = position _x;
				deleteMarkerLocal ("vehMarker"+ (str i));
				MarkerVeh = "vehMarker" + (str i);
				ParamsVeh=[MarkerVeh,pos];
				MarkerVeh = createMarkerLocal ParamsVeh;
				MarkerVeh setMarkerTypeLocal VehicleMarkerType;
				MarkerVeh setMarkerSizeLocal GlobalMarkerSize;
				MarkerVeh setMarkerPosLocal (pos);
				MarkerVeh setMarkerColorLocal(VehicleMarkerColor);
				MarkerVeh setMarkerTextLocal format ["%1",_name];
				i=i+1;
			} forEach vehList;
		};
		*/

		if(AddUnlockedVehiclesToMap || AddLockedVehiclesToMap) then {
			vehList = allmissionobjects "LandVehicle" + allmissionobjects "Air" + allmissionobjects "Boat";
			lockedVehList = [];
			unlockedVehList = [];

			{
				if(locked _x) then {
					lockedVehList = lockedVehList + [_x];
				} else {
					unlockedVehList = unlockedVehList + [_x];
				};
			} forEach vehList;
			
			If (AddUnlockedVehiclesToMap) then 
			{
				i = 0;
				{
					_name = gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
					pos = position _x;
					deleteMarkerLocal ("UvehMarker"+ (str i));
					MarkerUVeh = "UvehMarker" + (str i);
					ParamsUVeh=[MarkerUVeh,pos];
					MarkerUVeh = createMarkerLocal ParamsUVeh;
					MarkerUVeh setMarkerTypeLocal UnlockedVehicleMarkerType;
					MarkerUVeh setMarkerSizeLocal GlobalMarkerSize;
					MarkerUVeh setMarkerPosLocal (pos);
					MarkerUVeh setMarkerColorLocal(UnlockedVehicleMarkerColor);
					MarkerUVeh setMarkerTextLocal format ["%1",_name];
					i=i+1;
				} forEach unlockedVehList;
			};

			if (AddLockedVehiclesToMap) then 
			{			
				i4 = 0;
				{
					_name = gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
					pos = position _x;
					deleteMarkerLocal ("LvehMarker"+ (str i4));
					MarkerLVeh = "LvehMarker" + (str i4);
					ParamsLVeh=[MarkerLVeh,pos];
					MarkerLVeh = createMarkerLocal ParamsLVeh;
					MarkerLVeh setMarkerTypeLocal LockedVehicleMarkerType;
					MarkerLVeh setMarkerSizeLocal GlobalMarkerSize;
					MarkerLVeh setMarkerPosLocal (pos);
					MarkerLVeh setMarkerColorLocal(LockedVehicleMarkerColor);
					MarkerLVeh setMarkerTextLocal format ["%1",_name];
					i4=i4+1;
				} forEach lockedVehList;
			};
		};

		If(AddPlotPoleToMap && (delayTime == 0 || changed)) then
		{
			poleList = allMissionObjects "Plastic_Pole_EP1_DZ";
			i0 = 0;
			{
				_name = gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
				pos = position _x;
				deleteMarkerLocal ("poleMarker"+ (str i0));
				MarkerPole = "poleMarker" + (str i0);
				ParamsPole=[MarkerPole,pos];
				MarkerPole = createMarkerLocal ParamsPole;
				MarkerPole setMarkerTypeLocal PlotPoleMarkerType;
				MarkerPole setMarkerSizeLocal PlotPoleMarkerSize;
				MarkerPole setMarkerPosLocal (pos);
				MarkerPole setMarkerColorLocal(PlotPoleMarkerColor);
				MarkerPole setMarkerTextLocal format ["%1",_name];
				i0=i0+1;
			}forEach poleList;
		};
		
		If (AddStorageToMap && (delayTime == 0 || changed)) then 
		{
			storageList = [];
			{
				storageList = storageList + allmissionobjects (_x);
			} forEach storageObjects;
			
			i1 = 0;
			{
				_name = gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
				pos = position _x;
				deleteMarkerLocal ("storageMarker"+ (str i1));
				MarkerStorage = "storageMarker" + (str i1);
				ParamsStorage=[MarkerStorage,pos];
				MarkerStorage = createMarkerLocal ParamsStorage;
				MarkerStorage setMarkerTypeLocal StorageMarkerType;
				MarkerStorage setMarkerSizeLocal StorageMarkerSize;
				MarkerStorage setMarkerPosLocal (pos);
				MarkerStorage setMarkerColorLocal(StorageMarkerColor);
				MarkerStorage setMarkerTextLocal format ["%1",_name];

				i1=i1+1;
			}forEach storageList;
		};
		
		If (AddCrashesToMap && (delayTime == 0 || changed)) then 
		{
			crashList = allmissionobjects "UH1Wreck_DZ" + allmissionobjects "UH60Wreck_DZ" + allmissionobjects "UH60_NAVY_Wreck_DZ" + allmissionobjects "UH60_ARMY_Wreck_DZ" + allmissionobjects "UH60_NAVY_Wreck_burned_DZ" + allmissionobjects "UH60_ARMY_Wreck_burned_DZ" + allmissionobjects "Mass_grave_DZ" + allmissionobjects "Supply_Crate_DZE";
			i2 = 0;
			{
				_name = gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
				pos = position _x;
				deleteMarkerLocal ("crashMarker"+ (str i2));
				MarkerCrash = "crashMarker" + (str i2);
				ParamsCrash=[MarkerCrash,pos];
				MarkerCrash = createMarkerLocal ParamsCrash;
				MarkerCrash setMarkerTypeLocal CrashesMarkerType;
				MarkerCrash setMarkerSizeLocal GlobalMarkerSize;
				MarkerCrash setMarkerPosLocal (pos);
				MarkerCrash setMarkerColorLocal(CrashesMarkerColor);
				MarkerCrash setMarkerTextLocal format ["%1",_name];

				i2=i2+1;
			}forEach crashList;
		};
		
		If(AddBuildablesToMap && (delayTime == 0 || changed)) then
		{
			buildableObjectsList = [];
			{
				buildableObjectsList = buildableObjectsList + allmissionobjects (_x);
			} forEach buildableObjects;
			i3 = 0;
			{
				pos = position _x;
				deleteMarkerLocal ("buildablesMarker" + (str i3));
				MarkerBuildables = "buildablesMarker" + (str i3);
				ParamsBuildables=[MarkerBuildables,pos];
				MarkerBuildables = createMarkerLocal ParamsBuildables;
				MarkerBuildables setMarkerTypeLocal BuildablesMarkerType;
				MarkerBuildables setMarkerSizeLocal BuildablesMarkerSize;
				MarkerBuildables setMarkerPosLocal (pos);
				MarkerBuildables setMarkerColorLocal(BuildablesMarkerColor);
				i3=i3+1;
			}forEach buildableObjectsList;
		};
	};

	If (!AddDeadPlayersToMap && changed) then 
	{
		{
			deleteMarkerLocal _x;
		}forEach dListMarkers;
		dListMarkers = [];
	};
	
	If (!AddZombieToMap && changed) then 
	{
		k=0;
		{
			deleteMarkerLocal ("zmMarker"+ (str k));
			k=k+1;
		}forEach markers;
		markers = [];
	};

	If (!AddUnlockedVehiclesToMap && changed) then
	{
		i=0;
		{
			deleteMarkerLocal ("UvehMarker"+ (str i));
			i=i+1;
		}forEach unlockedVehList;
	};

	If (!AddLockedVehiclesToMap && changed) then
	{
		i4=0;
		{
			deleteMarkerLocal ("LvehMarker"+ (str i4));
			i4=i4+1;
		}forEach lockedVehList;
	};

	If (!AddPlotPoleToMap && changed) then 
	{
		i0=0;
		{
			deleteMarkerLocal ("poleMarker"+ (str i0));
			i0=i0+1;
		}forEach poleList;
	};
		
	If (!AddStorageToMap && changed) then 
	{
		i1=0;
		{
			deleteMarkerLocal ("storageMarker"+ (str i1));
			i1=i1+1;
		}forEach storageList;
	};

	If (!AddCrashesToMap && changed) then 
	{
		i2=0;
		{
			deleteMarkerLocal ("crashMarker"+ (str i2));
			i2=i2+1;
		}forEach crashList;
	};

	If (!AddBuildablesToMap && changed) then 
	{
		i3=0;
		{
			deleteMarkerLocal ("buildablesMarker"+ (str i3));
			i3=i3+1;
		}forEach buildableObjectsList;
	};

	sleep GlobalSleep;

	// Makes sure items have correctly turned off
	if(toggleCheck != 2 && changed) then {
		toggleCheck = toggleCheck + 1;
		if(toggleCheck == 2) then {
			changed = false;
			toggleCheck = 0;
		};
	};
	
	delayTime = delayTime + 1;
	if(delayTime == 5) then {
		delayTime = 0;
	};

	{
		clearGroupIcons (group _x);
	} forEach allUnits;
	
	Sleep GlobalSleep;

};

if(!enhancedESP2) then 
{
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", F5_KEY];

	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has DISABLED enhanced ESP",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};
	// Tool use broadcaster
	if(!((getPlayerUID player) in SuperAdminList) && broadcastToolUse) then {
		useBroadcaster = format["%1 -- has disabled enhanced ESP",name player];
		[] spawn {publicVariableServer "useBroadcaster";};
	};

	If (AddDeadPlayersToMap) then 
	{
		{
			deleteMarkerLocal _x;
		}Foreach dListMarkers;
	};
	
	If (AddZombieToMap) then 
	{
		k=0;
		{
			deleteMarkerLocal ("zmMarker"+ (str k));
			k=k+1;
		}forEach markers;
	};

	If (AddUnlockedVehiclesToMap) then 
	{
		i=0;
		{
			deleteMarkerLocal ("UvehMarker"+ (str i));
			i=i+1;
		}forEach unlockedVehList;
	};

	If (AddLockedVehiclesToMap) then 
	{
		i4=0;
		{
			deleteMarkerLocal ("LvehMarker"+ (str i4));
			i4=i4+1;
		}forEach lockedVehList;
	};

	If (AddPlotPoleToMap) then 
	{
		i0=0;
		{
			deleteMarkerLocal ("poleMarker"+ (str i0));
			i0=i0+1;
		}forEach poleList;
	};
	
	If (AddStorageToMap) then 
	{
		i1=0;
		{
			deleteMarkerLocal ("storageMarker"+ (str i1));
			i1=i1+1;
		}forEach storageList;
	};

	If (AddCrashesToMap) then 
	{
		i2=0;
		{
			deleteMarkerLocal ("crashMarker"+ (str i2));
			i2=i2+1;
		}forEach crashList;
	};

	If (AddBuildablesToMap) then 
	{
		i3=0;
		{
			deleteMarkerLocal ("buildablesMarker"+ (str i3));
			i3=i3+1;
		}forEach buildableObjectsList;
	};

	sleep 0.5;
};

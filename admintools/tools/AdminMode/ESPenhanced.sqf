if(isNil "markers") then { markers = []};
if(isNil "changed") then {changed = false};
if(isNil "toggleCheck") then {toggleCheck = 2};
if(isNil "poleList") then {poleList = [];};
if(isNil "tentList") then {tentList = [];};
if(isNil "crashList") then {crashList = [];};

if (!("ItemGPS" in items player)) then {player addweapon "ItemGPS";};
if(isNil "enhancedESP2") then {enhancedESP2 = true;} else {enhancedESP2 = !enhancedESP2};

// START OF CONFIG
// Defines the default on and off of map markers
if (isNil "AddPlayersToMap") then {AddPlayersToMap = true;};
if (isNil "AddDeadPlayersToMap") then {AddDeadPlayersToMap = false;};
if (isNil "AddZombieToMap") then {AddZombieToMap = false;};
if (isNil "AddVehicleToMap") then {AddVehicleToMap = true;};
if (isNil "AddPlotPoleToMap") then {AddPlotPoleToMap = false;};
if (isNil "AddTentsToMap") then {AddTentsToMap = false;};
if (isNil "AddCrashesToMap") then {AddCrashesToMap = false;};
// END OF CONFIG


//GLOBAL VARS START

GlobalSleep=1;//Sleep between update markers
GlobalMarkerSize = [0.7,0.7];

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

//----------------------#Vehicles#-------------------------
VehicleMarkerType="vehicle";
VehicleMarkerColor="ColorBlue";
//----------------------#Vehicles#-------------------------

//----------------------#PlottPole#-------------------------
PlotPoleMarkerType="vehicle";
PlotPoleMarkerColor="ColorWhite";
//----------------------#PlotPole#-------------------------

//----------------------#Tents#----------------------------
TentsMarkerType="vehicle";
TentsMarkerColor="ColorYellow";
//----------------------#Tents#----------------------------

//----------------------#Crashes#--------------------------
CrashesMarkerType="vehicle";
CrashesMarkerColor="ColorRed";
//----------------------#Crashes#--------------------------

//GLOBAL VARS END


F5Menu = 
{
	F5OptionMenu = 
	[
		["",true],
		["Toggle options:(current state)", [-1], "", -5, [["expression", ""]], "1", "0"],
		[format["Show Dead Bodies: %1",AddDeadPlayersToMap], [2], "", -5, [["expression", "AddDeadPlayersToMap = !AddDeadPlayersToMap;changed = true;toggleCheck = 0;"]], "1", "1"],
		[format["Show Plot Poles: %1",AddPlotPoleToMap], [3], "", -5, [["expression", "AddPlotPoleToMap = !AddPlotPoleToMap;changed = true;toggleCheck = 0;"]], "1", "1"],
		[format["Show tents: %1",AddTentsToMap], [4], "", -5, [["expression", "AddTentsToMap = !AddTentsToMap;changed = true;toggleCheck = 0;"]], "1", "1"],
		[format["Show Epoch Missions: %1",AddCrashesToMap], [5], "", -5, [["expression", "AddCrashesToMap = !AddCrashesToMap;changed = true;toggleCheck = 0;"]], "1", "1"],
		[format["Show Zombies: %1",AddZombieToMap], [6], "", -5, [["expression", "AddZombieToMap = !AddZombieToMap;changed = true;toggleCheck = 0;"]], "1", "1"],
		[format["Show Players: %1",AddPlayersToMap], [7], "", -5, [["expression", "AddPlayersToMap = !AddPlayersToMap;changed = true;toggleCheck = 0;"]], "1", "1"],
		[format["Show Vehicles: %1",AddVehicleToMap], [8], "", -5, [["expression", "AddVehicleToMap = !AddVehicleToMap;changed = true;toggleCheck = 0;"]], "1", "1"]
	];
	showCommandingMenu "#USER:F5OptionMenu";
};

if(enhancedESP2) then { 
	dList = []; //List of dead bodies
	dListMarkers = []; //List of Dead player markers
	F5_KEY = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 63) then {call F5Menu;};"];

	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has ENABLED enhanced ESP",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};
	// Tool use broadcaster
	if(!((getPlayerUID player) in SuperAdminList) && broadcastToolUse) then {
		useBroadcaster = format["%1 -- has enabled enhanced ESP",name player];
		[] spawn {publicVariableServer "useBroadcaster";};
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
		if (AddDeadPlayersToMap) then {
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
		
		If(AddPlotPoleToMap) then
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
				MarkerPole setMarkerSizeLocal GlobalMarkerSize;
				MarkerPole setMarkerPosLocal (pos);
				MarkerPole setMarkerColorLocal(PlotPoleMarkerColor);
				MarkerPole setMarkerTextLocal format ["%1",_name];
				i0=i0+1;
			}forEach poleList;
		};	
		
		If (AddTentsToMap) then 
		{
			tentList = allmissionobjects "Land_A_tent";
			i1 = 0;
			{
				_name = gettext (configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
				pos = position _x;
				deleteMarkerLocal ("tentMarker"+ (str i1));
				MarkerTent = "tentMarker" + (str i1);
				ParamsTent=[MarkerTent,pos];
				MarkerTent = createMarkerLocal ParamsTent;
				MarkerTent setMarkerTypeLocal TentsMarkerType;
				MarkerTent setMarkerSizeLocal GlobalMarkerSize;
				MarkerTent setMarkerPosLocal (pos);
				MarkerTent setMarkerColorLocal(TentsMarkerColor);
				MarkerTent setMarkerTextLocal format ["%1",_name];

				i1=i1+1;
			}forEach tentList;
		};
		
		If (AddCrashesToMap) then 
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

	If (!AddVehicleToMap && changed) then 
	{
		i=0;
		{
			deleteMarkerLocal ("vehMarker"+ (str i));
			i=i+1;
		}forEach vehList;
	};

	If (!AddPlotPoleToMap && changed) then 
	{
		i0=0;
		{
			deleteMarkerLocal ("poleMarker"+ (str i0));
			i0=i0+1;
		}forEach poleList;
	};
		
	If (!AddTentsToMap && changed) then 
	{
		i1=0;
		{
			deleteMarkerLocal ("tentMarker"+ (str i1));
			i1=i1+1;
		}forEach tentList;
	};

	If (!AddCrashesToMap && changed) then 
	{
		i2=0;
		{
			deleteMarkerLocal ("crashMarker"+ (str i2));

			i2=i2+1;
		}forEach crashList;
	};

	sleep GlobalSleep;

	// Makes sure items have correctly turned off
	if(toggleCheck != 2) then {
		toggleCheck = toggleCheck + 1;
		if(toggleCheck == 2) then {
			changed = false;
		};
	};

	{
		clearGroupIcons (group _x);
	} forEach allUnits;
};

Sleep GlobalSleep;

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

	If (AddVehicleToMap) then 
	{
		i=0;
		{
			deleteMarkerLocal ("vehMarker"+ (str i));

			i=i+1;
		}forEach vehList;
	};

	If (AddPlotPoleToMap) then 
	{
		i0=0;
		{
			deleteMarkerLocal ("poleMarker"+ (str i0));

			i0=i0+1;
		}forEach poleList;
	};
	
	If (AddTentsToMap) then 
	{
		i1=0;
		{
			deleteMarkerLocal ("tentMarker"+ (str i1));

			i1=i1+1;
		}forEach tentList;
	};

	If (AddCrashesToMap) then 
	{
		i2=0;
		{
			deleteMarkerLocal ("crashMarker"+ (str i2));

			i2=i2+1;
		}forEach crashList;
	};
	sleep 0.5;
};

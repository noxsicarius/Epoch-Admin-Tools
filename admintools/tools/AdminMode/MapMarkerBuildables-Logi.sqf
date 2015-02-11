systemChat "Modular items map marker script loaded. (Does not work though)!";

// This script does not work at the moment

if(isNil "buildableObjectsList") then {buildableObjectsList = [];};
if(isNil "buildableObjects") then {buildableObjects = (dayz_allowedObjects - storageObjects) - ["LightPole_DZ","Plastic_Pole_EP1_DZ","Generator_DZ","TrapBear","ParkBench_DZ"];};

BuildablesMarkerType="DOT";
BuildablesMarkerColor="ColorRed";
BuildablesMarkerSize = [0.4,0.4];

if(isNil "AddBuiltItemsToMap") then {AddBuiltItemsToMap = true;} else {AddBuiltItemsToMap = !AddBuiltItemsToMap};

// If the player does not have a GPS in their possession, this will attempt to add one
if !(('ItemGPS' in items player)) then { result = [player,"ItemGPS"] call BIS_fnc_invAdd;};

While {AddBuiltItemsToMap} do 
{
	buildableObjectsList = [];
	{
		buildableObjectsList = buildableObjectsList + allMissionObjects (_x);
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
	
	uiSleep 2;
};

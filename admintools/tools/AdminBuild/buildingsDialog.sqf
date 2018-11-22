private ["_dialog","_building"];
PermDialogSelected = -1;
TempDialogSelected = -1;
AdminDialogList = 13000;
buildingList = EAT_allBuildingList;

_dialog = createdialog "EAT_build_AdminDialog";
lbClear AdminDialogList;

{
	private ["_index"];
	_index = lbAdd [AdminDialogList, format["%1 - %2 (%3)", _x select 0, _x select 1, _x select 2]];
	lbSetPicture [AdminDialogList, _index];
} forEach buildingList;

LoadSpecificList = {
	lbClear AdminDialogList;
	buildingList = _this select 0;
	
	switch(buildingList) do
	{
		case "Residential":
		{
			buildingList = EAT_buildResidential;
		};
		case "Military":
		{
			buildingList = EAT_buildMilitary;
		};
		case "Industrial":
		{
			buildingList = EAT_buildIndustrial;
		};
		case "Religious":
		{
			buildingList = EAT_buildReligious;
		};
		case "Farm":
		{
			buildingList = buildFarm;
		};
		case "Ores":
		{
			buildingList = EAT_buildOre;
		};
		case "Graves":
		{
			buildingList = EAT_buildGrave;
		};
		case "Roads":
		{
			buildingList = EAT_buildRoad;
		};
		case "Other":
		{
			buildingList = EAT_buildOther;
		};
	};
	
	lbClear AdminDialogList;

	{
		private ["_index", "_x"];
		_index = lbAdd [AdminDialogList, format["%1 - %2 (%3)", _x select 0, _x select 1, _x select 2]];
		lbSetPicture [AdminDialogList, _index];
	} forEach buildingList;
};

waitUntil { !dialog };
if ((PermDialogSelected < 0) && (TempDialogSelected < 0)) exitWith {};

if (PermDialogSelected > -1) then {
	_building = ((buildingList select PermDialogSelected) select 2);
	hint format["Spawning Perm %1", _building];
	[_building,true,true] execVM "admintools\tools\AdminBuild\adminBuild.sqf";
};

if (TempDialogSelected > -1) then {
	_building = ((buildingList select TempDialogSelected) select 2);
	hint format["Spawning Temp %1", _building];
	[_building,true,false] execVM "admintools\tools\AdminBuild\adminBuild.sqf";
};

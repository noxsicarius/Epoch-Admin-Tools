private ["_dialog","_building"];
PermDialogSelected = -1;
TempDialogSelected = -1;
AdminDialogList = 13000;
buildingList = allBuildingList;

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
			buildingList = buildResidential;
		};
		case "Military":
		{
			buildingList = buildMilitary;
		};
		case "Industrial":
		{
			buildingList = buildIndustrial;
		};
		case "Religious":
		{
			buildingList = buildReligious;
		};
		case "Farm":
		{
			buildingList = buildFarm;
		};
		case "Ores":
		{
			buildingList = buildOre;
		};
		case "Graves":
		{
			buildingList = buildGrave;
		};
		case "Roads":
		{
			buildingList = buildRoad;
		};
		case "Other":
		{
			buildingList = buildOther;
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

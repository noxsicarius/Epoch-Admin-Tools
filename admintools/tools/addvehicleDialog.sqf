private ["_kindOf", "_filter", "_cfgvehicles","_dialog","_vehicle"];
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };}forEach _types;_res}
PermDialogSelected = -1;
TempDialogSelected = -1;
AdminDialogList = 13000;

if (isNil "vhnlist") then
{
	vhnlist = [];
	_kindOf = ["LandVehicle","Air","Ship"];
	_filter = ["BIS_Steerable_Parachute","ParachuteBase","StaticWeapon"];
	_cfgvehicles = configFile >> "cfgVehicles";
	titleText ["Generating Vehicle list... Wait...","PLAIN DOWN"];titleFadeOut 2;
	for "_i" from 0 to (count _cfgvehicles)-1 do 
	{
		private ["_vehicle", "_veh_type", "_textPart"];
		_vehicle = _cfgvehicles select _i;
		//				diag_log(_vehicle);
		if (isClass _vehicle) then {
			_veh_type = configName(_vehicle);
			if ((getNumber(_vehicle >> "scope") == 2) and (getText(_vehicle >> "picture") != "") and (KINDOF_ARRAY(_veh_type,_kindOf)) and !(KINDOF_ARRAY(_veh_type,_filter))) then {
				_textPart =	getText(configFile >> "cfgVehicles" >> _veh_type >> "displayName");
				_image = (gettext (configFile >> "CfgVehicles" >> _veh_type >> "picture"));
				vhnlist set [count vhnlist,[_veh_type, _textPart, _image]];
			};
		};
	};
	titleText ["List is ready...","PLAIN DOWN"];titleFadeOut 2;
};

_dialog = createdialog "EAT_Veh_AdminDialog";
lbClear AdminDialogList;
{
	private ["_index", "_x","_image"];
	_image = _x select 2;
	_index = lbAdd [AdminDialogList, format["%2 (%1)", _x select 0, _x select 1]];
  lbSetPicture [AdminDialogList, _index, _image];
	
} forEach vhnlist;

LoadSpecificList = {
	private ["_kindOf", "_filter", "_cfgvehicles","_dialog","_vehicle"];
	lbClear AdminDialogList;
		vhnlist = [];
		//_kindOf = ["LandVehicle","Air","Ship"];
		_kindOf = [_this select 0];
		_filter = ["BIS_Steerable_Parachute","ParachuteBase","StaticWeapon"];      
		_cfgvehicles = configFile >> "cfgVehicles";
		titleText ["Generating Vehicle list... Please wait ...","PLAIN DOWN"];titleFadeOut 2;
		for "_i" from 0 to (count _cfgvehicles)-1 do 
		{
			private ["_vehicle", "_veh_type", "_textPart"];
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then {
				_veh_type = configName(_vehicle);
				if ((getNumber(_vehicle >> "scope") == 2) and (getText(_vehicle >> "picture") != "") and (KINDOF_ARRAY(_veh_type,_kindOf)) and !(KINDOF_ARRAY(_veh_type,_filter))) then {
					_textPart =	getText(configFile >> "cfgVehicles" >> _veh_type >> "displayName");
					_image = (gettext (configFile >> "CfgVehicles" >> _veh_type >> "picture"));
					vhnlist set [count vhnlist,[_veh_type, _textPart, _image]];
				};
			};
		};
		titleText ["List is ready...","PLAIN DOWN"];titleFadeOut 2;
	
	lbClear AdminDialogList;
	{
		private ["_index", "_x","_image"];
		_image = _x select 2;
		_index = lbAdd [AdminDialogList, format["%2 (%1)", _x select 0, _x select 1]];
	  lbSetPicture [AdminDialogList, _index, _image];
	} forEach vhnlist;
};

waitUntil { !dialog };
if ((PermDialogSelected < 0) && (TempDialogSelected < 0)) exitWith {};

if (PermDialogSelected > -1) then {
	_vehicle = ((vhnlist select PermDialogSelected) select 0);
	hint format["Spawning Perm %1", _vehicle];
	[_vehicle] execVM "admintools\tools\addvehicle.sqf";
};

if (TempDialogSelected > -1) then {
	_vehicle = ((vhnlist select TempDialogSelected) select 0);
	hint format["Spawning Temp %1", _vehicle];
	[_vehicle] execVM "admintools\tools\addtempvehicle.sqf";
};

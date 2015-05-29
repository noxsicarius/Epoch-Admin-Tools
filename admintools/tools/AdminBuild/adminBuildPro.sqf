/*
	Modified version of Raymix's snap pro player build to work with admin build
*/
private ["_helperColor","_objectHelper","_objectHelperDir","_objectHelperPos","_canDo","_location","_dir","_classname","_item","_cancel","_reason","_tmpbuilt","_text","_offset",
"_IsNearPlot","_isOk","_location1","_location2","_position","_object","_findNearestPoles","_findNearestPole","_distance","_classnametmp","_ghost","_isPole","_lockable",
"_zheightchanged","_rotate","_combination_1","_combination_2","_combination_3","_combination_4","_combination","_combination_1_Display","_combinationDisplay","_zheightdirection",
"_vehicle","_inVehicle","_objHDiff","_isLandFireDZ","_isPerm"];

//snap vars -- temporary fix for errors so variables.sqf can be skipped
if (isNil "snapProVariables") then {
	if (isNil "DZE_snapExtraRange") then {
		DZE_snapExtraRange = 0;
	};
	if (isNil "DZE_checkNearbyRadius") then {
		DZE_checkNearbyRadius = 30;
	};
	s_player_toggleSnap = -1;
	s_player_toggleSnapSelect = -1;
	s_player_toggleSnapSelectPoint=[];
	snapActions = -1;
	snapGizmos = [];
	snapGizmosNearby = [];
	snapProVariables = true; // will skip this statement from now on.
};
// snap vars

_cancel = false;
_isPerm = false;
_reason = "";
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
_canDo = call fnc_actionAllowed;

helperDetach = false; 

DZE_Q = false;
DZE_Z = false;

DZE_Q_alt = false;
DZE_Z_alt = false;

DZE_Q_ctrl = false;
DZE_Z_ctrl = false;

DZE_5 = false;
DZE_4 = false;
DZE_6 = false;
DZE_F = false;

DZE_cancelBuilding = false;

call gear_ui_init;
closeDialog 1;

if(isNil 'isBuilding') then {isBuilding = false};
if(!_canDo) exitWith {cutText ["Cannot build while on ladder, in water, in vehicle","PLAIN DOWN"];};

if((_this select 0) == "rebuild") then {
	if(isNil "adminRebuildItem") exitWith {systemChat "You have not selected a buildable item yet"};
	_item =	adminRebuildItem;
	_isPerm = adminRebuildPerm;
} else {
	_item =	_this select 0;
	adminRebuildItem = _item;
	isBuilding = _this select 1;
	_isPerm = _this select 2;
	adminRebuildPerm = _isPerm;
};


_classname = _item;
_classnametmp = _classname;
_text = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
_ghost = getText (configFile >> "CfgVehicles" >> _classname >> "ghostpreview");

_lockable = 0;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "lockable")) then {
	_lockable = getNumber(configFile >> "CfgVehicles" >> _classname >> "lockable");
};

_isAllowedUnderGround = 1;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "nounderground")) then {
	_isAllowedUnderGround = getNumber(configFile >> "CfgVehicles" >> _classname >> "nounderground");
};

_offset = 	getArray (configFile >> "CfgVehicles" >> _classname >> "offset");
if((count _offset) <= 0) then {
	if(isBuilding) then {
		if(_item in (buildResidential - buildShed)) then {
			_offset = [0,15,2];
		} else {
			if(_item in (buildCastle + buildMilitary)) then {
				_offset = [0,3,2];
			} else {
				if(_item in buildReligious) then {
					_offset = [0,25,2];
				} else {
					if(_item in buildGrave + buildOutdoors) then {
						_offset = [0,2,1];
					} else {
						_offset = [0,6,2];
					};
				};
			};
		};
	} else {
		_offset = [0,2,0];
	};
};

_isPole = (_classname == "Plastic_Pole_EP1_DZ");
_isLandFireDZ = (_classname == "Land_Fire_DZ");

_distance = DZE_PlotPole select 0;

if(_isPole) then {
	_distance = DZE_PlotPole select 1;
};

// check for near plot
_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
_findNearestPole = [];

{
	if (alive _x) then {
		_findNearestPole set [(count _findNearestPole),_x];
	};
} count _findNearestPoles;

_IsNearPlot = count (_findNearestPole);

// If item is plot pole && another one exists within 45m
if(_isPole && _IsNearPlot > 0) exitWith {  DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_44") , "PLAIN DOWN"]; };

_location = [0,0,0];
_isOk = true;

// get inital players position
_location1 = [player] call FNC_GetPos;
_dir = getDir player;

// if ghost preview available use that instead
if (_ghost != "") then {
	_classname = _ghost;
};

_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
//Build gizmo
_objectHelper = "Sign_sphere10cm_EP1" createVehicle _location;
_helperColor = "#(argb,8,8,3)color(0,0,0,0,ca)";
_objectHelper setobjecttexture [0,_helperColor];
_objectHelper attachTo [player,_offset];
_object attachTo [_objectHelper,[0,0,0]];
_position = [_objectHelper] call FNC_GetPos;
	
_objHDiff = 0;

if (isClass (missionConfigFile >> "SnapBuilding" >> _classname)) then {	
	["","","",["ON",_object,_classname,_objectHelper]] spawn snap_build;
};
	
while {_isOk} do {

	_zheightchanged = false;
	_zheightdirection = "";
	_rotate = false;

	if (DZE_Q) then {
		DZE_Q = false;
		_zheightdirection = "up";
		_zheightchanged = true;
	};
	if (DZE_Z) then {
		DZE_Z = false;
		_zheightdirection = "down";
		_zheightchanged = true;
	};
	if (DZE_Q_alt) then {
		DZE_Q_alt = false;
		_zheightdirection = "up_alt";
		_zheightchanged = true;
	};
	if (DZE_Z_alt) then {
		DZE_Z_alt = false;
		_zheightdirection = "down_alt";
		_zheightchanged = true;
	};
	if (DZE_Q_ctrl) then {
		DZE_Q_ctrl = false;
		_zheightdirection = "up_ctrl";
		_zheightchanged = true;
	};
	if (DZE_Z_ctrl) then {
		DZE_Z_ctrl = false;
		_zheightdirection = "down_ctrl";
		_zheightchanged = true;
	};
	if (DZE_4) then {
		_rotate = true;
		DZE_4 = false;
		_dir = -45;
	};
	if (DZE_6) then {
		_rotate = true;
		DZE_6 = false;
		_dir = 45;
	};
	
	if (DZE_F and _canDo) then {	
		if (helperDetach) then {
			_objectHelperDir = getDir _objectHelper; 
			_objectHelper attachTo [player];
			_objectHelper setDir _objectHelperDir-(getDir player);
			helperDetach = false;
		} else {
			_objectHelperDir = getDir _objectHelper;
			detach _objectHelper;
			[_objectHelper]	call FNC_GetSetPos;
			_objectHelper setVelocity [0,0,0]; //fix sliding glitch
			helperDetach = true;
		};
		DZE_F = false;
	};

	if(_rotate) then {
		if (helperDetach) then {
			_objectHelperDir = getDir _objectHelper;
			_objectHelper setDir _objectHelperDir+_dir;
			[_objectHelper]	call FNC_GetSetPos;
		} else {
			detach _objectHelper;
			_objectHelperDir = getDir _objectHelper;
			_objectHelper setDir _objectHelperDir+_dir;
			[_objectHelper]	call FNC_GetSetPos;
			_objectHelperDir = getDir _objectHelper;
			_objectHelper attachTo [player];
			_objectHelper setDir _objectHelperDir-(getDir player);		
		};
	};

	if(_zheightchanged) then {
		if (!helperDetach) then {
			detach _objectHelper;
			_objectHelperDir = getDir _objectHelper;
		};

		_position = [_objectHelper] call FNC_GetPos;

		if(_zheightdirection == "up") then {
			_position set [2,((_position select 2)+0.1)];
			_objHDiff = _objHDiff + 0.1;
		};
		if(_zheightdirection == "down") then {
			_position set [2,((_position select 2)-0.1)];
			_objHDiff = _objHDiff - 0.1;
		};

		if(_zheightdirection == "up_alt") then {
			_position set [2,((_position select 2)+1)];
			_objHDiff = _objHDiff + 1;
		};
		if(_zheightdirection == "down_alt") then {
			_position set [2,((_position select 2)-1)];
			_objHDiff = _objHDiff - 1;
		};

		if(_zheightdirection == "up_ctrl") then {
			_position set [2,((_position select 2)+0.01)];
			_objHDiff = _objHDiff + 0.01;
		};
		if(_zheightdirection == "down_ctrl") then {
			_position set [2,((_position select 2)-0.01)];
			_objHDiff = _objHDiff - 0.01;
		};

		if((_isAllowedUnderGround == 0) && ((_position select 2) < 0)) then {
			_position set [2,0];
		};

		if (surfaceIsWater _position) then {
			_objectHelper setPosASL _position;
		} else {
			_objectHelper setPosATL _position;
		};

		if (!helperDetach) then {
		_objectHelper attachTo [player];
		_objectHelper setDir _objectHelperDir-(getDir player);
		};
	};

	sleep 0.5;

	_location2 = [player] call FNC_GetPos;
	_objectHelperPos = [_objectHelper] call FNC_GetPos;

	if(DZE_5) exitWith {
		_isOk = false;
		_position = [_object] call FNC_GetPos;
		detach _object;
		_dir = getDir _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};

	if(_location1 distance _location2 > 15) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "You've moved too far away from where you started building (within 15 meters)";
		detach _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};
		
	if(_location1 distance _objectHelperPos > 15) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "Object is placed to far away from where you started building (within 15 meters)";
		detach _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};

	if(abs(_objHDiff) > 15) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "Cannot move up or down more than 15 meters";
		detach _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};

	if (DZE_cancelBuilding) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "Cancelled building.";
		detach _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};
};

if(!_cancel) then {
	_classname = _classnametmp;

	// Start Build
	_tmpbuilt = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
	_tmpbuilt setdir _dir;
	_location = _position;

	if((_isAllowedUnderGround == 0) && ((_location select 2) < 0)) then {
		_location set [2,0];
	};

	if (surfaceIsWater _location) then {
		_tmpbuilt setPosASL _location;
		_location = ASLtoATL _location;
	} else {
		_tmpbuilt setPosATL _location;
	};

	cutText [format[(localize "str_epoch_player_138"),_text], "PLAIN DOWN"];

	cutText [format[localize "str_build_01",_text], "PLAIN DOWN"];

	if (_isPole) then {
		[] spawn player_plotPreview;
	};

	_tmpbuilt setVariable ["OEMPos",_location,true];

	if(_lockable > 1) then {

		_combinationDisplay = "";

		switch (_lockable) do {
			case 2: { // 2 lockbox
				_combination_1 = (floor(random 3)) + 100; // 100=red,101=green,102=blue
				_combination_2 = floor(random 10);
				_combination_3 = floor(random 10);
				_combination = format["%1%2%3",_combination_1,_combination_2,_combination_3];
				dayz_combination = _combination;
				if (_combination_1 == 100) then {
					_combination_1_Display = "Red";
				};
				if (_combination_1 == 101) then {
					_combination_1_Display = "Green";
				};
				if (_combination_1 == 102) then {
					_combination_1_Display = "Blue";
				};
				_combinationDisplay = format["%1%2%3",_combination_1_Display,_combination_2,_combination_3];
			};

			case 3: { // 3 combolock
				_combination_1 = floor(random 10);
				_combination_2 = floor(random 10);
				_combination_3 = floor(random 10);
				_combination = format["%1%2%3",_combination_1,_combination_2,_combination_3];
				dayz_combination = _combination;
				_combinationDisplay = _combination;
			};

			case 4: { // 4 safe
				_combination_1 = floor(random 10);
				_combination_2 = floor(random 10);
				_combination_3 = floor(random 10);
				_combination_4 = floor(random 10);
				_combination = format["%1%2%3%4",_combination_1,_combination_2,_combination_3,_combination_4];
				dayz_combination = _combination;
				_combinationDisplay = _combination;
			};
		};

		_tmpbuilt setVariable ["CharacterID",_combination,true];


		PVDZE_obj_Publish = [_combination,_tmpbuilt,[_dir,_location],_classname];
		publicVariableServer "PVDZE_obj_Publish";
		cutText [format[(localize "str_epoch_player_140"),_combinationDisplay,_text], "PLAIN DOWN", 5];

	} else {
		if(_isPerm) then {
			_tmpbuilt setVariable ["CharacterID",dayz_characterID,true];

			// fire?
			if(_tmpbuilt isKindOf "Land_Fire_DZ") then {
				_tmpbuilt spawn player_fireMonitor;
			} else {
				PVDZE_obj_Publish = [dayz_characterID,_tmpbuilt,[_dir,_location],_classname];
				publicVariableServer "PVDZE_obj_Publish";
			};
		};
	};
} else {
	deleteVehicle _tmpbuilt;
	cutText [(localize "str_epoch_player_46") , "PLAIN DOWN"];
};
snapTutorial = false;
[0,0,0] call fnc_snapActionCleanup;
call fnc_initSnapPointsCleanup;
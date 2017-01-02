private ["_abort","_reason","_distance","_isNear","_lockable","_isAllowedUnderGround","_offset","_classname",
"_zheightdirection","_zheightchanged","_rotate","_objectHelperPos","_objectHelperDir","_objHDiff","_position",
"_isOk","_dir","_vector","_cancel","_location2","_buildOffset","_location",
"_counter","_dis","_sfx","_combination_1_Display","_combination_1",
"_combination_2","_combination_3","_combination","_combinationDisplay","_combination_4","_num_removed",
"_tmpbuilt","_vUp","_classnametmp","_text","_ghost","_objectHelper","_location1","_object","_helperColor",
"_canDo","_pos","_onLadder","_vehicle","_inVehicle","_isPole","_isPerm"];

//Check if building already in progress, exit if so.
if (dayz_actionInProgress) exitWith {localize "str_epoch_player_40" call dayz_rollingMessages;};
dayz_actionInProgress = true;

_pos = [player] call FNC_GetPos;

_onLadder =	(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
_isPerm = false;

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

DZE_updateVec = false;
DZE_memDir = 0;
DZE_memForBack = 0;
DZE_memLeftRight = 0;

call gear_ui_init;
closeDialog 1;

if (dayz_isSwimming) exitWith {dayz_actionInProgress = false; localize "str_player_26" call dayz_rollingMessages;};
if (_inVehicle) exitWith {dayz_actionInProgress = false; localize "str_epoch_player_42" call dayz_rollingMessages;};
if (_onLadder) exitWith {dayz_actionInProgress = false; localize "str_player_21" call dayz_rollingMessages;};

DZE_buildItem =	_this select 0;
if(isNil "adminRebuildItem" && DZE_buildItem == "rebuild") exitWith {dayz_actionInProgress = false; systemChat "You have not selected a buildable item yet"};
if(DZE_buildItem == "rebuild") then {
	DZE_buildItem =	adminRebuildItem;
	_isPerm = adminRebuildPerm;
} else {
	adminRebuildItem = DZE_buildItem;
	isBuilding = _this select 1;
	adminRebuildPerm = _this select 2;
	_isPerm = adminRebuildPerm;
};
// declare tempVariables for the unidimentional array with the list of each items for each category to be compared
_buildRes = [(EAT_buildResidential - EAT_buildShed)] call myfnc_MDarray;
_buildMil = [(EAT_buildCastle + EAT_buildMilitary)] call myfnc_MDarray;
_buildReli = [EAT_buildReligious] call myfnc_MDarray;
_buildMisc = [(EAT_buildGrave + EAT_buildOutdoors)] call myfnc_MDarray;

_classname = DZE_buildItem;
_classnametmp = _classname;

_text = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
if(isNil "_text") then {
	_text = _classname;
};
_ghost = getText (configFile >> "CfgVehicles" >> _classname >> "ghostpreview");

_lockable = 0; //default define if lockable not found in config file below
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "lockable")) then { //find out if item is lockable object
	_lockable = getNumber(configFile >> "CfgVehicles" >> _classname >> "lockable"); // 2=lockbox, 3=combolock, 4=safe
};

_isAllowedUnderGround = 1; //check if allowed to build under terrain
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "nounderground")) then {
	_isAllowedUnderGround = getNumber(configFile >> "CfgVehicles" >> _classname >> "nounderground");
};

_offset = 	getArray (configFile >> "CfgVehicles" >> _classname >> "offset"); //check default distance offset, define if does not exist

if((count _offset) <= 0) then {
	if(isBuilding) then {
		
		if(DZE_buildItem in _buildRes) then {
			_offset = [0,15,2];
		} else {
			if(DZE_buildItem in _buildMil) then {
				_offset = [0,3,2];
			} else {
				if(DZE_buildItem in _buildReli) then {
					_offset = [0,25,2];
				} else {
					if(DZE_buildItem in _buildMisc) then {
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

_distance = DZE_PlotPole select 0;
_needText = localize "str_epoch_player_246";

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
if(_isPole && _IsNearPlot > 0) exitWith {dayz_actionInProgress = false; cutText ["You are too close to another plot pole" , "PLAIN DOWN"]; };

_objectHelper = objNull;
_isOk = true;
_location1 = [player] call FNC_GetPos; // get inital players position
_dir = getDir player; //required to pass direction when building

// if ghost preview available use that instead
if (_ghost != "") then {
	_classname = _ghost;
};

_object = createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"]; //object preview, not an actual object that will be built

if((count _offset) <= 0) then {
	_offset = [0,(abs(((boundingBox _object)select 0) select 1)),0];
};

_objectHelper = "Sign_sphere10cm_EP1" createVehicle [0,0,0];
_helperColor = "#(argb,8,8,3)color(0,0,0,0,ca)";
_objectHelper setobjecttexture [0,_helperColor];
_objectHelper attachTo [player,_offset];
_object attachTo [_objectHelper,[0,0,0]];

if (isClass (configFile >> "SnapBuilding" >> _classname)) then {	
	["","","",["Init",_object,_classname,_objectHelper]] spawn snap_build;
};

if !(DZE_buildItem in DZE_noRotate) then{
	["","","",["Init","Init",0]] spawn build_vectors;
};

_objHDiff = 0;	
_cancel = false;
_reason = "";

helperDetach = false;
_canDo = (!r_drag_sqf and !r_player_unconscious);
_position = [_objectHelper] call FNC_GetPos;

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
		if(DZE_dirWithDegrees) then{
			DZE_memDir = DZE_memDir - DZE_curDegree;
		}else{
			DZE_memDir = DZE_memDir - 45;
		};
	};
	if (DZE_6) then {
		_rotate = true;
		DZE_6 = false;
		if(DZE_dirWithDegrees) then{
			DZE_memDir = DZE_memDir + DZE_curDegree;
		}else{
			DZE_memDir = DZE_memDir + 45;
		};
	};
		
	if(DZE_updateVec) then{
		[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
		DZE_updateVec = false;
	};
	
	if (DZE_F and _canDo) then {
		if (helperDetach) then {
			_objectHelper attachTo [player];
			DZE_memDir = DZE_memDir-(getDir player);
			helperDetach = false;
			[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
		} else {		
			_objectHelperPos = getPosATL _objectHelper;
			detach _objectHelper;			
			DZE_memDir = getDir _objectHelper;
			[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
			_objectHelper setPosATL _objectHelperPos;
			_objectHelper setVelocity [0,0,0]; //fix sliding glitch
			helperDetach = true;
		};
		DZE_F = false;
	};
	
	if(_rotate) then {
		[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
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
		};
		[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
	};

	uiSleep 0.5;

	_location2 = [player] call FNC_GetPos;
	_objectHelperPos = [_objectHelper] call FNC_GetPos;
		
	if(DZE_5) exitWith {
		_position = [_object] call FNC_GetPos;
		detach _object;
		_dir = getDir _object;
		_vector = [(vectorDir _object),(vectorUp _object)];	
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};

	if(_location1 distance _location2 > DZE_buildMaxMoveDistance) exitWith {
		_cancel = true;
		_reason = format[localize "STR_EPOCH_BUILD_FAIL_MOVED",DZE_buildMaxMoveDistance];
		detach _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};
		
	if(_location1 distance _objectHelperPos > DZE_buildMaxMoveDistance) exitWith {
		_cancel = true;
		_reason = format[localize "STR_EPOCH_BUILD_FAIL_TOO_FAR",DZE_buildMaxMoveDistance];
		detach _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};

	if (DZE_cancelBuilding) exitWith {
		_cancel = true;
		_reason = localize "STR_EPOCH_PLAYER_46";
		detach _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};
};
_proceed = false;
_counter = 0;
_location = [0,0,0];

if(!_cancel) then {

	_classname = _classnametmp;

	// Start Build
	_tmpbuilt = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"]; //create actual object that will be published to database

	_tmpbuilt setdir _dir; //set direction inherited from passed args from control
	_tmpbuilt setVariable["memDir",_dir,true];

	// Get position based on object
	_location = _position;

	if((_isAllowedUnderGround == 0) && ((_location select 2) < 0)) then { //check Z axis if not allowed to build underground
		_location set [2,0]; //reset Z axis to zero (above terrain)
	};
		
	_tmpbuilt setVectorDirAndUp _vector;
		
	_buildOffset = [0,0,0];
	_vUp = _vector select 1;
	switch (_classname) do {
		case "MetalFloor_DZ": { _buildOffset = [(_vUp select 0) * .148, (_vUp select 1) * .148,0]; };
		case "CinderWall_DZ": { _buildOffset = [(_vUp select 0) * 1.686, (_vUp select 1) * 1.686,0]; };
	};
		
	_location = [
		(_location select 0) - (_buildOffset select 0),
		(_location select 1) - (_buildOffset select 1),
		(_location select 2) - (_buildOffset select 2)
	];
	
	if (surfaceIsWater _location) then {
		_tmpbuilt setPosASL _location;
		_location = ASLtoATL _location; //Database uses ATL
	} else {
		_tmpbuilt setPosATL _location;
	};

	format[localize "str_epoch_player_138",_text] call dayz_rollingMessages;

	call player_forceSave;
		
	format[localize "str_build_01",_text] call dayz_rollingMessages;

	_tmpbuilt setVariable ["OEMPos",_location,true]; //store original location as a variable

	if(_lockable > 1) then { //if item has code lock on it
		_combinationDisplay = ""; //define new display
			
		switch (_lockable) do { //generate random combinations depending on item type
			case 2: { // 2 lockbox
				_combination_1 = (floor(random 3)) + 100; // 100=red,101=green,102=blue
				_combination_2 = floor(random 10);
				_combination_3 = floor(random 10);
				_combination = format["%1%2%3",_combination_1,_combination_2,_combination_3];
				dayz_combination = _combination;
				if (_combination_1 == 100) then {
					_combination_1_Display = localize "STR_TEAM_RED";
				};
				if (_combination_1 == 101) then {
					_combination_1_Display = localize "STR_TEAM_GREEN";
				};
				if (_combination_1 == 102) then {
					_combination_1_Display = localize "STR_TEAM_BLUE";
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

		_tmpbuilt setVariable ["CharacterID",_combination,true]; //set combination as a character ID
		//call publish precompiled function with given args and send public variable to server to save item to database
		if (DZE_permanentPlot) then {
			_tmpbuilt setVariable ["ownerPUID",dayz_playerUID,true];
			PVDZ_obj_Publish = [_combination,_tmpbuilt,[_dir,_location,dayz_playerUID,_vector],[]];
			if (_lockable == 3) then {
				_friendsArr = [[dayz_playerUID,toArray (name player)]];
				_tmpbuilt setVariable ["doorfriends", _friendsArr, true];
				PVDZ_obj_Publish = [_combination,_tmpbuilt,[_dir,_location,dayz_playerUID,_vector],_friendsArr];
			};
		} else {
			PVDZ_obj_Publish = [_combination,_tmpbuilt,[_dir,_location, _vector],[]];
		};
		publicVariableServer "PVDZ_obj_Publish";

		[format[localize "str_epoch_player_140",_combinationDisplay,_text],1] call dayz_rollingMessages; //display new combination
		systemChat format[localize "str_epoch_player_140",_combinationDisplay,_text];
	} else { //if not lockable item
		if(_isPerm) then {
			_tmpbuilt setVariable ["CharacterID",dayz_characterID,true];
			// fire?
			if(_tmpbuilt isKindOf "Land_Fire_DZ") then { //if campfire, then spawn, but do not publish to database
				_tmpbuilt spawn player_fireMonitor;
			} else {
				if (DZE_permanentPlot) then {
					_tmpbuilt setVariable ["ownerPUID",dayz_playerUID,true];
					if (_isPole) then {
						_friendsArr = [[dayz_playerUID,toArray (name player)]];
						_tmpbuilt setVariable ["plotfriends", _friendsArr, true];
						PVDZ_obj_Publish = [dayz_characterID,_tmpbuilt,[_dir,_location,dayz_playerUID,_vector],_friendsArr];
					} else {
						PVDZ_obj_Publish = [dayz_characterID,_tmpbuilt,[_dir,_location,dayz_playerUID,_vector],[]];
					};
				} else {
					PVDZ_obj_Publish = [dayz_characterID,_tmpbuilt,[_dir,_location, _vector],[]];
				};
				publicVariableServer "PVDZ_obj_Publish";
			};
		};
	};

	// Tool use logger
	if(EAT_logMinorTool) then {
		EAT_PVEH_usageLogger = format["%1 %2 -- has used admin build to place: %3",name player,getPlayerUID player,_item];
		[] spawn {publicVariable "EAT_PVEH_usageLogger";};
	};
	
} else { //cancel build if passed _cancel arg was true or building on roads/trader city
	format[localize "str_epoch_player_47",_text,_reason] call dayz_rollingMessages;
};

dayz_actionInProgress = false;
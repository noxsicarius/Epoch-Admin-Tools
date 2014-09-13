private ["_location","_dir","_classname","_item","_hasrequireditem","_missing","_hastoolweapon","_cancel","_reason","_started","_finished","_animState","_isMedic","_dis","_sfx","_hasbuilditem","_tmpbuilt","_onLadder","_isWater","_require","_text","_offset","_IsNearPlot","_isOk","_location1","_location2","_counter","_limit","_proceed","_num_removed","_position","_object","_canBuildOnPlot","_friendlies","_nearestPole","_ownerID","_findNearestPoles","_findNearestPole","_distance","_classnametmp","_ghost","_isPole","_needText","_lockable","_zheightchanged","_rotate","_combination_1","_combination_2","_combination_3","_combination_4","_combination","_combination_1_Display","_combinationDisplay","_zheightdirection","_abort","_isNear","_need","_needNear","_vehicle","_inVehicle","_requireplot","_objHDiff","_isLandFireDZ","_isTankTrap"];

_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater = 		dayz_isSwimming;
_cancel = false;
_reason = "";
_canBuildOnPlot = false;
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

DZE_Q = false;
DZE_Z = false;

DZE_Q_alt = false;
DZE_Z_alt = false;

DZE_Q_ctrl = false;
DZE_Z_ctrl = false;

DZE_5 = false;
DZE_4 = false;
DZE_6 = false;

DZE_cancelBuilding = false;

call gear_ui_init;
closeDialog 1;
if(isNil 'isBuilding') then {isBuilding = false};
if (_isWater) exitWith {cutText [localize "str_player_26", "PLAIN DOWN"];};
if (_inVehicle) exitWith {cutText [(localize "str_epoch_player_42"), "PLAIN DOWN"];};
if (_onLadder) exitWith {cutText [localize "str_player_21", "PLAIN DOWN"];};

if((_this select 0) == "rebuild") then {
	if(isNil "adminRebuildItem") exitWith {systemChat "You have not selected a buildable item yet"};
	_item =	adminRebuildItem;
} else {
	_item =	_this select 0;
	adminRebuildItem = _item;
	if((_this select 1) == "building") then {isBuilding = true;} else {isBuilding = false;};
};

_classname = _item;
_classnametmp = _classname;
_text = 		getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
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
		_offset = [0,10,2];
	} else {
		_offset = [0,2,0];
	};
};

_isPole = (_classname == "Plastic_Pole_EP1_DZ");
_isLandFireDZ = (_classname == "Land_Fire_DZ");

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
if(_isPole && _IsNearPlot > 0) exitWith {cutText [(localize "str_epoch_player_44") , "PLAIN DOWN"]; };

_missing = "";

_location = [0,0,0];
_isOk = true;

// get inital players position
_location1 = getPosATL player;
_dir = getDir player;

// if ghost preview available use that instead
if (_ghost != "") then {
	_classname = _ghost;
};

_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
_object attachTo [player,_offset];
_position = getPosATL _object;

cutText [(localize "str_epoch_player_45"), "PLAIN DOWN"];

_objHDiff = 0;

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
		_dir = 180;
	};
	if (DZE_6) then {
		_rotate = true;
		DZE_6 = false;
		_dir = 0;
	};

	if(_rotate) then {
		_object setDir _dir;
		_object setPosATL _position;
		//diag_log format["DEBUG Rotate BUILDING POS: %1", _position];
	};

	if(_zheightchanged) then {
		detach _object;
		_position = getPosATL _object;

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

		_object setDir (getDir _object);

		if((_isAllowedUnderGround == 0) && ((_position select 2) < 0)) then {
			_position set [2,0];
		};

		_object setPosATL _position;

		//diag_log format["DEBUG Change BUILDING POS: %1", _position];

		_object attachTo [player];

	};

	sleep 0.5;

	_location2 = getPosATL player;

	if(DZE_5) exitWith {
		_isOk = false;
		detach _object;
		_dir = getDir _object;
		_position = getPosATL _object;
		//diag_log format["DEBUG BUILDING POS: %1", _position];
		deleteVehicle _object;
	};

	if(_location1 distance _location2 > 15) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "You've moved to far away from where you started building (within 10 meters)";
		detach _object;
		deleteVehicle _object;
	};
	if(abs(_objHDiff) > 20) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "Cannot move up || down more than 20 meters";
		detach _object;
		deleteVehicle _object;
	};

	if (DZE_cancelBuilding) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "Cancelled building.";
		detach _object;
		deleteVehicle _object;
	};
};

if(!_cancel) then {
	_classname = _classnametmp;

	// Start Build
	_tmpbuilt = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];

	_tmpbuilt setdir _dir;

	// Get position based on object
	_location = _position;

	if((_isAllowedUnderGround == 0) && ((_location select 2) < 0)) then {
		_location set [2,0];
	};

	_tmpbuilt setPosATL _location;


	cutText [format[(localize "str_epoch_player_138"),_text], "PLAIN DOWN"];

	_isOk = true;

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
		if(!isBuilding) then {
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
	
	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has used admin build to place: %3",name player,getPlayerUID player,_item];
		[] spawn {publicVariable "usageLogger";};
	};
} else {
	r_interrupt = false;
	
	cutText [(localize "str_epoch_player_46") , "PLAIN DOWN"];
};
/*
	Base Manager
	by maca134 
	edits and base destruct integration by NoxSicarius
	Export added by NoxSicarius for saving to sqf
	Allows you to copy/paste, save structures and insert them into the game.
	Also allows for deletion of bases and the items in them.
*/

/***************** add basses here *****************/
BCBaseList = [
	[
		"base1",
		"Test Base",
		[0,23,0],
		[
			["CinderWallDoor_DZ",[0.0551758,-0.736328,3.37357],239.861],
			["MetalFloor_DZ",[2.53516,0.763672,6.58356],59.9374],
			["MetalFloor_DZ",[2.54492,0.763672,3.19955],59.8886],
			["MetalFloor_DZ",[-2.00488,-1.83691,6.58356],239.937],
			["MetalFloor_DZ",[-2.00488,-1.83691,3.19955],239.889],
			["CinderWall_DZ",[-4.20508,1.36328,3.38358],150.186],
			["CinderWallDoorSmall_DZ",[-2.5249,3.76367,3.38358],239.993],
			["FireBarrel_DZ",[4.40527,1.86328,3.43457],59.2191],
			["CinderWallDoor_DZ",[4.78516,2.06348,-0.000427246],59.9374],
			["MetalFloor_DZ",[-0.0947266,5.26367,6.58356],239.937],
			["MetalFloor_DZ",[-0.0947266,5.26367,3.19955],59.8886],
			["WoodSmallWallThird_DZ",[4.84521,2.06348,3.38358],239.847],
			["WoodSmallWallThird_DZ",[4.89502,1.96289,3.38358],59.8468],
			["MetalFloor_DZ",[-4.63477,2.66309,3.19955],239.889],
			["MetalFloor_DZ",[-4.63477,2.66309,6.58356],59.9374],
			["CinderWall_DZ",[-0.214844,-5.63672,3.38358],329.709],
			["CinderWallDoorSmall_DZ",[2.71484,-5.23633,3.39355],59.7286],
			["MetalFloor_DZ",[5.16504,-3.83691,6.58356],239.937],
			["MetalFloor_DZ",[5.1748,-3.83691,3.19955],59.8886],
			["MetalFloor_DZ",[0.625,-6.43652,6.58356],59.9374],
			["MetalFloor_DZ",[0.635254,-6.43652,3.19955],239.889],
			["CinderWall_DZ",[6.18506,2.76367,3.38358],60.0843],
			["CinderWallDoorSmall_DZ",[2.33496,6.36328,-0.000427246],59.7633],
			["CinderWall_DZ",[-1.50488,7.46289,3.38956],329.972],
			["CinderWall_DZ",[-1.54492,7.46289,-0.000427246],150.363],
			["CinderWall_DZ",[-6.04492,4.76367,-0.000427246],148.928],
			["CinderWallDoorSmall_DZ",[7.34521,-2.33691,0.009552],59.8816],
			["CinderWallHalf_DZ",[-6.23486,4.66309,3.38956],149.364],
			["MetalFloor_DZ",[7.08496,3.36328,6.58356],59.9374],
			["MetalFloor_DZ",[-6.54492,-4.53711,3.19955],239.889],
			["MetalFloor_DZ",[-6.54492,-4.53711,6.58356],239.937],
			["MetalFloor_DZ",[5.36523,6.36328,3.18356],59.7772],
			["CinderWall_DZ",[8.55518,1.06348,-0.000427246],149.939],
			["CinderWall_DZ",[-8.59473,-1.13672,3.38358],150.109],
			["MetalFloor_DZ",[8.90527,0.263672,3.19357],59.8189],
			["CinderWall_DZ",[6.375,-6.23633,3.37958],149.81],
			["CinderWall_DZ",[6.375,-6.23633,-0.000427246],329.81],
			["Sandbag1_DZ",[6.68506,6.16309,-0.00143433],329.956],
			["MetalFloor_DZ",[4.44482,7.96289,3.19955],59.8886],
			["MetalFloor_DZ",[4.45508,7.96289,6.58356],59.9374],
			["MetalFloor_DZ",[-9.1748,0.0634766,6.58356],239.937],
			["MetalFloor_DZ",[-9.1748,0.0634766,3.19955],239.889],
			["CinderWallHalf_DZ",[1.60498,-9.03711,3.37958],149.81],
			["CinderWall_DZ",[1.60498,-9.03711,-0.000427246],329.81],
			["CinderWall_DZ",[-4.58496,-8.13672,3.38358],329.818],
			["CinderWallDoorSmall_DZ",[7.10498,6.36328,3.39755],330.226],
			["MetalFloor_DZ",[8.5752,4.26367,3.19357],59.7494],
			["MetalFloor_DZ",[8.70508,4.26367,6.58755],59.9444],
			["MetalFloor_DZ",[9.71484,-1.13672,6.58356],59.9374],
			["MetalFloor_DZ",[-3.90479,-9.03711,3.19955],239.889],
			["MetalFloor_DZ",[-3.91504,-9.03711,6.58356],239.937],
			["CinderWallDoorSmall_DZ",[9.78516,1.76367,3.39755],149.591],
			["WoodStairsSans_DZ",[9.64502,-3.23633,0.299561],149.952],
			["WoodSmallWallThird_DZ",[10.1748,-1.83691,3.37756],149.842],
			["WoodSmallWallThird_DZ",[10.2148,-1.73633,3.37756],329.842],
			["CinderWall_DZ",[3.24512,10.1631,-0.000427246],150.363],
			["CinderWall_DZ",[3.24512,10.1631,3.37958],330.363],
			["CinderWall_DZ",[-9.03516,-5.73633,-0.000427246],60.2108],
			["CinderWall_DZ",[-9.60498,-4.73633,3.38956],60.2249],
			["CinderWall_DZ",[-10.5649,2.16309,-0.000427246],150.057],
			["CinderWallHalf_DZ",[-10.5649,2.16309,3.37958],330.057],
			["CinderWall_DZ",[-8.23486,-7.13672,3.38956],60.0563],
			["CinderWall_DZ",[6.85498,9.16309,3.37958],60.0283],
			["CinderWall_DZ",[6.85498,9.16309,-0.000427246],240.028],
			["CinderWall_DZ",[-11.5552,-1.33691,-0.000427246],60.3165],
			["CinderWallHalf_DZ",[-11.5552,-1.33691,3.37958],240.317],
			["CinderWall_DZ",[11.1353,-3.43652,-0.000427246],329.81],
			["CinderWall_DZ",[11.1353,-3.43652,3.37958],149.81],
			["CinderWallHalf_DZ",[-2.60498,-11.4365,3.37958],150.089],
			["CinderWall_DZ",[-2.60498,-11.4365,-0.000427246],330.089],
			["CinderWallHalf_DZ",[10.7451,5.46289,3.37357],59.9723],
			["CinderWall_DZ",[12.0649,0.163086,3.37958],60.1405],
			["CinderWall_DZ",[12.0649,0.163086,-0.000427246],240.14],
			["CinderWall_DZ",[-6.29492,-10.5371,-0.000427246],60.2108],
			["CinderWallHalf_DZ",[-6.29492,-10.5371,3.37958],240.211],
			["WoodStairsSans_DZ",[12.2749,-1.63672,-2.20044],149.947]
		]
	] // to add a base place a comma here. ex: ],
	//add base from server/EpochAdminToolLogs/SavedBases here
];

if(isNil "BD_Buildables") then {BD_Buildables = true;};
if(isNil "BD_PlotPoles") then {BD_PlotPoles = true;};
if(isNil "BD_vehicles") then {BD_vehicles = true;};
if(isNil "BCCurrentBase") then {BCCurrentBase = [];};

// Temp variables to fix the trader dialogue issue
private ["_TraderDialogLoadItemList","_TraderDialogShowPrices","_TraderDialogSell"];
_TraderDialogLoadItemList = TraderDialogLoadItemList;
_TraderDialogShowPrices = TraderDialogShowPrices;
_TraderDialogSell = TraderDialogSell;

TraderDialogLoadItemList = {};
TraderDialogShowPrices = {};
TraderDialogSell = {};

TraderDialogBuy = {
	systemChat str [lbCurSel 12000, lbCurSel 12001];
	[lbCurSel 12000, lbCurSel 12001] spawn {
		private ["_pindex", "_bindex", "_base", "_player", "_base_objects"];
		systemChat str _this;
		_pindex = _this select 0;
		_bindex = _this select 1;
		if (_pindex < 0 or _bindex < 0) exitWith {};
		_base = BCBaseList select _bindex;
		_player = BCNearbyList select _pindex;
		_attach_position = player modelToWorld (_base select 2);
		_attach_position set [2, getPosASL player select 2];
		_base_objects = [_base select 3, _attach_position, _player] call fn_BCCreateBase;
		[_base_objects] call fn_BCBuildbase;
	};
};

fn_BCInsert = {
	createdialog "TraderDialog";
	lbClear 12000;
	lbClear 12001;
	ctrlShow [12005, false];
	{
		lbAdd [12001, format["%1 (%2)", _x select 1, _x select 0]];
		true
	} count BCBaseList;

	BCNearbyList = [];
	{
		if (_x isKindOf "Man" and !(_x isKindOf "zZombie_base")) then {
			BCNearbyList set [count BCNearbyList, _x];
			lbAdd [12000, format["%1", name _x]];
		};
		true
	} count (player nearEntities ["CAManBase", 10]);
};

fn_BCSetCenter = {
	private ["_centerSign"];
	BC_radius = nil;
	BC_Center = getPosASL player;
	_centerSign = createVehicle ["Sign_arrow_down_large_EP1", [0,0,0], [], 0, "CAN_COLLIDE"];
	_centerSign setPosASL BC_Center;
	_centerSign spawn {sleep 30; deleteVehicle _this;};
	showCommandingMenu "#USER:BCMainMenu";
};

fn_BCSetRadius = {
	if (isNil "BC_Center") exitWith
	{
		systemChat "Center not set";
	};
	BC_radius = [player, BC_center] call BIS_fnc_distance2D;
	showCommandingMenu "#USER:BCMainMenu";
	[] spawn {
		private ["_pos", "_radius", "_angle", "_distance", "_count", "_step", "_count", "_step", "_objects"];
		_angle = 0;
		_count = round((2 * pi * BC_radius) / 2);
		_objects = [];
		for "_x" from 0 to _count do
		{
			private["_a", "_b", "_obj"];
			_a = (BC_Center select 0) + (sin(_angle)*BC_radius);
			_b = (BC_Center select 1) + (cos(_angle)*BC_radius);
			_obj = createVehicle ["Sign_sphere100cm_EP1", [0,0,0], [], 0, "CAN_COLLIDE"];
			_obj setPosASL [_a, _b, BC_center select 2];
			_objects set [count _objects, _obj];
			_angle = _angle + (360/_count);
		};
		
		for "_x" from 0 to _count do
		{
			private["_a", "_b", "_obj"];
			_a = (BC_Center select 0) + (sin(_angle)*BC_radius);
			_b = (BC_Center select 2) + (cos(_angle)*BC_radius);
			_obj = createVehicle ["Sign_sphere100cm_EP1", [0,0,0], [], 0, "CAN_COLLIDE"];
			_obj setPosASL [_a, BC_center select 1, _b];
			_objects set [count _objects, _obj];
			_angle = _angle + (360/_count);
		};
		
		for "_x" from 0 to _count do
		{
			private["_a", "_b", "_obj"];
			_a = (BC_Center select 1) + (sin(_angle)*BC_radius);
			_b = (BC_Center select 2) + (cos(_angle)*BC_radius);
			_obj = createVehicle ["Sign_sphere100cm_EP1", [0,0,0], [], 0, "CAN_COLLIDE"];
			_obj setPosASL [BC_center select 0, _a, _b];
			_objects set [count _objects, _obj];
			_angle = _angle + (360/_count);
		};

		sleep 30;
		{deleteVehicle _x; true } count _objects;
	};
};

fn_BCExport = {
	private ["_objects", "_position", "_distance", "_nearest_objects", "_export","_i"];
	if (isNil "BC_Center" or isNil "BC_radius") exitWith
	{
		systemChat "Center not set";
	};
	_objects = [];
	_export = "";
	_position = BC_center;
	_distance = BC_radius;
	_nearest_objects = nearestObjects [[_position select 0, _position select 1], dayz_allowedObjects, _distance];
	_objectCount = count _nearest_objects;
	_i = 0;
	{
		private ["_obj_type", "_direction", "_obj_position", "_relative_position", "_row"];
		_obj_type = typeOf _x;
		_direction = getDir _x;
		_obj_position = getPosASL _x;
		_relative_position = [
			(_obj_position select 0) - (_position select 0),
			(_obj_position select 1) - (_position select 1),
			(_obj_position select 2) - (_position select 2)
		];
		_row = [_obj_type, _relative_position, _direction];
		if(_i < _objectCount) then {
			_export = _export + str(_row) + ",$$";
		} else {
			_export = _export + str(_row);
		};
		_row set [count _row, _x];
		_objects set [count _objects, _row];
		true
	} count _nearest_objects;
	
	EAT_baseExporter = _export;
	[] spawn {publicVariableServer "EAT_baseExporter"};

	systemChat format["Exported base to server\EpochAdminTools\Bases.sqf"];
	showCommandingMenu "#USER:BCMainMenu";

	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has exported a base",name player,getPlayerUID player];
		publicVariable "usageLogger";
	};

	_objects
};

fn_BCCopy = {
	private ["_objects", "_position", "_distance", "_nearest_objects"];
	if (isNil "BC_Center" or isNil "BC_radius") exitWith
	{
		systemChat "Center not set";
	};
	_objects = [];
	_position = BC_center;
	_distance = BC_radius;
	_nearest_objects = nearestObjects [[_position select 0, _position select 1], dayz_allowedObjects, _distance];
	{
		private ["_obj_type", "_direction", "_obj_position", "_relative_position", "_row"];
		_obj_type = typeOf _x;
		_direction = getDir _x;
		_obj_position = getPosASL _x;
		_relative_position = [
			(_obj_position select 0) - (_position select 0),
			(_obj_position select 1) - (_position select 1),
			(_obj_position select 2) - (_position select 2)
		];
		_row = [_obj_type, _relative_position, _direction];
		_row set [count _row, _x];
		_objects set [count _objects, _row];
		true
	} count _nearest_objects;
	systemChat format["Copied %1 items", count _nearest_objects];
	BCCopiedBase = _objects;
	showCommandingMenu "#USER:BCMainMenu";
	_objects
};

fn_BCPaste = {
	private ["_dimensions", "_attach_position", "_base_objects"];
	if (isNil "BCCopiedBase") exitWith
	{
		systemChat "No base has been copied";
	};
	_dimensions = BCCopiedBase call fn_BCGetDimensions;
	_attach_position = player modelToWorld [0, ((_dimensions select 0) max (_dimensions select 1)), 0];
	diag_log str [0, ((_dimensions select 0) max (_dimensions select 1)), 0];
	_attach_position set [2, getPosASL player select 2];
	_base_objects = [BCCopiedBase, _attach_position] call fn_BCCreateBase;
	[_base_objects] call fn_BCBuildbase;

	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has pasted a copied base",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};
	// Tool use broadcaster
	if(broadcastToolUse) then {
		useBroadcaster = "Admin -- has placed a base";
		[] spawn {publicVariableServer "useBroadcaster";};
	};
	
};

fn_BCDelete = {
	BaseDestruction = [
		["What should delete?",true],
			["Finish",[2],"",-5,[["expression","[] spawn fn_BCConfirmDelete"]],"1","1"],
			[format["Vehicles(%1)",BD_vehicles], [3], "", -5, [["expression", "BD_vehicles = !BD_vehicles; [] spawn fn_BCDelete"]], "1", "1"],
			[format["PlotPoles(%1)",BD_PlotPoles], [4], "", -5, [["expression", "BD_PlotPoles = !BD_PlotPoles; [] spawn fn_BCDelete"]], "1", "1"],
			[format["Buildables(%1)",BD_Buildables], [5], "", -5, [["expression", "BD_Buildables = !BD_Buildables; [] spawn fn_BCDelete"]], "1", "1"]
	];
	showCommandingMenu "#USER:BaseDestruction";
};

fn_BCConfirmDelete = {
	private ["_position", "_distance", "_objectClasses", "_objects"];
	
	if (isNil "BC_Center" or isNil "BC_radius") exitWith
	{
		systemChat "Center or radius not set";
	};
	if (!BD_Buildables && !BD_PlotPoles && !BD_vehicles) exitWith
	{
		systemChat "Nothing deleted. You set all options to false";
	};
	
	_position = BC_center;
	_distance = BC_radius;
	_objectClasses = [];

	if (BD_Buildables) then {
		_objectClasses = dayz_allowedObjects;
	};
	if (BD_vehicles) then {
		_objectClasses = _objectClasses + ["LandVehicle","Helicopter","Plane","Ship"];
	};
	if (BD_PlotPoles) then {
		_objectClasses = _objectClasses + ["Plastic_Pole_EP1_DZ"];
	} else {
		_objectClasses = _objectClasses - ["Plastic_Pole_EP1_DZ"];
	};
	
	_objects = nearestObjects [[_position select 0, _position select 1], _objectClasses, _distance];

	{
		//_x setDamage 1;
		deleteVehicle _x;
		_objectID = _x getVariable ["ObjectID", "0"];
		_objectUID = _x getVariable ["ObjectUID", "0"];
		PVDZE_obj_Delete = [_objectID, _objectUID, (name player)];
		publicVariableServer "PVDZE_obj_Delete";
	} forEach _objects;

	[format["<t size='0.6'>Deleted %1 objects</t>", count _objects],0,0.8,0.5,0,0,8] spawn BIS_fnc_dynamicText;

	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has deleted %3 items using deletebase",name player,getPlayerUID player,count _objects];
		[] spawn {publicVariable "usageLogger";};
	};
	// Tool use broadcaster
	if(!((getPlayerUID player) in SuperAdminList) && broadcastToolUse) then {
		useBroadcaster = format["%1 -- has deleted base items",name player];
		[] spawn {publicVariableServer "useBroadcaster";};
	};
};

fn_BCSaveToDb = {
	{
		PVDZE_obj_Publish = [_x getVariable ["CharacterID", dayz_characterID],_x,[getDir _x, getPosATL _x], typeOf _x];
		publicVariableServer "PVDZE_obj_Publish";
	} count BCCurrentBase;
	[format["<t size='0.6'>Added %1 objects to database</t>", count BCCurrentBase],0,0.8,0.5,0,0,8] spawn BIS_fnc_dynamicText;
	
	// Tool use logger
	if(logMajorTool) then {
		usageLogger = format["%1 %2 -- has placed a saved base",name player,getPlayerUID player];
		[] spawn {publicVariable "usageLogger";};
	};
	// Tool use broadcaster
	if(!((getPlayerUID player) in SuperAdminList) && broadcastToolUse) then {
		useBroadcaster = format["%1 -- has placed a base",name player];
		[] spawn {publicVariableServer "useBroadcaster";};
	};

};

fn_BCCancelBase = {
	{
		detach _x; deleteVehicle _x;
	} count BCCurrentBase;
	BCCurrentBase = [];
	["<t size='0.6'>Cancelled</t>",0,0.8,0.5,0,0,8] spawn BIS_fnc_dynamicText;
};

fn_BCCenter = {
	private ["_ax", "_ay", "_az", "_total"];
	_ax = 0;
	_ay = 0;
	_az = 0;
	{
		private ["_pos"];
		_pos = getPosASL _x;
		_ax = _ax + (_pos select 0);
		_ay = _ay + (_pos select 1);
		_az = _az + (_pos select 2);
	} count _this;
	_total = count _this;
	_center = [_ax / _total, _ay / _total, _az / _total];
	_center
};

fn_BCCreateBase = {
	private ["_objects", "_items", "_position", "_player"];
	_objects = [];
	_items = _this select 0;
	_position = _this select 1;
	if (count _this == 3) then {
		_player = _this select 2;
	};
	{
		private ["_object", "_orig_obj"];
		_object = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
		_object setPosASL [
			((_x select 1) select 0) + (_position select 0),
			((_x select 1) select 1) + (_position select 1),
			((_x select 1) select 2) + (_position select 2) 
		];
		_object attachTo [player];
		_object setDir ((_x select 2) - getDir player);
		if (count _x == 4) then {
			_orig_obj = _x select 3;
			_object setVariable ["CharacterID", _orig_obj getVariable ["CharacterID", ""], true];
		};
		if (!isNil "_player") then {
			_object setVariable ["CharacterID", (_player getVariable ["CharacterID","0"]), true];
		};
		_objects set [count _objects, _object];
		true
	} count _items;
	_objects
};

fn_BCBuildbase = {
	private ["_base_objects", "_finished", "_place"];
	_base_objects = _this select 0;
	{
		_x attachTo [player];
		true
	} count _base_objects;
	_finished = false;
	DZE_Q = false;
	DZE_Z = false;
	DZE_4 = false;
	DZE_6 = false;
	DZE_5 = false;
	DZE_cancelBuilding = false;
	_place = false;
	while {!_finished} do {
		private ["_player_direction"];
		["<t size='0.6'>SPACE: Place | Q/R: Rotate | PgUp/PgDn: Height</t>",0,0.8,0.5,0,0,8] spawn BIS_fnc_dynamicText;
		_player_direction = getDir player;
		if (DZE_Q or DZE_Z) then {
			{
				private ["_obj_direction", "_position"];
				detach _x;
				_obj_direction = getDir _x;
				_position = getPosASL _x;
				_position set [2, (_position select 2) + (if (DZE_Q) then {0.5} else {-0.5})];
				_x setPosASL _position;
				_x attachTo [player];
				_x setDir (_obj_direction - _player_direction);
				true
			} count _base_objects;
			DZE_Q = false;
			DZE_Z = false;
		};
		if (DZE_4 or DZE_6) then {
			private ["_center_position"];
			_center_position = _base_objects call fn_BCCenter;
			{
				private ["_position", "_obj_direction", "_dif_direction", "_new_direction", "_distance", "_rotated_position"];
				detach _x;
				_position = getPosASL _x;
				_obj_direction = ([_center_position, _position] call BIS_fnc_dirTo);
				_dif_direction = if (DZE_4) then {10} else {-10};
				_new_direction = _obj_direction + _dif_direction;
				_distance = [_center_position, _position] call BIS_fnc_distance2D;
				_obj_direction = getDir _x;
				_rotated_position = [_center_position, _distance, _new_direction] call BIS_fnc_relPos;
				_rotated_position set [2, _position select 2];
				_x setPosASL _rotated_position;
				_x attachTo [player];
				_x setDir (((_obj_direction - _player_direction) + _dif_direction) % 360);
				true
			} count _base_objects;
			DZE_4 = false;
			DZE_6 = false;
		};
		if(DZE_5) exitWith {
			_finished = true;
			_place = true;
		};
		if (DZE_cancelBuilding) exitWith {
			_finished = true;
			_place = false;
		};
		sleep 0.1;
	};
	{detach _x; true} count _base_objects;
	BCCurrentBase = _base_objects;
	if (_place) then {
		showCommandingMenu "#USER:BCBaseSaveMenu";
	} else {
		call fn_BCCancelBase;
	};
};

fn_BCGetDimensions = {
	private ["_xmin", "_xmax", "_ymin", "_ymax"];
	_xmin = 0;
	_xmax = 0;
	_ymin = 0;
	_ymax = 0;
	{
		private ["_position"];
		_position = _x select 1;
		if ((_position select 0) < _xmin) then {
			_xmin = _position select 0;
		};
		if ((_position select 0) > _xmax) then {
			_xmax = _position select 0;
		};
		
		if ((_position select 1) < _ymin) then {
			_ymin = _position select 1;
		};
		if ((_position select 1) > _ymax) then {
			_ymax = _position select 1;
		};
		true
	} count _this;
	[abs _xmin + abs _xmax, abs _ymin + abs _ymax]
};

BCMainMenu =
[
	["Base Manager",true],
	["Insert", 		 [2], "", -5, [["expression", "[] spawn fn_BCInsert"]], "1", "1"],
	["Export to sqf",[3], "", -5, [["expression", "[] spawn fn_BCExport"]], "1", "1"],
	["===========",  [], "", -5, [["expression", ""]], "1", "0"],
	["Set Center", 	 [4], "", -5, [["expression", "[] spawn fn_BCSetCenter"]], "1", "1"],
	["Set Radius", 	 [5], "", -5, [["expression", "[] spawn fn_BCSetRadius"]], "1", "1"],
	["===========",  [], "", -5, [["expression", ""]], "1", "0"],
	["Copy",		 [6], "", -5, [["expression", "[] spawn fn_BCCopy"]], "1", "1"],
	["Paste", 		 [7], "", -5, [["expression", "[] spawn fn_BCPaste"]], "1", "1"],
	["Delete", 		 [8], "", -5, [["expression", "[] spawn fn_BCDelete"]], "1", "1"],
	["===========",  [], "", -5, [["expression", ""]], "1", "0"],
	["Exit", 		 [9], "", -5, [["expression", ""]], "1", "1"]
];

BCBaseSaveMenu = [
	["",true],
		["Save", 	[2], "", -5, [["expression", "[] spawn fn_BCSaveToDb"]], "1", "1"],
		["Exit", 	[3], "", -5, [["expression", "[] spawn fn_BCCancelBase"]], "1", "1"]
];

showCommandingMenu "#USER:BCMainMenu";

TraderDialogLoadItemList = _TraderDialogLoadItemList;
TraderDialogShowPrices = _TraderDialogShowPrices;
TraderDialogSell = _TraderDialogSell;

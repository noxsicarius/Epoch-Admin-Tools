private ["_option","_location","_object","_objects","_objectClasses","_i","_dir","_objectID","_objectUID"];

if (isNil "BD_radius") then { BD_radius = 10; };

_option = _this select 0;
switch (_option) do {
	case "center": {
		BD_center = getPos player;
		cutText [format["Center set to %1", BD_center], "PLAIN DOWN"];
	};
	case "radius": {
		if (isNil "BD_center") then {
			cutText ["Center not set", "PLAIN DOWN"];
		} else {
			BD_radius = player distance BD_center;
			cutText [format["Radius set to %1 m", BD_radius], "PLAIN DOWN"];
		};
	};
	case "dome": {
		if (isNil "BD_center") then {
			cutText ["Center not set", "PLAIN DOWN"];
		} else {
			_objects = [];
			// center
			_object = createVehicle ["Plastic_Pole_EP1_DZ", BD_center, [], 0, "CAN_COLLIDE"];
			_objects set [0, _object];
			// circle
			for "_i" from 0 to 360 step (270 / BD_radius) do {
				_location = [(BD_center select 0) + ((cos _i) * BD_radius), (BD_center select 1) + ((sin _i) * BD_radius), BD_center select 2];
				_object = createVehicle ["WoodLargeWall_Preview_DZ", _location, [], 0, "CAN_COLLIDE"];
				_dir = ((BD_center select 0) - (_location select 0)) atan2 ((BD_center select 1) - (_location select 1)); 
				_object setDir _dir;
				_objects set [count _objects, _object];
			};
			// top
			_location = [BD_center select 0, BD_center select 1, (BD_center select 2) + BD_radius];
			_object = createVehicle ["WoodFloor_Preview_DZ", _location, [], 0, "CAN_COLLIDE"];
			_objects set [count _objects, _object];
			sleep 30;
			{
				deleteVehicle _x;
			} forEach _objects;
		};
	};
	case "destroy": {
		if (isNil "BD_center") then {
			cutText ["Center not set", "PLAIN DOWN"];
		} else {
			if (BD_radius > 500) then {
				cutText [format["Area is too large for base destruction (radius %1 > 500)", BD_radius], "PLAIN DOWN"];
			} else {
				_objectClasses = dayz_allowedObjects;
				_objectClasses = _objectClasses + allbuildables_class;
				if (BD_vehicles) then {
					_objectClasses = _objectClasses + ["LandVehicle","Helicopter","Plane","Ship"];
				};
				_objects = nearestObjects [BD_center, _objectClasses, BD_radius];
				_i = 0;
				{
					if (alive _x) then {
						//_x setDamage 1;
						deleteVehicle _x;
						_objectID = _x getVariable ["ObjectID", "0"];
						_objectUID = _x getVariable ["ObjectUID", "0"];
						PVDZE_obj_Delete = [_objectID, _objectUID, player];
						publicVariableServer "PVDZE_obj_Delete";
						_i = _i + 1;
					};
				} forEach _objects;
				cutText [format["%1 of %2 objects deleted", _i, count _objects], "PLAIN DOWN"];
			};
		};
	};
};
private ["_target","_objectClasses","_range","_objects","_count","_findNearestPole","_IsNearPlot","_objects_filtered"];

player removeAction s_player_maintain_area;
s_player_maintain_area = 1;
player removeAction s_player_maintain_area_preview;
s_player_maintain_area_preview = 1;

// check for near plot
_target = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], 20];
_findNearestPole = [];

{
	if (alive _x) then {
		_findNearestPole set [(count _findNearestPole),_x];
	};
} count _target;

_IsNearPlot = count (_findNearestPole);
if(_IsNearPlot < 1) exitWith {s_player_maintain_area_preview = -1;s_player_maintain_area = -1; titleText["No plot pole found in 20 meters","PLAIN DOWN"];titleFadeOut 4;};
_target = _target select 0;
_objectClasses = DZE_maintainClasses;
_range = DZE_maintainRange; // set the max range for the maintain area
_objects = nearestObjects [_target, _objectClasses, _range];

//filter to only those that have 10% damage
_objects_filtered = [];
{
    if (damage _x >= DZE_DamageBeforeMaint) then {
        _objects_filtered set [count _objects_filtered, _x];
   };
} count _objects;
_objects = _objects_filtered;

// TODO dynamic requirements based on used building parts?
_count = count _objects;

if (_count == 0) exitWith {
	cutText [format[(localize "STR_EPOCH_ACTIONS_22"), _count], "PLAIN DOWN"];
	s_player_maintain_area = -1;
	s_player_maintain_area_preview = -1;
};

// all required items removed from player gear
cutText [format[(localize "STR_EPOCH_ACTIONS_4"), _count], "PLAIN DOWN", 5];
PVDZE_maintainArea = [player,1,_target];
publicVariableServer "PVDZE_maintainArea";	

// Tool use logger
if(logMinorTool) then {
	usageLogger = format["%1 %2 -- has used admin build to maintain an area",name player,getPlayerUID player];
	[] spawn {publicVariable "usageLogger";};
};

s_player_maintain_area = -1;
s_player_maintain_area_preview = -1;
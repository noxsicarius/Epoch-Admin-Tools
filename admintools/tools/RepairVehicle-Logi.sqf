//**************************************************************************************************************************************
// Repair Vehicle Script

// This script requires 1 parameter (player)
// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_selectedPlayer","_selectedPlayerName","_playerVehicle","_vehicleType","_vehicleName","_hitpoints","_message"];

// Sets the selected player as the first parameter
_selectedPlayer = _this select 0;
_selectedPlayerName = name _selectedPlayer;

// Gets the players vehicle
_playerVehicle = (vehicle _selectedPlayer);

// If the player is in a vehicle
if (_selectedPlayer != vehicle _selectedPlayer) then
{
	// Gets the type of vehicle, its display name and the vehicle hitpoints
	_vehicleType = typeOf _playerVehicle;
	_vehicleName = getText(configFile >> "cfgVehicles" >> _vehicleType >> "displayName");
	_hitpoints = _playerVehicle call vehicle_getHitpoints;

	// Loop for the number of vehicle hitpoints
	{
		private ["_damage","_selection"];
		_damage = [_playerVehicle,_x] call object_getHit;

		// If the vehicle has any damage to the hitpoint, it is repaired
		if (_damage > 0) then {
			_selection = getText(configFile >> "cfgVehicles" >> _vehicleType >> "HitPoints" >> _x >> "name");
			[_playerVehicle,_selection,0] call object_setFixServer;
		};
	} count _hitpoints;

	// Fixes the vehicle, refills petrol and vehicle ammo
	_playerVehicle setDamage 0;
	_playerVehicle setFuel 1;
	_playerVehicle setVehicleAmmo 1;
	_playerVehicle setVelocity [0,0,1];

	// Display a message to the admin that called the script
	_message = format ["%1's %2 has been repaired, refuelled and rearmed!",_selectedPlayerName,_vehicleName];
	[_message] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";

	// Tool use logger
	if(logMinorTool) then {
		usageLogger = format["%1 %2 -- has permanently repaired %3",name player,getPlayerUID player,_playerVehicle];
		[] spawn {publicVariable "usageLogger";};
	};
}
else 
{
	// Display a message to the admin that called the script
	_message = format ["%1 is not currently in a vehicle!",_selectedPlayerName];
	[_message] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";
};

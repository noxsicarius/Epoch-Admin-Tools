
systemChat "Player join admin vehicle script called!";

// This script is still being worked on. It may not work properly at the moment.

// Player name passed in as the first parameter
_playerName = _this select 0;

{
	// If the name matches a current player
	if (name _x == _playerName) then
	{
		// Selects the player
		_selectedPlayer = _x;
	
		// Gets the admins vehicle
		_adminVehicle = vehicle player;
				
		// Attempts to move the selected player into each of the seats in the vehicle
		_selectedPlayer moveInDriver _adminVehicle;
		_selectedPlayer moveInGunner _adminVehicle;
		_selectedPlayer moveInCommander _adminVehicle;
		_selectedPlayer moveInCargo _adminVehicle;
		_selectedPlayer action ["getInDriver", _adminVehicle];
		_selectedPlayer action ["getInGunner", _adminVehicle];
		_selectedPlayer action ["getInCommander", _adminVehicle];
		_selectedPlayer action ["getInCargo", _adminVehicle];
	};
} forEach playableUnits;



systemChat "Player join admin vehicle script ended!";

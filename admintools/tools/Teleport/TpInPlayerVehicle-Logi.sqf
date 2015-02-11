
systemChat "Admin join player Vehicle script called!";

// I don't think this script was working when I last tested it but it did work a while ago before I changed something.

// Player name passed in as the first parameter
_playerName = _this select 0;
{
	if (name _x == _playerName) then
	{
		// Gets the players vehicle
		_playerVehicle = vehicle _x;
		
		// Attempts to move into each of the seats in the players vehicle
		player moveInDriver _playerVehicle;
		player moveInGunner _playerVehicle;
		player moveInCommander _playerVehicle;
		player moveInCargo _playerVehicle;
		player action ["getInDriver", _playerVehicle];
		player action ["getInGunner", _playerVehicle];
		player action ["getInCommander", _playerVehicle];
		player action ["getInCargo", _playerVehicle];
	};
} forEach playableUnits;



systemChat "Admin join player Vehicle script ended!";

private["_player","_playerName"];

_player = player;
_playerName = name _player;

if(!(_playerName in helpQueue)) then {
	EAT_contactAdmin = ["add", _playerName];
	[] spawn {publicVariable "EAT_contactAdminServer";};
	cutText["An admin will be with you shortly", "PLAIN DOWN", 5];

	[] spawn {
		While {(alive player) && ((name player) in helpQueue)} do {
			Sleep 3;
		};
		EAT_contactAdmin = ["remove", (name player)];
		[] spawn {publicVariable "EAT_contactAdminServer";};
	};
	
} else {
	cutText["Please be patient", "PLAIN DOWN", 3];
};
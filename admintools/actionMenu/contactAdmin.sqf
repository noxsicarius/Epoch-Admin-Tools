private["_player","_playerName","_cancel"];
_player = player;
_playerName = (name _player);
_cancel = _this select 0;
if(isNil "helpCount") then {helpCount = 0};

if((!(_playerName in helpQueue)) && (!(_cancel)) && (helpCount < antiSpamLimit)) then {
	EAT_contactAdminServer = ["add", _playerName];
	[] spawn {publicVariable "EAT_contactAdminServer";};
	cutText["An admin will be with you shortly", "PLAIN DOWN", 4];
	if(enableAntiSpam) then {helpCount = helpCount + 1;};
} else {
	if(_cancel) then {
		cutText["Cancelled help ticket", "PLAIN DOWN", 3];
		EAT_contactAdminServer = ["remove", _playerName];
		[] spawn {publicVariable "EAT_contactAdminServer";};
	} else {
		if((helpCount >= antiSpamLimit) && enableAntiSpam) then {
			1 cutText["ANTI SPAM, your contact an admin is disabled","WHITE OUT"];
			AllowContactAdmin = false;
			Sleep blindTime;
			1 cutText["","WHITE IN",5];
		} else {
			cutText["Please be patient", "PLAIN DOWN", 3];
		};
	};
};

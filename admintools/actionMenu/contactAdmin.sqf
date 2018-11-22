private["_player","_playerName","_cancel"];
_player = player;
_playerName = (name _player);
_cancel = _this select 0;
if(isNil "helpCount") then {helpCount = 0};

if((!(_playerName in EAT_helpQueue)) && (!(_cancel)) && (helpCount < EAT_antiSpamLimit)) then {
	EAT_helpQueue = EAT_helpQueue + [_playerName];
	EAT_PVEH_contactAdmin = ["add", _playerName];
	[] spawn {publicVariable "EAT_PVEH_contactAdmin";};
	"An admin will be with you shortly" call dayz_rollingMessages;
	if(EAT_enableAntiSpam) then {helpCount = helpCount + 1;};
} else {
	if(_cancel) then {
		if(_playerName in EAT_helpQueue) then {
			"Cancelled help ticket" call dayz_rollingMessages;
			EAT_helpQueue = EAT_helpQueue - [_playerName];
			EAT_PVEH_contactAdmin = ["remove", _playerName];
			[] spawn {publicVariable "EAT_PVEH_contactAdmin";};
		} else {
			"No help ticket found" call dayz_rollingMessages;
		};
	} else {
		if((helpCount >= EAT_antiSpamLimit) && EAT_enableAntiSpam) then {
			1 cutText["ANTI SPAM, your contact an admin is disabled","WHITE OUT"];
			EAT_AllowContactAdmin = false;
			EAT_helpQueue = EAT_helpQueue - [_playerName];
			EAT_PVEH_contactAdmin = ["remove", _playerName];
			[] spawn {publicVariable "EAT_PVEH_contactAdmin";};
			Sleep EAT_blindTime;
			1 cutText["","WHITE IN",5];
		} else {
			"Please be patient" call dayz_rollingMessages;
		};
	};
};

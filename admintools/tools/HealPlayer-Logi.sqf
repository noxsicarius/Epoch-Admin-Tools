
systemChat "Heal player script loaded!";


private ["_selectedPlayer","_player","_message"];

_selectedPlayer = _this select 0;
_player = player;

r_player_blood = r_player_bloodTotal;
r_player_inpain = false;
r_player_infected = false;
r_player_injured = false;
dayz_hunger	= 0;
dayz_thirst = 0;
dayz_temperatur = 100;
dayz_combat = 0;

r_fracture_legs = false;
r_fracture_arms = false;
r_player_dead = false;
r_player_unconscious = false;
r_player_loaded = false;
r_player_cardiac = false;
r_player_lowblood = false;
r_doLoop = false;
r_action = false;
r_player_timeout = 0;
r_handlerCount = 0;
r_interrupt = false;

disableUserInput false;
dayz_sourceBleeding = objNull;
_player setVariable ["USEC_injured",false,true];
_player setVariable['USEC_inPain',false,true];
_player setVariable['USEC_infected',false,true];
_player setVariable['USEC_lowBlood',false,true];
_player setVariable['USEC_BloodQty',12000,true];
_player setVariable['USEC_isCardiac',false,true];
{_player setVariable[_x,false,true];} forEach USEC_woundHit;
_player setVariable ["unconsciousTime", r_player_timeout, true];
_player setVariable['NORRN_unconscious',false,true];
_player setVariable ['messing',[dayz_hunger,dayz_thirst],true];
_player setHit ['legs',0];
_player setVariable ['hit_legs',0,false];
_player setVariable ['hit_hands',0,true];
_player setVariable['medForceUpdate',true,true];

disableSerialization;
_UIfix = (uiNameSpace getVariable 'DAYZ_GUI_display') displayCtrl 1303;
_UIfix2 = (uiNameSpace getVariable 'DAYZ_GUI_display') displayCtrl 1203;
_UIfix ctrlShow false;
_UIfix2 ctrlShow false;

{
	if (name _x == name _selectedPlayer) then 
	{
		_unit = _x;
	
		usecBandage = [_unit];
		publicVariable "usecBandage";
		{_unit setVariable[_x,false,true];} forEach USEC_woundHit;
		_unit setVariable ["USEC_injured",false,true];

		_unit setVariable["USEC_lowBlood",false,true];
		usecTransfuse = [_unit];
		publicVariable "usecTransfuse";

		_unit setVariable ["NORRN_unconscious", false, true];
		_unit setVariable ["USEC_isCardiac",false,true];
		_unit setVariable['medForceUpdate',true,true];

		usecMorphine = [_unit];
		publicVariable "usecMorphine";

		"dynamicBlur" ppEffectAdjust [0]; 
		"dynamicBlur" ppEffectCommit 5;

		usecPainK = [_unit,player];
		publicVariable "usecPainK";
		_unit setVariable["medForceUpdate",true];
				
		usecAntibiotics = [_unit];
		publicVariable "usecAntibiotics";
		_unit setVariable["USEC_infected",false,true];
		_unit setVariable["medForceUpdate",true];
		
		// Display a message to the admin that called the script
		_message = format ["%1 has been healed!", name _selectedPlayer];
		[_message] execVM "admintools\tools\AdminMessageDisplay-Logi.sqf";
	};
} forEach playableUnits;



systemChat "Heal player script ended!";

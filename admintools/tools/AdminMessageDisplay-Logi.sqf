//**************************************************************************************************************************************
// Admin Message Display Script

// This script requires 1 parameter (_message string)
// This script is called from a couple of the admin tool scripts in order to display notification messages to the admin
//**************************************************************************************************************************************
 
 private["_message","_messageTime","_messageFormatted"];
 
 // Sets the message as the first parameter
_message = _this select 0;

// Sets the message display time and formats the message size and colour (Orange)
_messageTime = 6;  
_messageFormatted = format ["<t size='0.55' color = '#FF8501' align='right'>%1<br /></t>", _message];
 
// Call BIS_fnc_dynamicText with the formatted message and pre defined X/Y co-ordinates
[
	_messageFormatted,
	[0.559300 * safezoneW + safezoneX], // X
	[0.010000 * safezoneH + safezoneY], // Y
	_messageTime,
	0.5
] spawn BIS_fnc_dynamicText;
	
sleep (_messageTime);

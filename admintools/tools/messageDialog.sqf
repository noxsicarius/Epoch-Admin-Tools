private ["_dialog"];
SendDialogText = "";

// Sleep to make sure scroll menu is cleared
Sleep 0.2;

_dialog = createdialog "EAT_messageBox_Dialog";

ctrlSetText [1001,"Send a server message"];

waitUntil {!dialog};
if(SendDialogText == "") exitWith {};

EAT_PVEH_serverMessage = "ADMIN: " + SendDialogText;
publicVariable "EAT_PVEH_serverMessage";

//Send the message to the admin as well
[format["<t size='0.8' color='#ff0000' font='Zeppelin33'>Admin: %1</t>", SendDialogText],0,-.2,10,2,0,8] spawn BIS_fnc_dynamicText;

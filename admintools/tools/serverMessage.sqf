private ["_text","_dialog"];
SendDialogText = "";

// Sleep to make sure scroll menu is cleared
Sleep 0.1;

_dialog = createdialog "EAT_messageBox_Dialog";

waitUntil {!dialog};
if(SendDialogText == "") exitWith {};

EAT_serverMessageServer = "ADMIN: " + SendDialogText;
[] spawn {publicVariable "EAT_serverMessageServer";};

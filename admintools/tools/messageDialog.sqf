private ["_dialog"];
SendDialogText = "";

// Sleep to make sure scroll menu is cleared
Sleep 0.2;

_dialog = createdialog "EAT_messageBox_Dialog";

ctrlSetText [1001,"Send a server message"];

waitUntil {!dialog};
if(SendDialogText == "") exitWith {};

EAT_serverMessageServer = "ADMIN: " + SendDialogText;
[] spawn {publicVariable "EAT_serverMessageServer";};

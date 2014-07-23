// Epoch Admin Tools
//Replace 111111111 with your ID. 
AdminList = [
"111111111", // <Your In-Game Name here>
"999999999" // <Admin In-Game Name>
];
ModList = [
"999999999", // <Moderator In-Game Name>
"999999999" // <Moderator In-Game Name>
];

/*
	Base deletion variable. Default true.
	Determines default true or false for deleting all vehicles
	inside the base delete dome. Can be changed in game.
	Default: true
*/
BD_vehicles = true;


/*
	Broadcasts a message to the entire server when the admin tools are used.
	If you are a playing admin keep this on so players know there is no abuse.
	Default: true
*/
broadcastToolUse = true;



// DO NOT MODIFY ANYTHING BEYOND THIS POINT
if(isNil "tempList") then {tempList = [];}; 

/*
	Determines default on or off for admin tools menu
	Set this to false if you want the menu to be off by default.
	F11 turns the tool off, F10 turns it on.
	Leave this as True for now, it is under construction.
*/
if (isNil "toolsAreActive") then {toolsAreActive = true;};

adminToolHandle = true;
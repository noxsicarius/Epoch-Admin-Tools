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

// Determins default on or off for admin tools menu
// Set this to false if you want the menu to be off by default.
// F11 turns the tool off, F10 turns it on.
if (isNil "toolsAreActive") then {toolsAreActive = true;};

tempList = []; //DO NOT MODIFY THIS VARIABLE


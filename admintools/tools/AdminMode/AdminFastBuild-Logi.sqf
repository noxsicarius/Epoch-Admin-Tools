//**************************************************************************************************************************************
// Admin Fast Build Script

// This script requires 1 parameter (_adminFastBuild boolean)
// This script is called from the AdminMainGUI.sqf
//**************************************************************************************************************************************

private ["_adminFastBuild"];

_adminFastBuild = _this select 0;

if (_adminFastBuild) then 
{
	// This gives the player a toolbox if they don't already have one
	if !(('ItemToolbox' in items player)) then { result = [player,"ItemToolbox"] call BIS_fnc_invAdd;};
	
	// Removes the plot pole requirement
	DZE_requireplot = 0;
	
	// Enables fast build
	DZE_StaticConstructionCount = 1;
}
else 
{
	// Apply the plot pole requirement
	DZE_requireplot = 1;
	
	// Disables fast build
	DZE_StaticConstructionCount = 1;
};

// This file should not be modified
adminBuild = _this select 0;

if(adminBuild) then {
	DZE_StaticConstructionCount = 1;
	DZE_requireplot = 0;
} else {
	DZE_StaticConstructionCount = 0;
	DZE_requireplot = 1;
};
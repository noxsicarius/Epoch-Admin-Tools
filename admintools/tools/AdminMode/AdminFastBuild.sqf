if(isNil "adminFastBuild") then {adminFastBuild = true;} else {adminFastBuild = !adminFastBuild};

if(adminFastBuild) then {
	DZE_StaticConstructionCount = 1;
	DZE_requireplot = 0;
} else {
	DZE_StaticConstructionCount = 0;
	DZE_requireplot = 1;
};
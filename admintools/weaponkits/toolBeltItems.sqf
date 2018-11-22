#define IS_TOOL(tool) (getNumber (configFile >> "CfgWeapons" >> tool >> "type") == 131072)
	{
		if (IS_TOOL(_x)) exitWith {
			player removeWeapon _x;
		}
	} count (weapons player);

	{
		player addWeapon _x;
	} count ["ItemHatchet","ItemKnife","ItemMatchbox","ItemEtool","ItemToolbox","ItemCrowbar"];

///////////////////////////////////////////////////////////////////////////
/// Styles
///////////////////////////////////////////////////////////////////////////

// Control types

class AdminDialog
{
	idd = -1;
	movingenable = 0;

	class Controls {
		class RscText_1000: RscTextT
		{
			idc = 1000;
			x = 0.283646 * safezoneW + safezoneX;
			y = 0.22492 * safezoneH + safezoneY;
			w = 0.432709 * safezoneW;
			h = 0.55016 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscListbox_1500: RscListbox
		{
			idc = 13000;
			x = 0.290407 * safezoneW + safezoneX;
			y = 0.238674 * safezoneH + safezoneY;
			w = 0.419186 * safezoneW;
			h = 0.467636 * safezoneH;
		};
		class RscShortcutButton_1700: RscShortcutButton
		{
			idc = -1;
			text = "Perm";
			x = 0.297168 * safezoneW + safezoneX;
			y = 0.692556 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick = "PermDialogSelected = (lbCurSel 13000); ((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
		class RscShortcutButton_1701: RscShortcutButton
		{
			idc = -1;
			text = "Temp";
			x = 0.37154 * safezoneW + safezoneX;
			y = 0.692556 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick = "TempDialogSelected = (lbCurSel 13000); ((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			idc = -1;
			text = "Close";
			x = 0.445912 * safezoneW + safezoneX;
			y = 0.692556 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
	};
};

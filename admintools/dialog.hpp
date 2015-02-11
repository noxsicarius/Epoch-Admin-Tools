#define COLOR_WHITE { 1,1,1,1 }
#define COLOR_BLACK { 0,0,0,1 }
#define COLOR_TRANSPARENT { 0,0,0,0 }
#define COLOR_ORANGE { 1,0.6392,0.0196,1 }

// Control types

// Text
class EAT_RscTextT
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = COLOR_TRANSPARENT;
	colorText[] = {0.8784,0.8471,0.651,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 2;
	font = "Zeppelin32";
	SizeEx = 0.03921;
};

// Text used for the list titles, pre-defined colour and height
class EAT_OrangeTextT : EAT_RscTextT
{
	colorBackground[] = COLOR_TRANSPARENT;
	colorText[] = COLOR_ORANGE;
	h = 0.015935 * safezoneH;
};

// Listbox
class EAT_RscListBox
{
	access = 0;
	type = 5;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] = COLOR_WHITE;
	colorScrollbar[] = COLOR_WHITE;
	colorSelect[] = COLOR_ORANGE;
	colorSelect2[] = COLOR_WHITE;
	colorSelectBackground[] = COLOR_BLACK;
	colorSelectBackground2[] = {0.8784,0.8471,0.651,1};
	colorBackground[] = COLOR_BLACK;
	soundSelect[] = {"",0.1,1};
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = COLOR_WHITE;
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
	style = 16;
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = 0.03921;
	color[] = COLOR_WHITE;
	period = 1.2;
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};

// Button
class EAT_RscShortcutButton {
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	color[] = COLOR_WHITE;
	colorFocused[] = COLOR_WHITE;
	color2[] = COLOR_WHITE;
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackground2[] = COLOR_WHITE;
	periodFocus = 1.2;
	periodOver = 0.8;
	class HitZone
	{
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos
	{
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos
	{
		left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	period = 0.4;
	font = "Zeppelin32";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	action = "";
	class Attributes
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class AttributesImage
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
	soundPush[] = { "", 0, 1 };
	soundEnter[] = { "", 0, 1 };
	soundClick[] = { "", 0, 1 };
	soundEscape[] = { "", 0, 1 };
	sound[] = { "", 0, 1 };
};

// Menu button
class EAT_RscButtonMenu : EAT_RscShortcutButton {
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = {0,0,0,0.8};
	colorBackgroundFocused[] = COLOR_WHITE;
	colorBackground2[] = {0.75,0.75,0.75,1};
	color[] = COLOR_WHITE;
	colorFocused[] = COLOR_BLACK;
	color2[] = COLOR_BLACK;
	colorText[] = COLOR_WHITE;
	colorDisabled[] = {1,1,1,0.25};
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[] = COLOR_WHITE;
	tooltipColorBox[] = COLOR_WHITE;
	tooltipColorShade[] = {0,0,0,0.65};
	class TextPos
	{
		left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class ShortcutPos
	{
		left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
	textureNoShortcut = "";
};

// Close button (Red background, white text - pre-defined "X")
class EAT_CloseButton: EAT_RscButtonMenu {
	text = "X";
	w = 0.0140000 * safezoneW;
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',1])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.2352])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.2352])", 0.5}; // Red
	colorText[] = {0.8784,0.8471,0.651,1};
	class Attributes
	{
		align = "center";
	};
};

// Filter button (Orange background, White text)
class EAT_FilterButton: EAT_RscButtonMenu {
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',1])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.6392])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.0196])", 0.5}; // Orange
	colorText[] = {0.8784,0.8471,0.651,1};
	class Attributes
	{
		align = "center";
	};
};
//*******************************************************************************************************************************************


// Admin tools dialog full menu with spawn items
class AdminDialogFull
{
	idd = 2626;
	movingenable = 0;

	class Controls {
		// Menu background
		class EAT_RscText_Background: EAT_RscTextT
		{
			idc = 1005;
			x = 0.009000 * safezoneW + safezoneX;
			y = 0.010000 * safezoneH + safezoneY;
		    w = 0.550300 * safezoneW;
			h = 0.980000 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		
		// Title text
		class EAT_RscText_Title: EAT_RscTextT
		{
			idc = -1;
			text = "Epoch Admin Tool";
			colorText[] = COLOR_ORANGE;
			x = 0.009000 * safezoneW + safezoneX;
			y = 0.013000 * safezoneH + safezoneY;
			w = 0.260212 * safezoneW;
			h = 0.0356935 * safezoneH;
			SizeEx = 0.07500;
		};
		
		// Players text
		class EAT_RscText_1: EAT_OrangeTextT
		{
			idc = -1;
			text = "Players:";
			x = 0.010000 * safezoneW + safezoneX;
			y = 0.070917 * safezoneH + safezoneY;
			w = 0.170212 * safezoneW;
		};
		
		// Tools text
		class EAT_RscText_2: EAT_OrangeTextT
		{
			idc = -1;
			text = "Tools:";
			x = 0.181800 * safezoneW + safezoneX;
			y = 0.070917 * safezoneH + safezoneY;
			w = 0.170212 * safezoneW;
		};
		
		// Spawn Menu text
		class EAT_RscText_3: EAT_OrangeTextT
		{
			idc = -1;
			text = "Spawn Menu:";
			x = 0.350800 * safezoneW + safezoneX;
			y = 0.070917 * safezoneH + safezoneY;
			w = 0.190000 * safezoneW;
		};
		
		// Player listbox
		class EAT_RscListbox_1: EAT_RscListBox
		{
			idc = 13003;
			x = 0.010000 * safezoneW + safezoneX;
			y = 0.090000 * safezoneH + safezoneY;
			w = 0.154000 * safezoneW;
			h = 0.872000 * safezoneH;
			SizeEx = 0.03500;
			onLBDblClick = "[(lbCurSel 13003)] call RemoveFromHelpQueue;";
		};
		
		// Admin tools listbox
		class EAT_RscListbox_2: EAT_RscListBox
		{
			idc = 13006;
			x = 0.179800 * safezoneW + safezoneX;
			y = 0.090000 * safezoneH + safezoneY;
			w = 0.147000 * safezoneW;
			h = 0.846000 * safezoneH;
			onLBDblClick = "[(lbCurSel 13006)] call AdminTool_Update;";
		}; 
		
		// Spawn listbox
		class EAT_RscListbox_3: EAT_RscListBox
		{
			idc = 13007;
			x = 0.347800 * safezoneW + safezoneX; 
			y = 0.090000 * safezoneH + safezoneY;
			w = 0.207200 * safezoneW;
			h = 0.138000 * safezoneH;
			onLBSelChanged = "[(lbCurSel 13007)] call SpawnTool_Update;";
		};
		
		// Spawn item listbox
		class EAT_RscListbox_4: EAT_RscListBox
		{
			idc = 13008;
			x = 0.350800 * safezoneW + safezoneX;
			y = 0.275000 * safezoneH + safezoneY;
			w = 0.207200 * safezoneW;
			h = 0.618100 * safezoneH;
			onLBDblClick = "[(lbCurSel 13008)] call SpawnItem_Update;";
		};
		
		// Filter button 1
		class EAT_RscButtonMenu_1: EAT_FilterButton
		{
			idc = 13010;
			text = "Filter 1";
			x = 0.350000 * safezoneW + safezoneX;
			y = 0.240000 * safezoneH + safezoneY;
			w = 0.045000 * safezoneW;
			onButtonClick = "call FilterButtonClicked_1;";
		};
		
		// Filter button 2
		class EAT_RscButtonMenu_2: EAT_FilterButton
		{
			idc = 13011;
			text = "Filter 2";
			x = 0.415000 * safezoneW + safezoneX;
			y = 0.240000 * safezoneH + safezoneY;
			w = 0.045000 * safezoneW;
			onButtonClick = "call FilterButtonClicked_2;";
		};
		
		// Filter button 3
		class EAT_RscButtonMenu_3: EAT_FilterButton
		{
			idc = 13012;
			text = "Filter 3";
			x = 0.480000 * safezoneW + safezoneX;
			y = 0.240000 * safezoneH + safezoneY;
			w = 0.045000 * safezoneW;
			onButtonClick = "call FilterButtonClicked_3;";
		};

		class EAT_RscButtonMenu_Close: EAT_CloseButton
		{
			idc = 13009;
			x = 0.545500 * safezoneW + safezoneX;
			y = 0.010000 * safezoneH + safezoneY;
			onButtonClick = "call AdminHighlightToggle; ((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
	};
};

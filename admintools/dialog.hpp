// Colors
#define COLOR_WHITE {1,1,1,1}
#define COLOR_BLACK {0,0,0,1}
#define COLOR_TRANSPARENT {0,0,0,0}
#define COLOR_ORANGE {1,0.6392,0.0196,1}

// Control types

class EAT_RscText
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

class EAT_RscFrame
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = COLOR_TRANSPARENT;
	colorText[] = COLOR_WHITE;
	font = "Zeppelin32";
	sizeEx = 0.02;
	text = "";
};

class EAT_RscEdit
{
    style = 0x00 + 0x40; 
    font = "Zeppelin32"; 
	type = 2;
    shadow = 2; 
	lineSpacing = 1;
    sizeEx = 0.03921; 
	autocomplete = "";
    colorBackground[] = {0, 0, 0, 1}; 
    colorText[] = {0.95, 0.95, 0.95, 1}; 
    colorSelection[] = {0.8784, 0.8471, 0.651, 1.0};
};

class EAT_RscListBox
{
	access = 0;
	type = 5;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] = {0.8784,0.8471,0.651,1};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorSelect2[] = {0.95,0.95,0.95,1};
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

class EAT_RscShortcutButton
{
	type = 16;
	x = 0.1;
	y = 0.1;

	class HitZone
	{
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};

	class ShortcutPos
	{
		left = 0.0145;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};

	class TextPos
	{
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};

	shortcuts[] = {};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = {0.8784,0.8471,0.651,1};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = COLOR_WHITE;
	colorBackground2[] = {1,1,1,0.4};

	class Attributes
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};

	idc = -1;
	style = 0;
	default = 0;
	shadow = 2;
	w = 0.183825;
	h = 0.104575;
	periodFocus = 1.2;
	periodOver = 0.8;
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	period = 0.4;
	font = "Zeppelin32";
	size = 0.03921;
	sizeEx = 0.03921;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	action = "";

	class AttributesImage
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
};

class EAT_RscButtonMenu : EAT_RscShortcutButton {
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 0;
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
	class HitZone
	{
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
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

class EAT_Veh_AdminDialog
{
	idd = -1;
	movingenable = 0;

	class Controls {
		class EAT_veh_RscText_1000: EAT_RscText
		{
			idc = 1000;
			x = 0.283646 * safezoneW + safezoneX;
			y = 0.22492 * safezoneH + safezoneY;
			w = 0.432709 * safezoneW;
			h = 0.55016 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class EAT_veh_RscText_1001: EAT_RscText
		{
			idc = 1001;
			text = "Pick a vehicle or select a category";
			x = 0.295498 * safezoneW + safezoneX;
			y = 0.235917 * safezoneH + safezoneY;
			w = 0.170212 * safezoneW;
			h = 0.0166935 * safezoneH;
		};

		class EAT_veh_RscListBox_1500: EAT_RscListBox
		{
			idc = 13000;
			x = 0.290407 * safezoneW + safezoneX;
			y = 0.268674 * safezoneH + safezoneY;
			w = 0.419186 * safezoneW;
			h = 0.447636 * safezoneH;
		};

		class EAT_veh_RscShortcutButton_1700: EAT_RscShortcutButton
		{
			idc = -1;
			text = "Temp";
			x = 0.297168 * safezoneW + safezoneX;
			y = 0.720556 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick = "TempDialogSelected = (lbCurSel 13000); ((ctrlParent (_this select 0)) closeDisplay 9000);";
		};

		class EAT_veh_RscShortcutButton_1701: EAT_RscShortcutButton
		{
			idc = -1;
			text = "Perm";
			x = 0.37154 * safezoneW + safezoneX;
			y = 0.720556 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick = "PermDialogSelected = (lbCurSel 13000); ((ctrlParent (_this select 0)) closeDisplay 9000);";
		};

		class EAT_veh_RscShortcutButton_1702: EAT_RscShortcutButton
		{
			idc = 12004;
			text = "Air";
			x = 0.485168 * safezoneW + safezoneX;
			y = 0.218000 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick="[""Air""] call LoadSpecificList;";
		};

		class EAT_veh_RscShortcutButton_1704: EAT_RscShortcutButton
		{
			idc = 12005;
			text = "Land";
			x = 0.55954 * safezoneW + safezoneX;
			y = 0.218000 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick="[""LandVehicle""] call LoadSpecificList;";
		};

		class EAT_veh_RscShortcutButton_1705: EAT_RscShortcutButton
		{
			idc = 12006;
			text = "Sea";
			x = 0.633912 * safezoneW + safezoneX;
			y = 0.218000 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick="[""Ship""] call LoadSpecificList;";
		};

		class EAT_veh_RscShortcutButton_1710: EAT_RscShortcutButton
		{
			idc = -1;
			text = "Close";
			x = 0.633912 * safezoneW + safezoneX;
			y = 0.720556 * safezoneH + safezoneY;
			w = 0.0651391 * safezoneW;
			h = 0.0590864 * safezoneH;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
	};
};

class EAT_messageBox_Dialog
{
	idd = -1;
	movable = 0;

	class Controls {
		class EAT_msgBox_Background: EAT_RscText
		{
			idc = 1000;
			x = 0.35677 * safezoneW + safezoneX;
			y = 0.382451 * safezoneH + safezoneY;
			w = 0.285304 * safezoneW;
			h = 0.183649 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class EAT_msgBox_RscText_1001: EAT_RscText
		{
			idc = 1001;
			text = "PLACEHOLDER";
			x = 0.35677 * safezoneW + safezoneX;
			y = 0.382451 * safezoneH + safezoneY;
			w = 0.285305 * safezoneW;
			h = 0.0247882 * safezoneH;
			colorText[] = {1,0.6392,0.196,1};
			colorBackground[] = {0,0,0,1};
		};
		class EAT_msgBox_txtBox: EAT_RscEdit
		{
			idc = 1400;
			type = 2;
			x = 0.362278 * safezoneW + safezoneX;
			y = 0.417716 * safezoneH + safezoneY;
			w = 0.274365 * safezoneW;
			h = 0.109082 * safezoneH;
			text = "";
			colorSelection[] = {1,1,1,0.25};
		};
		class EAT_msgBox_btnSend: EAT_RscShortcutButton
		{
			idc = 1700;
			text = "Send";
			x = 0.3656 * safezoneW + safezoneX;
			y = 0.518526 * safezoneH + safezoneY;
			w = 0.0596567 * safezoneW;
			h = 0.0535038 * safezoneH;
			onButtonClick = "SendDialogText = ctrlText ((ctrlParent (_this select 0)) displayCtrl 1400);((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
		class EAT_msgBox_btnClose: EAT_RscShortcutButton
		{
			idc = 1701;
			text = "Close";
			x = 0.573451 * safezoneW + safezoneX;
			y = 0.518526 * safezoneH + safezoneY;
			w = 0.0596567 * safezoneW;
			h = 0.0525776 * safezoneH;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
	};
};

class EAT_build_AdminDialog
{
	idd = -1;
	movingenable = 0;

	class Controls {
		class EAT_build_txtBackground: EAT_RscText
		{
			idc = 1000;
			x = 0.312699 * safezoneW + safezoneX;
			y = 0.229637 * safezoneH + safezoneY;
			w = 0.375427 * safezoneW;
			h = 0.521291 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class EAT_build_txtL: EAT_RscText
		{
			idc = 1001;
			text = "  Building Types";
			x = 0.320278 * safezoneW + safezoneX;
			y = 0.235075 * safezoneH + safezoneY;
			w = 0.0774524 * safezoneW;
			h = 0.0210828 * safezoneH;
			colorText[] = COLOR_ORANGE;
			colorBackground[] = COLOR_BLACK;
		};
		
		class EAT_build_txtR: EAT_RscText
		{
			idc = 1002;
			text = "Select a building below";
			x = 0.401543 * safezoneW + safezoneX;
			y = 0.235074 * safezoneH + safezoneY;
			w = 0.270000 * safezoneW;
			h = 0.0213143 * safezoneH;
			colorText[] = COLOR_ORANGE;
			colorBackground[] = COLOR_BLACK;
		};
		
		class EAT_build_RscListbox_1500: EAT_RscListbox
		{
			idc = 13000;
			x = 0.40084 * safezoneW + safezoneX;
			y = 0.264902 * safezoneH + safezoneY;
			w = 0.276449 * safezoneW;
			h = 0.464555 * safezoneH;
		};
		
		class EAT_build_Frame: EAT_RscFrame
		{
			idc = 1800;
			x = 0.400319 * safezoneW + safezoneX;
			y = 0.26027 * safezoneH + safezoneY;
			w = 0.280617 * safezoneW;
			h = 0.476597 * safezoneH;
		};
		
		class EAT_Build_Frame_L: EAT_RscFrame
		{
			idc = 1801;
			x = 0.318833 * safezoneW + safezoneX;
			y = 0.26027 * safezoneH + safezoneY;
			w = 0.079015 * safezoneW;
			h = 0.361039 * safezoneH;
		};
		
		class EAT_Build_Frame_BL: EAT_RscFrame
		{
			idc = 1802;
			x = 0.318833 * safezoneW + safezoneX;
			y = 0.625052 * safezoneH + safezoneY;
			w = 0.0784942 * safezoneW;
			h = 0.111861 * safezoneH;
		};
		
		class EAT_build_btnResident: EAT_RscShortcutButton
		{
			idc = 1702;
			text = "Residential";
			x = 0.323404 * safezoneW + safezoneX;
			y = 0.264902 * safezoneH + safezoneY;
			w = 0.0706801 * safezoneW;
			h = 0.0553565 * safezoneH;
			onButtonClick="[""Residential""] call LoadSpecificList;";
		};
		
		class EAT_build_btnMilitary: EAT_RscShortcutButton
		{
			idc = 1703;
			text = "Military";
			x = 0.323404 * safezoneW + safezoneX;
			y = 0.299902 * safezoneH + safezoneY;
			w = 0.0706801 * safezoneW;
			h = 0.0553565 * safezoneH;
			onButtonClick="[""Military""] call LoadSpecificList;";
		};
		
		class EAT_build_btnIndustrial: EAT_RscShortcutButton
		{
			idc = 1704;
			text = "Industrial";
			x = 0.323404 * safezoneW + safezoneX;
			y = 0.334902 * safezoneH + safezoneY;
			w = 0.0706801 * safezoneW;
			h = 0.0553565 * safezoneH;
			onButtonClick="[""Industrial""] call LoadSpecificList;";
		};
		
		class EAT_build_btnReligious: EAT_RscShortcutButton
		{
			idc = 1705;
			text = "Religious";
			x = 0.323404 * safezoneW + safezoneX;
			y = 0.369902 * safezoneH + safezoneY;
			w = 0.0706801 * safezoneW;
			h = 0.0553565 * safezoneH;
			onButtonClick="[""Religious""] call LoadSpecificList;";
		};
		
		class EAT_build_btnFarm: EAT_RscShortcutButton
		{
			idc = 1706;
			text = "Farm";
			x = 0.323404 * safezoneW + safezoneX;
			y = 0.404902 * safezoneH + safezoneY;
			w = 0.0706801 * safezoneW;
			h = 0.0553564 * safezoneH;
			onButtonClick="[""Farm""] call LoadSpecificList;";
		};
		
		class EAT_build_btnOres: EAT_RscShortcutButton
		{
			idc = 1707;
			text = "Ores";
			x = 0.323404 * safezoneW + safezoneX;
			y = 0.439902 * safezoneH + safezoneY;
			w = 0.0706801 * safezoneW;
			h = 0.0553565 * safezoneH;
			onButtonClick="[""Ores""] call LoadSpecificList;";
		};
		
		class EAT_build_btnGraves: EAT_RscShortcutButton
		{
			idc = 1708;
			text = "Graves";
			x = 0.323404 * safezoneW + safezoneX;
			y = 0.474902 * safezoneH + safezoneY;
			w = 0.0706801 * safezoneW;
			h = 0.0553565 * safezoneH;
			onButtonClick="[""Graves""] call LoadSpecificList;";
		};
		
		class EAT_build_btnRoads: EAT_RscShortcutButton
		{
			idc = 1709;
			text = "Roads";
			x = 0.323404 * safezoneW + safezoneX;
			y = 0.509902 * safezoneH + safezoneY;
			w = 0.0706801 * safezoneW;
			h = 0.0553565 * safezoneH;
			onButtonClick="[""Roads""] call LoadSpecificList;";
		};
		
		class EAT_build_btnOther: EAT_RscShortcutButton
		{
			idc = 1710;
			text = "Other";
			x = 0.323404 * safezoneW + safezoneX;
			y = 0.544902 * safezoneH + safezoneY;
			w = 0.0706801 * safezoneW;
			h = 0.0553565 * safezoneH;
			onButtonClick="[""Other""] call LoadSpecificList;";
		};
		
		class EAT_build_btnTemp: EAT_RscShortcutButton
		{
			idc = -1;
			text = "Temp";
			x = 0.329225 * safezoneW + safezoneX;
			y = 0.624902 * safezoneH + safezoneY;
			w = 0.0540102 * safezoneW;
			h = 0.0507248 * safezoneH;
			onButtonClick = "TempDialogSelected = (lbCurSel 13000); ((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
		
		class EAT_build_btnPerm: EAT_RscShortcutButton
		{
			idc = -1;
			text = "Perm";
			x = 0.329225 * safezoneW + safezoneX;
			y = 0.653902 * safezoneH + safezoneY;
			w = 0.0540102 * safezoneW;
			h = 0.0507248 * safezoneH;
			onButtonClick = "PermDialogSelected = (lbCurSel 13000); ((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
		
		class EAT_build_btnClose: EAT_RscShortcutButton
		{
			idc = 1711;
			text = "Close";
			x = 0.329225 * safezoneW + safezoneX;
			y = 0.684902 * safezoneH + safezoneY;
			w = 0.0540102 * safezoneW;
			h = 0.0507248 * safezoneH;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
		class EAT_build_closeBTN: EAT_RscButtonMenu
		{
			idc = 1600;
			text = "X";
			x = 0.670866 * safezoneW + safezoneX;
			y = 0.233927 * safezoneH + safezoneY;
			w = 0.0140000 * safezoneW;
			h = 0.0203776 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',1])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.2352])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.2352])", 0.5}; // Red
			colorText[] = {0.8784,0.8471,0.651,1};
			class Attributes
			{
				align = "center";
			};
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
	};
};
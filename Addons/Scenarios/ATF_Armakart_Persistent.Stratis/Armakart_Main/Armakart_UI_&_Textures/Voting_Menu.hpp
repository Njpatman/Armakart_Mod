class Weather_Voting_Menu
{
	idd = 123456;

	movingEnable = false;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Njpatman, v1.063, #Bapufy)
		////////////////////////////////////////////////////////
		class Count_0: RscStructuredText
		{
			idc = 1000;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.322109 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class FR_0: RscStructuredText
		{
			idc = 1850;
			x = 0.275703 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Frame_1: RscFrame
		{
			idc = 1800;
			x = 0.275703 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class RscFrame_1801: RscFrame
		{
			idc = 1801;
			x = 0.275703 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1802: RscFrame
		{
			idc = 1802;
			x = 0.368516 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1803: RscFrame
		{
			idc = 1803;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class FR_1: RscStructuredText
		{
			idc = 1851;
			x = 0.368516 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Frame_2: RscFrame
		{
			idc = 1804;
			x = 0.368516 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class FR_2: RscStructuredText
		{
			idc = 1852;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Frame_3: RscFrame
		{
			idc = 1805;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Count_1: RscStructuredText
		{
			idc = 1001;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.414922 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Count_2: RscStructuredText
		{
			idc = 1002;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.507734 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class FR_4: RscStructuredText
		{
			idc = 1854;
			x = 0.554141 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Frame_4: RscFrame
		{
			idc = 1806;
			x = 0.554141 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class RscFrame_1807: RscFrame
		{
			idc = 1807;
			x = 0.554141 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Count_3: RscStructuredText
		{
			idc = 1003;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.600547 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Count_4: RscStructuredText
		{
			idc = 1004;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.693359 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1808: RscFrame
		{
			idc = 1808;
			x = 0.646953 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class FR_5: RscStructuredText
		{
			idc = 1855;
			x = 0.646953 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Frame_5: RscFrame
		{
			idc = 1809;
			x = 0.646953 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class FR_6: RscStructuredText
		{
			idc = 1856;
			x = 0.275703 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Frame_6: RscFrame
		{
			idc = 1810;
			x = 0.275703 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class RscFrame_1811: RscFrame
		{
			idc = 1811;
			x = 0.275703 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Count_5: RscStructuredText
		{
			idc = 1005;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.322109 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class FR_7: RscStructuredText
		{
			idc = 1857;
			x = 0.368516 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Frame_7: RscFrame
		{
			idc = 1812;
			x = 0.368516 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class RscFrame_1813: RscFrame
		{
			idc = 1813;
			x = 0.368516 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Count_6: RscStructuredText
		{
			idc = 1006;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.414922 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class FR_11: RscStructuredText
		{
			idc = 1861;
			x = 0.22543 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.545273 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscFrame_1814: RscFrame
		{
			idc = 1814;
			x = 0.22543 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.545273 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscFrame_1815: RscFrame
		{
			idc = 1815;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1816: RscFrame
		{
			idc = 1816;
			x = 0.554141 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1817: RscFrame
		{
			idc = 1817;
			x = 0.646953 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class FR_8: RscStructuredText
		{
			idc = 1858;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class RscFrame_1818: RscFrame
		{
			idc = 1818;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class FR_9: RscStructuredText
		{
			idc = 1859;
			x = 0.554141 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class RscFrame_1819: RscFrame
		{
			idc = 1819;
			x = 0.554141 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class FR_10: RscStructuredText
		{
			idc = 1860;
			x = 0.646953 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class RscFrame_1820: RscFrame
		{
			idc = 1820;
			x = 0.646953 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Count_7: RscStructuredText
		{
			idc = 1007;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.507734 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Count_8: RscStructuredText
		{
			idc = 1008;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.600547 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Count_9: RscStructuredText
		{
			idc = 1009;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.693359 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Pic_0: RscPicture
		{
			idc = 1200;
			text = "a3\ui_f\data\gui\rsc\rscdisplayarcademap\clear_ca.paa";
			x = 0.275703 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Pic_1: RscPicture
		{
			idc = 1201;
			text = "a3\ui_f\data\gui\rsc\rscdisplayarcademap\cloudly_ca.paa";
			x = 0.368516 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Pic_2: RscPicture
		{
			idc = 1202;
			text = "a3\ui_f\data\gui\rsc\rscdisplayarcademap\editor_fog_max_ca.paa";
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Pic_3: RscPicture
		{
			idc = 1203;
			text = "a3\ui_f\data\gui\rsc\rscdisplayarcademap\rainy_ca.paa";
			x = 0.554141 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Pic_4: RscPicture
		{
			idc = 1204;
			text = "a3\ui_f\data\gui\rsc\rscdisplayarcademap\stormy_ca.paa";
			x = 0.646953 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Pic_5: RscPicture
		{
			idc = 1205;
			text = "Armakart_Main\Armakart_UI_&_Textures\SunRise.paa";
			x = 0.275703 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Pic_6: RscPicture
		{
			idc = 1206;
			text = "Armakart_Main\Armakart_UI_&_Textures\Noon.paa";
			x = 0.368516 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Pic_7: RscPicture
		{
			idc = 1207;
			text = "Armakart_Main\Armakart_UI_&_Textures\SunSet.paa";
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Pic_8: RscPicture
		{
			idc = 1208;
			text = "Armakart_Main\Armakart_UI_&_Textures\Night.paa";
			x = 0.554141 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class Pic_9: RscPicture
		{
			idc = 1209;
			text = "Armakart_Main\Armakart_UI_&_Textures\Night_Full_Moon.paa";
			x = 0.646953 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class CB_0: RscTextCheckbox
		{
			idc = 2500;
			x = 0.275703 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			values[] = {0};
			tooltips[] = {"SELECT WEATHER : CLEAR"};
		};
		class CB_1: RscTextCheckbox
		{
			idc = 2501;
			x = 0.368516 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			values[] = {1};
			tooltips[] = {"SELECT WEATHER : CLOUDY"};
		};
		class CB_2: RscTextCheckbox
		{
			idc = 2502;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			values[] = {2};
			tooltips[] = {"SELECT WEATHER : FOGGY"};
		};
		class CB_3: RscTextCheckbox
		{
			idc = 2503;
			x = 0.554141 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			values[] = {3};
			tooltips[] = {"SELECT WEATHER : LIGHT RAIN"};
		};
		class CB_4: RscTextCheckbox
		{
			idc = 2504;
			x = 0.646953 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			values[] = {4};
			tooltips[] = {"SELECT WEATHER : STORMY"};
		};
		class CB_5: RscTextCheckbox
		{
			idc = 2505;
			x = 0.275703 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			values[] = {5};
			tooltips[] = {"SELECT TIME : EARLY MORNING"};
		};
		class CB_6: RscTextCheckbox
		{
			idc = 2506;
			x = 0.368516 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			values[] = {6};
			tooltips[] = {"SELECT TIME : NOON"};
		};
		class CB_7: RscTextCheckbox
		{
			idc = 2507;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			values[] = {7};
			tooltips[] = {"SELECT TIME : LATE AFTERNOON"};
		};
		class CB_8: RscTextCheckbox
		{
			idc = 2508;
			x = 0.554141 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			values[] = {8};
			tooltips[] = {"SELECT TIME : NIGHT"};
		};
		class CB_9: RscTextCheckbox
		{
			idc = 2509;
			x = 0.646953 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			values[] = {9};
			tooltips[] = {"SELECT TIME : NIGHT FULL MOON"};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class Track_Voting_Menu
{
	idd = 12568;

	movingEnable = false;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Njpatman, v1.063, #Hywope)
		////////////////////////////////////////////////////////
		class Pic_0: RscPicture
		{
			idc = 1200;
			text = "Armakart_Main\Armakart_UI_&_Textures\Harbor.paa";
			x = 0.353047 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class Count_0: RscStructuredText
		{
			idc = 1000;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.399453 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Frame_1: RscFrame
		{
			idc = 1800;
			x = 0.353047 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class RscFrame_1801: RscFrame
		{
			idc = 1801;
			x = 0.353047 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1802: RscFrame
		{
			idc = 1802;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1803: RscFrame
		{
			idc = 1803;
			x = 0.569609 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Frame_2: RscFrame
		{
			idc = 1804;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class Frame_3: RscFrame
		{
			idc = 1805;
			x = 0.569609 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class Pic_1: RscPicture
		{
			idc = 1201;
			text = "Armakart_Main\Armakart_UI_&_Textures\Sewers.paa";
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class Pic_2: RscPicture
		{
			idc = 1202;
			text = "Armakart_Main\Armakart_UI_&_Textures\Docks.paa";
			x = 0.569609 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class Count_1: RscStructuredText
		{
			idc = 1001;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.507734 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Count_2: RscStructuredText
		{
			idc = 1002;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.616016 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Frame_4: RscFrame
		{
			idc = 1806;
			x = 0.353047 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class RscFrame_1807: RscFrame
		{
			idc = 1807;
			x = 0.353047 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Count_3: RscStructuredText
		{
			idc = 1003;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.399453 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Pic_3: RscPicture
		{
			idc = 1203;
			text = "Armakart_Main\Armakart_UI_&_Textures\Temple.paa";
			x = 0.353047 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class Pic_4: RscPicture
		{
			idc = 1204;
			text = "Armakart_Main\Armakart_UI_&_Textures\BoatAndBoogie.paa";
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class Count_4: RscStructuredText
		{
			idc = 1004;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.507734 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1808: RscFrame
		{
			idc = 1808;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Frame_5: RscFrame
		{
			idc = 1809;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class Frame_6: RscFrame
		{
			idc = 1810;
			x = 0.569609 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class RscFrame_1811: RscFrame
		{
			idc = 1811;
			x = 0.569609 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Count_5: RscStructuredText
		{
			idc = 1005;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.616016 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Pic_5: RscPicture
		{
			idc = 1205;
			text = "Armakart_Main\Armakart_UI_&_Textures\RainbowRoad.paa";
			x = 0.569609 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class Frame_7: RscFrame
		{
			idc = 1812;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class RscFrame_1813: RscFrame
		{
			idc = 1813;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Count_6: RscStructuredText
		{
			idc = 1006;
			text = "0";
			class Attributes
			{
				font = "LCD14";
				align = "center";
				valign = "center";
				shadow = false;
				size = "1.78";
			};
			x = 0.507734 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Pic_6: RscPicture
		{
			idc = 1206;
			text = "Armakart_Main\Armakart_UI_&_Textures\Random.paa";
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0773438 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class CB_0: RscTextCheckbox
		{
			idc = 2500;
			x = 0.353047 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			tooltips[] = {"SELECT TRACK : HARBOR"};
			values[] = {0};
		};
		class CB_1: RscTextCheckbox
		{
			idc = 2501;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			tooltips[] = {"SELECT TRACK : SEWERS"};
			values[] = {1};
		};
		class CB_2: RscTextCheckbox
		{
			idc = 2502;
			x = 0.569609 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			tooltips[] = {"SELECT TRACK : DOCKS"};
			values[] = {2};
		};
		class CB_3: RscTextCheckbox
		{
			idc = 2503;
			x = 0.353047 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			tooltips[] = {"SELECT TRACK : TEMPLE"};
			values[] = {3};
		};
		class CB_4: RscTextCheckbox
		{
			idc = 2504;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			tooltips[] = {"SELECT TRACK : BOAT AND BOOGIE"};
			values[] = {4};
		};
		class CB_5: RscTextCheckbox
		{
			idc = 2505;
			x = 0.569609 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			tooltips[] = {"SELECT TRACK : RAINBOW ROAD"};
			values[] = {5};
		};
		class CB_6: RscTextCheckbox
		{
			idc = 2506;
			x = 0.461328 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
			tooltips[] = {"SELECT TRACK : RANDOM"};
			values[] = {6};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
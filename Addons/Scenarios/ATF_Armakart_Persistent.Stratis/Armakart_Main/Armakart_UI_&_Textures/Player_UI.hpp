class Track_Loading_Screen	
{
	idd = 1465;

	duration = 99999999999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;
	

	class controls
	{

		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Njpatman, v1.063, #Socucu)
		////////////////////////////////////////////////////////

		class RscStructuredText_1105: RscStructuredText
		{
			idc = 1102;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Main_Text', _this select 0 ];";

			x = 0.2525 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.407 * safezoneH;
		};
		class RscStructuredText_1107: RscStructuredText
		{
			idc = 1109;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Loading_Text', _this select 0 ];";

			x = 0.494844 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_Title: RscStructuredText
		{
			idc = 1105;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Title', _this select 0 ];";

			x = 0.206094 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscStructuredText_1137: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Final_Text', _this select 0 ];";

			x = 0.448438 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1134: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Final', _this select 0 ];";

			x = 0.443281 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_1: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_1', _this select 0 ];";

			x = 0.221562 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_2: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_2', _this select 0 ];";

			x = 0.221562 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_3: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_3', _this select 0 ];";

			x = 0.221562 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_4: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_4', _this select 0 ];";

			x = 0.221562 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_5: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_5', _this select 0 ];";

			x = 0.221562 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_Equals_1: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Equals_1', _this select 0 ];";

			x = 0.345312 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_Equals_2: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Equals_2', _this select 0 ];";

			x = 0.345312 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_Equals_3: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Equals_3', _this select 0 ];";

			x = 0.345312 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_Equals_5: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Equals_5', _this select 0 ];";

			x = 0.345312 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_Equals_4: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Equals_4', _this select 0 ];";

			x = 0.345312 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_Number_1: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Number_1', _this select 0 ];";

			x = 0.371094 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_Number_2: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Number_2', _this select 0 ];";

			x = 0.371094 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_Number_5: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Number_5', _this select 0 ];";

			x = 0.371094 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_Number_4: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Number_4', _this select 0 ];";

			x = 0.371094 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Weather_Number_3: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Weather_Number_3', _this select 0 ];";

			x = 0.371094 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1135: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Final', _this select 0 ];";

			x = 0.443281 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1136: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Final_Text', _this select 0 ];";

			x = 0.448438 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Time_Title: RscStructuredText
		{
			idc = 1105;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Title', _this select 0 ];";

			x = 0.556719 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Time_Number_5: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Number_5', _this select 0 ];";

			x = 0.721719 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Time_Number_3: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Number_3', _this select 0 ];";

			x = 0.721719 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Time_Number_4: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Number_4', _this select 0 ];";

			x = 0.721719 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Time_Number_2: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Number_2', _this select 0 ];";

			x = 0.721719 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Time_Number_1: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Number_1', _this select 0 ];";

			x = 0.721719 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Time_Equals_5: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Equals_5', _this select 0 ];";

			x = 0.695937 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Time_Equals_1: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Equals_1', _this select 0 ];";

			x = 0.695937 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Time_Equals_3: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Equals_3', _this select 0 ];";

			x = 0.695937 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Time_Equals_2: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Equals_2', _this select 0 ];";

			x = 0.695937 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Time_Equals_4: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_Equals_4', _this select 0 ];";

			x = 0.695937 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Time_1: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_1', _this select 0 ];";

			x = 0.572187 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1130: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_4', _this select 0 ];";

			x = 0.572187 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1131: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_5', _this select 0 ];";

			x = 0.572187 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1132: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_3', _this select 0 ];";

			x = 0.572187 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1133: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Track_Loading_Screen_Time_2', _this select 0 ];";

			x = 0.572187 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Time_Titleasd: RscFrame
		{
			idc = 1906;
			

			x = 0.556719 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscFrame_1803: RscFrame
		{
			idc = 1907;
			

			x = 0.572187 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class RscFrame_1805: RscFrame
		{
			idc = 1907;
			

			x = 0.443281 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1806: RscFrame
		{
			idc = 1907;
			

			x = 0.448438 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1807: RscFrame
		{
			idc = 1907;
			

			x = 0.443281 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1808: RscFrame
		{
			idc = 1907;
			

			x = 0.448438 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1904: RscFrame
		{
			idc = 1904;
			

			x = 0.2525 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.407 * safezoneH;
		};
		class Weather_Titleasd: RscFrame
		{
			idc = 1906;
			

			x = 0.206094 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscFrame_1907: RscFrame
		{
			idc = 1907;
			

			x = 0.221562 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.22 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};


class Player_Loading_Screen	
{
	idd = 1445;

	duration = 99999999999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;
	

	class controls
	{

		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Njpatman, v1.063, #Xohyxi)
		////////////////////////////////////////////////////////

		class RscStructuredText_1105: RscStructuredText
		{
			idc = 1102;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Player_Loading_Screen_Main_Display', _this select 0 ];";

			x = 0.2525 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.352 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1105;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Player_Loading_Screen_Middle_Mid_Display', _this select 0 ];";

			x = 0.432969 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1103: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Player_Loading_Screen_Middle_Bottom_Display', _this select 0 ];";

			x = 0.45875 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1107: RscStructuredText
		{
			idc = 1109;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Player_Loading_Screen_Bottom_Main_Display', _this select 0 ];";

			x = 0.494844 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1904: RscFrame
		{
			idc = 1904;
			

			x = 0.2525 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.352 * safezoneH;
		};
		class RscFrame_1906: RscFrame
		{
			idc = 1906;
			
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1907: RscFrame
		{
			idc = 1907;
			
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};


class Loading_Screen	
{
	idd = 1435;

	duration = 99999999999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;
	

	class controls
	{

		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Njpatman, v1.063, #Xohyxi)
		////////////////////////////////////////////////////////

		class RscStructuredText_1105: RscStructuredText
		{
			idc = 1102;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Loading_Screen_Main_Display', _this select 0 ];";

			x = 0.2525 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.352 * safezoneH;
		};
		class RscStructuredText_1204: RscStructuredText
		{
			idc = 1103;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Loading_Screen_Left_Mid_Display', _this select 0 ];";

			x = 0.298906 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1104: RscStructuredText
		{
			idc = 1104;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Loading_Screen_Left_Bottom_Display', _this select 0 ];";

			x = 0.273125 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1105;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Loading_Screen_Middle_Mid_Display', _this select 0 ];";

			x = 0.432969 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1106;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Loading_Screen_Right_Mid_Display', _this select 0 ];";

			x = 0.592812 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1103: RscStructuredText
		{
			idc = 1107;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Loading_Screen_Middle_Bottom_Display', _this select 0 ];";

			x = 0.45875 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1106: RscStructuredText
		{
			idc = 1108;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Loading_Screen_Right_Bottom_Display', _this select 0 ];";

			x = 0.618594 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1107: RscStructuredText
		{
			idc = 1109;
			font = "puristaMedium";
			
			onload = "uiNamespace setVariable [ 'Loading_Screen_Bottom_Main_Display', _this select 0 ];";

			x = 0.494844 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1901: RscFrame
		{
			idc = 1901;
			

			x = 0.618594 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1902: RscFrame
		{
			idc = 1902;
			

			x = 0.298906 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1903: RscFrame
		{
			idc = 1903;
			

			x = 0.273125 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1904: RscFrame
		{
			idc = 1904;
			

			x = 0.2525 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.352 * safezoneH;
		};
		class RscFrame_1905: RscFrame
		{
			idc = 1905;
			

			x = 0.592812 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1906: RscFrame
		{
			idc = 1906;
			
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1907: RscFrame
		{
			idc = 1907;
			
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};






class Crosshair	
{
	idd = 1345;

	duration = 99999999999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.82};
			onload = "uiNamespace setVariable [ 'Crosshair_1', _this select 0 ];";
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.82};
			onload = "uiNamespace setVariable [ 'Crosshair_2', _this select 0 ];";
		};
	};	
};

class In_Race_UI	
{
	idd = 1348;

	duration = 99999999999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Njpatman, v1.063, #Lequgu)
		////////////////////////////////////////////////////////

		class RscFrame_1802: RscFrame
		{
			idc = 1802;

			x = 0.164844 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscFrame_1805: RscFrame
		{
			idc = 18032;

			x = 0.0617187 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			font = "puristaMedium";
			onload = "uiNamespace setVariable [ 'Place_UI', _this select 0 ];";

			x = 0.762969 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;
			font = "puristaMedium";
			onload = "uiNamespace setVariable [ 'Personal_UI_CPs', _this select 0 ];";

			x = 0.0926562 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscStructuredText_1102: RscStructuredText
		{
			idc = 1102;
			font = "puristaMedium";
			onload = "uiNamespace setVariable [ 'Personal_UI_Laps', _this select 0 ];";

			x = 0.195781 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;

			text = "Armakart_Main\Armakart_UI_&_Textures\UI_FLAG.paa";
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscPicture_1201: RscPicture
		{
			idc = 1201;

			text = "Armakart_Main\Armakart_UI_&_Textures\UI_CP.paa";
			x = 0.0617187 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};	
};

class Customization_Timer_UI	
{
	idd = 12358;

	duration = 99999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
		class Text: RscStructuredText
		{
			idc = 1004;

			text = "<br/> <t align = 'center'> If you've exited the Customization Menu, simply Self Interact >> Reset Menu</t>"; //--- ToDo: Localize;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.464062 * safezoneW;
			h = 0.099 * safezoneH;
			onload = "uiNamespace setVariable [ 'Pre_Race_UI_Bottom', _this select 0 ];";
		};
		class Timer_Title: RscStructuredText
		{
			idc = 1005;

			text = "<t align = 'center'  size='2'>--- Customization Time Left ---</t>"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.066 * safezoneH;	
			onload = "uiNamespace setVariable [ 'Timer_Title', _this select 0 ];";	
		};			
	};	
};

class Timer
{

	idd = 1236;

	duration = 9999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
		class timer_text: RscStructuredText
		{
			idc = 1029;

			x = 0.422656 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {1,0,0,0};
			onload = "uiNamespace setVariable [ 'TimerCtrl', _this select 0 ];";
		};
	};
};
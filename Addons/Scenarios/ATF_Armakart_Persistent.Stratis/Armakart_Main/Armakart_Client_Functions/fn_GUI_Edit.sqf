if !(hasInterface) exitWith {};

params ["_GUI_Edit", "_Variable_1", "_Variable_2", "_Variable_3"];

disableSerialization;

#define _Pre_Race_UI_Bottom uiNamespace getVariable ["Pre_Race_UI_Bottom", controlNull]
#define _Timer_Title uiNamespace getVariable ["Timer_Title", controlNull]
switch (_GUI_Edit) do {

	case "Edit_Track_End_Phase": { 
		_Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'>If you exit the Scoreboard, you will not be able to open it again!</t>";
		_Timer_Title ctrlSetStructuredText parseText "<t align = 'center'  size='2'>--- Scoreboard Viewing Time Left ---</t>";
	};

  case "Edit_Voting_Phase": { 

		// Exit if spectator
		if (Is_Spectator) exitWith {
			_Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'> </t>";
			_Timer_Title ctrlSetStructuredText parseText "<t align = 'center'  size='2'>--- Weather Voting Time Left ---</t>";
			closeDialog 1235;
		};
		_Voting_UI = findDisplay 123456;
		for "_i" from 0 to 11 do {
			_uiCB = (1000 + _i); 
			_uiCB_2 = (1850 + _i);
			_Voting = _Voting_UI displayCtrl _uiCB;
			_Voting_Frame = _Voting_UI displayCtrl _uiCB_2;
			//Get the UI color that was used on the Customization UI and applies it
			_Voting ctrlSetBackgroundColor UI_Color;
			_Voting_Frame ctrlSetBackgroundColor UI_Color;
		};
		_Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'>If you exit the voting menu, you will not be able to open it again!</t>";
		_Timer_Title ctrlSetStructuredText parseText "<t align = 'center'  size='2'>--- Weather Voting Time Left ---</t>";
    };

	case "Edit_Track_Voting_Phase": { 

		// Exit if spectator
		if (Is_Spectator) exitWith {
			_Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'> </t>";
			_Timer_Title ctrlSetStructuredText parseText "<t align = 'center'  size='2'>--- Track Voting Time Left ---</t>";
			closeDialog 1235;
		};
		_Voting_UI = findDisplay 12568;
		for "_i" from 0 to 7 do {
			_uiCB = (1000 + _i); 
			_Voting = _Voting_UI displayCtrl _uiCB;
			//Get the UI color that was used on the Customization UI and applies it
			_Voting ctrlSetBackgroundColor UI_Color;
		};
		_Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'>If you exit the voting menu, you will not be able to open it again!</t>";
		_Timer_Title ctrlSetStructuredText parseText "<t align = 'center'  size='2'>--- Track Voting Time Left ---</t>";
    };

	case "Edit_Players_Loaded": { 

		#define _Player_Loading_Screen_Main_Display uiNamespace getVariable ["Player_Loading_Screen_Main_Display", controlNull]
		#define _Player_Loading_Screen_Middle_Mid_Display uiNamespace getVariable ["Player_Loading_Screen_Middle_Mid_Display", controlNull]
		#define _Player_Loading_Screen_Middle_Bottom_Display uiNamespace getVariable ["Player_Loading_Screen_Middle_Bottom_Display", controlNull]
		#define _Player_Loading_Screen_Bottom_Main_Display uiNamespace getVariable ["Player_Loading_Screen_Bottom_Main_Display", controlNull]
		
		_Player_Loading_Screen_Bottom_Main_Display ctrlSetStructuredText parseText "<t color='#a7adba' font='PuristaSemibold' align = 'right' size='1.85'>Players are Initializing, Please Stand By...</t>";
		_Player_Loading_Screen_Main_Display ctrlSetStructuredText parseText "<t color='#c77518' font='PuristaSemibold' align = 'center' size='3.2'>Players are Initializing, keep in mind that you have to ACE self-interact to reset to your last checkpoint. Otherwise, good luck!</t>";

		if (_Variable_1 >= (0.85 * (count allPlayers))) then {
			_Player_Loading_Screen_Bottom_Main_Display ctrlSetStructuredText parseText "<t color='#a7adba' font='PuristaSemibold' align = 'right' size='1.85'>Enough Players have Loaded, Please Stand By...</t>";			
		};
		
		_color = "#ff0000";
		if (_Variable_1 > (0.5 * (count allPlayers))) then {_color = "#eef441";};
		if (_Variable_1 >= (0.85 * (count allPlayers))) then {_color = "#45f442";};

		_Player_Loading_Screen_Middle_Mid_Display ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.75'>Players Loaded</t>", _color];
		_Player_Loading_Screen_Middle_Bottom_Display ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%3' size='1.70'>%1/%2</t>", _Variable_1, (count allPlayers), _color];

    };

	case "Edit_kartCustomization": { 

		if (Is_Spectator) then {

			disableSerialization;

			#define _Pre_Race_UI_Bottom uiNamespace getVariable ["Pre_Race_UI_Bottom", controlNull]
			_Pre_Race_UI_Bottom ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'> </t>";

			closeDialog 1234;

		};

    };

    case "Edit_Initial_Loading_Screen": {

		#define _Loading_Screen_Main_Display uiNamespace getVariable ["Loading_Screen_Main_Display", controlNull]
		#define _Loading_Screen_Left_Mid_Display uiNamespace getVariable ["Loading_Screen_Left_Bottom_Display", controlNull]
		#define _Loading_Screen_Middle_Mid_Display uiNamespace getVariable ["Loading_Screen_Middle_Mid_Display", controlNull]
		#define _Loading_Screen_Right_Mid_Display uiNamespace getVariable ["Loading_Screen_Right_Mid_Display", controlNull]
		#define _Loading_Screen_Left_Bottom_Display uiNamespace getVariable ["Loading_Screen_Left_Mid_Display", controlNull]
		#define _Loading_Screen_Middle_Bottom_Display uiNamespace getVariable ["Loading_Screen_Middle_Bottom_Display", controlNull]
		#define _Loading_Screen_Right_Bottom_Display uiNamespace getVariable ["Loading_Screen_Right_Bottom_Display", controlNull]
		#define _Loading_Screen_Bottom_Main_Display uiNamespace getVariable ["Loading_Screen_Bottom_Main_Display", controlNull]

		_Loading_Screen_Bottom_Main_Display ctrlSetStructuredText parseText format [ "<t color='#a7adba' font='PuristaSemibold' align = 'right' size='1.85'>Armakart %1 is Initializing, Please Stand By...</t>", Track_Title];
		_Loading_Screen_Main_Display ctrlSetStructuredText parseText "<t color='#c77518' font='PuristaSemibold' align = 'center' size='3.15'>Armakart Systems and Objects are Initializing, keep in mind that you have to ACE self-interact to reset to your last checkpoint. Otherwise, good luck!</t>";

		if (_Variable_1 isEqualTo CP_NUM && _Variable_2 isEqualTo SUB_CP_NUM && _Variable_3 isEqualTo PWR_BLK_NUM) then {
			_Loading_Screen_Bottom_Main_Display ctrlSetStructuredText parseText format [ "<t color='#a7adba' font='PuristaSemibold' align = 'right' size='1.85'>Armakart %1 Has Loaded, Please Stand By...</t>", Track_Title];			
		};

		_color = "#ff0000";
		if (_Variable_1 > (0.5 * CP_NUM)) then {_color = "#eef441";};
		if (_Variable_1 isEqualTo CP_NUM) then {_color = "#45f442";};

		_Loading_Screen_Left_Mid_Display ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.75'>Checkpoints</t>", _color];

		_Loading_Screen_Left_Bottom_Display ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%3' size='1.70'>%1/%2</t>", _Variable_1, CP_NUM, _color];

		_color = "#ff0000";
		if (_Variable_2 > (0.5 * SUB_CP_NUM)) then {_color = "#eef441";};
		if (_Variable_2 isEqualTo SUB_CP_NUM) then {_color = "#45f442";};

		_Loading_Screen_Middle_Mid_Display ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.75'>Sub Checkpoints</t>", _color];

		_Loading_Screen_Middle_Bottom_Display ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%3' size='1.70'>%1/%2</t>", _Variable_2, SUB_CP_NUM, _color];

		_color = "#ff0000";
		if (_Variable_3 > (0.5 * PWR_BLK_NUM)) then {_color = "#eef441";};
		if (_Variable_3 isEqualTo PWR_BLK_NUM) then {_color = "#45f442";};

		_Loading_Screen_Right_Mid_Display ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.75'>Powerup Blocks</t>", _color];

		_Loading_Screen_Right_Bottom_Display ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%3' size='1.70'>%1/%2</t>", _Variable_3, PWR_BLK_NUM, _color];

    };

	case "Edit_Track_Loading_Screen": { 

		_Track_Loading_Screen_Main_Text = uiNamespace getVariable "Track_Loading_Screen_Main_Text";
		_Track_Loading_Screen_Loading_Text = uiNamespace getVariable "Track_Loading_Screen_Loading_Text";
		_Track_Loading_Screen_Time_Title = uiNamespace getVariable "Track_Loading_Screen_Time_Title";
		_Track_Loading_Screen_Time_Final_Text = uiNamespace getVariable "Track_Loading_Screen_Time_Final_Text";
		_Track_Loading_Screen_Time_Final = uiNamespace getVariable "Track_Loading_Screen_Time_Final";
		_Track_Loading_Screen_Weather_Title = uiNamespace getVariable "Track_Loading_Screen_Weather_Title";
		_Track_Loading_Screen_Weather_Final_Text = uiNamespace getVariable "Track_Loading_Screen_Weather_Final_Text";
		_Track_Loading_Screen_Weather_Final = uiNamespace getVariable "Track_Loading_Screen_Weather_Final";
		_Size = 1.25;
		_Track_Loading_Screen_Loading_Text ctrlSetStructuredText parseText "<t color='#a7adba' font='PuristaSemibold' align = 'right' size='1.85'>The Track is Initializing, Please Stand By...</t>";
		_Track_Loading_Screen_Main_Text ctrlSetStructuredText parseText "<t color='#c77518' font='PuristaSemibold' align = 'center' size='3.2'>Track Weather and Time are initializing, keep in mind that you have to ACE self-interact to reset to your last checkpoint. Otherwise, good luck!</t>";
		_1_Str = "Calculating...";
		_color = "#ff0000";
		_Effect = 'Time'; 
		_Variable_2 = missionNamespace getVariable "Time_Max";
		_Variable_3 = missionNamespace getVariable "Time_Array";
		if !(_Variable_1) then { 
			_Track_Loading_Screen_Weather_Final_Text ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' color='%1' size='1.25'>%2</t>", _color, _1_Str];
			_Track_Loading_Screen_Weather_Final ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.65'>Weather</t>", _color];
			_Track_Loading_Screen_Weather_Title ctrlSetStructuredText parseText format [ "<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%1' size='1.75'>--- </t><t align = 'center' valign = 'bottom' color='%1' size='1.75'>Player Weather Votes</t><t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%1' size='1.75'> ---</t>", "#a7adba"];
			_Track_Loading_Screen_Time_Final_Text ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' color='%1' size='1.25'>%2</t>", _color, _1_Str];
			_Track_Loading_Screen_Time_Final ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.75'>Time</t>", _color];
			_Track_Loading_Screen_Time_Title ctrlSetStructuredText parseText format [ "<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%1' size='1.75'>--- </t><t align = 'center' valign = 'bottom' color='%1' size='1.75'>Player Time Votes</t><t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%1' size='1.75'> ---</t>", "#a7adba"];
			_Effect = 'Weather'; 
			_Variable_2 = missionNamespace getVariable "Weather_Max";
			_Variable_3 = missionNamespace getVariable "Weather_Array";
		};
		for "_e" from 0 to _Variable_2 do {
			uiSleep 0.195;
			for "_i" from 0 to 4 do {
				if (((_Variable_3 select _i)select 0) >= _e) then {
					_b = _i + 1;
					_Effect_str = 'Track_Loading_Screen_' + _Effect +'_' + (str _b);
					_Track_Loading_Screen = uiNamespace getVariable _Effect_str;

					_Effect_Equals_str = 'Track_Loading_Screen_' + _Effect +'_Equals_' + (str _b);
					_Track_Loading_Screen_Equals = uiNamespace getVariable _Effect_Equals_str;

					_Effect_Number_str = 'Track_Loading_Screen_' + _Effect +'_Number_' + (str _b);
					_Track_Loading_Screen_Number = uiNamespace getVariable _Effect_Number_str;
					_color = "#ff0000";
					if (_e > (0.5 * _Variable_2)) then { _color = "#eef441"; };
					if ((_e isEqualTo _Variable_2)) then { _color = "#45f442"; };
					_Size = 1.25;
					if (_Variable_1 && (_e  > (0.5 * _Variable_2))) then {
						_Track_Loading_Screen_Time_Final_Text ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' color='%1' size='1.25'>%2</t>", "#eef441", _1_Str];
						_Track_Loading_Screen_Time_Final ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.75'>Time</t>", "#eef441"];
					};
					if (!_Variable_1 && (_e  > (0.5 * _Variable_2))) then {
						_Track_Loading_Screen_Weather_Final_Text ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' color='%1' size='1.25'>%2</t>", "#eef441", _1_Str];
						_Track_Loading_Screen_Weather_Final ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.65'>Weather</t>", "#eef441"];
					};
					if (_Variable_1 && (_e isEqualTo _Variable_2)) then {
						_Track_Loading_Screen_Time_Final_Text ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' color='%1' size='1.25'>%2</t>", "#45f442", ((_Variable_3 select _i)select 1)];
						_Track_Loading_Screen_Time_Final ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.75'>Time</t>", "#45f442"];
					};
					if (!_Variable_1 && (_e isEqualTo _Variable_2)) then {
						_Track_Loading_Screen_Weather_Final_Text ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' color='%1' size='1.25'>%2</t>", "#45f442", ((_Variable_3 select _i)select 1)];
						_Track_Loading_Screen_Weather_Final ctrlSetStructuredText parseText format [ "<t align = 'center' color='%1' size='1.65'>Weather</t>", "#45f442"];
					};
					_Track_Loading_Screen ctrlSetStructuredText parseText format ["<t align = 'center' color='%2' size='1.75'>%1</t>", ((_Variable_3 select _i)select 1), _color];
					_Track_Loading_Screen_Equals ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%1' size='2'>=</t>", _color];
					_Track_Loading_Screen_Number ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' color='%2' size='1.75'>%1</t>", _e, _color];
				};
			};
			if (_Variable_1 && (_e isEqualTo _Variable_2)) then {
				_Track_Loading_Screen_Loading_Text ctrlSetStructuredText parseText "<t color='#a7adba' font='PuristaSemibold' align = 'right' size='1.85'>Track initialization completed, Please Stand By...</t>";
				_Track_Loading_Screen_Main_Text ctrlSetStructuredText parseText "<t color='#c77518' font='PuristaSemibold' align = 'center' size='3.2'>Track Weather and Time Initialized, keep in mind that you have to ACE self-interact to reset to your last checkpoint. Otherwise, good luck!</t>";
				uiSleep 2;
				[ [], { Players_Loading_Vote = Players_Loading_Vote + 1 } ] remoteExec ["Spawn", 2, false];
			};
		};
    };
};
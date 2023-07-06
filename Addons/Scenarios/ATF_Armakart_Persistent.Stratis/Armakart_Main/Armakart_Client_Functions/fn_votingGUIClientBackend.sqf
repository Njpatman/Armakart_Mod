params ["_selection", "_player"];
if (!hasInterface) exitWith {};
disableSerialization;
_uiCount = (1000 + _selection);
_ctrlDisplay = findDisplay 46;
switch true do {
	case (RACE_PHASE isEqualTo "Track_Voting_Phase"): { 
		_ctrlDisplay = findDisplay 12568;
		if (_player isEqualTo player) then {
			for "_i" from 0 to 9 do {
				_uiCB = (2500 + _i); 
				ctrlEnable [_uiCB, false];
			};
		};
	};
	case (RACE_PHASE isEqualTo "Weather_Voting_Phase"): { 
		_ctrlDisplay = findDisplay 123456;
		if (_player isEqualTo player) then {
			if (_selection <= 4) then {
				for "_i" from 0 to 4 do {
					_uiCB = (2500 + _i); 
					ctrlEnable [_uiCB, false];
				};
				for "_i" from 0 to 5 do {
					_uiCB_2 = (1850 + _i); 
					_uiCB_2Ctrl = _ctrlDisplay displayCtrl _uiCB_2;
					_pos = ctrlPosition _uiCB_2Ctrl;

					_newCTRL = _ctrlDisplay ctrlCreate ["RscStructuredText", -1];
					_newCTRL ctrlSetPosition _pos;
					_newCTRL ctrlSetBackgroundColor UI_Color;
					_newCTRL ctrlCommit 0;
				};
			} else {
				for "_i" from 5 to 9 do {
					_uiCB = (2500 + _i); 
					ctrlEnable [_uiCB, false];
				};
				for "_i" from 6 to 10 do {
					_uiCB_2 = (1850 + _i); 
					_uiCB_2Ctrl = _ctrlDisplay displayCtrl _uiCB_2;
					_pos = ctrlPosition _uiCB_2Ctrl;

					_newCTRL = _ctrlDisplay ctrlCreate ["RscStructuredText", -1];
					_newCTRL ctrlSetPosition _pos;
					_newCTRL ctrlSetBackgroundColor UI_Color;
					_newCTRL ctrlCommit 0;
					
				};
			};
		};
	};
};

_uiCountCtrl = _ctrlDisplay displayCtrl _uiCount;
_numStr = ctrlText _uiCount;
_numCallStr = "_number = " + (_numStr) + "; _number";
_num = call compile _numCallStr;
_num = _num + 1;
_uiCountCtrl ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' size='1.78'>%1</t>", (str _num)];
/*
	Author: Njpatman

	Description:
		Selects a random powerup and plays a little hint animation that lasts as long as the sound effect
*/

if (!No_item) exitwith {};

No_item = false;
_Count_Racers = missionNamespace getVariable "Racer_Count";
playsound"itembox";
for "_i" from 1 to 42 do {
		_Hintstr = selectRandom [
		"<t color='#808080'>Bomb</t>",
		"<t color='#948685'>Triple Bomb</t>",
		"<t color='#04378f'>Lightning</t>",
		"<t color='#11aed9'>Fus-Roh-Dah</t>",
		"<t color='#5c0c5e'>Smoke</t>",
		"<t color='#FFFF00'>Banana</t>",
		"<t color='#e68f0e'>Kitchen Sink</t>",
		"<t color='#ff0d00'>Bunny Mine</t>",
		"<t color='#69f0ff'>Blue Shell</t>",
		"<t color='#FFFF00'>Triple Banana</t>",
		"<t color='#731717'>Triple Boost</t>",
		"<t color='#25910d'>Miller</t>",
		"<t color='#25910d'>Miller Lite</t>",
		"<t color='#fc3903'>Washing Machine</t>",
		"<t color='#FFFF00'>Banana Gun</t>",
		"<t color='#cd7f32'>Checkpoint Teleport</t>",
		"<t color='#ff5454'>Involuntary Boost</t>",
		"<t color='#5c8694'>Change Mass</t>"
	];
	hintSilent parseText _Hintstr;
	uiSleep 0.125;
};

Itembox_sfx = false;
uiSleep 0.115;
hintSilent "";

if (Player_Finished) exitWith {};

_pwrUp = selectRandom ["Bunny_IED", "Bomb", "Banana"];

switch true do {
	case (Powerup_Creep_Enabled isEqualTo 2): { 
		_pwrUp = selectRandom ["Bunny_IED", "Bomb", "Banana", "Involuntary_Boost", "Triple_Bomb", "Lightning", "Banana_Gun", "Triple_Boost", "Boost", "Triple_Banana", "Kitchen_sink", "Miller", "Washing_Machine", "Fus_Ro_Dah", "Change_Mass", "Miller_Lite", "CP_Tele", "Blue_Shell"];
	};
	case (Current_Place isEqualTo "N/A" || (typeName Current_Place) isEqualTo "STRING"): {
		_pwrUp = selectRandom ["Bunny_IED", "Bomb", "Banana", "Involuntary_Boost", "Triple_Bomb", "Lightning", "Banana_Gun", "Triple_Boost", "Boost", "Triple_Banana", "Kitchen_sink", "Miller", "Washing_Machine", "Fus_Ro_Dah", "Change_Mass", "Miller_Lite", "Blue_Shell"];
	};
	case (Current_Place isEqualTo 1): {
		_pwrUp = selectRandom ["Bunny_IED", "Bomb", "Banana"];
	};
	case (Current_Place > 1 && Current_Place <= (_Count_Racers * 0.2)): {
		_pwrUp = selectRandom ["Bunny_IED", "Bomb", "Banana", "Involuntary_Boost", "Triple_Bomb", "Lightning", "Banana_Gun", "Triple_Boost", "Boost", "Triple_Banana", "Kitchen_sink", "Miller", "Washing_Machine", "Fus_Ro_Dah"];
	};
	case (Current_Place >= (_Count_Racers * 0.2) && Current_Place <= (_Count_Racers * 0.4)): {
		_pwrUp = selectRandom ["Bunny_IED", "Bomb", "Banana", "Involuntary_Boost", "Triple_Bomb", "Lightning", "Banana_Gun", "Triple_Boost", "Boost", "Triple_Banana", "Kitchen_sink", "Miller", "Washing_Machine", "Fus_Ro_Dah", "Change_Mass", "Miller_Lite"];
	};
	case (Current_Place >= (_Count_Racers * 0.4) && Current_Place <= (_Count_Racers * 0.6)): {
		_pwrUp = selectRandom ["Banana", "Involuntary_Boost", "Triple_Bomb", "Lightning", "Banana_Gun", "Triple_Boost", "Boost", "Triple_Banana", "Kitchen_sink", "Miller", "Washing_Machine", "Fus_Ro_Dah", "Change_Mass", "Miller_Lite"];
	};
	case (Current_Place >= (_Count_Racers * 0.6) && Current_Place <= (_Count_Racers * 0.8)): {
		_pwrUp = selectRandom ["Involuntary_Boost", "Triple_Bomb", "Lightning", "Banana_Gun", "Triple_Boost", "Boost", "Triple_Banana", "Kitchen_sink", "Miller", "Washing_Machine", "Fus_Ro_Dah", "Change_Mass", "Miller_Lite", "CP_Tele", "Blue_Shell"];
	};
	case (Current_Place >= (_Count_Racers * 0.8) && Current_Place <= _Count_Racers): {
		_pwrUp = selectRandom ["Involuntary_Boost", "Triple_Boost", "Boost", "Kitchen_sink", "Miller", "Miller_Lite", "CP_Tele", "Blue_Shell"];
	};
};

_pwrUpSTR = "call NJP_Client_Powerup_Fnc_" + _pwrUp + "_ctrl";
[] spawn compile _pwrUpSTR;
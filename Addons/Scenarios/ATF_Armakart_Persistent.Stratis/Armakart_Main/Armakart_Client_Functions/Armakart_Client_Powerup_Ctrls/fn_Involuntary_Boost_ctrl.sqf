/*
	Author: Njpatman

	Description:
		Involuntary Boost powerup, gives a player a Involuntary speed boost
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
_Initial_hint_local = Initial_hint;
["Armakart", "MyKey", "Powerup Action", {
	_Search_Array = nearestObjects [getPos cursorTarget, ["Car", "Truck"], 35];

	if (_Search_Array isEqualTo []) then {

		_Pos_AGl = screenToWorld [0.5,0.5];

		_Search_Array = nearestObjects [_Pos_AGl, ["Car", "Truck"], 35];

	};
	[_Search_Array, player] remoteExec ["NJP_Server_Powerup_Fnc_Involuntary_Boost", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	_Search_Array = nearestObjects [getPos cursorTarget, ["Car", "Truck"], 35];

	if (_Search_Array isEqualTo []) then {

		_Pos_AGl = screenToWorld [0.5,0.5];

		_Search_Array = nearestObjects [_Pos_AGl, ["Car", "Truck"], 35];

	};
	[_Search_Array, player] remoteExec ["NJP_Server_Powerup_Fnc_Involuntary_Boost", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyDKey", "Discard Action", {
	[0, 0, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_C, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyDKeyButShift-er", "Discard Action", {
	[0, 0, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_C, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

"Crosshair_Layer" cutRsc ["Crosshair", "PLAIN"];

#define _Crosshair_1 uiNamespace getVariable [ "Crosshair_1", controlNull ]
#define _Crosshair_2 uiNamespace getVariable [ "Crosshair_2", controlNull ]

//Apllies the color value to the Crosshair
{
_x ctrlSetBackgroundColor UI_Color;
} forEach [_Crosshair_1, _Crosshair_2];

playsound"hint";

while {Initial_hint isEqualTo _Initial_hint_local} do {
	hintsilent parseText "<t color='#ff5454'>Involuntary Boost acquired!</t><br/><br/><t>Involuntary Boost Status:  </t><t color='#45f442'>Ready To Fire</t><br/><br/><t>The Involuntary Boost powerup will give a players kart under your crosshair a heavy boost in a random direction.</t><br/><br/><t>[Default Keybind: F]</t><br/><t>[Default Discard Keybind: C]</t>";
	uiSleep 20;
};
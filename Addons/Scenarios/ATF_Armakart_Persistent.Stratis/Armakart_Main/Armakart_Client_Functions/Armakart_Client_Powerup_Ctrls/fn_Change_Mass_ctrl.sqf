/*
	Author: Njpatman

	Description:
		Change Mass powerup, life is a smaller lie
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
_Initial_hint_local = Initial_hint;
["Armakart", "MyKey", "Powerup Action", {
	_Search_Array = nearestObjects [getPos cursorTarget, ["Car", "Truck"], 35];

	if (_Search_Array isEqualTo []) then {

		_Pos_AGl = screenToWorld [0.5,0.5];

		_Search_Array = nearestObjects [_Pos_AGl, ["Car", "Truck"], 35];

	};
	[_Search_Array, player] remoteExec ["NJP_Server_Powerup_Fnc_Change_Mass", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	_Search_Array = nearestObjects [getPos cursorTarget, ["Car", "Truck"], 35];

	if (_Search_Array isEqualTo []) then {

		_Pos_AGl = screenToWorld [0.5,0.5];

		_Search_Array = nearestObjects [_Pos_AGl, ["Car", "Truck"], 35];

	};
	[_Search_Array, player] remoteExec ["NJP_Server_Powerup_Fnc_Change_Mass", 2];
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
	hintsilent parseText "<t color='#5c8694'>Change Mass acquired!</t><br/><br/><t>Change Mass Status:  </t><t color='#45f442'>Ready To Change Some Mass</t><br/><br/><t>The Change Mass powerup will briefly change the mass of the vehicle under your crosshair to 10000kg, then we let PhysX take the wheel.</t><br/><br/><t>[Default Keybind: F]</t><br/><t>[Default Discard Keybind: C]</t>";
	uiSleep 20;
};
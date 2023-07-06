/*
	Author: Njpatman

	Description:
		Bomb powerup, spawns a bomb at the front of the kart and tracks the center of the players screen right before launch
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
_Initial_hint_local = Initial_hint;
["Armakart", "MyKey", "Powerup Action", {
	[player] remoteExec ["NJP_Server_Powerup_Fnc_Bomb", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	[player] remoteExec ["NJP_Server_Powerup_Fnc_Bomb", 2];
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
	hintsilent parseText "<t color='#808080'>Bomb acquired!</t><br/><br/><t>Bomb Status:  </t><t color='#45f442'>Ready To Fire</t><br/><br/><t>The Bomb powerup spawns a 250lb bomb that is slaved to the crosshair, keep in mind the bomb will stop tracking just before launch.</t><br/><br/><t>[Default Keybind: F]</t><br/><t>[Default Discard Keybind: C]</t>";
	uiSleep 20;
};
/*
	Author: Njpatman

	Description:
		Boost powerup, gives players a speed boost
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
_Initial_hint_local = Initial_hint;
["Armakart", "MyKey", "Powerup Action", {
	[player] remoteExec ["NJP_Server_Powerup_Fnc_Boost", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	[player] remoteExec ["NJP_Server_Powerup_Fnc_Boost", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyDKey", "Discard Action", {
	[0, 0, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_C, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyDKeyButShift-er", "Discard Action", {
	[0, 0, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_C, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

playsound"hint";

while {Initial_hint isEqualTo _Initial_hint_local} do {
	hintsilent parseText "<t color='#731717'>Boost acquired!</t><br/><br/><t>Boost Status:  </t><t color='#45f442'>Ready To Boost</t><br/><br/><t>The Boost powerup will simply give you a speed boost.</t><br/><br/><t>[Default Keybind: F]</t><br/><t>[Default Discard Keybind: C]</t>";
	uiSleep 20;
};
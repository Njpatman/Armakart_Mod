/*
	Author: Njpatman

	Description:
		Kitchen Sink powerup, simply launches 2 invisible GBUs with a kitchen sink on top
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
_Initial_hint_local = Initial_hint;
["Armakart", "MyKey", "Powerup Action", {
	[player, true] remoteExec ["NJP_Server_Powerup_Fnc_Kitchen_sink", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	[player, true] remoteExec ["NJP_Server_Powerup_Fnc_Kitchen_sink", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyRKey", "Powerup Action", {
	[player, false] remoteExec ["NJP_Server_Powerup_Fnc_Kitchen_sink", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_R, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyRKeyButShift-er", "Powerup Action", {
	[player, false] remoteExec ["NJP_Server_Powerup_Fnc_Kitchen_sink", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_R, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyDKey", "Discard Action", {
	[0, 0, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_C, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyDKeyButShift-er", "Discard Action", {
	[0, 0, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_C, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

playsound"hint";

while {Initial_hint isEqualTo _Initial_hint_local} do {
	hintsilent parseText "<t color='#e68f0e'>Kitchen Sink acquired!</t><br/><br/><t>Kitchen Sink Status:  </t><t color='#45f442'>Ready To Launch</t><br/><br/><t>The Kitchen Sink powerup spawns a kitchen sink that is launched to the front/back of your kart.</t><br/><br/><t>[Default Forward Keybind: F]</t><br/><t>[Default Backward Keybind: R]</t><br/><t>[Default Discard Keybind: C]</t>";
	uiSleep 20;
};
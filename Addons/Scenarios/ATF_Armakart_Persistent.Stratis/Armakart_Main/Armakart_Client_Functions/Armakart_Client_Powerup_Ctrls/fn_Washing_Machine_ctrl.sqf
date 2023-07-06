/*
	Author: Njpatman

	Description:
		Washing Machine powerup, simply launches a washing machine and spawns in 4 GBUs around it 
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
_Initial_hint_local = Initial_hint;
["Armakart", "MyKey", "Powerup Action", {
	[player, true] remoteExec ["NJP_Server_Powerup_Fnc_Washing_Machine", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	[player, true] remoteExec ["NJP_Server_Powerup_Fnc_Washing_Machine", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyRKey", "Powerup Action", {
	[player, false] remoteExec ["NJP_Server_Powerup_Fnc_Washing_Machine", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_R, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyRKeyButShift-er", "Powerup Action", {
	[player, false] remoteExec ["NJP_Server_Powerup_Fnc_Washing_Machine", 2];
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
	hintsilent parseText "<t color='#fc3903'>Washing Machine acquired!</t><br/><br/><t>Washing Machine Status:  </t><t color='#45f442'>Ready To Fire</t><br/><br/><t>The Washing Machine powerup spawns a washing machine that is launched to the front/back of your kart, and has a very powerful secondary cookoff after landing.</t><br/><br/><t>[Default Keybind: F]</t><br/><t>[Default Backward Keybind: R]</t><br/><t>[Default Discard Keybind: C]</t>";
	uiSleep 20;
};
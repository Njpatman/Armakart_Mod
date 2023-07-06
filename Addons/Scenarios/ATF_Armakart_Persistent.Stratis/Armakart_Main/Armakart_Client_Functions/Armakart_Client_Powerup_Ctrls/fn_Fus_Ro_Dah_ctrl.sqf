/*
	Author: Njpatman

	Description:
		Fus-Ro-Dah powerup, adds a trigger in front of the player and LAUNCHES whomever is in the trigger
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
_Initial_hint_local = Initial_hint;
["Armakart", "MyKey", "Powerup Action", {
	[player] remoteExec ["NJP_Server_Powerup_Fnc_Fus_Ro_Dah", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	[player] remoteExec ["NJP_Server_Powerup_Fnc_Fus_Ro_Dah", 2];
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
	hintsilent parseText "<t color='#11aed9'>Fus-Roh-Dah acquired!</t><br/><br/><t>Fus-Ro-Dah Status:  </t><t color='#45f442'>Ready To Fus-Ro-Dah</t><br/><br/><t>Fus-Ro-Dah LAUNCHES any player unlucky enough to be in front of your kart, keep in mind that there is a safe space of about a meter in front of your kart where someone may not be launched</t><br/><br/><t>[Default Keybind: F]</t><br/><t>[Default Discard Keybind: C]</t>";
	uiSleep 20;
};
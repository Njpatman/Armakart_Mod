/*
	Author: Njpatman

	Description:
		Banana powerup, pushes players back with a trigger and setvelocity
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
_Initial_hint_local = Initial_hint;
["Armakart", "MyKey", "Powerup Action", {
	_obj = [];
	_obj = nearestObjects [player, ["VR_3DSelector_01_complete_F"], 20];
	if (_obj isEqualTo []) then {
		[player, 3] remoteExec ["NJP_Server_Powerup_Fnc_Banana", 2];
		[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
	} else {
		hint parseText "<t>Powerup Status:  </t><t color='#ff0000'>You're too close to a Checkpoint! (Within 20m) You can still place the powerup</t>";
	};
}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	_obj = [];
	_obj = nearestObjects [player, ["VR_3DSelector_01_complete_F"], 20];
	if (_obj isEqualTo []) then {
		[player, 3] remoteExec ["NJP_Server_Powerup_Fnc_Banana", 2];
		[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
	} else {
		hint parseText "<t>Powerup Status:  </t><t color='#ff0000'>You're too close to a Checkpoint! (Within 20m) You can still place the powerup</t>";
	};
}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyDKey", "Discard Action", {
	[0, 0, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_C, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyDKeyButShift-er", "Discard Action", {
	[0, 0, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_C, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

playsound"hint";

while {Initial_hint isEqualTo _Initial_hint_local} do {
	hintsilent parseText "<t>Banana 3 Status:  </t><t color='#45f442'>Ready To Place</t><br/><br/><t>[Default Keybind: F]</t><br/><t>[Default Discard Keybind: C]</t>";
	uiSleep 10;
};
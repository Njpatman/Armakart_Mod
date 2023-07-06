/*
	Author: Njpatman

	Description:
		Bunny Mine powerup, Simply spawns a rabbit and attatches a large IED under it
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
_Initial_hint_local = Initial_hint;
["Armakart", "MyKey", "Powerup Action", {
	_obj = [];
	_obj = nearestObjects [player, ["VR_3DSelector_01_complete_F"], 20];
	if (_obj isEqualTo []) then {
		[player] remoteExec ["NJP_Server_Powerup_Fnc_Bunny_IED", 2];
		[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
	} else {
		hint parseText "<t>Powerup Status:  </t><t color='#ff0000'>You're too close to a Checkpoint! (Within 20m) You can still place the powerup</t>";
	};
}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	_obj = [];
	_obj = nearestObjects [player, ["VR_3DSelector_01_complete_F"], 20];
	if (_obj isEqualTo []) then {
		[player] remoteExec ["NJP_Server_Powerup_Fnc_Bunny_IED", 2];
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
	hintsilent parseText "<t color='#ff0d00'>Bunny Mine acquired!</t><br/><br/><t>Bunny Mine Status:  </t><t color='#45f442'>Ready To Deploy</t><br/><br/><t>The Bunny Mine is a VERY high explosive bunny that will launch anybody that drives over it too slowly.</t><br/><br/><t>[Default Keybind: F]</t><br/><t>[Default Discard Keybind: C]</t>";
	uiSleep 10;
};
/*
	Author: Njpatman

	Description:

*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
_Initial_hint_local = Initial_hint;
["Armakart", "MyKey", "Powerup Action", {
	if (Current_Checkpoint isEqualTo CP_NUM) exitwith {
		hint parseText "<t>Teleport Status:  </t><t color='#ff0000'>Unable To Teleport, Past Last Checkpoint</t>";
		[] spawn NJP_Client_Fnc_resetPowerup;
	};

	//Gets players next checkpoint
	Target_CP = Current_Checkpoint + 1;

	CP_Powerup_str = 'CP_Powerup_obj = CP_' + (str Target_CP);

	[] call compile CP_Powerup_str;

	[CP_Powerup_obj, player] remoteExec ["NJP_Server_Powerup_Fnc_CP_Tele", 2];
	[0, 0, false, false, true] call NJP_Client_Fnc_resetPowerup;
}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	if (Current_Checkpoint isEqualTo CP_NUM) exitwith {
		hint parseText "<t>Teleport Status:  </t><t color='#ff0000'>Unable To Teleport, Past Last Checkpoint</t>";
		[] spawn NJP_Client_Fnc_resetPowerup;
	};

	//Gets players next checkpoint
	Target_CP = Current_Checkpoint + 1;

	CP_Powerup_str = 'CP_Powerup_obj = CP_' + (str Target_CP);

	[] call compile CP_Powerup_str;

	[CP_Powerup_obj, player] remoteExec ["NJP_Server_Powerup_Fnc_CP_Tele", 2];
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
	hintsilent parseText "<t color='#cd7f32'>Checkpoint Teleport acquired!</t><br/><br/><t>Teleport Status:  </t><t color='#45f442'>Ready To Teleport</t><br/><br/><t>Simply teleports you to your next checkpoint. NOTE that you CANNOT teleport when you're past the last checkpoint.</t><br/><br/><t>[Default Keybind: F]</t><br/><t>[Default Discard Keybind: C]</t>";
	uiSleep 20;
};
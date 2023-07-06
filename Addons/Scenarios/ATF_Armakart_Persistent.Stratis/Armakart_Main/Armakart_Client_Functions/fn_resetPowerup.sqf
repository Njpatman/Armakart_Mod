#include "\a3\ui_f\hpp\defineDIKCodes.inc"

params [["_pwrupSleep", 0], ["_keySleep", 0], ["_discarded", false], ["_isIterative", false], ["_keyClear", false]];

["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
["Armakart", "MyRKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_R, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
["Armakart", "MyRKey", "Powerup Action", {""}, {""}, [DIK_R, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
["Armakart", "MyDKeyButShift-er", "Discard Action", {""}, {""}, [DIK_C, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
["Armakart", "MyDKey", "Discard Action", {""}, {""}, [DIK_C, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

if (_keyClear) exitWith {};

Initial_hint = Initial_hint + 1;

if (_discarded) then {
	hint parseText "<t>Powerup Status:  </t><t color='#ff0000'>Powerup Discarded!</t>";
};

if (_isIterative) exitWith {};

if (_pwrupSleep > 0) then {
	uiSleep _pwrupSleep;
};

"Crosshair_Layer" cutFadeOut 0.001;

No_item = true;
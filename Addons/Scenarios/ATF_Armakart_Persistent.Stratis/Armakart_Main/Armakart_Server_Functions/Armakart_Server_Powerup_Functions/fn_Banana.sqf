/*
	Author: Njpatman

	Description:
		Banana powerup, Simply spawns a banana and attaches a trigger to it
*/
params ["_Player", ["_BananaNum", 0]];

if (_BananaNum > 0 && !(_BananaNum isEqualTo 3)) then {
	[0.8, 0, false, true] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];
} else {
	[0.8, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];
};

uiSleep 0.05;

_banana = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
_banana attachTo [_Player, [0,-1.8,0.6]];
[_banana, 2.4] remoteExec ["setObjectScale",0,true];

_trgSpc = createTrigger ["EmptyDetector", [0,0,0]];
[_trgSpc, [1, 4, (getDir _Player), true, 2]] remoteExec ["setTriggerArea",0,true];
[_trgSpc, ["WEST", "PRESENT", false]] remoteExec ["setTriggerActivation",0,true];\
[_trgSpc, ["vehicle player in thislist", 
"

	_vehicle=vehicle player;
	_vel = velocity _vehicle;
	_dir = direction _vehicle;
	_speed = -30;
	_vehicle setVelocity [
		(_vel select 0) + (sin _dir * _speed), 
		(_vel select 1) + (cos _dir * _speed), 
		(_vel select 2)
	];
	_banana = getPosASL thistrigger nearestObject 'ACE_bananaItem';
	deleteVehicle _banana;
	deleteVehicle thistrigger;

", ""]
] remoteExec ["setTriggerStatements",0,true];
[_trgSpc, 0.25] remoteExec ["setTriggerInterval", 0,true];

if (_BananaNum > 0) then {
	[parseText format ["<t>Banana %1 Status:  </t><t color='#eef441'>Placing...</t>", _BananaNum]] remoteExec ["hintSilent", _Player];
} else {
	[parseText "<t>Banana Status:  </t><t color='#eef441'>Placing...</t>"] remoteExec ["hintSilent", _Player];
};

uiSleep 0.5;

detach _banana;

uiSleep 0.25;

_trgSpc attachTo [_banana, [0,0,0]];

detach _trgSpc;

if (_BananaNum > 0) then {
	[parseText format ["<t>Banana %1 Status:  </t><t color='#ff0000'>Banana Placed!</t>", _BananaNum]] remoteExec ["hint", _Player];
	switch (_BananaNum) do {
		case 1: { [] remoteExec ["NJP_Client_Powerup_Fnc_Triple_Banana_ctrl_2", _Player]; };
		case 2: { [] remoteExec ["NJP_Client_Powerup_Fnc_Triple_Banana_ctrl_3", _Player]; };
	};
} else {
	[parseText "<t>Banana Status:  </t><t color='#ff0000'>Banana Placed!</t>"] remoteExec ["hint", _Player];
};
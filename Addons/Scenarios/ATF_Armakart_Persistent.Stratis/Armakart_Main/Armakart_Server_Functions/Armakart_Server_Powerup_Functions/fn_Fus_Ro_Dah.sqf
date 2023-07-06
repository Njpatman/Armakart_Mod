/*
	Author: Njpatman

	Description:
		Fus-Ro-Dah powerup, adds a trigger in front of the player and LAUNCHES whomever is in the trigger
*/
params ["_Player"];

[0.45, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

[parseText "<t>Fus-Ro-Dah Status:  </t><t color='#eef441'>Yelling Very Loudly..</t>"] remoteExec ["hintSilent", _Player];

_Mark = createVehicle ["Sign_Sphere10cm_F", [0,0,0], [], 0, "NONE"];
hideObjectGlobal _Mark;

_Scream_obj = createVehicle ["Land_Battery_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_Scream_obj attachTo [vehicle _Player, [0,0,0.35]];
_Scream_obj setMass 4;
playSound "FusRoDah";
[_Player,["FusRoDah",125]] remoteExec ["say3d", -2, false];

uiSleep 0.4;

detach _Scream_obj;
_Mark attachTo [vehicle _Player, [0, 15, 0]];

[_Scream_obj, _Player] remoteexeccall ["NJP_Server_Powerup_Effect_Fnc_FusRoDah_Effect", 0];

_trgSpc = createTrigger ["EmptyDetector", getPosATL _Player];
[_trgSpc, [3.2, 13.2, (getDir _Player), true, 6]] remoteExec ["setTriggerArea", 0, true];
_trgSpc attachTo [_Mark, [0, 0, 0]];

[_trgSpc, ["WEST", "PRESENT", false]] remoteExec ["setTriggerActivation", 0, true];
[_trgSpc, ["vehicle player in thislist", 
"
	_vehicle = vehicle player;
	_vel = velocity _vehicle;
	_dir = direction _vehicle;
	_speed = 225;
	_vehicle setVelocity [
	(_vel select 0) + (sin _dir * _speed), 
	(_vel select 1) + (cos _dir * _speed), 
	100
	];
	playSound 'FusRoDah';
", ""]
] remoteExec ["setTriggerStatements", 0, true];

[parseText "<t>Fus-Ro-Dah Status:  </t><t color='#ff0000'>Fus-Ro-Dah Complete!</t>"] remoteExec ["hint", _Player];

uiSleep 0.8;

deleteVehicle _trgSpc;
deleteVehicle _Mark;
deleteVehicle _Scream_obj;
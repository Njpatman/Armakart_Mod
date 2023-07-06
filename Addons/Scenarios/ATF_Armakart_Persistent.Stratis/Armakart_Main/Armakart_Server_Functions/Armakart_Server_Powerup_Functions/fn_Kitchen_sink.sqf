/*
	Author: Njpatman

	Description:
		Kitchen Sink powerup, simply launches 2 invisible GBUs with a kitchen sink on top
*/

params ["_Player", ["_isFrontFiring", true]];

[1.55, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

if (_isFrontFiring) then {
	[parseText "<t>Kitchen Sink Status:  </t><t color='#eef441'>Launching Forwards...</t>"] remoteExec ["hintSilent", _Player];
} else {
	[parseText "<t>Kitchen Sink Status:  </t><t color='#eef441'>Launching Backwards...</t>"] remoteExec ["hintSilent", _Player];
};

_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;
_bomb_2 = "Bomb_03_F" createvehicle position Powerup_Spawn;
_sink = "CUP_sink" createvehicle position Powerup_Spawn;

_smoke_1 = "SmokeShellYellow" createVehicle position Powerup_Spawn;
_smoke_1 attachTo [_sink, [0,0,0]];

_bomb attachTo [vehicle _Player, [1,1,0.05]];
_bomb_2 attachTo [_sink, [0,0.5,0]];
_sink attachTo [_bomb, [0,0.5,0]];
hideObjectGlobal _bomb;
hideObjectGlobal _bomb_2;
_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];

sleep 1.5;

_vehicle = _bomb; 
_vel = velocity _vehicle;
_speed = 185;
["toss"] remoteExec ["playsound", _Player];
detach _bomb;
_dir = direction _vehicle;

if (_isFrontFiring) then {
	_vehicle setVelocity [
		(_vel select 0) + (sin _dir * _speed), 
		(_vel select 1) + (cos _dir * _speed),
		(_vel select 2)
	];
} else {
	_vehicle setVelocity [
		(_vel select 0) + (sin (_dir - 180) * _speed), 
		(_vel select 1) + (cos (_dir - 180) * _speed),
		(_vel select 2)
	];
};

[parseText "<t>Kitchen Sink Status:  </t><t color='#ff0000'>Launched!</t>"] remoteExec ["hintSilent", _Player];

sleep 4.5;

deleteVehicle _sink;
deleteVehicle _smoke_1;
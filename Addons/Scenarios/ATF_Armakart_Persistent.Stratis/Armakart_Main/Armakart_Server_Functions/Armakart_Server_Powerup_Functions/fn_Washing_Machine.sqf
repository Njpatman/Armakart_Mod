/*
	Author: Njpatman

	Description:
		Washing Machine powerup, simply launches a washing machine and spawns in 4 GBUs around it 
*/

params ["_Player", ["_isFrontFiring", true]];

[1.55, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

if (_isFrontFiring) then {
	[parseText "<t>Washing Machine Status:  </t><t color='#eef441'>Launching Forwards...</t>"] remoteExec ["hintSilent", _Player];
} else {
	[parseText "<t>Washing Machine Status:  </t><t color='#eef441'>Launching Backwards...</t>"] remoteExec ["hintSilent", _Player];
};

_bomb = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
_WM = "CUP_washing_machine" createvehicle position Powerup_Spawn;
_WM allowDamage false;

_smoke_1 = "SmokeShellRed" createVehicle position Powerup_Spawn;
_smoke_1 attachTo [_WM, [0,0,0.5]];

_bomb attachTo [vehicle _Player, [1,1,0.1]];
_WM attachTo [_bomb, [0,0.5,0]];
_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
_bomb hideObjectGlobal true;

uiSleep 1.5;

[parseText "<t>Washing Machine Status:  </t><t color='#ff0000'>Washing Machine Launched!</t>"] remoteExec ["hint", _Player];

_vehicle = _bomb; 
_vel = velocity _vehicle;
_speed = 85;
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

_i = 0;

uiSleep 6;

while {_i <= 4} do {

	_i = _i + 1;

	_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;

	_x_ = random 6;
	_y_ = random 6;
	_z_ = random 4;

	_bomb attachTo [_WM, [_x_,_y_,_z_]];
	_bomb setVelocity [0,0,0];
	detach _bomb;
	
	uiSleep 1;

};

deleteVehicle _WM;
deleteVehicle _smoke_1;
/*
	Author: Njpatman

	Description:
		Bomb powerup, spawns a bomb at the front of the kart and tracks the center of the players screen right before launch
*/

params ["_Player", ["_isFiringFront", true]];

[2.15, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

if (_isFrontFiring) then {
	[parseText "<t>Miller Status:  </t><t color='#eef441'>Miller Tracking Forwards...</t>"] remoteExec ["hintSilent", _Player];
} else {
	[parseText "<t>Miller Status:  </t><t color='#eef441'>Miller Tracking Backwards...</t>"] remoteExec ["hintSilent", _Player];
};

_group = createGroup CIVILIAN;
_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;
hideObjectGlobal _bomb;
_Miller = _group createUnit ["B_CTRG_Miller_F", position Powerup_Spawn, [], 0, "FORM"];

_smoke_1 = "SmokeShellGreen" createVehicle position Powerup_Spawn;
_smoke_1 attachTo [_Miller, [0,0,0]];

_Miller_Look_Obj = "Sign_Sphere10cm_F" createvehicle position Powerup_Spawn;
_Miller_Look_Obj attachTo [vehicle _Player, [0, 25,0.1]];
hideObjectGlobal _Miller_Look_Obj;

_bomb attachTo [vehicle _Player, [1,1,0]];
_Miller attachTo [_bomb, [0,-0.5,0]];
_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
_Dir = getdir vehicle _Player;
[_Miller, "TransAnimBase"] remoteExec ["switchMove",0,true];

uiSleep 2;
_Search_Array = nearestObjects [getPos _Miller_Look_Obj, ["Car", "Truck"], 20];
_kart = _Search_Array select 0;
uiSleep 0.1;

[parseText "<t>Miller Status:  </t><t color='#ff0000'>Miller Launched!</t>"] remoteExec ["hint", _Player];

if (_Search_Array isEqualTo []) then {
	_vehicle = _bomb; 
	_vel = velocity _vehicle;
	_dir = direction _vehicle;
	_speed = 175;
	["toss"] remoteExec ["playsound", _Player];
	detach _bomb;
	if (_isFiringFront) then {
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
} else {
	_vel = velocity _bomb;
	_speed = 175;
	["toss"] remoteExec ["playsound", _Player];
	detach _bomb;
	_dir_target = [_bomb, _kart] call BIS_fnc_dirTo;
	_bomb setDir _dir_target;
	_bomb setVelocity [
		(_vel select 0) + (sin _dir_target * _speed), 
		(_vel select 1) + (cos _dir_target * _speed),
		(_vel select 2)
	];
};
uiSleep 1.2;
deleteVehicle _Miller;
deleteVehicle _Miller_Look_Obj;
deleteVehicle _smoke_1;
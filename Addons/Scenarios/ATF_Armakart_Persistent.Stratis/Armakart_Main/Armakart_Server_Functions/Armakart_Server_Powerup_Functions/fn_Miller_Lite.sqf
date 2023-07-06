/*
	Author: Njpatman

	Description:
		Bomb powerup, spawns a bomb at the front of the kart and tracks the center of the players screen right before launch
*/

params ["_Player"];

[2.15, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

[parseText "<t>>Miller Lite Status:  </t><t color='#eef441'>Miller Lite Launching...</t>"] remoteExec ["hintSilent", _Player];

_Miller_group = createGroup CIVILIAN;
_bomb = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
_Miller_Lite = _Miller_group createUnit ["B_CTRG_Miller_F", position Powerup_Spawn, [], 0, "FORM"];
[_Miller_Lite, "TransAnimBase"] remoteExec ["switchMove",0,true];
[_Miller_Lite, false] remoteExec ["enableSimulationGlobal",0,true];

_spark = "#particlesource" createVehicle (getPosASL _Miller_Lite);

[_spark, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
[_spark, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
[_spark, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _Miller_Lite]] remoteExec ["setParticleParams",0,true];
[_spark, 0.005] remoteExec ["setDropInterval",0,true];

_Miller_Lite_Look_Obj = "Sign_Sphere10cm_F" createvehicle position Powerup_Spawn;
_Miller_Lite_Look_Obj attachTo [vehicle _Player, [0,55,0.1]];
hideObjectGlobal _Miller_Lite_Look_Obj;

_bomb attachTo [vehicle _Player, [1,1,0]];
_Miller_Lite attachTo [_bomb, [0,0,0]];
_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
_Dir = getdir vehicle _Player;
hideObjectGlobal _bomb;
[_Miller_Lite, 0.45] remoteExec ["setObjectScale",0,true];

uiSleep 2;
_Search_Array = nearestObjects [getPos _Miller_Lite_Look_Obj, ["Car", "Truck"], 50];
_kart = _Search_Array select 0;
uiSleep 0.1;

[parseText "<t>Miller Lite Status:  </t><t color='#ff0000'>Miller Lite Launched!</t>"] remoteExec ["hint", _Player];

if (_Search_Array isEqualTo []) then {
	_vehicle = _bomb; 
	_vel = velocity _vehicle;
	_dir = direction _vehicle;
	_speed = 125;
	["toss"] remoteExec ["playsound", _Player];
	detach _bomb;
	_vehicle setVelocity [
		(_vel select 0) + (sin _dir * _speed), 
		(_vel select 1) + (cos _dir * _speed), 
		(_vel select 2) + 6.5
	];
} else {
	_vel = velocity _bomb;
	_speed = 125;
	["toss"] remoteExec ["playsound", _Player];
	detach _bomb;
	_dir_target = [_bomb, _kart] call BIS_fnc_dirTo;
	_bomb setDir _dir_target;
	_bomb setVelocity [
		(_vel select 0) + (sin _dir_target * _speed), 
		(_vel select 1) + (cos _dir_target * _speed),
		(_vel select 2) + 6.5
	];
};

uiSleep 0.05;
deleteVehicle _Miller_Lite_Look_Obj;
_Search_Array = nearestObjects [getPos _Miller_Lite, ["Car", "Truck"], 50];
"Crosshair_Layer" cutFadeOut 0.001;

if (_Search_Array isEqualTo []) exitWith {
	deleteGroup _Miller_group;
	deleteVehicle _Miller_Lite;
	deleteVehicle _spark;
};

_Attacker_Name = name _Player;

{
	_Kart = _x;
	if !(_Kart isEqualTo vehicle _Player) then {
		[_Attacker_Name] remoteExec ["NJP_Server_Powerup_Effect_Fnc_Lightning_Effect", _kart];
	};
} forEach _Search_Array;

uiSleep 4.5;
deleteGroup _Miller_group;
deleteVehicle _Miller_Lite;
deleteVehicle _spark;
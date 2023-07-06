/*
	Author: Njpatman

	Description:
		Bomb powerup, spawns a bomb at the front of the kart and tracks the center of the players screen right before launch
*/

params ["_Player", ["_bombNum", 0]];

if (_bombNum > 0 && !(_bombNum isEqualTo 3)) then {
	[1.35, 0, false, true] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];
} else {
	[1.35, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];
};


uiSleep 0.05;

if (_bombNum > 0) then {
	[parseText format ["<t>Bomb %1 Status:  </t><t color='#eef441'>Tracking...</t>", _bombNum]] remoteExec ["hintSilent", _Player];
} else {
	[parseText "<t>Bomb Status:  </t><t color='#eef441'>Tracking...</t>"] remoteExec ["hintSilent", _Player];
};

_bomb = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;

_bomb attachTo [vehicle _Player, [0,1.5,0]];
_Player setVariable ["BOMB_PREP", true, true];


[[_bomb], {
	params ["_bomb"];
	player getVariable ["BOMB_PREP", false];
	while {player getVariable ["BOMB_PREP", true]} do {
		_Dir = getdir vehicle player;
		_Aim = screenToWorld [0.5,0.5];
		_dir_target = [_bomb, _Aim] call BIS_fnc_dirTo;
		_bomb setDir (_dir_target - _Dir);
		uiSleep 0.06;
	};
}] remoteExec ["Spawn", _Player, false];

uiSleep 1.6;
_Player setVariable ["BOMB_PREP", false, true];

if (_bombNum > 0) then {
	[parseText format ["<t>Bomb %1 Status:  </t><t color='#eef441'>Tracking Complete, Firing..</t>", _bombNum]] remoteExec ["hintSilent", _Player];
} else {
	[parseText "<t>Bomb Status:  </t><t color='#eef441'>Tracking Complete, Firing..</t>"] remoteExec ["hintSilent", _Player];
};

uiSleep 0.4;

[[_bomb], {
	params ["_bomb"];
	_vel = velocity _bomb;
	_speed = 250;
	playSound "toss";
	detach _bomb;
	_dir = screenToWorld [0.5,0.5];
	_dir_target = [_bomb, _dir] call BIS_fnc_dirTo;
	_bomb setVelocity [
		(_vel select 0) + (sin _dir_target * _speed), 
		(_vel select 1) + (cos _dir_target * _speed),
		(_vel select 2)
	];
}] remoteExec ["Spawn", _Player, false];

if (_bombNum > 0) then {
	[parseText format ["<t>Bomb %1 Status:  </t><t color='#ff0000'>Bomb Fired!</t>", _bombNum]] remoteExec ["hint", _Player];
} else {
	[parseText "<t>Bomb Status:  </t><t color='#ff0000'>Bomb Fired!</t>"] remoteExec ["hint", _Player];
};
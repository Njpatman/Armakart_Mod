/*
	Author: Njpatman

	Description:
		triple bomb powerup
*/

params ["_Player"];

[1.35, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

[parseText "<t>Triple Bomb Status:  </t><t color='#eef441'>Tracking...</t>"] remoteExec ["hintSilent", _Player];

_bomb = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
_bomb_1 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
_bomb_2 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;

_bomb attachTo [vehicle _Player, [0,1.5,0]];
_bomb_1 attachTo [vehicle _Player, [1,1.5,0]];
_bomb_2 attachTo [vehicle _Player, [-1,1.5,0]];
_Player setVariable ["BOMB_PREP", true, true];

[[_bomb, _bomb_1, _bomb_2], {
	params ["_bomb", "_bomb_1", "_bomb_2"];
	player getVariable ["BOMB_PREP", false];
	while {player getVariable ["BOMB_PREP", true]} do {
		{
			_Dir = getdir vehicle player;
			_Aim = screenToWorld [0.5,0.5];
			_dir_target = [_x, _Aim] call BIS_fnc_dirTo;
			_x setDir (_dir_target - _Dir);
			uiSleep 0.16;
		} forEach [_bomb, _bomb_1, _bomb_2];
	};
}] remoteExec ["Spawn", _Player, false];

uiSleep 1.6;
_Player setVariable ["BOMB_PREP", false, true];

[parseText "<t>Triple Bomb Status:  </t><t color='#eef441'>Tracking Complete, Firing..</t>"] remoteExec ["hintSilent", _Player];

uiSleep 0.4;

[parseText "<t>Triple Bomb Status:  </t><t color='#ff0000'>Bomb Fired!</t>"] remoteExec ["hint", _Player];

[[_bomb, _bomb_1, _bomb_2], {
	params ["_bomb", "_bomb_1", "_bomb_2"];
	{
		_vel = velocity _x;
		_speed = 250;
		playSound "toss";
		detach _x;
		_dir = screenToWorld [0.5,0.5];
		_dir_target = [_x, _dir] call BIS_fnc_dirTo;
		_x setVelocity [
			(_vel select 0) + (sin _dir_target * _speed), 
			(_vel select 1) + (cos _dir_target * _speed),
			(_vel select 2)
		];
		uiSleep 0.2;
	} forEach [_bomb, _bomb_1, _bomb_2];
}] remoteExec ["Spawn", _Player, false];

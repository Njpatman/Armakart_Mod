/*
	Author: Njpatman

	Description:
		Boost powerup, gives players a speed boost
*/

params ["_Player", ["_boostNum", 0]];

if (_boostNum > 0 && !(_boostNum isEqualTo 3)) then {
	[0.05, 0, false, true] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];
} else {
	[0.05, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];
};

uiSleep 0.05;

if (_boostNum > 0) then {
	[parseText format ["<t>Boost %1 Status:  </t><t color='#eef441'>Boosting...</t>", _boostNum]] remoteExec ["hintSilent", _Player];
} else {
	[parseText "<t>Boost Status:  </t><t color='#eef441'>Boosting...</t>"] remoteExec ["hintSilent", _Player];
};

_Kart = vehicle _Player;
_vel = velocity _Kart;
_dir = direction _Kart;
_speed = 15;
playsound"turbo";
[_Kart, [
	(_vel select 0) + (sin _dir * _speed), 
	(_vel select 1) + (cos _dir * _speed), 
	(_vel select 2)
]] remoteexec ["setVelocity", _Kart];

if (_boostNum > 0) then {
	[parseText format ["<t>Boost %1 Status:  </t><t color='#ff0000'>Boost Complete!</t>", _boostNum]] remoteExec ["hint", _Player];
	switch (_boostNum) do {
		case 1: { [] remoteExec ["NJP_Client_Powerup_Fnc_Triple_Boost_ctrl_2", _Player]; };
		case 2: { [] remoteExec ["NJP_Client_Powerup_Fnc_Triple_Boost_ctrl_3", _Player]; };
	};
} else {
	[parseText "<t>Boost Status:  </t><t color='#ff0000'>Boost Complete!</t>"] remoteExec ["hint", _Player];
};
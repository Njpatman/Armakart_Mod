/*
	Author: Njpatman

	Description:
		Involuntary Boost powerup, gives a player a Involuntary speed boost
*/

params ["_Search_Array", "_Player"];

[0.05, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

[parseText "<t>Involuntary Boost Status:  </t><t color='#eef441'>Involuntary Boost Boosting...</t>"] remoteExec ["hintSilent", _Player];

if (_Search_Array isEqualTo []) exitWith {
	[parseText "<t>Involuntary Boost Status:  </t><t color='#ff0000'>Involuntary Boost Stopped, No Kart Was Found In Range Of Where You Targeted!</t>"] remoteExec ["hint", _Player];
};

_Kart = _Search_Array select 0;

if (!(_kart isEqualTo vehicle _Player) && !isNull _kart) exitwith
{
	
	_Attacker_Name = name _Player;

	[_Attacker_Name, "Involuntary Boost"] remoteExec ["NJP_Server_Powerup_fnc_Tell_Victim_Attacker", _Kart];

	_vel = velocity _Kart;
	_dir = random 360;
	_speed = 48;
	["turbo"] remoteexec ["playsound", _Kart];
	[_Kart, [
		(_vel select 0) + (sin _dir * _speed), 
		(_vel select 1) + (cos _dir * _speed), 
		(_vel select 2)
	]] remoteexec ["setVelocity", _Kart];

	[parseText "<t>Involuntary Boost Status:  </t><t color='#ff0000'>Involuntary Boost Complete</t>"] remoteExec ["hint", _Player];

};

if (_kart isEqualTo vehicle _Player) then {
	[parseText "<t>Involuntary Boost Status:  </t><t color='#ff0000'>Involuntary Boost Stopped, Your Own Kart Was Targeted!</t>"] remoteExec ["hint", _Player];
};

/*
	Author: Njpatman

	Description:
		Lightning powerup, life is a lie
*/
params ["_Search_Array", "_Player"];

[0.05, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

[parseText "<t>Lightning Status:  </t><t color='#eef441'>Lightning Zapping...</t>"] remoteExec ["hintSilent", _Player];

if (_Search_Array isEqualTo []) exitWith {
	[parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Stopped, No Kart Was Found In Range Of Where You Targeted!</t>"] remoteExec ["hint", _Player];
};

_Kart = _Search_Array select 0;

if (!(_Kart isEqualTo vehicle _Player) && !isNull _Kart) exitWith 
{
	_Attacker_Name = name _Player;
	
	_group = createGroup CIVILIAN;

	_Zap = _group createUnit ["ModuleLightning_F",getPosASL _Kart, [], 0, "CAN_COLLIDE"];

	deleteGroup _group;

	[_Attacker_Name] remoteExec ["NJP_Server_Powerup_Effect_Fnc_Lightning_Effect", _kart];

	deleteVehicle _Zap;
	[parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Complete</t>"] remoteExec ["hint", _Player];
};

if (_kart isEqualTo vehicle _Player) then {
	[parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Stopped, Your Own Kart Was Targeted!</t>"] remoteExec ["hint", _Player];
};
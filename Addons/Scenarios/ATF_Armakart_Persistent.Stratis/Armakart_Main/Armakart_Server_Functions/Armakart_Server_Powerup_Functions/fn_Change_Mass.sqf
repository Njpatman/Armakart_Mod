/*
	Author: Njpatman

	Description:
		Change Mass powerup, life is a smaller lie
*/

params ["_Search_Array", "_Player"];

[0.05, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

[parseText "<t>Change Mass Status:  </t><t color='#eef441'>Change Mass Massing...</t>"] remoteExec ["hintSilent", _Player];

if (_Search_Array isEqualTo []) exitWith {
	[parseText "<t>Change Mass Status:  </t><t color='#ff0000'>Mass Change Stopped, No Kart Was Found In Range Of Where You Targeted!</t>"] remoteExec ["hint", _Player];
};

_Kart = _Search_Array select 0;

if (_kart isEqualTo vehicle _Player) exitWith {
	[parseText "<t>Change Mass Status:  </t><t color='#ff0000'>Mass Change Stopped, Your Own Kart Was Targeted!</t>"] remoteExec ["hint", _Player];
};

_Kart_array = fullCrew [_Kart, "driver", false];
_driver_array = _Kart_array select 0;
_driver = _driver_array select 0;

_Attacker_Name = name _Player;

[_Attacker_Name] remoteExec ["NJP_Server_Powerup_Effect_Fnc_Change_Mass_Effect", _driver];
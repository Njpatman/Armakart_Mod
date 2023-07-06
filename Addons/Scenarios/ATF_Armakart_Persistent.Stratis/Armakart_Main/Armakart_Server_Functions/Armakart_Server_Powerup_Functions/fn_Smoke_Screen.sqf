 /*
	Author: Njpatman

	Description:
		Smoke powerup, spawns vanilla smokes and attatches them to the players vic
*/

params ["_Player"];

[0.05, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

[parseText "<t>Smoke Status:  </t><t color='#eef441'>Smoke Deploying...</t>"] remoteExec ["hintSilent", _Player];

_smoke_shell_1 = selectRandom ["SmokeShell","SmokeShellRed","SmokeShellBlue","SmokeShellOrange","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple"];
_smoke_shell_2 = selectRandom ["SmokeShell","SmokeShellRed","SmokeShellBlue","SmokeShellOrange","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple"];

_smoke_1 = _smoke_shell_1 createVehicle position Powerup_Spawn;
_smoke_2 = _smoke_shell_2 createVehicle position Powerup_Spawn;
_smoke_3 = _smoke_shell_1 createVehicle position Powerup_Spawn;
_smoke_4 = _smoke_shell_2 createVehicle position Powerup_Spawn;
_smoke_5 = _smoke_shell_1 createVehicle position Powerup_Spawn;
_smoke_6 = _smoke_shell_2 createVehicle position Powerup_Spawn;

{_x attachto [vehicle _Player,[0.5,-0.5,-0.6]];} forEach [_smoke_1,_smoke_2];
{_x attachto [vehicle _Player,[-0.5,-0.5,-0.6]];} forEach [_smoke_3,_smoke_4];
{_x attachto [vehicle _Player,[0,-0.5,-0.4]];} forEach [_smoke_5,_smoke_6];

[parseText "<t>Smoke Status:  </t><t color='#ff0000'>Smoke Deployed</t>"] remoteExec ["hint", _Player];

uiSleep 18.5;

{deleteVehicle _x;} forEach [_smoke_1,_smoke_2,_smoke_3,_smoke_4,_smoke_5,_smoke_6];
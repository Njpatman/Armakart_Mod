/*
	Author: Njpatman

	Description:
		Bunny Mine powerup, Simply spawns a rabbit and attatches a large IED under it
*/

params ["_Player"];

[0.55, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

[parseText "<t>Bunny Mine Status:  </t><t color='#eef441'>Deploying...</t>"] remoteExec ["hintSilent", _Player];

_bomb = "ACE_IEDLandBig_Range_Ammo" createvehicle position Powerup_Spawn;
_Bunny = createVehicle ["Rabbit_F", [0,0,0], [], 0, "NONE"];

_Bunny attachTo [_Player, [0,-1.8,0.4]];
detach _Bunny;

_Bunny setVelocity [0,0,0];

uiSleep 0.5;

_bomb attachTo [_Bunny, [0,0,-0.15]];

[parseText "<t>Bunny Mine Status:  </t><t color='#ff0000'>Deployed!</t>"] remoteExec ["hint", _Player];
	
_i = 1;

while {alive _bomb} do {
_i = _i + 1;
	if (_i isEqualTo 125) then {
		_bomb setDamage 1;					
	};
	uiSleep 1;
};

deleteVehicle _bomb;
deleteVehicle _Bunny;
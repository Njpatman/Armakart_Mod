/*
	Author: Njpatman

	Description:
		Blue Shell powerup, meant to fuck up first place boi
*/

params ["_Player"];

[0.4, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

[parseText "<t>Blue Shell Status:  </t><t color='#eef441'>Launching...</t>"] remoteExec ["hintSilent", _Player];

_First_Boi_local_array_num = Places_Live findIf {(_x select 4) isEqualTo 1};
_First_Boi_local_array = Places_Live select _First_Boi_local_array_num;

if (isNil "_First_Boi_local_array") then { _First_Boi_local_array = Places_Live select 0; };

_First_Boi_UID = _First_Boi_local_array select 5;
_First_Boi = _First_Boi_UID call BIS_fnc_getUnitByUID;
_First_Boi_Vic = vehicle _First_Boi;

_First_Boi_Vic_Check_Obj = lineIntersectsSurfaces 
[
	[(getPosASL _First_Boi_Vic select 0), (getPosASL _First_Boi_Vic select 1), (getPosASL _First_Boi_Vic select 2) + 5], 
	[(getPosASL _First_Boi_Vic select 0), (getPosASL _First_Boi_Vic select 1), (getPosASL _First_Boi_Vic select 2) + 500], 
	objNull, 
	objNull, 
	true, 
	1, 
	"GEOM", 
	"PHYSX"
];

if (_First_Boi_Vic_Check_Obj isEqualTo []) exitWith {

	_First_Boi_Vic_pos_x = getPosASL _First_Boi_Vic select 0;
	_First_Boi_Vic_pos_y = getPosASL _First_Boi_Vic select 1;
	_First_Boi_Vic_pos_z = getPosASL _First_Boi_Vic select 2;
	_First_Boi_Vic_pos_z = _First_Boi_Vic_pos_z + 485;

	_Speed = 100;

	_x_pos = random 2;
	_y_pos = random 2;

	[[_First_Boi_Vic_pos_x, _First_Boi_Vic_pos_y, _First_Boi_Vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_Vic, _Speed, false, [_x_pos,_y_pos,1]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

	uiSleep 0.35;

	_x_pos = random 2;
	_y_pos = random 2;

	[[_First_Boi_Vic_pos_x, _First_Boi_Vic_pos_y, _First_Boi_Vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_Vic, _Speed, false, [_x_pos,_y_pos,1]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

	[format ["|Armakart System| : A Blue Shell has been launched by %1 against %2!", name _Player, name _First_Boi]] remoteExec ["systemChat", 0];

	[parseText "<t>Blue Shell Status:  </t><t color='#ff0000'>Blue Shell Launched!</t>"] remoteExec ["hintSilent", _Player];
	
};

_First_Boi_Vic_Check_Obj_Intersect_Array = _First_Boi_Vic_Check_Obj select 0;
_First_Boi_Vic_Check_Obj_Intersect = _First_Boi_Vic_Check_Obj_Intersect_Array select 0;

_First_Boi_Vic_pos_x = _First_Boi_Vic_Check_Obj_Intersect select 0;
_First_Boi_Vic_pos_y = _First_Boi_Vic_Check_Obj_Intersect select 1;
_First_Boi_Vic_pos_z = _First_Boi_Vic_Check_Obj_Intersect select 2;
_First_Boi_Vic_pos_z = _First_Boi_Vic_pos_z - 6.5;

_Speed = 65;		

_x_pos = random 2;
_y_pos = random 2;

[[_First_Boi_Vic_pos_x, _First_Boi_Vic_pos_y, _First_Boi_Vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_Vic, _Speed, false, [_x_pos,_y_pos,1]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

uiSleep 0.35;

_x_pos = random 2;
_y_pos = random 2;

[[_First_Boi_Vic_pos_x, _First_Boi_Vic_pos_y, _First_Boi_Vic_pos_z], "ammo_Missile_Cruise_01", _First_Boi_Vic, _Speed, false, [_x_pos,_y_pos,1]] remoteExec ["BIS_fnc_exp_camp_guidedProjectile", 2];

[format ["|Armakart System| : A Blue Shell has been launched by %1 against %2!", name _Player, name _First_Boi]] remoteExec ["systemChat", 0];

[parseText "<t>Blue Shell Status:  </t><t color='#ff0000'>Blue Shell Launched!</t>"] remoteExec ["hintSilent", _Player];
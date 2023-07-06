Params ["_player","_trigger"];

[_player, ["teleport", 650]] remoteExec ["say3D", 0, false];
playSound "teleport";

_Sub_CP = getPos _trigger nearestObject 'Sign_Arrow_Large_Cyan_F';
	
_Sub_CP_Name_str = vehicleVarName _Sub_CP;

_Sub_CP_Num_str = _Sub_CP_Name_str select[7];

_Sub_CP_Num_Add_str = '_Next_Sub_CP_Num_Tele_script = 1 + ' + (_Sub_CP_Num_str) +'; _Next_Sub_CP_Num_Tele_script';

_Next_Sub_CP_Num_Tele = [] call compile _Sub_CP_Num_Add_str;

_Sub_CP_str = '_Sub_CP_obj_Tele_script = Sub_CP_' + (str _Next_Sub_CP_Num_Tele)  +'; _Sub_CP_obj_Tele_script';

_Sub_CP_obj_Tele = [] call compile _Sub_CP_str;

/*
[[], {
	if (isServer) exitWith {};
	_puddle_leak = "Land_Puddle_01_F" createVehiclelocal (getposasl vehicle player);
	_puddle_leak setPosasl (getposasl vehicle player);
	_puddle_leak setDir 90;

	//stropi jos
	_stropi = "#particlesource" createVehicleLocal (getPos _puddle_leak);
	_stropi setParticleCircle [0.05, [0, 0, 0]];
	_stropi setParticleRandom [1,[0.1,0.1,0],[1,1,0.5],0,0.01,[0,0,0,1],1,0];
	_stropi setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,16,0], "", "Billboard", 1, 0.5, [0,0,0],[0,0,0.7],0,15,7.9,0.0001,[0.12,0.12],[[0.5,0.5,0.6,0.5],[0.5,0.5,0.6,0.5]],[1000],1,0, "", "", _puddle_leak, 90];
	_stropi setDropInterval 0.05;

	//splash jos
	_splash_wave = "#particlesource" createVehicleLocal (getPos _puddle_leak);
	_splash_wave setParticleCircle [0,[0,0,0]];
	_splash_wave setParticleRandom [0.1,[0.3,0.3,0],[0,0,0],0,0.5,[0,0,0,0.1],0.5,0];
	_splash_wave setParticleParams [["\A3\data_f\ParticleEffects\Universal\UniversalOnSurface.p3d",16,15,15,1],"", "Billboard",1,1,[0,0,0],[0,0,0],0,10,7.9,0,[3,4],[[.05,.05,0.07,0.3],[.05,.05,0.07,0]],[1],1,0,"","",_puddle_leak, 90];
	_splash_wave setDropInterval 0.1;

	_impact = "#particlesource" createVehicleLocal (getPos _puddle_leak);
	_impact setParticleCircle [0, [0, 0, 0]];
	_impact setParticleRandom [0,[0.03,0.03,0],[0,0,0],0,0.1,[0,0,0,0.5],0,0];
	_impact setParticleParams [["\A3\data_f\ParticleEffects\Universal\UniversalOnSurface.p3d",16,13,7,0], "", "Billboard", 1, 0.5, [0,0,0],[0,0,0],0,10,7.9,0,[1.2,2],[[0.5,0.5,0.5,0.5],[0.05,0.05,0.05,0]],[1000],1,0,"","",_puddle_leak, 90];
	_impact setDropInterval 0.1;

	_drop_up = "#particlesource" createVehicleLocal (getPos _puddle_leak);
	_drop_up setParticleCircle [0,[0,0,0]];
	_drop_up setParticleRandom [0.1,[0.03,0.03,0],[0,0,0],0,0.1,[0,0,0,0.5],0,0];
	_drop_up setParticleParams [["\A3\Data_F_Mark\ParticleEffects\Universal\waterBallonExplode_01",4,0,16,0],"","Billboard",1,0.3,[0,0,0],[0,0,0],0,10.15,7.9,0,[3.4,6.4],[[0.8,0.8,1,1],[0.8,0.8,1,0.5]],[5],1,0,"","",_puddle_leak, 90,true];
	_drop_up setDropInterval 0.2;

	//splash jos
	_splash_r = "#particlesource" createVehicleLocal (getPos _puddle_leak);
	_splash_r setParticleCircle [0,[0, 0, 0]];
	_splash_r setParticleRandom [0,[0.01,0.01,-0.1],[0,0,0],0,0.3,[0,0,0,0.5],0,0];
	_splash_r setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 0.3, [0,0,-0.2],[0,0,1], 3, 13, 7.9, 0.0001, [2,4],[[1,1,1,0.5],[1,1,1,0.5]], [0.08], 1, 0, "", "", _puddle_leak, 90];
	_splash_r setDropInterval 0.1;
	uiSleep 0.85;
	deletevehicle _puddle_leak;
	deletevehicle _stropi;
	deletevehicle _splash_wave;
	deletevehicle _impact;
	deletevehicle _drop_up;
	deletevehicle _splash_r;
}] remoteExec ["Spawn", 0];
*/

_dir = direction _Sub_CP_obj_Tele;
_veh = vehicle _player;
_veh_Check_Obj = lineIntersectsSurfaces 
[
	[(getPosASL _Sub_CP_obj_Tele select 0), (getPosASL _Sub_CP_obj_Tele select 1), (getPosASL _Sub_CP_obj_Tele select 2) + 5], 
	[(getPosASL _Sub_CP_obj_Tele select 0), (getPosASL _Sub_CP_obj_Tele select 1), (getPosASL _Sub_CP_obj_Tele select 2) - 25], 
	objNull, 
	objNull, 
	true, 
	1, 
	"GEOM", 
	"PHYSX"
];

_veh_Check_Obj_Intersect_Array = _veh_Check_Obj select 0;
_veh_Check_Obj_Intersect = _veh_Check_Obj_Intersect_Array select 0;

_veh_pos_x = _veh_Check_Obj_Intersect select 0;
_veh_pos_y = _veh_Check_Obj_Intersect select 1;
_veh_pos_z = _veh_Check_Obj_Intersect select 2;

_trkObj = nearestObject [_veh_Check_Obj_Intersect, "Land_BasaltWall_01_8m_F"];
_vUp = vectorUp _trkObj;
[_veh, ([_veh_pos_x, _veh_pos_y, _veh_pos_z + 1.45] vectorAdd ([[1.45,0,0.65], random 360] call BIS_fnc_rotateVector2D))] remoteExec ["setPosASL", _veh];
[_veh, _dir] remoteExec ["setDir", _veh];
[_veh, [(_vUp select 0), (_vUp select 1), (Starting_VectorUp select 2)]] remoteExec ["setVectorUp", _veh];
[_veh, [0,0,0]] remoteExec ["setVelocity", _veh];
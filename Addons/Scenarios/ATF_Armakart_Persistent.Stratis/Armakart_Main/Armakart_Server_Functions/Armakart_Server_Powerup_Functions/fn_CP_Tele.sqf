params ["_CP_Powerup_obj", "_Player"];

[2.55, 0] remoteExec ["NJP_Client_Fnc_resetPowerup", _Player];

uiSleep 0.05;

[parseText "<t>Teleport Status:  </t><t color='#eef441'>Teleporting...</t>"] remoteExec ["hintSilent", _Player];

_blur_sonic = "#particlesource" createVehicle (getPosATL vehicle _Player);
[_blur_sonic, [1, [0.65, 0.65, 2]]] remoteExec ["setParticleCircle", 0];
[_blur_sonic, [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0]] remoteExec ["setParticleRandom", 0];
[_blur_sonic, [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 4, [0, 0, 0], [0, 0, 0], 12, 12, 6, 0.002, [8, 8, 1], [[1, 1, 1, 0.5], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", vehicle _Player]] remoteExec ["setParticleParams", 0];
[_blur_sonic, 0.05] remoteExec ["setDropInterval", 0];

uiSleep 2.5;

_veh = vehicle _Player;

switch true do {
	case (Track_Title isEqualTo "Boat And Boogie" && !(_CP_Powerup_obj isEqualTo CP_4)): { 
		_lights = isLightOn _veh;
		_camo = getObjectTextures _veh;
		_pos = getPosASL _veh;
		deleteVehicle _veh;

		//create new vehicle	
		_newVic = "C_Scooter_Transport_01_F" createVehicle [0,0,0];
		_newVic setPosASL _pos;
		_newVic setPilotLight _lights;
		_newVic setObjectTextureGlobal [0, (_camo select 0)];
		uiSleep 0.05;

		_player moveInDriver _newVic;
	};
	default {
		if !(typeOf _veh isEqualTo "C_Quadbike_01_F") then {
			_lights = isLightOn _veh;
			_camo = getObjectTextures _veh;
			_pos = getPosASL _veh;
			deleteVehicle _veh;

			//create new vehicle	
			_newVic = "C_Quadbike_01_F" createVehicle [0,0,0];
			_newVic setPosASL _pos;
			_newVic setPilotLight _lights;
			_newVic setObjectTextureGlobal [0, (_camo select 0)];
			uiSleep 0.05;

			_Player moveInDriver _newVic;
		};
	};
};

//Teleports players in a randomly select position in a circle around the CP, as well as faces them the direction the CP is facing
vehicle _Player setPosASL ((getPosASL _CP_Powerup_obj) vectorAdd ([[(Reset_Diameter * 0.5),0,Reset_Height], random 360] call BIS_fnc_rotateVector2D));

//have to remoteExec for doubles
[vehicle _Player, (getDir _CP_Powerup_obj)] remoteExec ['setDir', vehicle _Player];
[vehicle _Player, (surfaceNormal position vehicle _Player)] remoteExec ['setVectorUp', vehicle _Player];

[parseText "<t>Teleport Status:  </t><t color='#ff0000'>Teleport Complete</t>"] remoteExec ["hintSilent", _Player];

uiSleep 1.6;

deleteVehicle _blur_sonic;
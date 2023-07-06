//Gets players checkpoint
CP_str = 'CP_obj = CP_' + (str Current_Checkpoint);

[] call compile CP_str;

_veh = vehicle player;

//Creates vehicle for player, if the idiot got out
if (isNull objectParent player) then
{
	switch true do {
		case (Track_Title isEqualTo 'Boat And Boogie' && !(CP_obj isEqualTo CP_4)): { 
			_veh = createVehicle ["C_Scooter_Transport_01_F", getPosASL player, [], 0, "NONE"];
			_veh setDamage 0;
			player allowDamage false;
			_veh allowDamage false;
			_veh engineOn true;
		};
		default {
			_veh = createVehicle ["C_Quadbike_01_F", getPosASL player, [], 0, "NONE"];
			_veh setDamage 0;
			player allowDamage false;
			_veh allowDamage false;
			_veh engineOn true;
		 };
	};
	uiSleep 0.1;
	player moveInDriver _veh;
	if (!isNil "Vehicle_Texture") then {vehicle player setObjectTextureGlobal [0, (Vehicle_Texture select 0)];};
	if (!isNil "Vehicle_Lights") then {vehicle player setPilotLight Vehicle_Lights;};
};

switch true do {
	case (Track_Title isEqualTo "Boat And Boogie" && !(CP_obj isEqualTo CP_4)): { 
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

		player moveInDriver _newVic;
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

			player moveInDriver _newVic;
		};
	};
};

uiSleep 0.05;

vehicle player setDamage 0;
player allowDamage false;
vehicle player allowDamage false;
vehicle player engineOn true;

//have to remoteExec for doubles
[vehicle player, (getDir CP_obj)] remoteExec ["setDir", vehicle player];
[vehicle player, (vectorUp CP_obj)] remoteExec ["setVectorUp", vehicle player];

//Teleports players in a randomly select position in a circle around the CP, as well as faces them the direction the CP is facing
vehicle player setPosASL ((getPosASL CP_obj) vectorAdd ([[(Reset_Diameter * 0.5),0,Reset_Height], random 360] call BIS_fnc_rotateVector2D));

uiNamespace getVariable "NJP_Block_Keys";
uiNamespace getVariable "NJP_Block_Keys_EH";

if (uiNamespace getVariable "NJP_Block_Keys" isEqualTo 1) then {

	uiNamespace setVariable ["NJP_Block_Keys", 0];

	systemChat "|Armakart System| : Movement input will be re-enabled in a couple seconds from reset!";

	uiSleep 2;
			
	([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", (uiNamespace getVariable "NJP_Block_Keys_EH")];
	uiNamespace setVariable ["NJP_Block_Keys_EH", nil];

	if (!isNil "Lightning_Particle_Effect") then {deleteVehicle Lightning_Particle_Effect;};

	[vehicle player,1] remoteexec ['setfuel', vehicle player, true];

	systemChat "|Armakart System| : Movement input re-enabled from reset!";

};
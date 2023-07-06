if (Is_Spectator) exitWith {};

if (RACE_PHASE isEqualTo "kartCustomization") then {

	//Creates Ace Self interact to reset the UI
	_Reset_Menu = ["Reset_Menu","<t color='#225985'>Reset Menu</t>","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
	{
		
		createDialog "Customization_Menu";

		_Customization_Menu_UI = findDisplay 1286;
		_UI_Display_1 = _Customization_Menu_UI displayCtrl 1060;
		_UI_Display_2 = _Customization_Menu_UI displayCtrl 1061;
		_UI_Display_3 = _Customization_Menu_UI displayCtrl 1062;

		{
			_x ctrlSetBackgroundColor UI_Color;
		} forEach [_UI_Display_1, _UI_Display_2, _UI_Display_3];

	},{true}] call ace_interact_menu_fnc_createAction;

	[player, 1, ["ACE_SelfActions"], _Reset_Menu] call ace_interact_menu_fnc_addActionToObject;

};

//- Handles the creation and orbiting of the Pre-race camera -\\

[vehicle player, false] remoteExec ["enableSimulationGlobal", 2];

//Sets player vic fuel to 0
vehicle player setFuel 0;

//Sets up local variables
Current_Lap = 1;
initial_Lap = true;
Current_Checkpoint = 1;
No_item = true;
UI_Color_int = [0,11] call BIS_fnc_randomInt;
UI_Color = [0.133,0.349,0.522,0.65];
Next_Sub_CP_Num = 0;
Loc_Array = [0, 0, 0, 0];
Player_Finished = false;
Current_Place = "N/A";
Lightning_Particle_Effect = false;
Initial_hint = 0;

uiNamespace setVariable ["NJP_Block_Keys", 0];
uiNamespace setVariable ["NJP_Block_Keys_EH", nil];

// Initialize new stat tracking hash map for player 
localPlayerUID = getPlayerUID player;
[0, 0, localPlayerUID, true] remoteExec ["NJP_Server_fnc_updateRaceHash", 2];

_garageObjects = nearestObjects [player, [], 4];
systemchat str _garageObjects;
_doesGarageExist = _garageObjects findIf {typeOf _x isEqualTo "Land_MobileLandingPlatform_01_F"};
if (_doesGarageExist isEqualTo -1) then {
	[ "Armakart_Obj_Garage", player, [0,0.5, -1.65], ((getDir player) - 122), false, false, true, true ] spawn LARs_fnc_spawnComp;
};

//Makes player/player vic invincible
player allowDamage false;
vehicle player allowDamage false;

waitUntil {time > 0};

_Angle_Player_cam = random 360;

_pos = vehicle player;
_pos_object = _pos;
_pos = [getPosATL _pos select 0, getPosATL _pos select 1, getPosATL _pos select 2];

_logic_pos = [(_pos select 0), (_pos select 1), (_pos select 2)];
_logic = "VR_3DSelector_01_default_F" createVehicleLocal _logic_pos;
_logic attachTo [_pos_object, [0, 0, 0.385]];
detach _logic;
hideObject _logic;

_logic setDir _Angle_Player_cam;
_camPos = [_pos select 0, _pos select 1, (_pos select 2) +  4.2];

_cam = "camera" camCreate _camPos;
_cam camSetPos _camPos;
_cam camSetTarget _logic;
_cam camCommit 0;

waitUntil {camcommitted _cam};

_cam attachTo [_logic, [0, 2.415, 0.585]];
_cam cameraEffect ["internal", "BACK"];

// Handles the actual orbiting of the cam
while {!(RACE_PHASE isEqualTo "Race_Started")} do
{

	_Angle_Player_cam = _Angle_Player_cam + 0.065;
	_logic setDir _Angle_Player_cam;
	uiSleep 0.0085;

};

camDestroy _cam;
deleteVehicle _logic;
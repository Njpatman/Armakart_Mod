diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Begun Count Down Till Mission End";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

uiSleep 8.5;

["Customization_Timer_Layer", ["Customization_Timer_UI", "PLAIN"]] remoteExec ["cutRsc", 0, true];

//- Adds a timer to the players screen, which should give the time until the next phase or race start -\\
[( "Timer" call BIS_fnc_rscLayer ), ["Timer", "PLAIN"]] remoteExec ["cutRsc", 0];

_color = "#45f442";//green

//default
_Time_left = 85;

_Set_Time = 85;

["Edit_Track_End_Phase"] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, false];

[_color, _Set_Time] remoteExec ["NJP_Client_fnc_Update_Timer", 0, true];

_Voting_Time_left = _Set_Time + time;

while {_Time_left > 0} do {

	uiSleep 0.25;

	_Time_left = _Voting_Time_left - time;

	if (_Time_left < (_Set_Time * 0.35)) then {_color = "#eef441";};//yellow

	if (_Time_left < (_Set_Time * 0.15)) then {_color = "#ff0000";};//red

	[_color, _Time_left] remoteExec ["NJP_Client_fnc_Update_Timer", 0, true];

};

[( "Timer" call BIS_fnc_rscLayer ), ["", "PLAIN"]] remoteExec ["cutText", 0, true];

[] spawn {
	skipTime ((Time_Noon_Num - daytime + 24) % 24);
	0 setOvercast 0;
	0 setFog 0;
	0 setRain 0;
	0 setLightnings 0;
	0 setWaves 0;
	forceWeatherChange;
	_mPos1 = getMarkerPos "Harbor";
	_mPos2 = getMarkerPos "Docks";
	_mPos3 = getMarkerPos "Sewers";
	_mPos4 = getMarkerPos "Temple";
	_mPos5 = getMarkerPos "Boat&Boogie";
	_mPos6 = getMarkerPos "Rainbow Road";
	{
		_objects = [];
		_objects = nearestObjects [_x, [], 950];
		if !(_objects isEqualTo []) then {
			{
				if (typeOf _x isEqualTo "Land_PetroglyphWall_02_F" || typeOf _x isEqualTo "Land_PetroglyphWall_01_F" || typeOf _x isEqualTo "Land_CobblestoneSquare_01_8m_F" || typeOf _x isEqualTo "UserTexture10m_F" || (_x in [BT_1, BT_2, BT_3, BT_4, BT_5, BT_6, BT_7, BT_8, BT_9, BT_10, BT_11, BT_12]) ||typeOf _x isEqualTo "Sign_Arrow_Direction_Blue_F" || typeOf _x isEqualTo "Land_Sidewalk_02_narrow_4m_F" || typeOf _x isEqualTo "Land_QuayConcrete_01_20m_F" || typeOf _x isEqualTo "Land_QuayConcrete_01_20m_wall_F" || typeOf _x isEqualTo "Land_QuayConcrete_01_pier_F" || typeOf _x isEqualTo "Land_Statue_03_F" || typeOf _x isEqualTo "Land_Statue_01_F" || typeOf _x isEqualTo "Land_Lamp_Small_EP1" || typeOf _x isEqualTo "Land_BasaltWall_01_8m_F" || typeOf _x isEqualTo "A3_NEO_test_ad_quarry01" || typeOf _x isEqualTo "Land_AncientStatue_02_F" || typeOf _x isEqualTo "Land_AncientStatue_01_F" || typeOf _x isEqualTo "Land_AncientHead_01_F" || typeOf _x isEqualTo "Land_RaiStone_01_F" || typeOf _x isEqualTo "Land_Canal_Dutch_01_bridge_F" || typeOf _x isEqualTo "Land_Canal_Dutch_01_corner_F" || typeOf _x isEqualTo "Land_Canal_Dutch_01_stairs_F" || typeOf _x isEqualTo "A3_NEO_bridgewooden_01_f" || typeOf _x isEqualTo "Land_Molo_drevo" || typeOf _x isEqualTo "Land_WoodenWall_01_m_8m_F" || typeOf _x isEqualTo "land_nav_pier_c" || typeOf _x isEqualTo "CUP_Winter_obj_Wreck_Ship_1" || typeOf _x isEqualTo "Land_Wreck_Traw2_F" || typeOf _x isEqualTo "Land_Wreck_Traw_F") then {
					hideObjectGlobal _x;
					uiSleep 0.00015;
				} else {
					deleteVehicle _x;
				};
			} forEach _objects;
		};
	} forEach [_mPos1, _mPos2, _mPos3, _mPos4, _mPos5, _mPos6];
	_Marks = allMapMarkers;
	{ 
		if !(_x isEqualTo "Harbor" || _x isEqualTo "Docks" || _x isEqualTo "Sewers" || _x isEqualTo "Temple" || _x isEqualTo "Boat&Boogie" || _x isEqualTo "Rainbow Road") then {
			deleteMarker _x;
		};
	} forEach _Marks;
};

[[], {
	Scoreboard_Active = false;
	if (!Is_Spectator) then {
		[false] call ace_spectator_fnc_setSpectator;
		_veh = createVehicle ["C_Quadbike_01_F", Starting_Pos, [], 0, "NONE"];
		_veh setDamage 0;
		[_veh, false] remoteExec ["enableSimulationGlobal", 2];
		player allowDamage false;
		_veh allowDamage false;
		_veh engineOn true;
		uiSleep 0.1;
		player moveInDriver _veh;
		if (!isNil "Vehicle_Texture") then {vehicle player setObjectTextureGlobal [0, (Vehicle_Texture select 0)];};
		vehicle player setPilotLight false;
		_veh setPosASL Starting_Pos;
		_veh setVectorUp Starting_VectorUp;
	};
}] remoteExec ["Spawn", 0, true];

uiSleep 1.5;

[[], "Armakart_Main\Armakart_Init.sqf"] remoteExec ["execVM", 0];

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Completed Customization Phase & Begun Track Voting Phase.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

RACE_PHASE = "Track_Voting_Phase";
publicVariable "RACE_PHASE";

//Creates the Voting menu
["Track_Voting_Menu"] remoteExec ["createDialog", 0, false];

["Edit_Track_Voting_Phase"] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, false];

_color = "#45f442";//green

//default
_Time_left = 3;

_Set_Time = 20;

[_color, _Set_Time] remoteExec ["NJP_Client_fnc_Update_Timer", 0, true];

uiSleep 1;

_Voting_Time_left = _Set_Time + time;

while {_Time_left > 0} do {

	uiSleep 0.25;

	_Time_left = _Voting_Time_left - time;

	if (_Time_left < (_Set_Time * 0.35)) then {_color = "#eef441";};//yellow

	if (_Time_left < (_Set_Time * 0.15)) then {_color = "#ff0000";};//red

	[_color, _Time_left] remoteExec ["NJP_Client_fnc_Update_Timer", 0, true];

};

//Closes Voting Menu
[12568] remoteExec [ "closeDialog", 0, true];

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Completed Track Voting Phase, Spawning Track...";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

_Track = selectMax [Track_Harbor, Track_Docks, Track_Sewers, Track_Temple, Track_BoatAndBoogie, Track_RainbowRoad, Track_Random];

if (_Track isEqualTo Track_Random) then {
	_Track = selectRandom [Track_Harbor, Track_Docks, Track_Sewers, Track_Temple, Track_BoatAndBoogie, Track_RainbowRoad];
};

Track_Spawned = false;

switch (_Track) do {
	case Track_Harbor: { 
		[] spawn {
			_mPos = getMarkerPos "Harbor";
			_objects = nearestObjects [_mPos, [], 850];

			{
				if (typeOf _x isEqualTo "Land_Canal_Dutch_01_stairs_F") then {
					_x hideObjectGlobal false;
					uiSleep 0.0015;
					[_x] spawn LARs_fnc_showObjectsOnMap;
				};
			} forEach _objects;

			["ATF_Harbor_Objects", [], [0,0,0], 0] call LARs_fnc_spawnComp; 

			Track_Spawned = true;
		};

		Voting_Phase_Enabled = 1;

		SewerOverwrite = false;

		CP_Size_Array = [18, 18, 0, true, 25]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		Sub_CP_Size_Array = [20, 20, 0, true, 25]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		[[], {
			Radius_cam = 125; // Circle radius (distance to the checkpoints).

			Angle_cam = random 360; // Starting angle (compass direction).

			Altitude_cam = 35; // Camera altitude (height above ground).

			Speed_cam = 0.06; // Higher is faster.

			Track_Title = 'Harbor'; // Should be name of your track, shown at intro.

			Reset_Diameter = 10; // Diameter around the Checkpoint Markers players reset to; Please set to track width.

			Reset_Height = 2; // Height above the Checkpoint Markers players will reset to.
		}] remoteExec ["Spawn", 0, true];
	};
	case Track_Docks: {
		[] spawn {
			_mPos = getMarkerPos "Docks";
			_objects = nearestObjects [_mPos, [], 850];

			{
				if (typeOf _x isEqualTo "A3_NEO_bridgewooden_01_f" || typeOf _x isEqualTo "Land_Molo_drevo" || typeOf _x isEqualTo "Land_WoodenWall_01_m_8m_F" || typeOf _x isEqualTo "land_nav_pier_c" || typeOf _x isEqualTo "CUP_Winter_obj_Wreck_Ship_1" || typeOf _x isEqualTo "Land_Wreck_Traw2_F" || typeOf _x isEqualTo "Land_Wreck_Traw_F") then {
					_x hideObjectGlobal false;
					uiSleep 0.0015;
					[_x] spawn LARs_fnc_showObjectsOnMap;
				};
			} forEach _objects;

			["ATF_Docks_Objects", [], [0,0,0], 0] call LARs_fnc_spawnComp; 
		
			Track_Spawned = true;
		};

		Voting_Phase_Enabled = 1;

		SewerOverwrite = false;

		CP_Size_Array = [18, 18, 0, true, 25]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		Sub_CP_Size_Array = [20, 20, 0, true, 25]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		[[], {
			Laps_number = 2;

			Radius_cam = 125; // Circle radius (distance to the checkpoints).

			Angle_cam = random 360; // Starting angle (compass direction).

			Altitude_cam = 35; // Camera altitude (height above ground).

			Speed_cam = 0.06; // Higher is faster.

			Track_Title = 'Docks'; // Should be name of your track, shown at intro.

			Reset_Diameter = 10; // Diameter around the Checkpoint Markers players reset to; Please set to track width.

			Reset_Height = 2; // Height above the Checkpoint Markers players will reset to.
		}] remoteExec ["Spawn", 0, true];
	};
	case Track_Sewers: {
		[] spawn {
			_mPos = getMarkerPos "Sewers";
			_objects = nearestObjects [_mPos, [], 850];

			{
				if (typeOf _x isEqualTo "Land_Canal_Dutch_01_bridge_F" || typeOf _x isEqualTo "Land_Canal_Dutch_01_corner_F" || typeOf _x isEqualTo "land_nav_pier_c") then {
					_x hideObjectGlobal false;
					uiSleep 0.00015;
					[_x] spawn LARs_fnc_showObjectsOnMap;
				};
			} forEach _objects;

			["ATF_Sewer_Objects", [], [0,0,0], 0] call LARs_fnc_spawnComp;

			Track_Spawned = true;
		};

		Voting_Phase_Enabled = 0;

		SewerOverwrite = true;

		CP_Size_Array = [18, 18, 0, true, 25]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		Sub_CP_Size_Array = [20, 20, 0, true, 25]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		[[], {
			Radius_cam = 14; // Circle radius (distance to the checkpoints) 

			Angle_cam = random 360;// Starting angle (compass direction) 

			Altitude_cam = 0; // Camera altitude (height above ground) 

			Speed_cam = 0.26; // Higher is faster

			Track_Title = 'Sewers'; // Should be name of your track, shown at intro.

			Reset_Diameter = 6; // Diameter around the Checkpoint Markers players reset to; Please set to track width.

			Reset_Height = 2; // Height above the Checkpoint Markers players will reset to.
		}] remoteExec ["Spawn", 0, true];
	};

	case Track_Temple: {
		[] spawn {
			_mPos = getMarkerPos "Temple";
			_objects = nearestObjects [_mPos, [], 850];

			{	
				if (typeOf _x isEqualTo "Land_BasaltWall_01_8m_F" || typeOf _x isEqualTo "A3_NEO_test_ad_quarry01" || typeOf _x isEqualTo "Land_Lamp_Small_EP1") then {
					_x hideObjectGlobal false;
					uiSleep 0.0015;
					[_x] spawn LARs_fnc_showObjectsOnMap;
				};
				if (typeOf _x isEqualTo "Land_AncientStatue_02_F" || typeOf _x isEqualTo "Land_AncientStatue_01_F" || typeOf _x isEqualTo "Land_AncientHead_01_F" || (typeOf _x isEqualTo "Land_RaiStone_01_F" && !((_x isEqualTo Stone_0) || (_x isEqualTo Stone_3)))) then {
					_x hideObjectGlobal false;
					_x setObjectScale 35;
					uiSleep 0.15;
				};
				if (typeOf _x isEqualTo "Land_RaiStone_01_F" && ((_x isEqualTo Stone_0) || (_x isEqualTo Stone_3))) then {
					_x hideObjectGlobal false;
					_x setObjectScale 50;
					uiSleep 0.15;
				};
				if (typeOf _x isEqualTo "Land_PetroglyphWall_02_F" || typeOf _x isEqualTo "Land_PetroglyphWall_01_F") then {
					_x hideObjectGlobal false;
					_x setObjectScale 200;
					uiSleep 0.15;
				};
			} forEach _objects;

			["ATF_Temple_Objects", [], [0,0,0], 0] call LARs_fnc_spawnComp;

			Track_Spawned = true;
		};

		Voting_Phase_Enabled = 1;

		SewerOverwrite = false;

		CP_Size_Array = [18, 18, 0, true, 25]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		Sub_CP_Size_Array = [20, 20, 0, true, 25]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		[[], {

			Radius_cam = 28; // Circle radius (distance to the checkpoints) 

			Angle_cam = random 360;// Starting angle (compass direction) 

			Altitude_cam = 12; // Camera altitude (height above ground) 

			Speed_cam = 0.06; // Higher is faster

			Track_Title = 'Temple'; // Should be name of your track, shown at intro.

			Reset_Diameter = 6; // Diameter around the Checkpoint Markers players reset to; Please set to track width.

			Reset_Height = 2; // Height above the Checkpoint Markers players will reset to.
		}] remoteExec ["Spawn", 0, true];
	};

	case Track_BoatAndBoogie: {
		[] spawn {
			_mPos = getMarkerPos "Boat&Boogie";
			_objects = nearestObjects [_mPos, [], 950];

			{	
				if ((_x in [BT_1, BT_2, BT_3, BT_4, BT_5, BT_6, BT_7, BT_8, BT_9, BT_10, BT_11, BT_12]) || typeOf _x isEqualTo "Sign_Arrow_Direction_Blue_F" || typeOf _x isEqualTo "Land_Sidewalk_02_narrow_4m_F" || typeOf _x isEqualTo "Land_QuayConcrete_01_20m_F" || typeOf _x isEqualTo "Land_QuayConcrete_01_20m_wall_F" || typeOf _x isEqualTo "Land_QuayConcrete_01_pier_F" || typeOf _x isEqualTo "Land_Wreck_Traw2_F" || typeOf _x isEqualTo "Land_Wreck_Traw_F") then {
					_x hideObjectGlobal false;
					uiSleep 0.0015;
					[_x] spawn LARs_fnc_showObjectsOnMap;
				};
				if (typeOf _x isEqualTo "Land_Statue_01_F" || typeOf _x isEqualTo "Land_Statue_03_F") then {
					_x hideObjectGlobal false;
					_x setObjectScale 200;
					uiSleep 0.15;
				};
			} forEach _objects;

			["ATF_BoatAndBoogie_Objects", [], [0,0,0], 0] call LARs_fnc_spawnComp;

			Track_Spawned = true;
		};

		Voting_Phase_Enabled = 1;

		SewerOverwrite = false;

		CP_Size_Array = [65, 65, 0, false, 35]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		Sub_CP_Size_Array = [65, 65, 0, false, 35]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		[[], {

			Radius_cam = 34; // Circle radius (distance to the checkpoints) 

			Angle_cam = random 360;// Starting angle (compass direction) 

			Altitude_cam = 22; // Camera altitude (height above ground) 

			Speed_cam = 0.06; // Higher is faster

			Track_Title = 'Boat And Boogie'; // Should be name of your track, shown at intro.

			Reset_Diameter = 10; // Diameter around the Checkpoint Markers players reset to; Please set to track width.

			Reset_Height = 2; // Height above the Checkpoint Markers players will reset to.
		}] remoteExec ["Spawn", 0, true];
	};

	case Track_RainbowRoad: {
		[] spawn {
			_mPos = getMarkerPos "Rainbow Road";
			_objects = nearestObjects [_mPos, [], 950];

			{
				if (typeOf _x isEqualTo "Land_CobblestoneSquare_01_8m_F" || typeOf _x isEqualTo "UserTexture10m_F") then {
					_x hideObjectGlobal false;
					uiSleep 0.0015;
					[_x] spawn LARs_fnc_showObjectsOnMap;
				};
			} forEach _objects;

			["ATF_RainbowRoad_Objects", [], [0,0,0], 0] call LARs_fnc_spawnComp;

			Track_Spawned = true;
		};

		Voting_Phase_Enabled = 1;

		SewerOverwrite = false;

		CP_Size_Array = [15, 15, 0, false, 6]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		Sub_CP_Size_Array = [15, 15, 0, false, 6]; // Please reference https://community.bistudio.com/wiki/setTriggerArea to make sure you edit the right variables.

		[[], {
			Radius_cam = 84; // Circle radius (distance to the checkpoints) 

			Angle_cam = random 360;// Starting angle (compass direction) 

			Altitude_cam = 88; // Camera altitude (height above ground) 

			Speed_cam = 0.26; // Higher is faster

			Track_Title = 'Rainbow Road'; // Should be name of your track, shown at intro.

			Reset_Diameter = 6; // Diameter around the Checkpoint Markers players reset to; Please set to track width.

			Reset_Height = 2; // Height above the Checkpoint Markers players will reset to.
		}] remoteExec ["Spawn", 0, true];
	};
};

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Track Spawned";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";
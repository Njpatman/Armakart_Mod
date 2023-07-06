/* 
*
* - Initializes the race.
* 
*/

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Begun Race init & started Customization Phase.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

if !(isServer) exitWith {};

//Setsup "RACE_PHASE"
RACE_PHASE = "kartCustomization";
publicVariable "RACE_PHASE";

//Adds global variable for music loop
ehID = addMusicEventHandler ["MusicStop", {music_isPlaying = false}];

waitUntil {uiSleep 1; time > 0};

remoteExec ["NJP_Client_fnc_Pre_Race_Phase", 0, false];

if (!isNil "potato_safeStart_fnc_toggleSafeStart") then { [false] call potato_safeStart_fnc_toggleSafeStart; };

//Starts Customization Phase music and loops it
[] Spawn
{

	while {!(RACE_PHASE isEqualTo "Race_Started")} do
	{

		music_isPlaying = true;
		"Customization_Phase" remoteExec ["playMusic", 0, true];
		waitUntil
		{
			uiSleep 5;

			not music_isPlaying
		};

	};
	
};

//- Handles the Customization Phase UI -\\

call NJP_Server_fnc_kartCustomization;

call NJP_Server_fnc_voteTrack;

if (Voting_Phase_Enabled isEqualTo 1) then { call NJP_Server_fnc_voteWeather; } else {
	if (SewerOverwrite) then {
		[[2000, 7, 8, 24, 0]] remoteExec ["setDate"];

		0 setOvercast 0;
		0 setFog 0;
		0 setRain 0;
		0 setLightnings 0;
		0 setWaves 0;
		forceWeatherChange;
	};
	
    ["Customization_Timer_Layer", 0.001] remoteExec ["cutFadeOut", 0, true];

    //Remove timer display
    [( "Timer" call BIS_fnc_rscLayer ), ["", "PLAIN"]] remoteExec ["cutText", 0, true];

    diag_log "//----------------------------------------------------------------------------\\";
    diag_log "|Armakart System| : Completed Customization Phase & skipped Voting phase.";
    diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
    diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
    diag_log "\\----------------------------------------------------------------------------//";
};

uiSleep 2.25;

waitUntil {Track_Spawned};

["Track_Loading_Layer", 0.001] remoteExec ["cutFadeOut", 0, true];

[[],{ 
	//Sets plaver vic fuel to 0
	[vehicle player, 0] remoteExec ['setfuel', vehicle player]; 

	//Get number of each object
	CP_NUM = count allMissionObjects "VR_3DSelector_01_complete_F";
	SUB_CP_NUM = count allMissionObjects "Sign_Arrow_Large_Cyan_F";
	PWR_BLK_NUM = count allMissionObjects "Land_VR_CoverObject_01_kneelHigh_F";
}] remoteExec ["Spawn", 0, false];

uiSleep 0.65;

["Black_Screen_Layer", ["", "BLACK FADED", 3]] remoteExec ["cutText", 0, true];

//Removes Customization Menu Reset option
[[],{ [player, 1,["ACE_SelfActions","Reset_Menu"]] call ace_interact_menu_fnc_removeActionFromObject; }] remoteExec ["Spawn", 0, true];

["Initial_Loading_Layer", ["Loading_Screen", "PLAIN"]] remoteExec ["cutRsc", 0, false];

["Edit_Initial_Loading_Screen", Loaded_CP_NUM, Loaded_SUB_CP_NUM, Loaded_PWR_BLK_NUM] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, true];

//Initializes Checkpoints
_CP_Init = [] spawn NJP_Server_fnc_checkpoints;

//Initializes Sub Checkpoints
_Sub_CP_Init = [] spawn NJP_Server_fnc_subCheckpoints;

//Initializes Powerup Blocks
_Powerup_Block_Init = [] spawn NJP_Server_fnc_powerupBlocks;

While {!scriptDone _Powerup_Block_Init || !scriptDone _Sub_CP_Init || !scriptDone _CP_Init} do {


	["Edit_Initial_Loading_Screen", Loaded_CP_NUM, Loaded_SUB_CP_NUM, Loaded_PWR_BLK_NUM] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, true];

	uiSleep 0.225;

};

["Edit_Initial_Loading_Screen", Loaded_CP_NUM, Loaded_SUB_CP_NUM, Loaded_PWR_BLK_NUM] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, true];

//- Handles the Customization Phase ACE Self Interact, and camera -\\

RACE_PHASE = "Race_Started";
publicVariable "RACE_PHASE";

uiSleep 3.25;

["dynamicBlur",  true] remoteExec ["ppEffectEnable", 0, false];
["dynamicBlur",  [6]] remoteExec ["ppEffectAdjust", 0, false];
["dynamicBlur",  0] remoteExec ["ppEffectCommit", 0, false];    
["dynamicBlur",  [0.0]] remoteExec ["ppEffectAdjust", 0, false];
["dynamicBlur",  3] remoteExec ["ppEffectCommit", 0, false];

["Initial_Loading_Layer", 0.001] remoteExec ["cutFadeOut", 0, true];
["Black_Screen_Layer", ["", "BLACK IN", 3]] remoteExec ["cutText", 0, true];

//One-off Clean up Script to make the intro look nice
call NJP_Server_fnc_cleanUp;

//Do title
_author = getMissionConfigValue ["Author", 0];
_ATF_Version = getText (missionConfigFile >> "ATF_Version");

[
	[
		[Track_Title,"<t align = 'center' shadow = '1' size = '1.5' font = 'PuristaBold' >%1</t><br/>",12],
		["By: " + _author,"<t align = 'center' shadow = '1' size = '1.2'>%1</t><br/>",12],
		[_ATF_Version,"<t align = 'center' shadow = '1' size = '1'>%1</t><br/>",32]
	] , 1, 0.8
] remoteExec ["BIS_fnc_typeText", 0, true];

[""] remoteExec ["playMusic", 0, false];
["Intro"] remoteExec ["playMusic", 0, false];

remoteExec ["NJP_Client_fnc_Start_Race", -2];

remoteExec ["NJP_Client_fnc_Live_Place", 0];

_Tele_Pos_Array = nearestObjects [(getPosASL FINISH_LINE), ["VR_GroundIcon_01_F"], 500, true];
_i = 0;
{
	if !(typeOf _x isEqualTo "ace_spectator_virtual" || _x in ([] call ace_spectator_fnc_players)) then {
		_Tele_Pos = _Tele_Pos_Array select _i;
		_i = _i + 1;
		vehicle _x setPosASL (getPosASL _Tele_Pos);
		vehicle _x setDir (getDir _Tele_Pos);
		_Tele_Pos_array_pos = _Tele_Pos_Array find _Tele_Pos;
		_Tele_Pos_Array deleteAt _Tele_Pos_array_pos;
		deleteVehicle _Tele_Pos;

		systemChat str _x;
	};
} forEach allPlayers;

{deleteVehicle _x;} forEach allMissionObjects "VR_GroundIcon_01_F";

call NJP_Client_fnc_Start_Race;

diag_log "//----------------------------------------------------------------------------\\";
diag_log "||Armakart System| : Started Race.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

[] spawn NJP_Server_fnc_checkEndRace;

"" remoteExec ["playMusic", 0, false];

[] Spawn 
{
	_stringToParse = toArray Track_Title;

	while {32 IN _stringToParse} do {
		_index = _stringToParse find 32;
		_stringToParse deleteAt _index;
	};
	_finalString = toString _stringToParse;

	while {(RACE_PHASE isEqualTo "Race_Started")} do
	{
		music_isPlaying = true;
		_finalString remoteExec ["playMusic", 0, true];
		waitUntil
		{
			uiSleep 12.5;
			not music_isPlaying
		};
	};
};

[] Spawn 
{
	while {(RACE_PHASE isEqualTo "Race_Started")} do 
	{
		call NJP_Server_fnc_cleanUp;
		uiSleep 32.5;
	};
};

[] Spawn 
{
	while {(RACE_PHASE isEqualTo "Race_Started")} do 
	{
		{ 
			_pUID = _x;
			_delPos = Places_Live findIf {_pUID isEqualTo (_x select 5)};
			if !((Places_Live findIf {_pUID isEqualTo (_x select 5)}) isEqualTo -1) then {
				Places_Live deleteAt _delPos;
			};
			Places_Live pushBack _y;
		} forEach playersRaceHash;
		missionNamespace setVariable ["Racer_Count", (count Places_Live), true];
		Places_Live sort false;
		uiSleep 0.65;
	};
};

diag_log "//----------------------------------------------------------------------------\\";
diag_log "||Armakart System| : Completed Race init.";
diag_log format ["|Armakart System| : Time for Race to init: %1.", diag_tickTime];
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";
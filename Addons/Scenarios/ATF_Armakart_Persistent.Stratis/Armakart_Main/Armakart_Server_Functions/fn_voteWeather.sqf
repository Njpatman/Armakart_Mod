diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Completed Customization Phase & Begun Voting Phase.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

RACE_PHASE = "Weather_Voting_Phase";
publicVariable "RACE_PHASE";

//Creates the Voting menu
["Weather_Voting_Menu"] remoteExec ["createDialog", 0, false];

["Edit_Voting_Phase"] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, false];

_color = "#45f442";//green

//default
_Time_left = 30;

[_color, Voting_Phase_Time] remoteExec ["NJP_Client_fnc_Update_Timer", 0, true];

uiSleep 1;

_Voting_Time_left = Voting_Phase_Time + time;

while {_Time_left > 0} do {
	uiSleep 0.25;
	_Time_left = _Voting_Time_left - time;

	if (_Time_left < (Voting_Phase_Time * 0.35)) then {_color = "#eef441";};//yellow
	if (_Time_left < (Voting_Phase_Time * 0.15)) then {_color = "#ff0000";};//red

	[_color, _Time_left] remoteExec ["NJP_Client_fnc_Update_Timer", 0, true];
};

//Remove timer display
[( "Timer" call BIS_fnc_rscLayer ), ["", "PLAIN"]] remoteExec ["cutText", 0, true];

//Closes Voting Menu
["Customization_Timer_Layer", 0.001] remoteExec ["cutFadeOut", 0, true];

[123456] remoteExec [ "closeDialog", 0, true];

[( "Timer" call BIS_fnc_rscLayer ), ["", "PLAIN"]] remoteExec ["cutText", 0, true];

["Black_Screen_Layer", ["", "BLACK FADED", 150]]  remoteExec ["cutText", 0, false];

["Track_Loading_Layer", ["Track_Loading_Screen", "PLAIN"]] remoteExec ["cutRsc", 0, false];

["Edit_Track_Loading_Screen", false] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, false];

//Begin tallying and applying weather effects and time
diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Completed Voting Phase, tallying votes";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

_Weather = selectMax [Weather_Clear, Weather_Cloudy, Weather_Foggy, Weather_Light_Rain, Weather_Stormy];
missionNamespace setVariable ["Weather_Array", [[Weather_Clear, 'Clear'], [Weather_Cloudy, 'Cloudy'], [Weather_Foggy, 'Foggy'], [Weather_Light_Rain, 'Light Rain'], [Weather_Stormy, 'Stormy']], true];
missionNamespace setVariable ["Weather_Max", _Weather, true];
["Edit_Track_Loading_Screen", false] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, false];
switch (_Weather) do {

	case Weather_Stormy: {

		NJP_Server_Fnc_Weather = {

			0 setOvercast 1;
			0 setFog 0;
			0 setRain 1;
			0 setLightnings 1;
			0 setWaves 0.35;
			_init_dir = random 360;
			setWind [_init_dir, _init_dir ];
			0 setGusts 0.85;
			forceWeatherChange;
		};
	};

	case Weather_Light_Rain: {

		NJP_Server_Fnc_Weather = {

			0 setOvercast 0.85;
			0 setFog 0;
			0 setRain 0.35;
			0 setLightnings 0;
			0 setWaves 0;
			_init_dir = random 360;
			setWind [_init_dir, _init_dir ];
			forceWeatherChange;

		};		
	};

	case Weather_Foggy: {

		NJP_Server_Fnc_Weather = {

			0 setOvercast 0.42;
			0 setFog 0.75;
			0 setRain 0;
			0 setLightnings 0;
			0 setWaves 0;
			forceWeatherChange;

		};		
	};

	case Weather_Cloudy: {

		NJP_Server_Fnc_Weather = {

			0 setOvercast 0.95;
			0 setFog 0;
			0 setRain 0;
			0 setLightnings 0;
			0 setWaves 0;
			_init_dir = random 360;
			setWind [_init_dir, _init_dir ];
			forceWeatherChange;

		};
	};

	case Weather_Clear: {

		NJP_Server_Fnc_Weather = {

			0 setOvercast 0;
			0 setFog 0;
			0 setRain 0;
			0 setLightnings 0;
			0 setWaves 0;
			forceWeatherChange;

		};
	};

	default {Weather_Clear};

};

uiSleep 4.5;

_Time = selectMax [Time_Early_Morning, Time_Noon, Time_Late_Afternoon, Time_Night, Time_Night_Full_Moon];
missionNamespace setVariable ["Time_Array", [[Time_Early_Morning, 'Early Morning'], [Time_Noon, 'Noon'], [Time_Late_Afternoon, 'Late Afternoon'], [Time_Night, 'Night'], [Time_Night_Full_Moon, 'Night Full Moon']], true];
missionNamespace setVariable ["Time_Max", _Time, true];
["Edit_Track_Loading_Screen", true] remoteExec ["NJP_Client_Fnc_GUI_Edit", 0, false];

waitUntil {(Players_Loading_Vote > (0.85 * (count allPlayers)))};

switch (_Time) do {
	case Time_Night_Full_Moon: {
		skipTime ((24 - daytime + 24) % 24);
	};
	case Time_Night: {
		[[2000, 7, 8, 24, 0]] remoteExec ["setDate"];
	};
	case Time_Late_Afternoon: {
		skipTime ((Time_Late_Afternoon_Num - daytime + 24) % 24);
	};
	case Time_Noon: {
		skipTime ((Time_Noon_Num - daytime + 24) % 24);
	};
	case Time_Early_Morning: {
		skipTime ((Time_Early_Morning_Num - daytime + 24) % 24);
	};
	default {Time_Noon};
};

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart Voting| : Tallied Time votes.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

uiSleep 5.15;

call NJP_Server_Fnc_Weather;

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart Voting| : Applied weather effects to the server.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";
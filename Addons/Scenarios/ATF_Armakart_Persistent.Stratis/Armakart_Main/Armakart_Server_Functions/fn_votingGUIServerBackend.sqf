if (!isServer) exitWith {};

params ["_selection", "_selectedIndex", "_currentState", "_player"];

[_selection, _player] remoteExec ["NJP_Client_fnc_votingGUIClientBackend", 0];

if (RACE_PHASE isEqualTo "Track_Voting_Phase") then {
	switch (_selection) do {
		case 0: { 
			Track_Harbor = Track_Harbor + 1;
		};
		case 1: { 
			Track_Sewers = Track_Sewers + 1;
		};
		case 2: { 
			Track_Docks = Track_Docks + 1;
		};
		case 3: { 
			Track_Temple = Track_Temple + 1;
		};
		case 4: { 
			Track_BoatAndBoogie = Track_BoatAndBoogie + 1;
		};
		case 5: { 
			Track_RainbowRoad = Track_RainbowRoad + 1;
		};
		case 6: { 
			Track_Random = Track_Random + 1;
		};
	};
} else {
	switch (_selection) do {
		case 0: { 
			Weather_Clear = Weather_Clear + 1;
		};
		case 1: { 
			Weather_Cloudy = Weather_Cloudy + 1;
		};
		case 2: { 
			Weather_Foggy = Weather_Foggy + 1;
		};
		case 3: { 
			Weather_Light_Rain = Weather_Light_Rain + 1;
		};
		case 4: { 
			Weather_Stormy = Weather_Stormy + 1;
		};
		case 5: { 
			Time_Early_Morning = Time_Early_Morning + 1;
		};
		case 6: { 
			Time_Noon = Time_Noon + 1;
		};
		case 7: { 
			Time_Late_Afternoon = Time_Late_Afternoon + 1;
		};
		case 8: { 
			Time_Night = Time_Night + 1;
		};
		case 9: { 
			Time_Night_Full_Moon = Time_Night_Full_Moon + 1;
		};
	};
};
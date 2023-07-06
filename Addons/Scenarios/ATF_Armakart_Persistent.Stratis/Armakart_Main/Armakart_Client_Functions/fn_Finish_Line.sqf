if !(hasInterface) exitWith {};

//This block of code checks if the player has finished the race, if true, tell them their place then kill them
if (Current_Lap + 1 > Laps_number && Current_Checkpoint isEqualTo CP_NUM) exitWith
{
	"In_Race_UI_Layer" cutFadeOut 0.001;
	[0, 0, true] call NJP_Client_Fnc_resetPowerup;
	Player_Finished = true;
	_FINISHED_KART_NUM = KARTS_FINISHED + 1;
	_FINISHED_KART_NUM_STR = [_FINISHED_KART_NUM] call BIS_fnc_ordinalNumber;
	hintSilent "Race completed! Enjoy watching everyone else in spectator!";
	playSound "Win";

	if (player in (fullCrew [vehicle player, "cargo", false] select 0) && count units group player isEqualTo 2) then {
		_Driver = driver vehicle player;
		_Name = profileName;
		_Name_Dos = name _Driver;
		[_Name, _Name_Dos, false] remoteExec ["NJP_Client_Fnc_Places_Pushback", 0, true];
		[format ["|Armakart Doubles| : You & your buddy finished %1, make sure to notify him as he might not get this message", _FINISHED_KART_NUM_STR]] remoteexec ["systemChat", vehicle player, true];
	};

	if (player in (fullCrew [vehicle player, "driver", false] select 0) && count units group player isEqualTo 1) then {
		_Name = profileName;
		[_Name, nil, false] remoteExec ["NJP_Client_Fnc_Places_Pushback", 0, true];
		systemChat format ["|Armakart Singles| : You finished %1", _FINISHED_KART_NUM_STR];
	};

	for "_i" from 0 to 3 do { 
		[9999999999, _i, localPlayerUID, false, true] remoteExec ["NJP_Server_fnc_updateRaceHash", 2];
	};

	deleteVehicle vehicle player;
	_Group = createGroup sideLogic;
	[player] joinSilent _Group;
	[true] call ace_spectator_fnc_setSpectator;

	uiSleep 0.5;
	deleteVehicle vehicle player;
};


//Simply adds to the Current_Lap variable and resets the Checkpoint and Sub_Checkpoint count, while also making a song and dance about it
if (Current_Lap + 1 <= Laps_number && Current_Checkpoint isEqualTo CP_NUM) then
{
	//Checks if player is on his final lap, if so, then to make a song and dance about it.
	if (Current_Lap + 1 isEqualTo Laps_number && Current_Checkpoint isEqualTo CP_NUM) then
	{
		systemChat "|Armakart System| : Final Lap Started!";
		playsound"Final_Lap";
	} else {
		systemChat "|Armakart System| : Next Lap Started!";
		playsound"Lap";
	};

	Current_Checkpoint = 1;

	Current_Lap = Current_Lap + 1;

	[Current_Checkpoint, 1, localPlayerUID, false, true] remoteExec ["NJP_Server_fnc_updateRaceHash", 2];

	[0, 2, localPlayerUID, false, true] remoteExec ["NJP_Server_fnc_updateRaceHash", 2];

	[Current_Lap, 0, localPlayerUID, false, true] remoteExec ["NJP_Server_fnc_updateRaceHash", 2];

	initial_Lap = false;
};

//Checks if player is on his first lap, if so, then to make a song and dance about it.
if (initial_Lap) then 
{
	systemChat "|Armakart System| : First Lap Started!";

	playsound"Lap";

	player setVariable ['Sub_CP_obj', Sub_CP_0, true];

	Next_Sub_CP_Num = 0;

	initial_Lap = false;
};
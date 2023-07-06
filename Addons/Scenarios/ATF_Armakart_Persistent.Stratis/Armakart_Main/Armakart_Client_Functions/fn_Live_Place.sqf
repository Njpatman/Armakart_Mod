/*
* 
* - Handles the updating for players live in-race UI.
* 
*/ 

// Exit if spectator
if (!hasInterface || Is_Spectator) exitWith {};

#define _Personal_UI_Places uiNamespace getVariable ["Place_UI", controlNull]
#define _Personal_UI_CPs uiNamespace getVariable ["Personal_UI_CPs", controlNull]
#define _Personal_UI_Laps uiNamespace getVariable ["Personal_UI_Laps", controlNull]

_Count_Racers = missionNamespace getVariable "Racer_Count";

waitUntil { uiSleep 1; _Count_Racers = missionNamespace getVariable "Racer_Count"; !(isNil "_Count_Racers")};

While {!Player_Finished} do 
{
	_Count_Racers = missionNamespace getVariable "Racer_Count";
	if (player in (fullCrew [vehicle player, "driver", false] select 0)) then 
	{
		if (isNil 'Sub_CP_obj') then {
			player setVariable ["Sub_CP_obj", FINISH_LINE, true];
		};			
		[player] remoteExec ["NJP_Server_fnc_getPlayersPlace", 2];
		uiSleep 1;
		Current_Place = player getVariable "Current_Place";
	} else {
		Current_Place = "N/A";
	};
	if ((Current_Place isEqualTo "N/A")) then {
		_Personal_UI_Places ctrlSetStructuredText parseText "<t color = '#FF0000' font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='1.85'>N/A</t>";		
	} else {
		_Current_Place_ordinal = [Current_Place, "English", false] call BIS_fnc_ordinalNumber;
		switch (_Current_Place_ordinal) do 
		{
			case "1st" : 
			{
				_Personal_UI_Places ctrlSetStructuredText parseText format ["<t color = '#FFD700' font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>1st</t><t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'> / %1</t>", _Count_Racers];
			};
			case "2nd" : 
			{
				_Personal_UI_Places ctrlSetStructuredText parseText format ["<t color = '#C0C0C0' font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>2nd</t><t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'> / %1</t>", _Count_Racers];
			};
			case "3rd" : 
			{
				_Personal_UI_Places ctrlSetStructuredText parseText format ["<t color = '#8B4513' font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>3rd</t><t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'> / %1</t>", _Count_Racers];
			};
			default 
			{
				_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>%1</t><t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'> / %2</t>", _Current_Place_ordinal, _Count_Racers];
			};
		};
	};
	_Personal_UI_CPs ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' size='1.78'>%1/%2</t>", Current_Checkpoint, CP_NUM];
	_Personal_UI_Laps ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' size='1.78'>%1/%2</t>", Current_Lap, Laps_number];
	uiSleep 0.45;			
};
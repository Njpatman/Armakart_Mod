params ["_player"];

_pUID = getPlayerUID _player;

_Sub_CP_obj = _player getVariable "Sub_CP_obj";

_dist = (( vehicle _player distance _Sub_CP_obj) * -1);

[_dist, 3, _pUID, false, true] call NJP_Server_fnc_updateRaceHash;

waitUntil { uiSleep 1; _Count_Racers = missionNamespace getVariable "Racer_Count"; !(isNil "_Count_Racers")};

_Current_Place = Places_Live findIf {(_x select 5) isEqualTo _pUID};

_Current_Place = _Current_Place + 1;

[_Current_Place, 4, _pUID, false, true] call NJP_Server_fnc_updateRaceHash;

player setVariable ["Current_Place", _Current_Place, true];
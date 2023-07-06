if (!isServer) exitWith {};

if (isNil "playersRaceHash") then {
	waitUntil {uiSleep 1; !(isNil "playersRaceHash")};
};

params [["_input", 0], ["_arrayPos", 0], ["_uid", "0"], ["_isNewArray", false], ["_overwrite", false]];

if (_uid isEqualTo "") exitWith {};

if (!(_uid in playersRaceHash) || _isNewArray) then {
	_currentLaps = 0;
	_currentCheckpoint = 0;
	_nextSubCPNum = 0;
	_currentPlace = 0;
	_dist_calculated = 0;
	_playerLocalArray = [_uid, [_currentLaps, _currentCheckpoint, _nextSubCPNum, _dist_calculated, _currentPlace, _uid]];
	
	playersRaceHash set _playerLocalArray;
} else {
	_playerLocalArray = playersRaceHash get _uid;
	_updateVariable = _playerLocalArray # _arrayPos;

	if (_overwrite) exitWith {
		_playerLocalArray set [_arrayPos, _input];
	};
	switch true do {
		case ((typeName _updateVariable) isEqualTo "STRING"): 
		{
			_playerLocalArray set [_arrayPos, _input];
		};
		default 
		{
			_updatedInput = _updateVariable + _input; 
			_playerLocalArray set [_arrayPos, _updatedInput];
		};
	};
};
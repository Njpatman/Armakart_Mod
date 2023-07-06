{

	if ( count units _x isEqualTo 0 ) then {

		deleteGroup _x;
		
	};

} forEach allGroups;

_mPos1 = getMarkerPos "Harbor";
_mPos2 = getMarkerPos "Docks";
_mPos3 = getMarkerPos "Sewers";
_mPos4 = getMarkerPos "Temple";
_mPos5 = getMarkerPos "Boat&Boogie";
_mPos6 = getMarkerPos "Rainbow Road";
{
	_objects = [];
	_objects = nearestObjects [_x, ["Car"], 1000];
	{
		if ( (not alive _x) || (({ alive _x } count (crew _x)) isEqualTo 0) && !(typeOf _x isEqualTo "Land_ClutterCutter_small_F")) then {
			deleteVehicle _x;
		};
	} forEach _objects;
} foreach [_mPos1, _mPos2, _mPos3, _mPos4, _mPos5, _mPos6];

{

	deleteVehicle _x;

} forEach allDeadMen;
params ["_object"];

_pos = getPosATL _object;  
_bound = boundingBoxReal _object;  
_rot = getDir _object;  
_bmin = _bound select 0;  
_randomName = "";  
while {true} do {  
_randomName = str (random 8000);  
if (([getMarkerPos _randomName, [0,0,0]] call BIS_fnc_arrayCompare)) exitWith {};  
};  
_marker = createMarker [_randomName, _pos];  
_marker setMarkerShape "RECTANGLE";  
_marker setMarkerSize [_bmin select 0, _bmin select 1];  
_marker setMarkerDir _rot;  
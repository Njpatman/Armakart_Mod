//Apply composition Object rotation and position
//TODO: Fixme, this is not always corrrect

#include "macros.inc"

private[ "_pos", "_newPosX", "_newPosY", "_newPosASL", "_newPosZ", "_rotation", "_mkrPos" ];
params[
	[ "_obj", objNull ],
	[ "_cfgOffset", [0,0,0] ],
	[ "_cfgRot", [0,0,0] ],
	[ "_ATLOffset", 0 ],
	[ "_randomStartPos", [] ],
	[ "_needsSurfaceUp", false ],
	[ "_placementRadius", 0 ]
];

if ( _compIgnoreATLOffset ) then {
	_ATLOffset = 0;
};

//TESTING
//	if ( DEBUG_DEV ) then {
//		if !( canSuspend ) exitWith {
//			_this spawn LARs_fnc_setPositionAndRotation;
//		};
//	};

//ReOrientated Objects composition offset from [ x, z, y ] to [ x, y, z ]
_cfgOffset = [ _cfgOffset select 0, _cfgOffset select 2 , _cfgOffset select 1 ];

//Rotate composition offset by rotation passed to spawnComp
_cfgOffset = [ _cfgOffset, 360 - _compRot ] call BIS_fnc_rotateVector2D;

//Add offset passed to spawnComp ( rotated by rotation passed to spawnComp )
_cfgOffset = _cfgOffset vectorAdd ( [ _compOffset, 360 - _compRot ] call BIS_fnc_rotateVector2D ) ;

if ( _compAlign && !_asPlaced ) then {
	_newPosX = ( _compPos select 0 ) + ( _cfgOffset select 0 );
	_newPosY = ( _compPos select 1 ) + ( _cfgOffset select 1 );
	_newPosASL = getTerrainHeightASL [ _newPosX, _newPosY ];
	_newPosZ = _newPosASL + ( _cfgOffset select 2 );
//		if ( _asPlaced ) then {
//			_pos = [ _newPosX, _newPosY, _newPosZ + _ATLOffset ];
//		}else{
		_pos = [ _newPosX, _newPosY, _newPosZ ];
//		};
}else{
	_pos = ( _compPos vectorAdd _cfgOffset ) vectorAdd [ 0, 0, _ATLOffset ];
};

if ( count _randomStartPos > 0 ) then {
	_randomStartPos = _randomStartPos  apply {
		_mkrPos = ATLToASL getMarkerPos _x;
		_mkrPos = _mkrPos vectorAdd [ 0, 0, abs( boundingBoxReal _obj select 0 select 2 ) ];
		_mkrPos
	};
	_pos = selectRandom ( [ _pos ] + _randomStartPos );
};

if ( _placementRadius > 0 ) then {
	_pos = AGLToASL ( _pos getPos [ random _placementRadius, random 360 ] );
	_pos = _pos vectorAdd [ 0, 0, abs( boundingBoxReal _obj select 0 select 2 ) ];
};

if ( surfaceIsWater _pos && _compWater && !_asPlaced ) then {
	_pos = [ _pos select 0, _pos select 1, 0 + ( _cfgOffset select 2 ) + ( _compOffset select 2 ) ];
};

if !( isNull _obj ) then {

	//Move object to its world position
	_obj setPosWorld _pos;

	//Turn composition angles to degrees
	_CfgRot params[ "_P", "_Y", "_R" ];

	_Y = ( deg _Y ) + _compRot;
	_P = deg _P;
	_R = 360 - deg _R;
	
	{_x = [_x] call CBA_fnc_simplifyAngle;}forEach [_P, _R, _Y];  

	//Calculate Dir and Up
	_dir = [ sin _Y * cos _P, cos _Y * cos _P, sin _P];
	_up = [ [ sin _R, -sin _P, cos _R * cos _P ], -_Y ] call BIS_fnc_rotateVector2D;

	//Set Object rotation
	_obj setVectorDirAndUp [ _dir, _up ];

};

_pos
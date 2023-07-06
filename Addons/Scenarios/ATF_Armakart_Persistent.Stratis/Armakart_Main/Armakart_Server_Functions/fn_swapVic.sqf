params ["_player", "_swapVehClass"];

_veh = vehicle _player;

//check if already driving new vehicle
if (typeOf _veh isEqualto _swapVehClass) exitWith {};

_pos = getPosASL _veh;
_dir = getDir _veh;
_vel = velocity _veh;

//move player
_safeSpot = [(getPosASL _player) select 0, (getPosASL _player) select 1, ((getPosASL _player) select 2) +5];
_player setPosASL _safeSpot;

//delete old vehicle
deleteVehicle _veh;

uiSleep 0.01;

//create new vehicle	
_newVic = _swapVehClass createVehicle [0,0,0];
_newVic setPosASL _pos;

//set up new vehicle
_newVic allowDamage false;
_newVic engineOn true;
_newVic setDir _dir;
_newVic setVelocity _vel;
_newVic setObjectTextureGlobal [0, (Vehicle_Texture select 0)];

//move into new vehicle
_player moveInDriver _newVic;
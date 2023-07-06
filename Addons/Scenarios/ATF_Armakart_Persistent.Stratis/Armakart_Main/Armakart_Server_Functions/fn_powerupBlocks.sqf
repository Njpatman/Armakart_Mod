/* 
*
* - initializes the powerup blocks
* 
*/

{

	//Adds texture to blocks, in case MM forgot any (Somehow)
	_x setObjectTextureGlobal [0, "Armakart_Main\Armakart_UI_&_Textures\Powerup_Block.paa"];
	_x setObjectTextureGlobal [1, "#(argb,8,8,3)color(0.73,0.57,0.27,0.1)"];

	//Players seen to crash when attempting to load this all at once, putting this uiSleep in will hopefully spread out the love, causing less death to players PCs
	uiSleep 0.165;

	//This Chunk of code attaches a VR square to the Powerup Block object, which basically disables the collision on the Powerup Blocks while players are on a vic
	_Ting = createVehicle ["VR_Area_01_square_1x1_yellow_F", getPosASL _x, [], 0, "CAN_COLLIDE"];
	_Ting setDir (getDir _x);
	_Ting hideObjectGlobal true;
	[_x, _Ting] call BIS_fnc_attachToRelative;

	_Dir = getDir _x;
	_Powerup_Trigger = createTrigger ["EmptyDetector", getPos _x];
	_Powerup_Trigger attachTo [_x, [0,0,1.4]];
	detach _Powerup_Trigger;

	[_Powerup_Trigger, [1.15, 4.25, _Dir, true, 6.45]] remoteExec ["setTriggerArea", 0, true];
	[_Powerup_Trigger, ["WEST", "PRESENT", true]] remoteExec ["setTriggerActivation", 0, true];
	[_Powerup_Trigger, ["vehicle player in thislist",
	"
		_trigger = thistrigger;
		[_trigger] remoteExec ['NJP_Server_Powerup_Fnc_Powerup_Block_Disappearing_Act', 2];
		playSound 'Item_Box_Hit';
		[] spawn NJP_Client_Fnc_Armakart_Powerup_Master;
		if (count units group player isEqualTo 2) then 
		{
			_Kart_array = fullCrew [vehicle player, 'cargo', true];
			_passenger_array = _Kart_array select 0;
			_passenger = _passenger_array select 0;
			[[],{
				playSound 'Item_Box_Hit';
				[] call NJP_Client_Fnc_Armakart_Powerup_Master;
			}] remoteExec ['Spawn', _passenger];
		};
	", ""] ] remoteExec ["setTriggerStatements", 0, true];
	[_Powerup_Trigger, 0.30] remoteExec ["setTriggerInterval", 0, true];

	Loaded_PWR_BLK_NUM = Loaded_PWR_BLK_NUM + 1;

} forEach (allMissionObjects "Land_VR_CoverObject_01_kneelHigh_F");

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Completed Initializing Powerup Blocks.";
diag_log format ["|Armakart System| : Time for Powerup Blocks to init: %1.", diag_tickTime];
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";
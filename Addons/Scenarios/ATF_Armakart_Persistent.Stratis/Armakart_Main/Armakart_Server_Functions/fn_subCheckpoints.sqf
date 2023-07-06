/* 
*
* - Initializes sub checkpoints
* 
*/

{
	_Sub_CP_name = vehicleVarName _x;
	Loaded_SUB_CP_NUM = Loaded_SUB_CP_NUM + 1;
	uiSleep 0.0925;

	if (!(_Sub_CP_name in Manual_Sub_Checkpoint_Array)) then {
	
		_Sub_CP_Trigger = createTrigger ["EmptyDetector", getPos _x];
		_Sub_CP_Trigger attachTo [_x, [0,0,0]];
		detach _Sub_CP_Trigger;

		_x hideObjectGlobal true;

		[_Sub_CP_Trigger, Sub_CP_Size_Array] remoteExec ["setTriggerArea", 0, true];
		[_Sub_CP_Trigger, ["WEST", "PRESENT", true]] remoteExec ["setTriggerActivation", 0, true];
		[_Sub_CP_Trigger, ["vehicle player in thislist", 
		"
			_trigger = thisTrigger;

			_Sub_CP = getPos _trigger nearestObject 'Sign_Arrow_Large_Cyan_F';
				
			_Sub_CP_Name_str = vehicleVarName _Sub_CP;

			_Sub_CP_Num_str = _Sub_CP_Name_str select[7];

			_Sub_CP_Num_Add_str = 'Next_Sub_CP_Num = 1 + ' + (_Sub_CP_Num_str);
			
			[] call compile _Sub_CP_Num_Add_str;
		
			if (Next_Sub_CP_Num isEqualTo SUB_CP_NUM) then {
				player setVariable ['Sub_CP_obj', FINISH_LINE, true];
			} else {
				_Sub_CP_str = 'Sub_CP_obj = Sub_CP_' + (str Next_Sub_CP_Num);
				[] call compile _Sub_CP_str;
				player setVariable ['Sub_CP_obj', Sub_CP_obj, true];
			};

			[Next_Sub_CP_Num, 2, localPlayerUID, false, true] remoteExec ['NJP_Server_fnc_updateRaceHash', 2];

		", ""] ] remoteExec ["setTriggerStatements", 0, true];
		[_Sub_CP_Trigger, 0.5] remoteExec ["setTriggerInterval", 0, true];
	};
} forEach (allMissionObjects "Sign_Arrow_Large_Cyan_F");

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Completed Initializing Sub Checkpoints.";
diag_log format ["|Armakart System| : Time for Sub Checkpoints to init: %1.", diag_tickTime];
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";
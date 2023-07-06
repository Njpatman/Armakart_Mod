if (Is_Spectator) exitWith {};

waitUntil {!isNull player && !isNil "RACE_PHASE"};

uiSleep 1;

if (RACE_PHASE isEqualTo "kartCustomization" && !Is_Spectator && didJIP) exitWith {
	_Search_Array = nearestObjects [getPos player, ["Car", "Truck"], 12];
	_Kart = _Search_Array select 0;
	player moveInDriver _Kart;

	createDialog "Customization_Menu";

	systemChat "|Armakart System| : JIP'd Into Customization Phase, have fun in the race!";

	("Timer" call BIS_fnc_rscLayer) cutRsc ["Timer", "PLAIN"];

	call NJP_Client_Fnc_UI_Color_Swap;

	waitUntil {!isNull objectParent player};

	//Makes player/player vic invincible
	player allowDamage false;
	vehicle player allowDamage false;

	//Sets player vic fuel to 0
	vehicle player setFuel 0;

	call NJP_Client_Fnc_Pre_Race_Phase;
};

if (RACE_PHASE isEqualTo "Track_Voting_Phase" && !Is_Spectator && didJIP) exitWith {
	_Search_Array = nearestObjects [getPos player, ["Car", "Truck"], 12];
	_Kart = _Search_Array select 0;
	player moveInDriver _Kart;

	createDialog "Track_Voting_Phase";

	systemChat "|Armakart System| : JIP'd Into Voting Phase, have fun in the race!";

	("Timer" call BIS_fnc_rscLayer) cutRsc ["Timer", "PLAIN"];

	["Edit_Track_Voting_Phase"] call NJP_Client_Fnc_GUI_Edit;

	waitUntil {!isNull objectParent player};

	//Makes player/player vic invincible
	player allowDamage false;
	vehicle player allowDamage false;

	//Sets player vic fuel to 0
	vehicle player setFuel 0;

	call NJP_Client_Fnc_Pre_Race_Phase;
};

if (RACE_PHASE isEqualTo "Weather_Voting_Phase" && !Is_Spectator && didJIP) exitWith {
	_Search_Array = nearestObjects [getPos player, ["Car", "Truck"], 12];
	_Kart = _Search_Array select 0;
	player moveInDriver _Kart;

	createDialog "Weather_Voting_Menu";

	systemChat "|Armakart System| : JIP'd Into Weather Voting Phase, have fun in the race!";

	("Timer" call BIS_fnc_rscLayer) cutRsc ["Timer", "PLAIN"];

	["Edit_Voting_Phase"] call NJP_Client_Fnc_GUI_Edit;

	waitUntil {!isNull objectParent player};

	//Makes player/player vic invincible
	player allowDamage false;
	vehicle player allowDamage false;

	//Sets player vic fuel to 0
	vehicle player setFuel 0;

	call NJP_Client_Fnc_Pre_Race_Phase;
};


if (RACE_PHASE isEqualTo "Race_Started" && !Is_Spectator && didJIP) exitWith {
	Player_Finished = true;

	_Group = createGroup sideLogic;

	[player] joinSilent _Group;

	[true] call ace_spectator_fnc_setSpectator;

	disableSerialization;

	//Remove timer display
	( "Timer" call BIS_fnc_rscLayer ) cutText ["", "PLAIN"];

	"Customization_Timer_Layer" cutFadeOut 0.001;

	closeDialog 1235;
	closeDialog 1234;

	"Black_Screen_Layer" cutText ["", "BLACK IN", 3];

	hint "Sadly, you've joined too late. Armakart doesn't allow JIPs past race start, enjoy watching the carnage in spectator!";

	systemChat "|Armakart System| : JIP'd past race start, pushing into spectator...";

	uiSleep 5;

	if (!isNull objectParent player) then {
		deleteVehicle vehicle player;
	};
};

if (RACE_PHASE isEqualTo "Race_Stopped" && !Is_Spectator && didJIP) exitWith {
	Player_Finished = true;

	_Group = createGroup sideLogic;

	[player] joinSilent _Group;

	[true] call ace_spectator_fnc_setSpectator;

	disableSerialization;

	//Remove timer display
	( "Timer" call BIS_fnc_rscLayer ) cutText ["", "PLAIN"];

	"Customization_Timer_Layer" cutFadeOut 0.001;

	closeDialog 1235;
	closeDialog 1234;

	"Black_Screen_Layer" cutText ["", "BLACK IN", 3];

	hint "Sadly, you've joined too late. The Race has ended";

	systemChat "|Armakart System| : JIP'd past race end, pushing into spectator...";
};
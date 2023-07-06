/* 
*
* - Basically an extension of init.sqf just so all these commands don't clutter init.sqf if another unit wants to integrate armakart into their mission framework for a mission.
* 
*/

//- Variables that are handled globally -\\

// Time \\

	//-Certain maps have different timescales, these are just time variables the voting phase uses to skip to (set each so the specified time shown actually sets it to early morning, late afternoon, etc.)

	Time_Early_Morning_Num = 5.45;

	Time_Noon_Num = 12;

	Time_Late_Afternoon_Num = 19.15;

	Manual_Checkpoint_Array = []; // Insert string of Checkpoint name, should look something like: ['CP_4', 'CP_7', 'CP_12'];

	Manual_Sub_Checkpoint_Array = []; // Insert string of Sub Checkpoint name, should look something like: ['Sub_CP_9', 'Sub_CP_13', 'Sub_CP_24'];

if (hasInterface) then {
	[] spawn {
		waitUntil { !isNull player };

		// Exit if spectator
		if (hasInterface && typeOf player isEqualTo "ace_spectator_virtual" || player in ([] call ace_spectator_fnc_players)) exitWith {  // Check if player, even a host
			Player_Finished = true;
			UI_Color = [0.133,0.349,0.522,0.65];
			UI_Color_int = [0,11] call BIS_fnc_randomInt;

			Is_Spectator = true;

			systemChat "|Armakart System| : Spectator Client initialization completed!";
		};

		//Sets player vic fuel to 0
		vehicle player setFuel 0;
					
		//Makes player/player vic invincible
		player allowDamage false;
		vehicle player allowDamage false;

		// NAMETAGS
		WHA_NAMETAGS_TESTLOOP = [{{WHA_NAMETAGS_PLAYER reveal [_x,4]} forEach allUnits;}, 15, []] call CBA_fnc_addPerFrameHandler;

		//Sets group name for spectator boys
		group player setGroupIdGlobal [name player];
		player setVariable ["Current_Place", 0, true];

		openGPS true; // Opens GPS by default - Added 12JULY2022

		//Sets players initial character
		["Farmer"] call NJP_Client_fnc_Character_Swap;

		//Compiles and applies briefing to players
		call NJP_Client_fnc_Briefing;

		Starting_Pos = getPosASL vehicle player;
		Starting_VectorUp = vectorUp vehicle player;
		Is_Spectator = false;

		systemChat "|Armakart System| : Client initialization completed!";

		call NJP_Client_fnc_JIP_Check;
	};	
};

//Setsup the Systemchat at the end of the players individual race which tells them their place
KARTS_FINISHED = 0;

//Setsup "Places"
Places = [];

//Setsup "Loading_Orbit"
Loading_Orbit = true;

//Setsup "Scoreboard_Active"
Scoreboard_Active = false;

//Number of Laps/Checkpoints
Laps_number = 3; // Can be as high as you want

//Customization Phase Time
kartCustomization_Time = 55;

//Voting Phase
Voting_Phase_Enabled = 1;

Voting_Phase_Time = 25;

//Powerup Creep
Powerup_Creep_Enabled = 1;

//Sets the color values for UI Color Toggle function
Light_Blue = [0.133,0.349,0.522,0.65];
Light_Green = [0.114,0.639,0.255,0.65];
Light_Red = [0.749,0.141,0.129,0.65];
Light_Orange = [0.961,0.404,0.106,0.65];
Dark_Blue = [0,0.051,1,0.65];
Purple = [0.584,0,1,0.65];
Pink = [1,0.02,0.855,0.65];
Blue_violet = [0.451,0.4,0.741,0.65];
Bronze = [0.69,0.549,0.341,0.65];
Rose_Gold = [0.718,0.431,0.475,0.65];
Yellow = [1,1,0,0.65];
Khaki = [0.741,0.718,0.42,0.65];

onPreloadFinished { [[],{ Players_Preloaded = Players_Preloaded + 1 }] remoteExec ["Spawn", 2, false]; };

//Setsup variables for Weather Voting
Weather_Clear = 0;
Weather_Cloudy = 0;
Weather_Foggy = 0;
Weather_Light_Rain = 0;
Weather_Stormy = 0;

//Setsup variables for Time Voting
Time_Early_Morning = 0;
Time_Noon = 0;
Time_Late_Afternoon = 0;
Time_Night = 0;
Time_Night_Full_Moon = 0;

//Setsup variables for Track Voting
Track_Harbor = 0;
Track_Docks = 0;
Track_Sewers = 0;
Track_Temple = 0;
Track_BoatAndBoogie = 0;
Track_RainbowRoad = 0;
Track_Random = 0;

//- Server Init -\\
if (isServer) then 
{

	Loaded_CP_NUM = 0;
	Loaded_SUB_CP_NUM = 0;
	Loaded_PWR_BLK_NUM = 0;

	Players_Preloaded = 0;
	Players_Loading_Vote = 0;

	playersRaceHash = createHashMap;
	Places_Live = [];

	SewerOverwrite = false;

	//Pre-Race phase START!!
	[] spawn NJP_Server_fnc_raceInit;
	
	"|Armakart System| : Server initialization completed!" remoteExec ["systemChat", 0, true];

};



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------------------------------------------------
//	Whales Nametags Settup. Feel free to modify.
//------------------------------------------------------------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//	Main Values																	(Default values)
WHA_NAMETAGS_DRAWCURSORONLY = false;	//	Only draw nametags on mouse cursor. 		(Default: false)
										//	Can save FPS in crowded areas.
										//	Clients can change with CBA settings menu.
								
//WHA_NAMETAGS_ACTIONKEY = "timeInc"; 	//	Key that can be pressed to toggle tags.		("timeInc")
										//	Default is "timeInc", which is normally
										//	the (=) key. Other keys available here:
										//	https://community.bistudio.com/wiki/inputAction/actions/bindings
										//	Don't want any key? Comment out the line.
								
WHA_NAMETAGS_NIGHT = false;				//	Whether night will affect tag visibility.	(true)

//	Information Shown
WHA_NAMETAGS_SHOW_GROUP 		= false;	//	Show group name under unit's name. 			(true)
WHA_NAMETAGS_SHOW_ROLE			= false; 	//	Show unit's role (rifleman, driver). 		(true)
WHA_NAMETAGS_SHOW_VEHICLEINFO 	= false;	//	Show vehicle info. Requires SHOW_ROLE.		(true)

//	Draw Distances

WHA_NAMETAGS_DRAWDISTANCE_CURSOR = 150; //	Distance to draw nametags when pointing at a unit.	(20)
										//	Should be greater than DISTANCE_ALL.
										//	Can be altered significantly depending on player FOV.
WHA_NAMETAGS_DRAWDISTANCE_NEAR = 100; 	//	Distance within which all nametags will be drawn.	(10)
										//	Increasing this will cost performance.
										//	Due to a bug this will seem ~3m shorter in third person.
										//	If you want to truly disable non-cursor tags, set this to 0.
//	Font Fade
WHA_NAMETAGS_FADETIME = 1.5;			//	Fade time for cursor tags after player mouses away.	(1)

//	Text Configuration: Typeface
//	To manually alter these options, see functions\nametagResetFont.sqf.		
//	Options:
//	- "Roboto" (DEFAULT)
//	- "RobotoLight"
//	- "Purista"
//	- "PuristaLight"
//	- "Etelka"
//	- "Tahoma"
WHA_NAMETAGS_FONT_FACE = "Roboto";			//	Typeface set for nametag system.			("Roboto")

//	Text Configuration: Size

WHA_NAMETAGS_FONT_SIZE_RAW = 0.044;			//	Default raw font size.						(0.036)
											//	Used directly for names, and used with
											//	below modifiers for all else.
WHA_NAMETAGS_FONT_SIZE_SEC_MULTI =	0.861;	//	Multiplier for group and role tags.			(0.861)
WHA_NAMETAGS_FONT_SIZE_MULTI = 1;			//	A general multiplier that can be used		(1)
											//	if you don't like the other ones.
											//	Multipliers may be overriden by CBA settings.
//	Text Configuration: Spacing
WHA_NAMETAGS_FONT_SPREAD_MULTI = 1;			//	Multiplier for vertical font spacing.		(1)
											//	may be overriden by CBA settings.
								
//	Text Configuration: Color
//	To manually alter these options, see functions\nametagResetFont.sqf.
//	Options:
//	- WHGreen
//	- ACERust
//	- TMTMTeal
//	- COALCrimson
//	- FAWhite
//	- STSand
//	- BromaPurple
WHA_NAMETAGS_FONT_COLOR = "COALCrimson";	//	Font color set for nametag system.			("WHGreen")

//	Text Configuration: Position
WHA_NAMETAGS_FONT_HEIGHT_ONHEAD = true;	//	Attaches nametags to head (like ACE)		(false)



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------------------------------------------------
//	Whales Nametags Functions and Scripts Settup. Please do not modify past this line.
//------------------------------------------------------------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//	Make sure this isn't a dedicated server or headless client.
if (!hasInterface) exitWith {};

//	Global variable that will be flipped on and off using the disableKey and CBA.
WHA_NAMETAGS_ON = true; 

//	Determine which mods are active.
#include "Armakart_Client_Functions\Armakart_Client_Nametag_Functions\Armakart_Nametags_Include\wha_nametags_checkMods.sqf";


//------------------------------------------------------------------------------------
//	Configuration and settings import and setup.
//------------------------------------------------------------------------------------

//	Allows for player (client) configuration of other settings.
#include "Armakart_Client_Functions\Armakart_Client_Nametag_Functions\Armakart_Nametags_Include\wha_nametags_settings.sqf"


//------------------------------------------------------------------------------------
//	More preparation.
//------------------------------------------------------------------------------------

//	Let the player initialize properly.
waitUntil{!isNull player};
waitUntil{player == player};

//	Variable that will be used to keep track of Arma's day/night cycle.
WHA_NAMETAGS_VAR_NIGHT = 1;

//	Reset font spacing and size to (possibly) new conditions.
call wha_nametags_fnc_resetFont;

//	Setting up cursor cache and fader.
WHA_NAMETAGS_CACHE_CURSOR = objNull;
WHA_NAMETAGS_CACHE_CURSOR_DATA = [];
WHA_NAMETAGS_CACHE_FADE = [[],[],[]];

//	Wait for player to get ingame.
waitUntil {!isNull (findDisplay 46)};

//	Setting up our disableKey (Default '+')
#include "Armakart_Client_Functions\Armakart_Client_Nametag_Functions\Armakart_Nametags_Include\wha_nametags_disableKey.sqf"


//------------------------------------------------------------------------------------
//	Keep an updated cache of all tags to draw.
//------------------------------------------------------------------------------------

#include "Armakart_Client_Functions\Armakart_Client_Nametag_Functions\Armakart_Nametags_Include\wha_nametags_cacheLoop.sqf"


//------------------------------------------------------------------------------------
//	Render nametags from the cache every frame.
//------------------------------------------------------------------------------------

WHA_NAMETAGS_EVENTHANDLER = addMissionEventHandler 
["Draw3D", 
{
	if WHA_NAMETAGS_ON then
	{	call wha_nametags_fnc_onEachFrame	};
}];

// KARTS : EH to remove nametags upon death
player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	WHA_NAMETAGS_ON = false;
}];
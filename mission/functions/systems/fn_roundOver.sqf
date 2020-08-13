/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_roundOver

Description:
	Execute end-of-round events based on the subfunction name provided

Parameters:
	0 : STRING - Subfunction name
	1 : ANY    - Subfunction arguments

Return:
	Nothing
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_system_fnc_roundOver

#include "..\macros.inc"
#include "..\defines.inc"

#define VAR_CAMERA FUNC_SUBVAR(camera)

#define DIALOG_W 100
#define DIALOG_H 140

SWITCH_SYS_PARAMS;

switch _mode do {
	case "server":{
		// someone has already placed first
		if ROUND_OVER exitWith {};

		missionNameSpace setVariable ["GG_s_roundWinner",_params,true];

		private _winnerName = _params getVariable ["GG_c_name",name _params];
		["client",[_winnerName,getPlayerUID _params]] remoteExec [QUOTE(THIS_FUNC),[0,-2] select isDedicated];

		private _weaponPool = missionNameSpace getVariable ["GG_s_weaponPool",[]];
		private _scores = [] call GG_system_fnc_getLeaderboardStats;

		// https://github.com/ConnorAU/SQFDiscordEmbedBuilder
		[
			"GunGame","","","",false,
			[
				[
					serverName,
					[
						"**Map**: " + getText(configFile >> "CfgWorlds" >> worldName >> "description"),
						"**Location**: " + GG_s_votedMapName,
						"**Round Duration**: " + ([diag_tickTime - GG_s_roundStartTick,"MM:SS"] call BIS_fnc_secondsToString),
						"**Round Winner**: " + _winnerName,
						"",
						"**Scoreboard**:"
					] joinString "\n",
					"https://github.com/ConnorAU/A3GunGame",
					"009fdd",false,"","",[],[],
					[
						["Player",_scores apply {_x#3} joinString "\n",true],
						["Weapon",_scores apply {format["%1 of %2",((_x#0)+1) min (count _weaponPool),count _weaponPool]} joinString "\n",true],
						["Kills / Deaths / KDR",_scores apply {format["%1 / %2 / %3",_x#1,_x#2,(([_x#1,1] select (_x#1 == 0))/([_x#2,1] select (_x#2 == 0)))toFixed 2]} joinString "\n",true]
					]
				]
			]
		] call (missionNameSpace getVariable ["DiscordEmbedBuilder_fnc_buildSqf",{}]);

		[] call GG_ai_fnc_clean;

		uisleep 25;

		private _maxRounds = ["get","MaxRounds"] call GG_system_fnc_params;
		if (_maxRounds > 0) then {
			if (isNil "GG_s_roundsPlayed") then {GG_s_roundsPlayed = 0};
			GG_s_roundsPlayed = GG_s_roundsPlayed + 1;
			if (GG_s_roundsPlayed >= _maxRounds) then {
				DLOG("Maximum rounds played");
				endMission "WINNER";
			};
		} else {
			// Reset counter if they changed the value in the lobby mid-session
			GG_s_roundsPlayed = 0;
		};

		[] spawn GG_setup_fnc_server;
	};
	case "client":{
		_params params ["_winnerName","_winnerUID"];

		playSound (["Defeat","Victory"]select(_winnerUID == getPlayerUID player));

		missionNameSpace setVariable ["RscStatic_mode",[0]];
		"GG_c_later_static" cutRsc ["RscStatic","PLAIN"];

		private _vol = soundVolume;
		0.25 fadeSound 1;
		setViewDistance 2000;

		["destroy"] call GG_ui_fnc_miniMap;
		["destroy"] call GG_ui_fnc_leaderboardMini;
		["destroy"] call GG_ui_fnc_weaponList;
		["initCam"] call THIS_FUNC;

		// i got stuck on a ladder at the end of the game one time,
		if (["ladder",animationstate player] call BIS_fnc_instring) then {
			{
				player action ["LadderOff",_x];
			} foreach nearestobjects[player,["house_f"],50];
		};
		player setpos (markerPos "respawn");

		private _scores = [] call GG_system_fnc_getLeaderboardStats;
		private _myPlace = (_scores findIf {_x#4 == getPlayerUID player})+1;

		// https://steamcommunity.com/sharedfiles/filedetails/?id=1493485159
		[
			["UpdateDetails","Round over"],
			["UpdateState",format[
				"Finished in %1%2 place",_myPlace,switch _myPlace do {
				case 1;
				case 21:{"st"};
				case 2;
				case 22:{"nd"};
				case 3:{"rd"};
				default {"th"};
			}]],
			["UpdatePartySize",0]
		] call (missionNameSpace getVariable["DiscordRichPresence_fnc_update",{}]);

		// https://github.com/ConnorAU/A3ExtendedChat
		private _emoji = ["getImage","party_popper"] call (missionNameSpace getVariable ["CAU_xChat_fnc_emoji",{""}]);
		["systemChat",format["%1 %2 won the round! %1",[":party_popper:",""] select (_emoji == ""),_winnerName]] call (missionNameSpace getVariable ["CAU_xChat_fnc_sendMessage",{}]);

		[format[
			"<t size='1.5' shadow=2><t color='%2'>%1</t> won the round!</t>",_winnerName,
			([COLOR_ACTIVE_RGBA] apply {_x call BIS_fnc_parseNumber}) call BIS_fnc_colorRGBtoHTML
		],-1,-1,8,1] call BIS_fnc_dynamicText;
		uisleep 1;
		["init",[true]] call GG_ui_fnc_leaderboard;
		uisleep 18;
		["destroy"] call GG_ui_fnc_leaderboard;

  		"GG_c_layer_endround" cutText ["","BLACK OUT",1];
		1 fadeSound _vol;
		uisleep 1;
		[] spawn GG_setup_fnc_client;
		["destroyCam"] call THIS_FUNC;
  		"GG_c_layer_endround" cutText ["","BLACK IN",1];
	};
	case "initCam":{
		private _combatZone = markerPos "GG_CombatZone";
		_combatZone set [2,5];
		private _startPos = _combatZone getPos [200,random 360];
		_startPos set [2,15];

		VAR_CAMERA = "CAMERA" camCreate [0,0,1.17];
		VAR_CAMERA cameraEffect ["INTERNAL","BACK"];
		showCinemaBorder false;
		camUseNVG false;
		VAR_CAMERA camSetFOV 0.25;
		VAR_CAMERA camSetPos _startPos;
		VAR_CAMERA camSetTarget _combatZone;
		VAR_CAMERA camCommit 0;

		VAR_CAMERA camSetPos (_startPos vectorAdd [0,0,80]);
		VAR_CAMERA camSetTarget (_combatZone vectorAdd [0,0,80]);
		VAR_CAMERA camCommit 40;
	};
	case "destroyCam":{
		VAR_CAMERA cameraEffect ["TERMINATE","BACK"];
		camDestroy VAR_CAMERA;
	};
};

nil

/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_setup_fnc_server

#include "..\defines.inc"

// this all needs to be done before waiting for players when the round is reset due to no players connected
missionNameSpace setVariable ["GG_s_killsPerWeapon",nil,true];
missionNameSpace setVariable ["GG_s_weaponPool",nil,true];
missionNameSpace setVariable ["GG_s_weaponPoolCondition",nil,true];
missionNameSpace setVariable ["GG_s_roundWinner",nil,true];
deleteMarker "GG_CombatZone";
[] call GG_ai_fnc_clean;

DLOG("Waiting for player to join the session");
waitUntil {count allPlayers > 0};

if (isNil "GG_s_firstInitComplete") then {
	setTimeMultiplier 0.1;

	addMissionEventHandler["PlayerConnected",{_this spawn GG_eventhandler_fnc_playerConnected}];
	addMissionEventHandler["HandleDisconnect",{call GG_eventhandler_fnc_handleDisconnect}];

	["init"] call GG_system_fnc_params;

	west setFriend [west,0];
	
	GG_s_firstInitComplete = true;
};

["pending"] call GG_system_fnc_params;
[] call GG_system_fnc_setWeather;
["server"] call GG_system_fnc_voteMap; 
[] call GG_system_fnc_setWeaponPool;
[] call GG_ai_fnc_init;

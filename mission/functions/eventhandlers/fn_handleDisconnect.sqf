/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_eventhandler_fnc_handleDisconnect

#include "..\defines.inc"

params ["_unit", "_id", "_uid", "_name"];

if (count allPlayers == 0) then {
	// Bug hunting
	private _log = format["No players connected, resetting mission: %1",allPlayers];
	DLOG(_log);

	// reset the round, no players are connected
	[] spawn GG_setup_fnc_server;
};

[] call GG_system_fnc_resizeCombatZone;

private _log = format["Player disconnected: %1 (%2)",_name,_uid];
DLOG(_log);
deleteVehicle _unit;
false;
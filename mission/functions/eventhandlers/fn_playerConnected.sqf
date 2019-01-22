/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_eventhandler_fnc_playerConnected

#include "..\defines.inc"

params ["_id", "_uid", "_name", "_jip", "_owner"];

private _log = format["Player connected: %1 (%2)",_name,_uid];
DLOG(_log);

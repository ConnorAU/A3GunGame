/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "..\defines.inc"

if (!COMBAT_ZONE_EXISTS || ROUND_OVER) exitWith {};

private _allUnits = count allUnits;
if (_allUnits == 0) exitWith {};

private _modifier = 0.8 max (_allUnits/8) min 2.5;
"GG_CombatZone" setMarkerSize (GG_s_votedMapSize apply {_x*_modifier});

["modifyZoom"] remoteExecCall ["GG_ui_fnc_miniMap",[0,-2] select isDedicated];
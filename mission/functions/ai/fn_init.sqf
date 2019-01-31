/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define GG_ai_fnc_init

#include "..\defines.inc"


private _numberOfAI = "AIUnits" call BIS_fnc_getParamValue;

for "_i" from 1 to _numberOfAI do {
	[] call GG_ai_fnc_create;
};

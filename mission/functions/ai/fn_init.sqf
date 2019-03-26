/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define GG_ai_fnc_init

#include "..\defines.inc"


private _numberOfAI = ["get","AIUnits"] call GG_system_fnc_params;

for "_i" from 1 to _numberOfAI do {
	[] call GG_ai_fnc_create;
};

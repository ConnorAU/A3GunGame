/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "..\defines.inc"

// Select by UID to avoid the occasional and unlikely doubleup from dead units and their alive counter-parts
// Could do it by alive units only but that would hide players from the leaderboard while they're dead
private _selected = [];
private _list = allPlayers select {
	!isNil {_x getVariable "GG_c_name"} && {_selected pushBackUnique (getplayeruid _x) > -1}
} apply {[
	_x getVariable ["GG_c_score",0],
	_x getVariable ["GG_c_kills",0],
	_x getVariable ["GG_c_deaths",0],
	_x getVariable ["GG_c_name",""],
	getPlayerUID _x,
	_x
]};
_list sort false;
_list

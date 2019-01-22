/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "\a3\3den\ui\dikcodes.inc"
#include "..\defines.inc"

params ["", "_key"];

if !(ROUND_OVER) then {
	GG_c_modifyVolume = if (count (actionKeys "User1") > 0) then {
		inputAction "User1" > 0
	} else {
		_key == DIK_F1
	};

	if (inputAction "NetworkStats" > 0) then {
		GG_c_leaderboardShown = true;
		["init"] call GG_ui_fnc_leaderboard;
	};
};

GG_c_modifyVolume
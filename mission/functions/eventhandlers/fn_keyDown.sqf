/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "..\dikcodes.inc"
#include "..\defines.inc"

params ["", "_key", "_shift"];

if !(ROUND_OVER) then {
	GG_c_modifyVolume = if (count (actionKeys "User1") > 0) then {
		inputAction "User1" > 0
	} else {
		_key == DIK_F1
	};

	if (inputAction "NetworkStats" > 0) then {
		["init"] call GG_ui_fnc_leaderboard;
	};
};

GG_c_modifyVolume || _key in [DIK_F2] || (_key in [DIK_V] && _shift)
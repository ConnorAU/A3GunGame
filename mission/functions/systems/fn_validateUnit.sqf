/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_system_fnc_validateUnit

#include "..\defines.inc"

// There is a rare bug where units don't properly load.
// This can cause players to be invisible, unable to rank up, not appear in the leaderboard and most likely experience other unknown issues.
if (isNull param[0,objNull,[objNull]]) then {
	if (remoteExecutedOwner > 2) then {
		"BadUnit" remoteExec ["endMission",remoteExecutedOwner];
	};
};
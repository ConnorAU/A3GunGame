/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_validateUnit

Description:
	Verifies the provided unit does actually exist as a global object. This is to combat a rare bug where units don't properly load.
	This can cause players to be invisible, unable to rank up, not appear in the leaderboard and most likely experience other unknown issues.

Parameters:
	0 : OBJECT - Unit object

Return:
	Nothing
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_system_fnc_validateUnit

#include "..\defines.inc"

if (isNull param[0,objNull,[objNull]]) then {
	if (remoteExecutedOwner > 2) then {
		"BadUnit" remoteExec ["endMission",remoteExecutedOwner];
	};
};

nil

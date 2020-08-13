/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_resizeCombatZone

Description:
	Modifies the combat zone size based on the current number of units inside

Parameters:
	None

Return:
	Nothing
---------------------------------------------------------------------------- */

#include "..\defines.inc"

if (!COMBAT_ZONE_EXISTS || ROUND_OVER) exitWith {};

private _allUnits = count allUnits;
if (_allUnits == 0) exitWith {};

private _modifier = 0.8 max (_allUnits/8) min 2.5;
"GG_CombatZone" setMarkerSize (GG_s_votedMapSize apply {_x*_modifier});

["modifyZoom"] remoteExecCall ["GG_ui_fnc_miniMap",[0,-2] select isDedicated];

nil

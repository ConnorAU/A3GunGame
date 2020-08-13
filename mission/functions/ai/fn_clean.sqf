/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_ai_fnc_clean

Description:
	Delete all AI units and AI groups

Parameters:
	None

Return:
	Nothing
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_ai_fnc_clean

#include "..\defines.inc"

{
	if (!isPlayer _x) then {
		deleteVehicle _x;
	};
} foreach allUnits;
{
	if ((_x getVariable ["GG_s_group_AI",false]) && {count units _x == 0}) then {
		deleteGroup _x;
	};
} foreach allGroups;

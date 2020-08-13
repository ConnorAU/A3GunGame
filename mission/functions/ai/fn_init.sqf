/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_ai_fnc_init

Description:
	Initialize AI bots for the round

Parameters:
	None

Return:
	Nothing
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_ai_fnc_init

#include "..\defines.inc"

private _numberOfAI = ["get","AIUnits"] call GG_system_fnc_params;

for "_i" from 1 to _numberOfAI do {
	[] call GG_ai_fnc_create;
};

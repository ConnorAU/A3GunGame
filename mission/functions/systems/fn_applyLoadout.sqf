/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_applyLoadout

Description:
	Apply loadout to unit

Parameters:
	0 : OBJECT - Unit to apply loadout to

Return:
	Nothing
---------------------------------------------------------------------------- */

params [["_unit",player,[objNull]]];
_unit setUnitLoadout (call GG_config_fnc_loadouts);

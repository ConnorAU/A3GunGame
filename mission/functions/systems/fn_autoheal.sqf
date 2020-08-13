/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_autoheal

Description:
	None

Parameters:
	0 : OBJECT - Unit to apply autoheal effect to

Return:
	Nothing
---------------------------------------------------------------------------- */

#include "..\defines.inc"

// using param because # gave a zero divisor error when the round ended
#define UNIT_DAMAGE (getAllHitPointsDamage _unit param [2,[]])

params [["_unit",player,[objNull]]];

uiSleep 8;

if (isNull _unit || {!alive _unit}) exitWith {};

while {alive _unit && {(UNIT_DAMAGE findIf {_x > 0}) > -1}} do {
	// Run this unscheduled to ensure all values are updated before new values are applied in the damage handler
	isNil {
		{
			if (_x > 0) then {
				_unit setHitIndex [_forEachIndex,(_x - 0.05) max 0];
			};
		} forEach UNIT_DAMAGE;
		_unit setVariable ["GG_c_hitPointDamage",UNIT_DAMAGE];
	};

	uiSleep 0.5;
};

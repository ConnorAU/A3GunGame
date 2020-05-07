/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

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

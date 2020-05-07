/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_eventhandler_fnc_handleDamage

#include "..\defines.inc"

params ["_unit","","_damage","","","_hitIndex","_source"];
if (_hitIndex < 0) exitWith {0};

private _hitPointDamage = _unit getVariable ["GG_c_hitPointDamage",[]];
if (_hitPointDamage isEqualTo []) then {
	_hitPointDamage = (getAllHitPointsDamage _unit # 2) apply {0};
};

_damage = (_hitPointDamage#_hitIndex)+(["get","DamageModifier"] call GG_system_fnc_params)*(_damage-(_hitPointDamage#_hitIndex));
_unit setVariable ["GG_c_hitPointDamage",getAllHitPointsDamage _unit#2];

// take no damage if the round has been won
[_damage,0] select ROUND_OVER;
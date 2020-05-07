/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_eventhandler_fnc_handleDamage

#include "..\defines.inc"

#define VAR_LAST_DAMAGE QUOTE(FUNC_SUBVAR(lastDamage))

params ["_unit","","_damage","","","_hitIndex"];
if (_hitIndex < 0) exitWith {0};

private _hitPointDamage = _unit getVariable [VAR_LAST_DAMAGE,[]];
if (_hitPointDamage isEqualTo []) then {
	_hitPointDamage = (getAllHitPointsDamage _unit # 2) apply {0};
};

_damage = (_hitPointDamage#_hitIndex)+(["get","DamageModifier"] call GG_system_fnc_params)*(_damage-(_hitPointDamage#_hitIndex));
_hitPointDamage set [_hitIndex,_damage];
_unit setVariable [VAR_LAST_DAMAGE,_hitPointDamage];

// take no damage if the round has been won
[_damage,0] select ROUND_OVER;
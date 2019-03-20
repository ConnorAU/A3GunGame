/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_eventhandler_fnc_handleDamage

#include "..\defines.inc"

#define VAR_LAST_DAMAGE FUNC_SUBVAR(lastDamage)

params ["_unit","","_damage","","","_hitIndex"];
if (_hitIndex < 0) exitWith {0};

if (isNil QUOTE(VAR_LAST_DAMAGE)) then {
	VAR_LAST_DAMAGE = (getAllHitPointsDamage _unit # 2) apply {0};
};

_damage = (VAR_LAST_DAMAGE#_hitIndex)+(["DamageModifier",1] call BIS_fnc_getParamValue)*(_damage-(VAR_LAST_DAMAGE#_hitIndex));
VAR_LAST_DAMAGE set [_hitIndex,_damage];

// take no damage if the round has been won
[_damage,0] select ROUND_OVER;
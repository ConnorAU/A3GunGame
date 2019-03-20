/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_system_fnc_jump

#include "..\defines.inc"

#define VAR_JUMP_TICK FUNC_SUBVAR(tick)

params [["_unit",player,[objNull]]];
if (speed player < 10 || {currentWeapon player == "" || {currentWeapon player != primaryWeapon player}}) exitwith {};
if (isNil QUOTE(VAR_JUMP_TICK)) then {VAR_JUMP_TICK = 0};
if (VAR_JUMP_TICK > diag_tickTime) exitwith {};
VAR_JUMP_TICK = diag_tickTime + 1;
[_unit,"AovrPercMrunSrasWrflDf"] remoteExec ["switchMove",0];

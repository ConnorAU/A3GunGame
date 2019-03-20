/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_eventhandler_fnc_MPHit

#include "..\defines.inc"

#define VAR_AUTOHEAL_THREAD QUOTE(FUNC_SUBVAR(autoheal_thread))

params ["_unit", "_causedBy"];

if (_causedBy == player && {_unit != player}) then {
	[] spawn GG_ui_fnc_hitmarker;
};

// player & AI for hosted servers
if (local _unit) then {
	terminate (_unit getVariable [VAR_AUTOHEAL_THREAD,scriptNull]);
	_unit setVariable [VAR_AUTOHEAL_THREAD,[_unit] spawn GG_system_fnc_autoheal];
};
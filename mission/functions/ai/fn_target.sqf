/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define GG_ai_fnc_target

#include "..\defines.inc"

params [["_unit",objNull,[objNull]]];
if (isNull _unit) exitWith {};

private _units = allUnits select {alive _x && {_x != _unit && {_x inArea "GG_CombatZone"}}} apply {[_unit distance _x,getPosASL _x]};
_units sort true;

private _pos = if (count _units > 0) then {_units#0#1} else {
	getMarkerPos "GG_CombatZone";
};
_unit doMove _pos;
/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define GG_ai_fnc_monitor

#include "..\defines.inc"

params [["_unit",objNull,[objNull]]];
if (isNull _unit) exitWith {};

if !(_unit inArea "GG_CombatZone") exitWith {
	_unit setDamage 1;
};

private _target = assignedTarget _unit;

if (!isNull _target && {alive _target
	//([objNull,"VIEW"] checkVisibility [eyePos _unit,getPosASL _target]) > 0.25
}) exitWith {};

private _difficulty = ["get","AIDifficulty"] call GG_system_fnc_params;
private _units = allUnits select {alive _x && {_x != _unit && {_x inArea "GG_CombatZone"}}} apply {[_unit distance _x,_x]};
_units sort true;

private _target = _units param [0,[]] param [1,objNull];
private _pos = if (isNull _target) then {markerPos "GG_CombatZone"} else {
	if (_difficulty >= 0.75) then {
		_unit doTarget _target;
	};
	getPos _target;
};
_unit doMove _pos;
_unit setSpeedMode "FULL";

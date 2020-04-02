/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ai_fnc_moveToSpawn

#include "..\defines.inc"

#define SPAWN_MARKER "GG_CombatZone"

params [["_unit",objNull,[objNull]]];
if (isNull _unit) exitWith {};

if ROUND_OVER exitWith {
	_unit setPos (markerpos "respawn");
};

private _zoneCenter = markerPos SPAWN_MARKER;
private _zoneSize = markerSize SPAWN_MARKER;
_zoneSize = (_zoneSize select 0) max (_zoneSize select 1);
private _spawnPos = [];

for "_i" from 1 to 1000 do {
	scopeName "findSpawnLoop";
	private _thisPos = [_zoneCenter,0,(0.75 max (_i/20) min 1)*_zoneSize,1,0,0.35] call BIS_fnc_findSafePos;
	if (count _thisPos == 2) then {_thisPos pushback 0};
	_thisPos = ATLtoASL _thisPos;
	if (_thisPos inArea SPAWN_MARKER) then {
		private _isHidden = true;
		{
			if (alive _x && {getpos _x inArea SPAWN_MARKER}) then {
				private _eyePos = eyePos _x;

				private _eyeIntersect = lineIntersects[_eyePos,_thisPos vectorAdd [0,0,1.8],_x,_unit];
				private _bodyIntersect = lineIntersects[_eyePos,_thisPos vectorAdd [0,0,0.9],_x,_unit];
				private _footIntersect = lineIntersects[_eyePos,_thisPos,_x,_unit];

				if (false in [_eyeIntersect,_bodyIntersect,_footIntersect]) exitwith {
					_isHidden = false;
				};
			};
		} foreach allUnits;
		if _isHidden then {
			private _nearUnits = nearestObjects[ASLtoAGL _thisPos,["CAManBase"],25] select {alive _x};
			if (count _nearUnits < 1) then {
				_spawnPos = +_thisPos;
				breakOut "findSpawnLoop";
			};
		};
	};
};

if (count _spawnPos == 0) exitWith {
	uisleep 3;
	[] call THIS_FUNC;
};

_unit setPosASL _spawnPos;
_unit setDir (getDir _unit + (_unit getRelDir markerPos SPAWN_MARKER));
_unit setDamage 0;

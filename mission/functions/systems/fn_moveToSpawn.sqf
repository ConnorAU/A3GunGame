/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_moveToSpawn

Description:
	Move unit to a safe spawn location in the combat zone

Parameters:
	0 : OBJECT - Unit to move to spawn ppint

Return:
	Nothing
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_system_fnc_moveToSpawn

#include "..\defines.inc"

#define SPAWN_MARKER "GG_CombatZone"

if ROUND_OVER exitWith {
	player setPos (markerpos "respawn");
};

params [["_firstSpawn",false,[true]]];

"GG_c_layer_interlacing" cutRsc ["RscInterlacing","BLACK OUT",0];
"GG_c_layer_interlacing" cutFadeOut 1e14;

// there was an issue with this text staying on screen after spawn.
// I assume it was to do with this thread displaying the text after the thread at the bottom removed it
// So the uisleep is to try and avoid that
["<t shadow=2 >Finding safe spawn location...</t>",[-1,-1],[-1,-1],1e14,0.5] spawn BIS_fnc_dynamicText;
uiSleep 0.5;
if _firstSpawn then {
	// gradually spawn in at start of round
	uiSleep(((allPlayers find player)+1)/10);
};

private _deathPos = missionNameSpace getVariable ["GG_c_deathPos",[0,0,0]];
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

				private _eyeIntersect = lineIntersects[_eyePos,_thisPos vectorAdd [0,0,1.8],_x,player];
				private _bodyIntersect = lineIntersects[_eyePos,_thisPos vectorAdd [0,0,0.9],_x,player];
				private _footIntersect = lineIntersects[_eyePos,_thisPos,_x,player];

				if (false in [_eyeIntersect,_bodyIntersect,_footIntersect]) exitwith {
					_isHidden = false;
				};
			};
		} foreach allUnits;
		if _isHidden then {
			private _nearUnits = nearestObjects[ASLtoAGL _thisPos,["CAManBase"],25] select {alive _x};
			if (count _nearUnits < 1 && {ASLtoAGL _thisPos distance _deathPos > 40}) then {
				_spawnPos = +_thisPos;
				breakOut "findSpawnLoop";
			};
		};
	};
};

if (count _spawnPos == 0) exitWith {
	["<t shadow=2 >No safe spawn found, trying again...</t>",[-1,-1],[-1,-1],1e14,0.5] spawn BIS_fnc_dynamicText;
	uisleep 3;
	[] call THIS_FUNC;
};

player setPosASL _spawnPos;
player setDir (getDir player + (player getRelDir markerPos SPAWN_MARKER));
player setDamage 0;

missionNameSpace setVariable ["RscStatic_mode",[0]];
["",[-1,-1],[-1,-1],1,0] spawn BIS_fnc_dynamicText;
"GG_c_later_static" cutRsc ["RscStatic","PLAIN"];
"GG_c_layer_interlacing" cutText ["","PLAIN",0];

nil

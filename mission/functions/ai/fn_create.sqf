/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define GG_ai_fnc_create

#include "..\defines.inc"

if ROUND_OVER exitWith {};
private _difficulty = "AIDifficulty" call BIS_fnc_getParamValue;

private _group = createGroup[west,true];
private _unit = _group createUnit ["B_RangeMaster_F",getMarkerPos "respawn",[],0,"NONE"];
_unit setSkill _difficulty;
_unit allowFleeing (1-_difficulty);
_unit disableConversation true;
_unit enableStamina false;
_unit setCustomAimCoef (1-_difficulty);
_group setCombatMode "RED";
_group setBehaviour "COMBAT";
SVAR(_group,"GG_s_group_AI",true);

_unit addEventHandler ["HandleDamage",{call GG_eventhandler_fnc_handleDamage}];
_unit addMPEventHandler ["MPHit",{call GG_eventhandler_fnc_MPHit}];
_unit addMPEventHandler ["MPKilled",{call GG_eventhandler_fnc_MPKilled}];

[] call GG_system_fnc_resizeCombatZone;

[_unit] call GG_system_fnc_applyLoadout;
[_unit] call GG_ai_fnc_moveToSpawn;
[_unit] call GG_ai_fnc_applyWeapon;

_unit spawn {
	while {alive _this} do {
		[_this] call GG_ai_fnc_monitor;
		uiSleep 5;
	};
};

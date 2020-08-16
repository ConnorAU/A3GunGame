/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_ai_fnc_create

Description:
	Create an AI unit, prepare it to serve as a bot and start the monitor loop

Parameters:
	None

Return:
	Nothing
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_ai_fnc_create

#include "..\defines.inc"

if ROUND_OVER exitWith {};

private _difficulty = ["get","AIDifficulty"] call GG_system_fnc_params;
private _randomize = ["get","AIDifficultyRandom"] call GG_system_fnc_params;
if (_randomize == 1) then {
	private _difficultiesWeighted = [];
	private _difficultiesAll = getArray(missionConfigFile >> "Params" >> "AIDifficulty" >> "values");
	{
		_difficultiesWeighted append [_x,_forEachIndex + 1];
		if (_x == _difficulty) exitWith {};
	} forEach _difficultiesAll;
	_difficulty = selectRandomWeighted _difficultiesWeighted;
};

private _group = createGroup[west,true];
private _unit = _group createUnit ["B_RangeMaster_F",getMarkerPos "respawn",[],0,"NONE"];

_difficulty = _difficulty*0.01; // _difficulty/100 but avoiding a possible zero divisor error
_unit setSkill _difficulty;
_unit allowFleeing (1-_difficulty);
_unit disableConversation true;
_unit enableStamina false;
_unit setCustomAimCoef (1-_difficulty);

// https://github.com/ConnorAU/A3ExtendedChat
_unit setVariable ["CAU_xChat_unit_name",format["%1 (AI)",name _unit],true];

_group setCombatMode "RED";
_group setBehaviour "COMBAT";
_group setVariable ["GG_s_group_AI",true];

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

nil

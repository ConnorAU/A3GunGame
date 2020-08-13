/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_eventhandler_fnc_map

Information:
	https://community.bistudio.com/wiki/Arma_3:_Event_Handlers/addMissionEventHandler#Map
---------------------------------------------------------------------------- */

#include "..\defines.inc"

params ["_mapIsOpened", "_mapIsForced",["_transition",0,[0]]];

if (!_mapIsOpened || _mapIsForced || !COMBAT_ZONE_EXISTS) exitWith {};

(markerSize "GG_CombatZone") params ["_combatZoneX","_combatZoneY"];
private _combatZoneVal = if (_combatZoneX == _combatZoneY) then {_combatZoneX} else {_combatZoneX max _combatZoneY};

private _ctrlMap = findDisplay 12 displayCtrl 51;
_ctrlMap ctrlMapAnimAdd [
	_transition,((_combatZoneVal*0.25)/worldSize)*10,
	markerPos "GG_CombatZone"
];
ctrlMapAnimCommit _ctrlMap;

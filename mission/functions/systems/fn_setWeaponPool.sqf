/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_system_fnc_setWeaponPool

#include "..\defines.inc"

// If voting was cancelled due to the only player connecting,
// we need to cancel creating a weapon pool too
if (count allPlayers == 0) exitWith {};

private _weaponPool = [] call GG_config_fnc_weapons;
private _killStreakDefault = _weaponPool deleteAt 0;
_weaponPool deleteAt 0; // _condition

private _finalWeaponsPool = [];
private _weaponType = "WeaponType" call BIS_fnc_getParamValue;

if (_weaponType > 0) then {
	_finalWeaponsPool = _weaponPool#(_weaponType - 1) call BIS_fnc_arrayShuffle;
};

if (0 in [_weaponType,count _finalWeaponsPool]) then {
	{
		private _subPool = _weaponPool select _foreachIndex;
		for "_i" from 1 to 2 do {
			_finalWeaponsPool pushBack (_subPool deleteAt (floor random (count _subPool - 1)));
		};
	} foreach _weaponPool;
};

private _killStreak = "KillStreak" call BIS_fnc_getParamValue;
private _finalKillStreak = [_killStreak,_killStreakDefault] select (_killStreak == 0);
SVAR_J(MNS,"GG_s_killsPerWeapon",_finalKillStreak,true);
SVAR_J(MNS,"GG_s_weaponPool",_finalWeaponsPool,true);

DLOG("Selected kill streak: "+str _finalKillStreak);
DLOG("Selected weapons from pool:");
{
	private _log = format["    %1. %2",_foreachindex + 1,getText(configFile >> "CfgWeapons" >> _x >> "displayName")];
	DLOG(_log);
} foreach _finalWeaponsPool;
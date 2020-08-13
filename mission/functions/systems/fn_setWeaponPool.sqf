/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_setWeaponPool

Description:
	Set the weapon pool for the round

Parameters:
	None

Return:
	Nothing
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_system_fnc_setWeaponPool

#include "..\defines.inc"

// If voting was cancelled due to the only player connecting,
// we need to cancel creating a weapon pool too
if (count allPlayers == 0) exitWith {};

private _customPool = missionNamespace getVariable ["GG_admin_customWeaponPool",[]];
private _weaponPool = [] call GG_config_fnc_weapons;
private _killStreakDefault = _weaponPool deleteAt 0;
_weaponPool deleteAt 0; // _condition

private _finalWeaponsPool = [];

if (_customPool isEqualTo []) then {
	private _weaponType = ["get","WeaponType"] call GG_system_fnc_params;

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
} else {
	_finalWeaponsPool = +_customPool;
};

private _killStreak = ["get","KillStreak"] call GG_system_fnc_params;
private _finalKillStreak = [_killStreak,_killStreakDefault] select (_killStreak == 0);
missionNameSpace setVariable ["GG_s_killsPerWeapon",_finalKillStreak,true];
missionNameSpace setVariable ["GG_s_weaponPool",_finalWeaponsPool,true];

DLOG("Selected kill streak: "+str _finalKillStreak);
DLOG("Selected weapons from pool:");
{
	private _log = format["    %1. %2",_foreachindex + 1,getText(configFile >> "CfgWeapons" >> _x >> "displayName")];
	DLOG(_log);
} foreach _finalWeaponsPool;

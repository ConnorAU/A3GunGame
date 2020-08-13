/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_ai_fnc_applyWeapon

Description:
	Add weapon to the defined AI object. The weapon added depends on the current scores of active players.

Parameters:
	0 : OBJECT - AI unit

Return:
	Nothing
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_ai_fnc_applyWeapon

#include "..\defines.inc"

params [["_unit",objNull,[objNull]]];
if (isNull _unit) exitWith {};

private _weaponPool = missionNameSpace getVariable["GG_s_weaponPool",[]];
private _killsPerWeapon = missionNameSpace getVariable["GG_s_killsPerWeapon",2];

private _curIndex = 0 max (((selectRandom allPlayers) getVariable ["GG_c_score",0]) + selectRandom[0,1,-1]) min (count _weaponPool - 1);
private _weapon = _weaponPool#_curIndex;
private _magazine = getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")#0;

{_unit removeMagazine _x} foreach magazines _unit;
removeAllWeapons _unit;

while {_unit canAdd _magazine} do {
	_unit addMagazine _magazine;
};
_unit addWeapon _weapon;

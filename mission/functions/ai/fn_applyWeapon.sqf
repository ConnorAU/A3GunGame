/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "..\defines.inc"

params [["_unit",objNull,[objNull]]];
if (isNull _unit) exitWith {};

private _weaponPool = GVAR(MNS,"GG_s_weaponPool",[]);
private _killsPerWeapon = GVAR(MNS,"GG_s_killsPerWeapon",2);

private _curIndex = 0 max ((GVAR(selectRandom allPlayers,"GG_c_score",0)) + selectRandom[0,1,-1]) min (count _weaponPool - 1);
private _weapon = _weaponPool#_curIndex;
private _magazine = getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")#0;

{_unit removeMagazine _x} foreach magazines _unit;
removeAllWeapons _unit;

while {_unit canAdd _magazine} do {
	_unit addMagazine _magazine;
};
_unit addWeapon _weapon;

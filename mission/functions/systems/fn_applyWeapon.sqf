/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_applyWeapon

Description:
	Apply weapon to player based on current score

Parameters:
	0 : BOOL - true if the function was called by killing an enemy

Return:
	Nothing
---------------------------------------------------------------------------- */

#include "..\defines.inc"

params [["_calledByKill",false,[true]]];

private _weaponPool = missionNameSpace getVariable ["GG_s_weaponPool",[]];
private _killsPerWeapon = missionNameSpace getVariable ["GG_s_killsPerWeapon",2];

if (GG_c_killStreak >= _killsPerWeapon) then {
	GG_c_killStreak = 0;
	GG_c_score = GG_c_score + 1;
	player setVariable ["GG_c_score",GG_c_score,true];
};
if (GG_c_score >= count _weaponPool) exitWith {
	["server",player] remoteExec ["GG_system_fnc_roundOver",2];
};

private _curIndex = GG_c_score min (count _weaponPool - 1);
private _weapon = _weaponPool#_curIndex;
private _magazine = getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines")#0;

["update",[_weaponPool,_curIndex,_killsPerWeapon]] call GG_ui_fnc_weaponList;

if _calledByKill then {
	GG_c_fireMode = weaponState player # 2;
	playSound "NewWeapon";
};

if (currentWeapon player == _weapon) exitWith {};

// Prevent overriding end of round rich presence info
if !(ROUND_OVER) then {
	// https://steamcommunity.com/sharedfiles/filedetails/?id=1493485159
	[
		["UpdateState",getText(configFile >> "CfgWeapons" >> _weapon >> "displayName") call GG_system_fnc_fixDiscordString],
		["UpdatePartySize",_curIndex + 1],
		["UpdatePartyMax",count _weaponPool]
	] call (missionNameSpace getVariable["DiscordRichPresence_fnc_update",{}]);
};

{player removeMagazine _x} foreach magazines player;
removeAllWeapons player;

while {player canAdd _magazine} do {
	player addMagazine _magazine;
};
player addWeapon _weapon;

if (!isNil "GG_c_fireMode") then {
	private _weapon = currentWeapon player;
	private _ammo = player ammo _weapon;
	player setAmmo [_weapon, 0];
	player forceWeaponFire [_weapon,GG_c_fireMode];
	player setAmmo [_weapon,_ammo];
};

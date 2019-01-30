/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "..\defines.inc"

params ["_unit", "_killer"];

// If player or AI
if (local _unit) then {
	if (_unit == player) then {
		GG_c_deaths = GG_c_deaths + 1;
		GG_c_deathPos = getpos _unit;
		GG_c_cameraView = cameraView;
		SVAR_J(player,"GG_c_deaths",GG_c_deaths,true);

		GG_c_killStreak = 0;

		if (isNull _killer || {_killer == _unit}) then {
			// revert 1 weapon
			GG_c_score = (GG_c_score - 1) max 0;
			SVAR_J(player,"GG_c_score",GG_c_score,true);
			playSound "RevertWeapon";
		};
	};

	removeAllWeapons _unit;
	{_unit removeMagazine _x} foreach magazines _unit;

	{deleteVehicle _x} foreach nearestobjects[_unit,["WeaponHolderSimulated"],5];

	if (!isPlayer _unit) then {
		[] spawn {
			uiSleep getNumber (missionConfigFile >> "respawnDelay");
			[] call GG_ai_fnc_create;
		};
	};
};

if (local _killer) then {
	if (_killer == player) then {
		GG_c_kills = GG_c_kills + 1;
		GG_c_killStreak = GG_c_killStreak + 1;
		SVAR_J(player,"GG_c_kills",GG_c_kills,true);
		[true] spawn GG_ui_fnc_hitmarker;
		[true] call GG_system_fnc_applyWeapon;
	};
};

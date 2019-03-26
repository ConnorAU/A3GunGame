/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ui_fnc_weaponList
#define DISPLAY_NAME GG_displayWeaponList

#include "..\macros.inc"
#include "..\defines.inc"

#define DIALOG_Y safeZoneY + PX_HS(32)
#define DIALOG_H 80

#define CELL_Y_1 DIALOG_Y + PX_HS(SIZE_M)
#define CELL_Y_2 CELL_Y_1 + CELL_H
#define CELL_H PX_HA((DIALOG_H/2))
#define CELL_POS(y) [_ctrlTitlePos select 0,y,_ctrlTitlePos select 2,CELL_H]

disableSerialization;
SWITCH_SYS_PARAMS;

switch _mode do {
	case "onLoad":{
		uiNamespace setVariable [QUOTE(DISPLAY_NAME),_params#0];
	};
	case "init":{
		// Load the UI in unscheduled environment
		isNil {
			QUOTE(DISPLAY_NAME) cutRsc [QUOTE(DISPLAY_NAME),"PLAIN",-1,false];
			USE_DISPLAY(THIS_DISPLAY);
			USE_CTRL(_ctrlTitle,1);
			private _ctrlTitlePos = ctrlPosition _ctrlTitle;

			private _weaponPool = missionNameSpace getVariable ["GG_s_weaponPool",[]];
			private _weaponCtrls = [];
			for "_i" from 0 to (count _weaponPool - 1) do {
				private _ctrl = _display ctrlCreate ["ctrlStructuredText",-1];
				_ctrl ctrlSetStructuredText parsetext format["<t align='center' size='8' shadow='2'><img image='%1' /></t>",getText(configFile >> "CfgWeapons" >> _weaponPool#_i >> "picture")];
				_ctrl ctrlSetFade ([0,0.5]param[_i,1]);
				_ctrl ctrlSetPosition (if (_i==0) then {CELL_POS(CELL_Y_1)} else {CELL_POS(CELL_Y_2)});
				_ctrl ctrlCommit 0;
				_weaponCtrls pushback _ctrl;
			};

			_display setVariable ["weaponCtrls",_weaponCtrls];
		};
	};
	case "update":{
		_params params ["_weaponPool","_curIndex","_killsPerWeapon"];

		USE_DISPLAY(THIS_DISPLAY);
		if (isNull _display) exitWith {};

		USE_CTRL(_ctrlTitle,1);
		private _ctrlTitlePos = ctrlPosition _ctrlTitle;
		private _weaponCtrls = _display getVariable ["weaponCtrls",[]];
		private _killsTilProgress = _killsPerWeapon - GG_c_killStreak;

		_ctrlTitle ctrlSetText format[
			[
				"Next weapon in %1 kill%2",
				"Round victory in %1 kill%2"
			] select (_curIndex == (count _weaponPool - 1)),
			_killsTilProgress,
			["s",""] select (_killsTilProgress==1)
		];

		{
			_x ctrlSetFade 1;
			if (_forEachIndex <= _curIndex) then {
				_x ctrlSetPosition CELL_POS(CELL_Y_1);
			} else {
				_x ctrlSetPosition CELL_POS(CELL_Y_2);
			};
			if (_forEachIndex == _curIndex) then {
				_x ctrlSetFade 0;
			};
			if (_forEachIndex == (_curIndex + 1)) then {
				_x ctrlSetFade 0.5;
			};
			_x ctrlCommit 0.25;
		} foreach _weaponCtrls;
	};
	case "destroy":{
		QUOTE(DISPLAY_NAME) cutFadeOut 0;
	};
};
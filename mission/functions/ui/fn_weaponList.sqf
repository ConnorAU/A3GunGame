/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ui_fnc_weaponList

#include "..\macros.inc"
#include "..\defines.inc"

#define DIALOG_X (safeZoneX + safezoneW) - (PX_WS(DIALOG_W) + PX_WS(3))
#define DIALOG_Y safeZoneY + PX_HS(32)
#define DIALOG_W 82
#define DIALOG_H 80

#define CELL_Y_1 DIALOG_Y + PX_HS(SIZE_M)
#define CELL_Y_2 CELL_Y_1 + CELL_H
#define CELL_H PX_HA((DIALOG_H/2))
#define CELL_POS(y) [DIALOG_X,y,PX_WS(DIALOG_W),CELL_H]

disableSerialization;
SWITCH_SYS_PARAMS;

switch _mode do {
	case "init":{
		// Load the UI in unscheduled environment
		isNil {
			USE_DISPLAY(findDisplay 46);
			private _allControls = [
				_display ctrlCreate ["ctrlStaticBackground",-1],
				_display ctrlCreate ["ctrlStaticTitle",-1]
			];

			_allControls params ["_ctrlBackground","_ctrlTitle","_ctrlList"];

			_ctrlBackground ctrlSetBackgroundColor [0.2,0.2,0.2,0.3];
			_ctrlBackground ctrlSetPosition [
				DIALOG_X,
				DIALOG_Y,
				PX_WS(DIALOG_W),
				2*(CELL_H) + PX_HA(SIZE_M)
			];

			_ctrlTitle ctrlSetBackgroundColor [0,0,0,0.7];
			_ctrlTitle ctrlSetPosition [
				DIALOG_X,
				DIALOG_Y,
				PX_WS(DIALOG_W),
				PX_HS(SIZE_M)
			];

			private _weaponPool = GVAR(MNS,"GG_s_weaponPool",[]);
			for "_i" from 0 to (count _weaponPool - 1) do {
				private _ctrl = _display ctrlCreate ["ctrlStructuredText",-1];
				_ctrl ctrlSetStructuredText parsetext format["<t align='center' size='8' shadow='2'><img image='%1' /></t>",getText(configFile >> "CfgWeapons" >> _weaponPool#_i >> "picture")];
				_ctrl ctrlSetFade ([0,0.5]param[_i,1]);
				_ctrl ctrlSetPosition (if (_i==0) then {CELL_POS(CELL_Y_1)} else {CELL_POS(CELL_Y_2)});
				_allControls pushback _ctrl;
			};

			{_x ctrlCommit 0} foreach _allControls;

			SVAR(_display,"GG_weaponList_ctrls",_allControls);

		};
	};
	case "update":{
		_params params ["_weaponPool","_curIndex","_killsPerWeapon"];

		USE_DISPLAY(findDisplay 46);
		private _allControls = GVAR(_display,"GG_weaponList_ctrls",[]);
		if (count _allControls == 0) exitWith {};

		private _ctrlTitle = _allControls#1;
		private _killsTilProgress = _killsPerWeapon - GG_c_killStreak;

		_ctrlTitle ctrlSetText format[
			[
				"Next weapon in %1 kill%2",
				"Round victory in %1 kill%2"
			] select (_curIndex == (count _weaponPool - 1)),
			_killsTilProgress,
			["s",""] select (_killsTilProgress==1)
		];

		private _weaponCtrls = _allControls select [2,count _allControls];
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
		isNil {
			USE_DISPLAY(findDisplay 46);

			private _allControls = GVAR(_display,"GG_weaponList_ctrls",[]);
			{ctrlDelete _x} forEach _allControls;
			SVAR(_display,"GG_weaponList_ctrls",nil);
		};
	};
};
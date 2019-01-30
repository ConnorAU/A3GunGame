/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ui_fnc_leaderboardMini

#include "..\macros.inc"
#include "..\defines.inc"

#define DIALOG_X safeZoneX + PX_WS(63) + PX_WS(2)
#define DIALOG_Y safeZoneY + PX_HS(3)
#define DIALOG_W 100
#define DIALOG_H 33

disableSerialization;
SWITCH_SYS_PARAMS;

switch _mode do {
	case "init":{
		// Load the UI in unscheduled environment
		isNil {
			USE_DISPLAY(findDisplay 46);
			private _allControls = [
				_display ctrlCreate ["ctrlStaticBackground",-1],
				_display ctrlCreate ["ctrlStaticTitle",-1],
				_display ctrlCreate ["ctrlListNBox",-1]
			];
			SVAR(_display,"GG_leaderboardMini_ctrls",_allControls);

			_allControls params ["_ctrlBackground","_ctrlTitle","_ctrlList"];

			_ctrlBackground ctrlSetBackgroundColor [0.2,0.2,0.2,0.3];
			_ctrlBackground ctrlSetPosition [
				DIALOG_X,
				DIALOG_Y + PX_HS(SIZE_M),
				PX_WS(DIALOG_W),
				PX_HA(DIALOG_H) - PX_HA(SIZE_M)
			];

			_ctrlTitle ctrlSetText "Leaderboard";
			_ctrlTitle ctrlSetBackgroundColor [0,0,0,0.7];
			_ctrlTitle ctrlSetPosition [
				DIALOG_X,
				DIALOG_Y,
				PX_WS(DIALOG_W),
				PX_HS(SIZE_M)
			];

			_ctrlList ctrlSetPosition [
				DIALOG_X,
				DIALOG_Y + PX_HS(SIZE_XL),
				PX_WS(DIALOG_W),
				PX_HA(DIALOG_H) - PX_HA((SIZE_XL+1))
			];

			{_x ctrlCommit 0} foreach _allControls;

			_ctrlList lnbAddColumn 0.1;
			_ctrlList lnbAddColumn 0.5;
			_ctrlList lnbAddRow ["","Name","Weapon"];
			for "_i" from 1 to 5 do {_ctrlList lnbAddRow [format["%1.",_i],"",""];};

			["drawStats",[_ctrlList]] spawn THIS_FUNC;
		};
	};
	case "drawStats":{
		_params params ["_ctrlList"];
		private _weaponPool = GVAR(MNS,"GG_s_weaponPool",[]);
		while {!isNull _ctrlList} do {
			private _stats = [] call GG_system_fnc_getLeaderboardStats;
			private _uidWritten = false;
			for "_i" from 0 to 4 do {
				if (_i == 4 && {!_uidWritten}) then {
					_i = _stats findIf {_x#4 == getPlayerUID player};
				};
				(_stats param [_i,[]]) params [["_score",0],"","",["_name",""],["_uid",""]];
				if (_uid == getPlayerUID player) then {_uidWritten = true;};

				if (count _name > 26) then {
					_name = format["%1...",_name select [0,23]];
				};

				private _weapon = "";
				if (_uid != "") then {
					_weapon = getText(configFile >> "CfgWeapons" >> _weaponPool#(_score min (count _weaponPool - 1)) >> "displayName");
					if (count _weapon > 27) then {
						_weapon = format["%1...",_weapon select [0,24]];
					};
				};

				private _row = (_i+1) min 5;
				_ctrlList lnbSetText [[_row,0],format["%1.",_i + 1]];
				_ctrlList lnbSetText [[_row,1],_name];
				_ctrlList lnbSetText [[_row,2],_weapon];
			};
			uisleep 0.25;
		};
	};
	case "destroy":{
		isNil {
			USE_DISPLAY(findDisplay 46);

			private _allControls = GVAR(_display,"GG_leaderboardMini_ctrls",[]);
			{ctrlDelete _x} forEach _allControls;
			SVAR(_display,"GG_leaderboardMini_ctrls",nil);
		};
	};
};
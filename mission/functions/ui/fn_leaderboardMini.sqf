/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_ui_fnc_leaderboardMini

Description:
	Handles all tasks related to the leaderboard overlay

Parameters:
	0 : STRING - Subfunction name
	1 : ANY    - Subfunction arguments

Return:
	Nothing
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_ui_fnc_leaderboardMini
#define DISPLAY_NAME GG_displayLeaderboardMini

#include "..\defines.inc"

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
			USE_CTRL(_ctrlList,1);

			_ctrlList lnbAddColumn 0.1;
			_ctrlList lnbAddColumn 0.5;
			_ctrlList lnbAddRow ["","Name","Weapon"];
			for "_i" from 1 to 5 do {_ctrlList lnbAddRow [format["%1.",_i],"",""];};

			["drawStats",[_ctrlList]] spawn THIS_FUNC;
		};
	};
	case "drawStats":{
		_params params ["_ctrlList"];
		private _weaponPool = missionNameSpace getVariable ["GG_s_weaponPool",[]];
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
		QUOTE(DISPLAY_NAME) cutFadeOut 0;
	};
};

nil

/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ui_fnc_leaderboard
#define DISPLAY_NAME GG_displayLeaderboard

#include "..\defines.inc"

disableSerialization;
SWITCH_SYS_PARAMS;

switch _mode do {
	case "onLoad":{
		uiNamespace setVariable [QUOTE(DISPLAY_NAME),_params#0];
	};
	case "init":{
		_params params [["_roundOver",false,[true]]];
		isNil {
			disableSerialization;
			if !(isNull(THIS_DISPLAY)) exitWith {};
			QUOTE(DISPLAY_NAME) cutRsc [QUOTE(DISPLAY_NAME),"PLAIN"];
			USE_DISPLAY(THIS_DISPLAY);
			USE_CTRL(_ctrlTitle,1);
			USE_CTRL(_ctrlList,2);

			_ctrlList lnbAddColumn 0.1;
			_ctrlList lnbAddColumn 0.5;
			_ctrlList lnbAddColumn 0.64;
			_ctrlList lnbAddColumn 0.74;
			_ctrlList lnbAddColumn 0.865;
			_ctrlList lnbAddRow ["","Name","Weapon","Kills","Deaths","KDR"];

			private _weaponPool = missionNameSpace getVariable ["GG_s_weaponPool",[]];
			private _stats = [] call GG_system_fnc_getLeaderboardStats;
			for "_i" from 0 to 29 do {
				(_stats param [_i,[]]) params ["_score","_kills","_deaths",["_name",""]];
				if (_name == "") then {
					_ctrlList lnbAddRow [format["%1.",_i+1]];
				} else {
					if (count _name > 34) then {_name = format["%1...",_name select [0,31]]};
					_ctrlList lnbAddRow [
						format["%1.",_i+1],
						_name,format["%1 of %2",(_score+1) min (count _weaponPool),count _weaponPool],str _kills,str _deaths,
						// avoiding zero divisor errors
						(([_kills,1] select (_kills == 0))/([_deaths,1] select (_deaths == 0)))toFixed 2
					];
				};
			};

			if _roundOver then {
				[_ctrlTitle] spawn {
					scriptName QUOTE(THIS_FUNC);

					disableSerialization;
					params ["_ctrlTitle"];

					for "_i" from 17 to 0 step -1 do {
						_ctrlTitle ctrlSetText format[
							"Next round starts in %1 second%2",
							_i,["s",""] select (_i == 1)
						];
						uisleep 1;
					};
				};
			};
		};
	};
	case "destroy":{
		QUOTE(DISPLAY_NAME) cutFadeOut 0;	
	};
};
/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ui_fnc_voteMap

#include "..\macros.inc"
#include "..\defines.inc"

#define DIALOG_X safeZoneX + PX_WS(SIZE_XL)
#define DIALOG_W 60
#define DIALOG_H 93

disableSerialization;
SWITCH_SYS_PARAMS;

switch _mode do {
	case "init":{
		// Load the UI in unscheduled environment
		isNil {
			USE_DISPLAY(findDisplay 12);
			private _allControls = [
				_display ctrlCreate ["ctrlStaticBackground",-1],
				_display ctrlCreate ["ctrlStaticTitle",-1],
				_display ctrlCreate ["ctrlListNBox",-1]
			];
			SVAR(_display,"GG_voteMap_ctrls",_allControls);

			_allControls params ["_ctrlBackground","_ctrlTitle","_ctrlList"];

			_ctrlBackground ctrlSetPosition [
				DIALOG_X,
				CENTER_YA(DIALOG_H),
				PX_WS(DIALOG_W),
				PX_HA(DIALOG_H)
			];

			_ctrlTitle ctrlSetText "Map Voting";
			_ctrlTitle ctrlSetPosition [
				DIALOG_X,
				CENTER_YA(DIALOG_H),
				PX_WS(DIALOG_W),
				PX_HS(SIZE_M)
			];

			_ctrlList ctrlSetPosition [
				DIALOG_X,
				CENTER_YA(DIALOG_H) + PX_HS(SIZE_XL),
				PX_WS(DIALOG_W),
				PX_HA(DIALOG_H) - PX_HS((SIZE_XL+1))
			];

			{_x ctrlCommit 0} foreach _allControls;

			_ctrlList lnbAddColumn 0.7;
			_ctrlList lnbAddRow ["Map","Votes"];
			{
				_ctrlList lnbAddRow [_x#0,"0"];
			} forEach _params;

			addMissionEventHandler ["EachFrame",{["drawVotes",_this] call THIS_FUNC}];
		};
	};
	case "drawVotes":{
		USE_DISPLAY(findDisplay 12);
		private _allControls = GVAR(_display,"GG_voteMap_ctrls",[]);
		_allControls params ["","_ctrlTitle","_ctrlList"];

		private _timeRemaining = floor(((GVAR(MNS,"GG_s_voteEndTick",0))) - serverTime);
		private _title = if (_timeRemaining > 0) then {
			format["Map Voting: %1 second%2 remaining",_timeRemaining max 0,["s",""] select (_timeRemaining == 1)];
		} else {
			format["Map Voting: %1",GVAR(MNS,"GG_s_votedMapName","")];
		};
		_ctrlTitle ctrlSetText _title;

		for "_i" from 1 to (lnbSize _ctrlList)#0 do {
			_ctrlList lnbSetText [
				[_i,1],
				str({(GVAR(_x,"GG_s_mapVote",-1)) == (_i-1)} count allPlayers)
			];
		};

		if (_timeRemaining <= -3) then {
			removeMissionEventHandler ["EachFrame",_thisEventHandler];
		};
	};
	case "destroy":{
		isNil {
			USE_DISPLAY(findDisplay 12);

			private _allControls = GVAR(_display,"GG_voteMap_ctrls",[]);
			{ctrlDelete _x} forEach _allControls;
			SVAR(_display,"GG_voteMap_ctrls",nil);
		};
	};
};
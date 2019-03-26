/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ui_fnc_voteMap
#define DISPLAY_NAME GG_displayVoteMap

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
			QUOTE(DISPLAY_NAME) cutRsc [QUOTE(DISPLAY_NAME),"PLAIN"];
			USE_DISPLAY(THIS_DISPLAY);
			USE_CTRL(_ctrlTitle,1);
			USE_CTRL(_ctrlList,2);

			_ctrlList lnbAddColumn 0.7;
			_ctrlList lnbAddRow ["Map","Votes"];
			{
				_ctrlList lnbAddRow [_x#0,"0"];
			} forEach _params;

			addMissionEventHandler ["EachFrame",{["drawVotes",_this] call THIS_FUNC}];
		};
	};
	case "drawVotes":{
		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlTitle,1);
		USE_CTRL(_ctrlList,2);

		private _timeRemaining = floor((missionNameSpace getVariable ["GG_s_voteEndTick",0]) - serverTime);
		private _title = if (_timeRemaining > 0) then {
			format["Map Voting: %1 second%2 remaining",_timeRemaining max 0,["s",""] select (_timeRemaining == 1)];
		} else {
			format["Map Voting: %1",missionNameSpace getVariable ["GG_s_votedMapName",""]];
		};
		_ctrlTitle ctrlSetText _title;

		for "_i" from 1 to (lnbSize _ctrlList)#0 do {
			_ctrlList lnbSetText [
				[_i,1],
				str({(_x getVariable ["GG_s_mapVote",-1]) == (_i-1)} count allPlayers)
			];
		};

		if (_timeRemaining <= -3) then {
			removeMissionEventHandler ["EachFrame",_thisEventHandler];
		};
	};
	case "destroy":{
		QUOTE(DISPLAY_NAME) cutFadeOut 0;
	};
};
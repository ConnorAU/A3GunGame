/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_system_fnc_voteMap

#include "..\defines.inc"

SWITCH_SYS_PARAMS;

switch _mode do {
	case "server":{
		// Delete combat zone from previous round
		deleteMarker "GG_CombatZone";

		missionNameSpace setVariable ["GG_s_votedMap",nil,true];
		missionNameSpace setVariable ["GG_s_votedMapName","",true];
		missionNameSpace setVariable ["GG_s_voteEndTick",serverTime + 60,true];

		// wait for all players to vote or for voting time to run out
		private _allMaps = [] call GG_config_fnc_maps;
		private _votes = [];

		// Skip voting if there is only one possible location
		if (count _allMaps >= 2) then {
			waitUntil {
				_votes = allPlayers apply {_x getVariable ["GG_s_mapVote",-1]};
				!(-1 in _votes) || serverTime > GG_s_voteEndTick
			};
		} else {_votes = [0];};
		missionNameSpace setVariable ["GG_s_voteEndTick",0,true];

		// only player disconnected, abort selecting map
		if (count _votes == 0) exitWith {};

		// tally votes and make list of maps to draw from (incase of tied top votes)
		private _votesTallied = [];
		for "_i" from 0 to (count _allMaps - 1) do {
			_votesTallied set [_i,{_x == _i} count _votes];
		};
		
		private _maxTally = selectMax _votesTallied;
		private _possibleMaps = [];
		{
			if (_x == _maxTally) then {
				_possibleMaps pushback (_allMaps#_foreachIndex);
			};
		} foreach _votesTallied;

		private _selectedMap = selectRandom _possibleMaps;
		_selectedMap params ["_name","_position","_size","_rotation"];

		// create new combat zone
		DLOG("Selected map: "+_name);
		missionNameSpace setVariable ["GG_s_votedMap",_allMaps find _selectedMap,true];
		missionNameSpace setVariable ["GG_s_votedMapName",_name,true];
		missionNameSpace setVariable ["GG_s_votedMapSize",_size];

		private _marker = createMarker ["GG_CombatZone",_position];
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerSize _size;
		_marker setMarkerDir _rotation;
		_marker setMarkerAlpha 0.8;
		_marker setMarkerColor "ColorBlack";
		_marker setMarkerBrush "SolidBorder";

		[] call GG_system_fnc_resizeCombatZone;
		[] call GG_system_fnc_openAllDoors;

		missionNameSpace setVariable ["GG_s_roundStartTick",diag_tickTime];
	};
	case "client":{
		openMap [true,true];

		private _allMaps = [] call GG_config_fnc_maps;
		["init",_allMaps] call GG_ui_fnc_voteMap;

		// monitor to cancel voting if time runs out
		[] spawn {
			scriptName (QUOTE(THIS_FUNC)+": Monitor");

			// wait for voting to start
			waitUntil {!isNil "BIS_missionChosen"};

			// wait for client to vote or for voting to end
			waitUntil {isNil "BIS_missionChosen" || serverTime >= (missionNameSpace getVariable ["GG_s_voteEndTick",0])};

			// voted
			if (isNil "BIS_missionChosen") exitWith {};

			// force end voting
			[] spawn BIS_removeMissionTooltipAndHandlers;
			missionNameSpace setVariable ["BIS_missionChosen",0];
		};

		private _selectedMission = [
			[worldsize,worldsize],
			[worldsize/2,worldsize/2,0], 
			_allMaps apply {[_x#1,_x#0,_x#0,"load.paa",{}]}
		] call BIS_fnc_missionSelector;

		if (serverTime < (missionNameSpace getVariable ["GG_s_voteEndTick",0])) then {
			player setVariable ["GG_s_mapVote",_selectedMission,true];
			["<t shadow=2 >Waiting for voting to finish...</t>",[-1,-1],[-1,-1],1e14,0.5] spawn BIS_fnc_dynamicText;
			uisleep 1;
		};

		// wait for combat zone to be ready
		waitUntil {COMBAT_ZONE_EXISTS};
		["",[-1,-1],[-1,-1],1,0] spawn BIS_fnc_dynamicText;
		[true,false,2] call GG_eventhandler_fnc_map;
		["destroy"] call GG_ui_fnc_welcome;

		uisleep 5;

		["destroy"] call GG_ui_fnc_voteMap;
		openMap [false,false];

		player setVariable ["GG_s_mapVote",nil,true];
	};
};
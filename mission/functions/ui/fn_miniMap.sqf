/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ui_fnc_miniMap
#define DISPLAY_NAME GG_displayMiniMap

#include "..\defines.inc"

#define VAR_UNITS_INFO FUNC_SUBVAR(units_info)
#define VAR_UPDATE_TICK FUNC_SUBVAR(update_tick)
#define VAL_UPDATE_FREQ 8
#define VAL_ICON_SIZE 16

disableSerialization;
SWITCH_SYS_PARAMS;

switch _mode do {
	case "onLoad":{
		uiNameSpace setVariable [QUOTE(DISPLAY_NAME),_params#0];
	};
	case "init":{
		// Load the UI in unscheduled environment
		isNil {
			QUOTE(DISPLAY_NAME) cutRsc [QUOTE(DISPLAY_NAME),"PLAIN",-1,false];

			VAR_UNITS_INFO = [];
			VAR_UPDATE_TICK = 0;

			USE_DISPLAY(THIS_DISPLAY);
			USE_CTRL(_ctrlTitle,1);
			USE_CTRL(_ctrlMap,2);

			_ctrlTitle ctrlSetText format["Location: %1",missionNameSpace getVariable ["GG_s_votedMapName",""]];
			["modifyZoom"] call THIS_FUNC;

			private _blipsEnabled = ["get","EnemyMapBlips"] call GG_system_fnc_params;
			if (_blipsEnabled isEqualTo 1) then {
				_ctrlMap ctrlAddEventHandler ["Draw",{["drawBlips",_this] call THIS_FUNC}];
				(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",{["drawBlips",_this] call THIS_FUNC}];
			};
		};
	};
	case "modifyZoom":{
			if !COMBAT_ZONE_EXISTS exitWith {};

			USE_DISPLAY(THIS_DISPLAY);
			if (isNull _display) exitWith {};

			USE_CTRL(_ctrlMap,2);
			_ctrlMap ctrlMapAnimAdd [
				0,(((selectMax markerSize "GG_CombatZone")*0.75)/worldSize)*10,
				markerPos "GG_CombatZone"
			];
			ctrlMapAnimCommit _ctrlMap;
	};
	case "drawBlips":{
		_params params ["_ctrlMap"];

		if !COMBAT_ZONE_EXISTS exitWith {};

		if (diag_tickTime > VAR_UPDATE_TICK) then {
			VAR_UPDATE_TICK = diag_tickTime + VAL_UPDATE_FREQ;
			VAR_UNITS_INFO = allUnits select {
				alive _x && {_x != player && {_x distance (markerPos "respawn") > 50}}
			} apply {getPos _x};
		};

		private _size = VAL_ICON_SIZE*(1 min((VAR_UPDATE_TICK-3)-diag_tickTime)max 0);
		{
			_ctrlMap drawIcon ["\a3\ui_f\data\map\markers\military\dot_ca.paa",[1,0,0,1],_x,_size,_size,0];
		} foreach VAR_UNITS_INFO;

		_ctrlMap drawIcon ["\A3\ui_f\data\map\vehicleicons\iconman_ca.paa",[0.8,1,0.8,1],getPos player,24,24,getDirVisual player];
	};
	case "destroy":{
		QUOTE(DISPLAY_NAME) cutFadeOut 0;
	};
};
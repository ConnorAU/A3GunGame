/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ui_fnc_miniMap
#define DISPLAY_NAME GGDisplayMiniMap

#include "..\macros.inc"
#include "..\defines.inc"

#define VAR_UNITS_INFO FUNC_SUBVAR(units_info)
#define VAR_UPDATE_TICK FUNC_SUBVAR(update_tick)
#define VAL_UPDATE_FREQ 8
#define VAL_ICON_SIZE 16

#define DIALOG_W 60

disableSerialization;
SWITCH_SYS_PARAMS;

switch _mode do {
	case "init":{
		// Load the UI in unscheduled environment
		isNil {
			// minimap created as rsctitle because map ctrls dont position correctly when created using ctrlCreate
			QUOTE(DISPLAY_NAME) cutRsc [QUOTE(DISPLAY_NAME),"PLAIN",0,true];

			VAR_UNITS_INFO = [];
			VAR_UPDATE_TICK = 0;

			USE_DISPLAY(THIS_DISPLAY);
			USE_CTRL(_ctrlMap,1);

			["modifyZoom"] call THIS_FUNC;

			addMissionEventHandler["EachFrame",{["EachFrame"] call THIS_FUNC}];
			_ctrlMap ctrlAddEventHandler ["Draw",{["drawBlips",_this] call THIS_FUNC}];
			(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",{["drawBlips",_this] call THIS_FUNC}];

			// Create the title bar on display 46
			// for some reason it shows darker when created in the RscTitle dialog
			USE_DISPLAY(findDisplay 46);
			private _ctrlTitle = _display ctrlCreate ["ctrlStaticTitle",-1];
			_ctrlTitle ctrlSetText format["Location: %1",missionNameSpace getVariable ["GG_s_votedMapName",""]];
			_ctrlTitle ctrlSetBackgroundColor [0,0,0,0.7];
			_ctrlTitle ctrlSetPosition [
				safeZoneX + PX_WS(3),
				safeZoneY + PX_HS(3),
				PX_WS(DIALOG_W),
				PX_HS(SIZE_M)
			];
			_ctrlTitle ctrlCommit 0;
			_display setVariable ["GG_miniMap_title",_ctrlTitle];
		};
	};
	case "onLoad":{
		_params params ["_display"];
		uiNameSpace setVariable [QUOTE(DISPLAY_NAME),_display];
	};
	case "modifyZoom":{
			if !COMBAT_ZONE_EXISTS exitWith {};

			(markerSize "GG_CombatZone") params ["_combatZoneX","_combatZoneY"];
			private _combatZoneVal = if (_combatZoneX == _combatZoneY) then {_combatZoneX} else {_combatZoneX max _combatZoneY};

			USE_DISPLAY(THIS_DISPLAY);
			if (isNull _display) exitWith {};

			USE_CTRL(_ctrlMap,1);
			_ctrlMap ctrlMapAnimAdd [
				0,((_combatZoneVal*0.75)/worldSize)*10,
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
	case "EachFrame":{
		// Cheap way to keep the map hidden like the title when the esc menu is open
		// Cant do this in the draw EVH cause once its hidden it no longer draws to fix itself
		USE_DISPLAY(THIS_DISPLAY);

		if (isNull _display) then {
			removeMissionEventHandler["EachFrame",_thisEventhandler];
		};

		USE_CTRL(_ctrlMap,1);
		_ctrlMap ctrlShow isNull(findDisplay 49);
	};
	case "destroy":{
		QUOTE(DISPLAY_NAME) cutText ["","PLAIN",0];
		USE_DISPLAY(findDisplay 46);
		ctrlDelete (_display getVariable ["GG_miniMap_title",controlNull]);
	};
};
/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ui_fnc_adminMenu
#define DISPLAY_NAME GG_displayAdminMenu

#include "..\macros.inc"
#include "..\defines.inc"

#define VAL_CUSTOM_POS_MARKER "GG_CombatZoneCustom"

disableSerialization;
SWITCH_SYS_PARAMS;

switch _mode do {
	case "onLoad":{
		uiNamespace setVariable [QUOTE(DISPLAY_NAME),_params#0];
	};
	case "init":{
		if (isMultiplayer && !(serverCommandAvailable "#kick")) exitWith {}; // not admin

		// Load the UI in unscheduled environment
		isNil {
			if !(isNull(THIS_DISPLAY)) exitWith {};

			createDialog QUOTE(DISPLAY_NAME);
			USE_DISPLAY(THIS_DISPLAY);
			_display displayAddEventHandler ["Unload",{["unload"] call THIS_FUNC}];

			USE_CTRL(_ctrlListParams,1);
			USE_CTRL(_ctrlMap,2);
			USE_CTRL(_ctrlComboWeapon,3);
			USE_CTRL(_ctrlListWeaponL,4);
			USE_CTRL(_ctrlListWeaponR,5);
			USE_CTRL(_ctrlButtonWeaponAdd,6);
			USE_CTRL(_ctrlButtonWeaponRemove,7);
			USE_CTRL(_ctrlButtonCancel,8);
			USE_CTRL(_ctrlButtonApply,9);


			{
				private _name = configName _x;
				private _value = ["getPending",_name] call GG_system_fnc_params;
				private _values = getArray(_x >> "values");

				private _index = _ctrlListParams lbAdd getText(_x >> "title");
				_ctrlListParams lbSetTextRight [_index,getArray(_x >> "texts")#(_values find _value)];
				_ctrlListParams lbSetData [_index,_name];
				_ctrlListParams lbSetValue [_index,_value];
			} forEach ("true" configClasses (missionConfigFile >> "Params"));
			_ctrlListParams ctrlAddEventHandler ["LBDblClick",{["ParamsLBDblClick",_this] call THIS_FUNC}];


			_ctrlMap ctrlSetTooltip "Alt + Left Click: Set/Remove custom position";
			private _id = addMissionEventHandler ["MapSingleClick",{["MapSingleClick",_this] call THIS_FUNC}];
			_display setVariable ["mapEventID",_id];


			_ctrlComboWeapon ctrlAddEventHandler ["LBSelChanged",{["WeaponsComboLBSelChanged",_this] call THIS_FUNC}];
			{_ctrlComboWeapon lbAdd _x;} foreach [
				// Not pulling names from the param because shot guns group with rifles not smg
				"None (Use default pool randomization)",
				"All",
				"Submachine Guns",
				"Rifles",
				"Snipers",
				"Machine Guns",
				"Pistols"
			];

			private _weaponPool = missionNameSpace getVariable [
				"GG_admin_customWeaponPool",
				missionNameSpace getVariable ["GG_s_weaponPool",[]]
			];
			{
				private _config = configFile >> "CfgWeapons" >> _x;
				private _index = _ctrlListWeaponR lbAdd getText(_config >> "displayName");
				_ctrlListWeaponR lbSetTooltip [_index,_x];
				_ctrlListWeaponR lbSetData [_index,_x];
				_ctrlListWeaponR lbSetPicture [_index,getText(_config >> "picture")];
				_ctrlListWeaponR lbSetPictureRight [_index,["WeaponsDLCIcon",_config] call THIS_FUNC];
			} forEach _weaponPool;

			// preload all weapons 
			_ctrlComboWeapon lbSetCurSel 1;
			if (isNil "GG_admin_customWeaponPool") then {
				// disable custom pool if no custom pool is already set
				_ctrlComboWeapon lbSetCurSel 0;
			};

			_ctrlButtonWeaponAdd ctrlSetText ">";
			_ctrlButtonWeaponAdd ctrlAddEventHandler ["ButtonClick",{["WeaponsButtonClicked",[_this#0,true]] call THIS_FUNC}];
			_ctrlButtonWeaponRemove ctrlSetText "<";
			_ctrlButtonWeaponRemove ctrlAddEventHandler ["ButtonClick",{["WeaponsButtonClicked",[_this#0,false]] call THIS_FUNC}];


			_ctrlButtonCancel ctrlAddEventHandler ["ButtonClick",{(ctrlParent(_this#0)) closeDisplay 2}];

			_ctrlButtonApply ctrlSetText "Save Changes";
			_ctrlButtonApply ctrlAddEventHandler ["ButtonClick",{["confirm",0] call THIS_FUNC}];


			if (VAL_CUSTOM_POS_MARKER in allMapMarkers) then {
				VAL_CUSTOM_POS_MARKER setMarkerAlphaLocal 0.5;
				_ctrlMap ctrlMapAnimAdd [0,(((selectMax markerSize VAL_CUSTOM_POS_MARKER)*0.75)/worldSize)*10,markerPos VAL_CUSTOM_POS_MARKER];
			} else {
				_ctrlMap ctrlMapAnimAdd [0,(((selectMax markerSize "GG_CombatZone")*0.75)/worldSize)*10,markerPos "GG_CombatZone"];
			};
			ctrlMapAnimCommit _ctrlMap;
		};
	};


	case "ParamsLBDblClick":{
		_params params ["_ctrlListParams","_index"];
		private _data = _ctrlListParams lbData _index;
		if (["spacer",_data] call BIS_fnc_inString) exitWith {};

		private _cfg = missionConfigFile >> "Params" >> _data;
		private _texts = getArray(_cfg >> "texts");
		private _values = getArray(_cfg >> "values");

		private _options = [];
		for "_i" from 0 to count _texts - 1 do {
			_options pushback [
				[_texts#_i],[],[],[],"",
				_texts#_i,_values#_i
			];
		};

		// https://github.com/ConnorAU/A3UserInputMenus
		[
			_options,
			"Select a Value",
			{
				if _confirmed then {
					["ParamsValueChanged",[_data,_value]] call THIS_FUNC
				};
			},
			"Select",""
		] call (missionNameSpace getVariable ["CAU_UserInputMenus_fnc_listBox",{
			private _linkText = FNC_LINKTEXT;

			[
				parseText format[
					"You cannot set new parameter values without the %1 mod.",
					["User Input Menus","https://steamcommunity.com/sharedfiles/filedetails/?id=1673595418"] call _linkText
				],
				"Missing Mod",
				"Ok"
			] spawn BIS_fnc_guiMessage;
		}]);
	};
	case "ParamsValueChanged":{
		_params params ["_paramData","_paramValue"];

		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlListParams,1);

		private _index = lbCurSel _ctrlListParams;
		_ctrlListParams lbSetTextRight [_index,_paramData];
		_ctrlListParams lbSetValue [_index,_paramValue];
	};


	case "MapSingleClick":{
		_params params ["","_pos","_alt"];

		if !_alt exitWith {};

		private _markerExists = true;
		if (VAL_CUSTOM_POS_MARKER in allMapMarkers) then {
			if (_pos inArea VAL_CUSTOM_POS_MARKER) exitWith {
				deleteMarker VAL_CUSTOM_POS_MARKER;
				_markerExists = false;
			};
			VAL_CUSTOM_POS_MARKER setMarkerPos _pos;
		} else {
			// global marker so new admins can see the pending change before the round resets
			createMarker [VAL_CUSTOM_POS_MARKER,_pos];
			VAL_CUSTOM_POS_MARKER setMarkerShape "ELLIPSE";
			VAL_CUSTOM_POS_MARKER setMarkerBrush "SolidBorder";
			VAL_CUSTOM_POS_MARKER setMarkerColor "ColorRed";
			VAL_CUSTOM_POS_MARKER setMarkerText "Custom Position";
			VAL_CUSTOM_POS_MARKER setMarkerSize [100,100];
		};

		if !_markerExists exitWith {};

		// Hide marker from everyone else
		VAL_CUSTOM_POS_MARKER setMarkerAlpha 0;
		VAL_CUSTOM_POS_MARKER setMarkerAlphaLocal 0.5;
	};


	case "WeaponsComboLBSelChanged":{
		_params params ["_ctrlComboWeapon","_index"];

		USE_DISPLAY(ctrlParent _ctrlComboWeapon);
		USE_CTRL(_ctrlListWeaponL,4);
		USE_CTRL(_ctrlListWeaponR,5);
		USE_CTRL(_ctrlButtonWeaponAdd,6);
		USE_CTRL(_ctrlButtonWeaponRemove,7);

		_ctrlListWeaponL ctrlEnable (_index > 0);
		_ctrlListWeaponR ctrlEnable (_index > 0);
		_ctrlButtonWeaponAdd ctrlEnable (_index > 0);
		_ctrlButtonWeaponRemove ctrlEnable (_index > 0);

		//lbClear _ctrlListWeaponR;
		if (_index > 0) then {
			["WeaponsListPopulate"] call THIS_FUNC;
		};
	};
	case "WeaponsComboFilter":{
		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlComboWeapon,3);
		[
			[],
			["AssaultRifle","Handgun","MachineGun","Shotgun","SubmachineGun","SniperRifle","Rifle"],
			["Shotgun","SubmachineGun"],
			["AssaultRifle"],
			["SniperRifle"],
			["MachineGun"],
			["Handgun"]
		]#lbCurSel _ctrlComboWeapon;
	};
	case "WeaponsDLCIcon":{
		private _dlc = "";
		private _addons = configSourceAddonList _params;
		if (count _addons > 0) then {
			private _mods = configSourceModList (configFile >> "CfgPatches" >> _addons#0);
			_dlc = _mods param [0,""];
		};
		modParams[_dlc,["logoSmall"]] param [0,""]
	};
	case "WeaponsListPopulate":{
		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlComboWeapon,3);
		USE_CTRL(_ctrlListWeaponL,4);
		USE_CTRL(_ctrlListWeaponR,5);

		private _filter = ["WeaponsComboFilter"] call THIS_FUNC;
		private _list = _ctrlComboWeapon getVariable [format["weaponListCache%1",lbCurSel _ctrlComboWeapon],[]];
		if (lbCurSel _ctrlComboWeapon > 0 && {count _list == 0}) then {
			private ["_config","_class","_itemType"];
			for "_i" from 0 to count (configFile >> "CfgWeapons") - 1 do {
				_config = (configFile >> "CfgWeapons") select _i;
				if (isClass _config) then {
					_class = configname _config;
					_itemType = _class call BIS_fnc_itemType;
					if (
						getnumber (_config >> "scope") == 2 && 
						{((_itemType#0) != "VehicleWeapon" && {_itemType#1 in _filter}) } && 
						{_class call bis_fnc_baseWeapon == _class}
					) then {
						_list pushBackUnique [
							getText(_config >> "displayName"),
							_class,
							getText(_config >> "picture"),
							["WeaponsDLCIcon",_config] call THIS_FUNC
						];
					};
				};
			};
			_list sort true;

			// Save to var so we dont need to build this filtered list again
			_ctrlComboWeapon setVariable [format["weaponListCache%1",lbCurSel _ctrlComboWeapon],_list];
		};

		private _alreadyUsed = [];
		for "_i" from 0 to lbSize _ctrlListWeaponR - 1 do {
			_alreadyUsed pushBack (_ctrlListWeaponR lbData _i);
		};

		lbClear _ctrlListWeaponL;
		private _index = -1;
		{
			_x params ["_name","_class","_image","_imageRight"];
			if !(_class in _alreadyUsed) then {
				_index = _ctrlListWeaponL lbAdd _name;
				_ctrlListWeaponL lbSetTooltip [_index,_class];
				_ctrlListWeaponL lbSetData [_index,_class];
				_ctrlListWeaponL lbSetPicture [_index,_image];
				_ctrlListWeaponL lbSetPictureRight [_index,_imageRight];
			};
		} forEach _list;
	};
	case "WeaponsButtonClicked":{
		_params params ["_ctrlButton","_bool"];

		USE_DISPLAY(ctrlParent _ctrlButton);
		USE_CTRL(_ctrlListWeaponL,4);
		USE_CTRL(_ctrlListWeaponR,5);
		
		if _bool then {
			private _index = lbCurSel _ctrlListWeaponL;
			private _data = _ctrlListWeaponL lbData _index;
			if (_data == "") exitWith {};
			
			private _newIndex = _ctrlListWeaponR lbAdd (_ctrlListWeaponL lbText _index);
			_ctrlListWeaponR lbSetTooltip [_newIndex,_data];
			_ctrlListWeaponR lbSetData [_newIndex,_data];
			_ctrlListWeaponR lbSetPicture [_newIndex,_ctrlListWeaponL lbPicture _index];
			_ctrlListWeaponR lbSetPictureRight [_newIndex,_ctrlListWeaponL lbPictureRight _index];
			//lbSort _ctrlListWeaponR;

			_ctrlListWeaponL lbDelete _index;
		} else {
			private _index = lbCurSel _ctrlListWeaponR;
			private _data = _ctrlListWeaponR lbData _index;
			if (_data == "") exitWith {};
			
			private _filter = ["WeaponsComboFilter"] call THIS_FUNC;
			private _itemType = _data call BIS_fnc_itemType;
			if ((_itemType#0) != "VehicleWeapon" && {_itemType#1 in _filter}) then {
				private _newIndex = _ctrlListWeaponL lbAdd (_ctrlListWeaponR lbText _index);
				_ctrlListWeaponL lbSetTooltip [_newIndex,_data];
				_ctrlListWeaponL lbSetData [_newIndex,_data];
				_ctrlListWeaponL lbSetPicture [_newIndex,_ctrlListWeaponR lbPicture _index];
				_ctrlListWeaponL lbSetPictureRight [_newIndex,_ctrlListWeaponR lbPictureRight _index];
				lbSort _ctrlListWeaponL;
			};

			_ctrlListWeaponR lbDelete _index;
		};
	};


	case "confirm":{
		if (_params isEqualType 0) then {
			USE_DISPLAY(THIS_DISPLAY);
			USE_CTRL(_ctrlListParams,1);
			USE_CTRL(_ctrlComboWeapon,3);
			USE_CTRL(_ctrlListWeaponR,5);

			for "_i" from 0 to lbSize _ctrlListParams - 1 do {
				private _param = _ctrlListParams lbData _i;
				private _valueNew = _ctrlListParams lbValue _i;
				private _valueOld = ["get",_param] call GG_system_fnc_params;
				if (_valueNew != _valueOld) then {
					["setPending",[_param,_valueNew]] call GG_system_fnc_params;
				};
			};

			missionNamespace setVariable [
				"GG_admin_customCombatZonePos",
				[	
					nil,
					[
						"Custom Location",
						markerPos VAL_CUSTOM_POS_MARKER,
						markerSize VAL_CUSTOM_POS_MARKER,
						markerDir VAL_CUSTOM_POS_MARKER
					]
				] select (VAL_CUSTOM_POS_MARKER in allMapMarkers),
				2
			];

			private _weaponPool = [];
			if (lbCurSel _ctrlComboWeapon > 0 && lbSize _ctrlListWeaponR > 0) then {
				for "_i" from 0 to lbSize _ctrlListWeaponR - 1 do {
					_weaponPool pushBack (_ctrlListWeaponR lbData _i);
				};
				// public var so new admins can see the pending change before the round resets
			};
			missionNamespace setVariable [
				"GG_admin_customWeaponPool",
				[_weaponPool,nil] select (_weaponPool isEqualTo []),
				true
			];

			_display closeDisplay 2;

			// https://github.com/ConnorAU/A3UserInputMenus
			[
				"Would you like to reset the round and apply these changes immediately?",
				"Changes saved",
				{["confirm",_confirmed] call THIS_FUNC},
				"Reset Now",
				"Reset Later"
			] call (missionNameSpace getVariable ["CAU_UserInputMenus_fnc_guiMessage",{
				_this spawn {
					private _confirmed = [_this#0,_this#1,_this#3,_this#4] call BIS_fnc_guiMessage;
					call (_this#2);
				};
			}]);
		} else {
			if _params then {
				private _scores = [] call GG_system_fnc_getLeaderboardStats;
				["server",_scores#0#5] remoteExec ["GG_system_fnc_roundOver",2];
			};
		};
	};
	case "unload":{
		USE_DISPLAY(THIS_DISPLAY);
		private _id = _display getVariable ["mapEventID",-1];
		removeMissionEventHandler ["MapSingleClick",_id];
		if (VAL_CUSTOM_POS_MARKER in allMapMarkers) then {
			VAL_CUSTOM_POS_MARKER setMarkerAlphaLocal 0;
		};
	};
};
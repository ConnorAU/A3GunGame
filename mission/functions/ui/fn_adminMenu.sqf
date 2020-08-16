/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_ui_fnc_adminMenu

Description:
	Handle all tasks related to the admin menu

Parameters:
	0 : STRING - Subfunction name
	1 : ANY    - Subfunction arguments

Return:
	ANY - Depends on the subfunction name provided
---------------------------------------------------------------------------- */


#define THIS_FUNC GG_ui_fnc_adminMenu
#define DISPLAY_NAME GG_displayAdminMenu

#include "..\macros.inc"
#include "..\defines.inc"

#define VAR_MAP_PRESETS 			FUNC_SUBVAR(mapPresets)
#define VAR_MAP_PRESETS_SOURCE 		FUNC_SUBVAR(mapPresetsSource)
#define VAR_WEAPON_PRESETS 			FUNC_SUBVAR(weaponPresets)
#define VAR_WEAPON_PRESETS_SOURCE 	FUNC_SUBVAR(weaponPresetsSource)

#define VAL_CUSTOM_POS_MARKER "GG_CombatZoneCustom"

// https://github.com/ConnorAU/A3UserInputMenus
#define UIM_FNC(f) (missionNamespace getVariable [QUOTE(JOIN(CAU_UserInputMenus_fnc_,f)),{["missingUserInputMenus"] call THIS_FUNC;nil}])


disableSerialization;
SWITCH_SYS_PARAMS;

if (isMultiplayer && !(serverCommandAvailable "#kick")) exitWith {}; // not admin
if (
	isServer && !hasInterface &&
	{!(_mode in ["MapPresetGet","MapPresetGetServer","MapPresetSetServer","WeaponsPresetGet","WeaponsPresetGetServer","WeaponsPresetSetServer"])}
) exitWith {}; // executing on dedicated server outside of remoteExec context or not using a remoteExec mode

switch _mode do {
	case "onLoad":{
		uiNamespace setVariable [QUOTE(DISPLAY_NAME),_params#0];
	};
	case "init":{
		// Load the UI in unscheduled environment
		if !(isNull(THIS_DISPLAY)) exitWith {};

		createDialog QUOTE(DISPLAY_NAME);
		USE_DISPLAY(THIS_DISPLAY);
		_display displayAddEventHandler ["Unload",{["unload"] call THIS_FUNC}];

		USE_CTRL(_ctrlListParams,1);
		USE_CTRL(_ctrlButtonMapPresetSource,10);
		USE_CTRL(_ctrlButtonMapPresetLoad,11);
		USE_CTRL(_ctrlButtonMapPresetSave,12);
		USE_CTRL(_ctrlButtonMapPresetDelete,13);
		USE_CTRL(_ctrlMap,2);
		USE_CTRL(_ctrlComboWeapon,3);
		USE_CTRL(_ctrlListWeaponL,4);
		USE_CTRL(_ctrlButtonWeaponPresetSource,14);
		USE_CTRL(_ctrlButtonWeaponPresetLoad,15);
		USE_CTRL(_ctrlButtonWeaponPresetSave,16);
		USE_CTRL(_ctrlButtonWeaponPresetDelete,17);
		USE_CTRL(_ctrlListWeaponR,5);
		USE_CTRL(_ctrlButtonWeaponAdd,6);
		USE_CTRL(_ctrlButtonWeaponRemove,7);
		USE_CTRL(_ctrlButtonCancel,8);
		USE_CTRL(_ctrlButtonApply,9);

		{
			private _name = configName _x;
			private _value = ["getPending",_name] call GG_system_fnc_params;
			private _values = getArray(_x >> "values");
			private _valueIndex = _values find _value;

			private _index = _ctrlListParams lbAdd getText(_x >> "title");
			_ctrlListParams lbSetTextRight [_index,getArray(_x >> "texts")#_valueIndex];
			_ctrlListParams lbSetData [_index,_name];
			_ctrlListParams lbSetValue [_index,_valueIndex];
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
		["WeaponsListRightPopulate",_weaponPool] call THIS_FUNC;

		// preload all weapons
		_ctrlComboWeapon lbSetCurSel 1;
		if (isNil "GG_admin_customWeaponPool") then {
			// disable custom pool if no custom pool is already set
			_ctrlComboWeapon lbSetCurSel 0;
		};

		// Set UI display text and events
		if isServer then {
			// Disable source selection if you are the server because both options would pull from the same source profile
			uiNamespace setVariable [QUOTE(VAR_MAP_PRESETS_SOURCE),true];
			_ctrlButtonMapPresetSource ctrlEnable false;
		} else {
			["MapPresetGetServer"] remoteExecCall [QUOTE(THIS_FUNC),2];
			_ctrlButtonMapPresetSource ctrlAddEventHandler ["ButtonClick",{["PresetSourceToggle",[_this#0,"map"]] call THIS_FUNC}];
		};
		["PresetSourceToggle",[_ctrlButtonMapPresetSource,"map",true]] call THIS_FUNC;
		_ctrlButtonMapPresetLoad ctrlSetText "\a3\3den\data\displays\display3den\toolbar\open_ca.paa";
		_ctrlButtonMapPresetLoad ctrlSetTooltip "Load a saved combat zone preset";
		_ctrlButtonMapPresetLoad ctrlAddEventHandler ["ButtonClick",{["MapPresetLoad"] call THIS_FUNC}];
		_ctrlButtonMapPresetSave ctrlSetText "\a3\3den\data\displays\display3den\toolbar\save_ca.paa";
		_ctrlButtonMapPresetSave ctrlSetTooltip "Save the defined combat zone preset";
		_ctrlButtonMapPresetSave ctrlAddEventHandler ["ButtonClick",{["MapPresetSave"] call THIS_FUNC}];
		_ctrlButtonMapPresetDelete ctrlSetText "\a3\3den\data\displays\display3den\panelleft\entitylist_delete_ca.paa";
		_ctrlButtonMapPresetDelete ctrlSetTooltip "Delete a saved combat zone preset";
		_ctrlButtonMapPresetDelete ctrlAddEventHandler ["ButtonClick",{["MapPresetDelete"] call THIS_FUNC}];

		if isServer then {
			// Disable source selection if you are the server because both options would pull from the same source profile
			uiNamespace setVariable [QUOTE(VAR_WEAPON_PRESETS_SOURCE),true];
			_ctrlButtonWeaponPresetSource ctrlEnable false;
		} else {
			["WeaponsPresetGetServer"] remoteExecCall [QUOTE(THIS_FUNC),2];
			_ctrlButtonWeaponPresetSource ctrlAddEventHandler ["ButtonClick",{["PresetSourceToggle",[_this#0,"weapons"]] call THIS_FUNC}];
		};
		["PresetSourceToggle",[_ctrlButtonWeaponPresetSource,"weapons",true]] call THIS_FUNC;
		_ctrlButtonWeaponPresetLoad ctrlSetText "\a3\3den\data\displays\display3den\toolbar\open_ca.paa";
		_ctrlButtonWeaponPresetLoad ctrlSetTooltip "Load a saved weapon pool";
		_ctrlButtonWeaponPresetLoad ctrlAddEventHandler ["ButtonClick",{["WeaponsPresetLoad"] call THIS_FUNC}];
		_ctrlButtonWeaponPresetSave ctrlSetText "\a3\3den\data\displays\display3den\toolbar\save_ca.paa";
		_ctrlButtonWeaponPresetSave ctrlSetTooltip "Save the defined weapon pool";
		_ctrlButtonWeaponPresetSave ctrlAddEventHandler ["ButtonClick",{["WeaponsPresetSave"] call THIS_FUNC}];
		_ctrlButtonWeaponPresetDelete ctrlSetText "\a3\3den\data\displays\display3den\panelleft\entitylist_delete_ca.paa";
		_ctrlButtonWeaponPresetDelete ctrlSetTooltip "Delete a saved weapon pool";
		_ctrlButtonWeaponPresetDelete ctrlAddEventHandler ["ButtonClick",{["WeaponsPresetDelete"] call THIS_FUNC}];

		_ctrlButtonWeaponAdd ctrlSetText "\a3\ui_f\data\gui\rsccommon\rschtml\arrow_right_ca.paa";
		_ctrlButtonWeaponAdd ctrlAddEventHandler ["ButtonClick",{["WeaponsButtonClicked",[_this#0,true]] call THIS_FUNC}];
		_ctrlListWeaponL ctrlAddEventHandler ["LBDblClick",{["WeaponsButtonClicked",[_this#0,true]] call THIS_FUNC}];
		_ctrlButtonWeaponRemove ctrlSetText "\a3\ui_f\data\gui\rsccommon\rschtml\arrow_left_ca.paa";
		_ctrlButtonWeaponRemove ctrlAddEventHandler ["ButtonClick",{["WeaponsButtonClicked",[_this#0,false]] call THIS_FUNC}];
		_ctrlListWeaponR ctrlAddEventHandler ["LBDblClick",{["WeaponsButtonClicked",[_this#0,false]] call THIS_FUNC}];

		_ctrlButtonCancel ctrlAddEventHandler ["ButtonClick",{(ctrlParent(_this#0)) closeDisplay 2}];

		_ctrlButtonApply ctrlSetText "Save Changes";
		_ctrlButtonApply ctrlAddEventHandler ["ButtonClick",{["confirm",0] call THIS_FUNC}];

		["MapFocusOnZone"] call THIS_FUNC;
	};


	case "missingUserInputMenus":{
		private _linkText = FNC_LINKTEXT;

		[
			parseText format[
				"This action requires the %1 mod.",
				["User Input Menus","https://steamcommunity.com/sharedfiles/filedetails/?id=1673595418"] call _linkText
			],
			"Missing dependency",
			"Ok"
		] spawn BIS_fnc_guiMessage;
	};

	case "MapFocusOnZone":{
		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlMap,2);

		if (VAL_CUSTOM_POS_MARKER in allMapMarkers) then {
			VAL_CUSTOM_POS_MARKER setMarkerAlphaLocal 0.5;
			_ctrlMap ctrlMapAnimAdd [0,(((selectMax markerSize VAL_CUSTOM_POS_MARKER)*0.75)/worldSize)*10,markerPos VAL_CUSTOM_POS_MARKER];
		} else {
			_ctrlMap ctrlMapAnimAdd [0,(((selectMax markerSize "GG_CombatZone")*0.75)/worldSize)*10,markerPos "GG_CombatZone"];
		};
		ctrlMapAnimCommit _ctrlMap;
	};

	case "PresetSourceToggle":{
		_params params ["_ctrlButton","_type",["_firstLoad",false]];
		private _info = switch _type do {
			case "map":{[
				QUOTE(VAR_MAP_PRESETS_SOURCE),
				[
					[
						"\a3\3den\data\displays\display3den\toolbar\help_updates_ca.paa",
						"Use combat zone presets from the server profile"
					],
					[
						"\a3\3den\data\displays\display3den\statusbar\server_ca.paa",
						"Use combat zone presets from your local game profile"
					]
				]
			]};
			case "weapons":{[
				QUOTE(VAR_WEAPON_PRESETS_SOURCE),
				[
					[
						"\a3\3den\data\displays\display3den\toolbar\help_updates_ca.paa",
						"Use weapon pool presets from the server profile"
					],
					[
						"\a3\3den\data\displays\display3den\statusbar\server_ca.paa",
						"Use weapon pool presets from your local game profile"
					]
				]
			]};
			default {[]};
		};

		if (_info isEqualTo []) exitWith {};

		_info params ["_var","_states"];
		private _value = uiNamespace getVariable [_var,true];
		if !_firstLoad then {
			_value = !_value;
			uiNamespace setVariable [_var,_value];
			saveProfileNamespace;
		};

		private _state = _states select _value;
		_ctrlButton ctrlSetText (_state#0);
		_ctrlButton ctrlSetTooltip (_state#1);
	};


	case "ParamsLBDblClick":{
		_params params ["_ctrlListParams","_index"];
		private _data = _ctrlListParams lbData _index;
		if (["spacer",_data] call BIS_fnc_inString) exitWith {};

		private _cfg = missionConfigFile >> "Params" >> _data;
		private _texts = getArray(_cfg >> "texts");

		private _options = [];
		for "_i" from 0 to count _texts - 1 do {
			_options pushback [
				[_texts#_i],[],[],[],"",
				_texts#_i,_i
			];
		};

		[
			[_options,_ctrlListParams lbValue _index],
			"Select a Value",
			{
				if _confirmed then {
					["ParamsValueChanged",[_data,_value]] call THIS_FUNC
				};
			},
			"Select",""
		] call UIM_FNC(listBox);
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

	case "MapPresetGet":{
		private _presets = if (uiNamespace getVariable [QUOTE(VAR_MAP_PRESETS_SOURCE),true]) then {
			private _allMapPresets = profileNamespace getVariable [QUOTE(VAR_MAP_PRESETS),[]];
			_allMapPresets param [_allMapPresets findIf {_x#0 == worldName},[],[[]],2] param [1,[],[[]]];
		} else {
			(THIS_DISPLAY) getVariable [QUOTE(VAR_MAP_PRESETS),[]];
		};
		+_presets;
	};
	case "MapPresetGetServer":{
		private _return = ["MapPresetGet"] call THIS_FUNC;
		["MapPresetGetServerReturn",_return] remoteExecCall [QUOTE(THIS_FUNC),remoteExecutedOwner];
	};
	case "MapPresetGetServerReturn":{
		(THIS_DISPLAY) setVariable [QUOTE(VAR_MAP_PRESETS),_params];
	};
	case "MapPresetSet";
	case "MapPresetSetServer":{
		if (_mode == "MapPresetSet" && {!(uiNamespace getVariable [QUOTE(VAR_MAP_PRESETS_SOURCE),true])}) exitWith {
			["MapPresetSetServer",_params] remoteExecCall [QUOTE(THIS_FUNC),2];
			["MapPresetGetServerReturn",_params] call THIS_FUNC;
		};
		private _allMapPresets = profileNamespace getVariable [QUOTE(VAR_MAP_PRESETS),[]];
		private _thisWorldMapPresetsIndex = _allMapPresets findIf {_x#0 == worldName};
		if (_thisWorldMapPresetsIndex > -1) then {
			_allMapPresets set [_thisWorldMapPresetsIndex,[worldName,_params]];
		} else {
			_allMapPresets pushBack [worldName,_params];
		};
		profileNamespace setVariable [QUOTE(VAR_MAP_PRESETS),_allMapPresets];
		saveProfileNamespace;
	};
	case "MapPresetLoad";
	case "MapPresetDelete":{
		private _presets = ["MapPresetGet"] call THIS_FUNC;
		if (_presets isEqualTo []) then {
			[
				["You do not have any combat zone presets saved for this terrain."],
				"Unable to show presets",
				nil,nil,nil,THIS_DISPLAY
			] call UIM_FNC(guiMessage);
		} else {
			{_presets set [_forEachIndex,[[format["%1. %2",_forEachIndex + 1,_x#0]]]]} forEach _presets;

			private _args = [
				[
					{
						if _confirmed then {
							deleteMarker VAL_CUSTOM_POS_MARKER;
							private _presets = ["MapPresetGet"] call THIS_FUNC;
							["MapSingleClick",[nil,_presets#_index#1,true]] call THIS_FUNC;
							["MapFocusOnZone"] call THIS_FUNC;
						};
					},
					localize "str_a3_rscdisplayarsenal_stat_load"
				],
				[
					{
						if _confirmed then {
							private _presets = ["MapPresetGet"] call THIS_FUNC;
							_presets deleteAt _index;
							["MapPresetSet",_presets] call THIS_FUNC;
						};
					},
					localize "STR_3DEN_Delete"
				]
			] select (_mode == "MapPresetDelete");

			[[_presets],"Select a combat zone preset",_args#0,_args#1,"",THIS_DISPLAY] call UIM_FNC(listBox);
		};
	};
	case "MapPresetSave":{
		if (VAL_CUSTOM_POS_MARKER in allMapMarkers) then {
			[
				[nil,mapGridPosition markerPos VAL_CUSTOM_POS_MARKER],
				"Name this combat zone preset",
				{
					if _confirmed then {
						private _presets = ["MapPresetGet"] call THIS_FUNC;
						_presets pushBackUnique [_text,markerPos VAL_CUSTOM_POS_MARKER];
						["MapPresetSet",_presets] call THIS_FUNC;
					};
				},
				localize "str_3den_display3den_menubar_missionsave_text",
				"",THIS_DISPLAY
			] call UIM_FNC(text);
		} else {
			[
				["You must place a custom combat zone on the map before you can save it."],
				"Unable to save combat zone preset",
				nil,nil,nil,THIS_DISPLAY
			] call UIM_FNC(guiMessage);
		};
	};


	case "WeaponsComboLBSelChanged":{
		_params params ["_ctrlComboWeapon","_index"];

		USE_DISPLAY(ctrlParent _ctrlComboWeapon);
		USE_CTRL(_ctrlListWeaponL,4);
		USE_CTRL(_ctrlListWeaponR,5);
		USE_CTRL(_ctrlButtonWeaponAdd,6);
		USE_CTRL(_ctrlButtonWeaponRemove,7);

		private _enable = _index > 0;
		_ctrlListWeaponL ctrlEnable _enable;
		_ctrlListWeaponR ctrlEnable _enable;
		_ctrlButtonWeaponAdd ctrlEnable _enable;
		_ctrlButtonWeaponRemove ctrlEnable _enable;

		//lbClear _ctrlListWeaponR;
		if _enable then {
			["WeaponsListLeftPopulate"] call THIS_FUNC;
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
	case "WeaponsListLeftPopulate":{
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
	case "WeaponsListRightPopulate":{
		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlListWeaponR,5);

		lbClear _ctrlListWeaponR;
		{
			private _config = configFile >> "CfgWeapons" >> _x;
			private _index = _ctrlListWeaponR lbAdd getText(_config >> "displayName");
			_ctrlListWeaponR lbSetTooltip [_index,_x];
			_ctrlListWeaponR lbSetData [_index,_x];
			_ctrlListWeaponR lbSetPicture [_index,getText(_config >> "picture")];
			_ctrlListWeaponR lbSetPictureRight [_index,["WeaponsDLCIcon",_config] call THIS_FUNC];
		} forEach _params;
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

	case "WeaponsPresetGet":{
		private _source = if (uiNamespace getVariable [QUOTE(VAR_WEAPON_PRESETS_SOURCE),true]) then {profileNamespace} else {THIS_DISPLAY};
		+(_source getVariable [QUOTE(VAR_WEAPON_PRESETS),[]]);
	};
	case "WeaponsPresetGetServer":{
		private _return = ["WeaponsPresetGet"] call THIS_FUNC;
		["WeaponsPresetGetServerReturn",_return] remoteExecCall [QUOTE(THIS_FUNC),remoteExecutedOwner];
	};
	case "WeaponsPresetGetServerReturn":{
		USE_DISPLAY(THIS_DISPLAY);
		_display setVariable [QUOTE(VAR_WEAPON_PRESETS),_params];
	};
	case "WeaponsPresetSet";
	case "WeaponsPresetSetServer":{
		if (_mode == "WeaponsPresetSet" && {!(uiNamespace getVariable [QUOTE(VAR_WEAPON_PRESETS_SOURCE),true])}) exitWith {
			["WeaponsPresetSetServer",_params] remoteExecCall [QUOTE(THIS_FUNC),2];
			["WeaponsPresetGetServerReturn",_params] call THIS_FUNC;
		};
		profileNamespace setVariable [QUOTE(VAR_WEAPON_PRESETS),_params];
		saveProfileNamespace;
	};
	case "WeaponsPresetLoad";
	case "WeaponsPresetDelete":{
		private _presets = ["WeaponsPresetGet"] call THIS_FUNC;
		if (_presets isEqualTo []) then {
			[
				["You do not have any weapon pool presets saved."],
				"Unable to show presets",
				nil,nil,nil,THIS_DISPLAY
			] call UIM_FNC(guiMessage);
		} else {
			{_presets set [_forEachIndex,[[format["%1. %2",_forEachIndex + 1,_x#0]]]]} forEach _presets;

			private _args = [
				[
					{
						if _confirmed then {
							private _presets = ["WeaponsPresetGet"] call THIS_FUNC;
							["WeaponsListRightPopulate",_presets#_index#1] call THIS_FUNC;

							USE_DISPLAY(THIS_DISPLAY);
							USE_CTRL(_ctrlComboWeapon,3);
							_ctrlComboWeapon lbSetCurSel 1;
						};
					},
					localize "str_a3_rscdisplayarsenal_stat_load"
				],
				[
					{
						if _confirmed then {
							private _presets = ["WeaponsPresetGet"] call THIS_FUNC;
							_presets deleteAt _index;
							["WeaponsPresetSet",_presets] call THIS_FUNC;
						};
					},
					localize "STR_3DEN_Delete"
				]
			] select (_mode == "WeaponsPresetDelete");

			[[_presets],"Select a weapon pool preset",_args#0,_args#1,"",THIS_DISPLAY] call UIM_FNC(listBox);
		};
	};
	case "WeaponsPresetSave":{
		USE_DISPLAY(THIS_DISPLAY);
		USE_CTRL(_ctrlListWeaponR,5);

		if (lbSize _ctrlListWeaponR > 0) then {
			private _placeholderName = if (lbSize _ctrlListWeaponR > 1) then {
				(_ctrlListWeaponR lbText 0) + "  -  " + (_ctrlListWeaponR lbText (lbSize _ctrlListWeaponR - 1))
			} else {_ctrlListWeaponR lbText 0};

			[
				[false,_placeholderName],
				"Name this weapon pool preset",
				{
					if _confirmed then {
						USE_DISPLAY(THIS_DISPLAY);
						USE_CTRL(_ctrlListWeaponR,5);

						private _weaponPool = [];
						for "_i" from 0 to lbSize _ctrlListWeaponR - 1 do {
							_weaponPool pushBack (_ctrlListWeaponR lbData _i);
						};

						private _presets = ["WeaponsPresetGet"] call THIS_FUNC;
						_presets pushBackUnique [_text,_weaponPool];
						["WeaponsPresetSet",_presets] call THIS_FUNC;
					};
				},
				localize "str_3den_display3den_menubar_missionsave_text",
				"",THIS_DISPLAY
			] call UIM_FNC(text);
		} else {
			[
				["You must add a weapon to the weapon pool before you can save it."],
				"Unable to save weapon pool preset",
				nil,nil,nil,THIS_DISPLAY
			] call UIM_FNC(guiMessage);
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
				private _valueNew = getArray(missionConfigFile >> "Params" >> _param >> "values")#(_ctrlListParams lbValue _i);
				private _valueOld = ["get",_param] call GG_system_fnc_params;
				if (_valueNew != _valueOld) then {
					["setPending",[_param,_valueNew]] call GG_system_fnc_params;
				};
			};

			missionNamespace setVariable [
				"GG_admin_customCombatZonePos",
				if (VAL_CUSTOM_POS_MARKER in allMapMarkers) then {
					[
						"Custom Location",
						markerPos VAL_CUSTOM_POS_MARKER,
						markerSize VAL_CUSTOM_POS_MARKER,
						markerDir VAL_CUSTOM_POS_MARKER
					]
				},
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
				if (_weaponPool isEqualTo []) then {_weaponPool},
				true
			];

			_display closeDisplay 2;

			[
				["Would you like to reset the round and apply these changes immediately?"],
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

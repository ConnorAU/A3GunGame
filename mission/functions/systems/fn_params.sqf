/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_params

Description:
	None

Parameters:
	0 : STRING - Subfunction name
	1 : ANY    - Subfunction arguments

Return:
	NUMBER or Nothing - Depending on provided subfunction name
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_system_fnc_params

#include "..\defines.inc"

#define VAR(a) format["%1_%2",QUOTE(THIS_FUNC),a]
#define VAR2(a) format["%1_pending_%2",QUOTE(THIS_FUNC),a]

SWITCH_SYS_PARAMS;

switch _mode do {
	case "init":{
		if !isServer exitWith {};

		{
			missionNamespace setVariable [
				VAR(configName _x),
				(configName _x) call BIS_fnc_getParamValue,
				true
			];
		} foreach ("true" configClasses (missionConfigFile >> "Params"));
	};
	case "pending":{
		{
			private _val = missionNameSpace getVariable VAR2(configname _x);
			if (!isNil "_val") then {
				missionNamespace setVariable [VAR(configName _x),_val,true];
				missionNamespace setVariable [VAR2(configName _x),nil,true];
			};
		} foreach ("true" configClasses (missionConfigFile >> "Params"));
	};
	case "get":{
		missionNamespace getVariable [VAR(_params),getNumber(missionConfigFile >> "Params" >> _params >> "default")];
	};
	case "getPending":{
		missionNamespace getVariable [VAR2(_params),["get",_params] call THIS_FUNC];
	};
	case "setPending":{
		// public var so new admins can see the pending change before the round resets
		missionNamespace setVariable [VAR2(_params#0),_params#1,true];
	};
};

/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_eventhandler_fnc_keyUp

Information:
	https://community.bistudio.com/wiki/User_Interface_Event_Handlers#onKeyUp
---------------------------------------------------------------------------- */

#include "..\dikcodes.inc"
#include "..\defines.inc"

params ["", "_key", "_shift"];

if GG_c_modifyVolume then {
	private _vol = soundVolume - 0.25;
	if (_vol < 0) then {_vol = 1};
	1 fadeSound _vol;
	titleText [format["Sound adjusted to %1%2",_vol*100,"%"],"PLAIN DOWN"];
	GG_c_modifyVolume = false;
};

if (_key == DIK_V) exitWith {
	[] call GG_system_fnc_jump;
};
if (_key == DIK_H) exitWith {
	[] call GG_ui_fnc_welcome;
};
if (_key == DIK_F2) exitWith {
	["init"] call GG_ui_fnc_adminMenu;
};

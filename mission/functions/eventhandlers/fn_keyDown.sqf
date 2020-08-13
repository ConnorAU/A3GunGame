/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_eventhandler_fnc_keyDown

Information:
	https://community.bistudio.com/wiki/User_Interface_Event_Handlers#onKeyDown
---------------------------------------------------------------------------- */

#include "..\dikcodes.inc"
#include "..\defines.inc"

params ["", "_key", "_shift"];

if !(ROUND_OVER) then {
	GG_c_modifyVolume = if (count (actionKeys "User1") > 0) then {
		inputAction "User1" > 0
	} else {
		_key == DIK_F1
	};

	if (inputAction "NetworkStats" > 0) then {
		["init"] call GG_ui_fnc_leaderboard;
	};

};

GG_c_modifyVolume || _key in [DIK_H,DIK_F2] || (_key in [DIK_V] && _shift)

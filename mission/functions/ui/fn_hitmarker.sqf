/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_ui_fnc_hitmarker

Description:
	Display a hitmarker icon on the screen to indicate hitting an enemy
	Shown as white for a hit, and red for a kill

Parameters:
	0 : BOOL - true if called by killing an enemy

Return:
	Nothing
---------------------------------------------------------------------------- */

#include "..\macros.inc"
#include "..\defines.inc"

#define DIALOG_W 12
#define DIALOG_H 12

params [["_kill",false,[true]]];

disableSerialization;
USE_DISPLAY(findDisplay 46);

private _ctrlImage = _display ctrlCreate ["ctrlStaticPicture",-1];
_ctrlImage ctrlSetText "\a3\ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa";
_ctrlImage ctrlSetTextColor ([[1,1,1,1],[1,0,0,1]] select _kill);
_ctrlImage ctrlSetPosition [
	CENTER_XS(DIALOG_W),
	CENTER_YS(DIALOG_H),
	PX_WS(DIALOG_W),
	PX_HS(DIALOG_H)
];
_ctrlImage ctrlCommit 0;

uisleep 0.2;

_ctrlImage ctrlSetFade 1;
_ctrlImage ctrlCommit 0.2;

waitUntil {ctrlCommitted _ctrlImage};

ctrlDelete _ctrlImage;

nil

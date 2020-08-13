/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_eventhandler_fnc_playerConnected

Information:
	https://community.bistudio.com/wiki/Arma_3:_Event_Handlers/addMissionEventHandler#PlayerConnected
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_eventhandler_fnc_playerConnected

#include "..\defines.inc"

params ["_id", "_uid", "_name", "_jip", "_owner"];

private _log = format["Player connected: %1 (%2)",_name,_uid];
DLOG(_log);

/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_eventhandler_fnc_respawn

Information:
	https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Respawn
---------------------------------------------------------------------------- */

#include "..\defines.inc"

params ["_unit","_corpse"];

_unit disableConversation true;
_unit enableStamina false;
_unit setCustomAimCoef 0;
_unit switchCamera GG_c_cameraView;

_unit setVariable ["GG_c_kills",GG_c_kills,true];
_unit setVariable ["GG_c_deaths",GG_c_deaths,true];
_unit setVariable ["GG_c_score",GG_c_score,true];
_unit setVariable ["GG_c_name",name _unit,true];
_unit setVariable ["GG_c_hitPointDamage",[]];

deleteVehicle _corpse;

[] call GG_system_fnc_applyLoadout;
[] call GG_system_fnc_applyWeapon;
[] spawn GG_system_fnc_moveToSpawn;

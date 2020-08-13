/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_setup_fnc_mission

Description:
	Executes initialization functions on preinit

Parameters:
	None

Return:
	Nothing
---------------------------------------------------------------------------- */

/*
	Inits are spawned from this file so they dont delay the mission from loading.
	It would make just as much sense to execute these from initPlayerLocal.sqf and initServer.sqf, but I hate a cluttered mission root so here we are.
*/
if isServer then {[] spawn GG_setup_fnc_server;};
if hasInterface then {[] spawn GG_setup_fnc_client;};

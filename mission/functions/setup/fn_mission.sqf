/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

/*
	Inits are spawned from this file so they dont delay the mission from loading.
	It would make just as much sense to execute these from initPlayerLocal.sqf and initServer.sqf, but I hate a cluttered mission root so here we are.
*/
if isServer then {[] spawn GG_setup_fnc_server;};
if hasInterface then {[] spawn GG_setup_fnc_client;};
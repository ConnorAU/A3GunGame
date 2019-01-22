/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "..\defines.inc"

if GG_c_modifyVolume then {
	private _vol = soundVolume - 0.25;
	if (_vol < 0) then {_vol = 1};
	1 fadeSound _vol;
	titleText [format["Sound adjusted to %1%2",_vol*100,"%"],"PLAIN DOWN"];
	GG_c_modifyVolume = false;
}; 

if (GVAR(MNS,"GG_c_leaderboardShown",false)) then {
	["destroy"] call GG_ui_fnc_leaderboard;
	GG_c_leaderboardShown = false;
};
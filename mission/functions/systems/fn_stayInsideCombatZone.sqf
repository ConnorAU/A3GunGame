/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "..\defines.inc"

private ["_greyScaleHandle","_outOfZoneTick"];
while {!(ROUND_OVER)} do {
	if !(player inArea "GG_CombatZone") then {
		if (player distance (markerPos "respawn") > 25) then {
			// begin UI effects
			"ColorCorrections" ppEffectEnable true;
			"ColorCorrections" ppEffectAdjust [1,1,0,[0,0,0,0.5],[1,1,1,0],[0.299,0.587,0.114,0]];
			"ColorCorrections" ppEffectCommit 2;
			"FilmGrain" ppEffectEnable true;
			"FilmGrain" ppEffectAdjust [0.75,1.5,1.7,0.2,1.0,true];
			"FilmGrain" ppEffectCommit 1;

			for "_i" from 9 to 0 step -1 do {
				[format["<t color='#FF0000' shadow=2 >You have left the combat zone: %1</t>",_i],-1,-1,1.5,[0,1] select (_i == 9)] spawn BIS_fnc_dynamicText;

				uisleep 1;

				if (player inArea "GG_CombatZone" || ROUND_OVER) exitWith {};
				if (_i == 0) exitWith {player setDamage 1};
			};

			"ColorCorrections" ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0.299,0.587,0.114,0],[-1,-1,0,0,0,0,0]];
			"ColorCorrections" ppEffectCommit 2;
			"FilmGrain" ppEffectAdjust [0,1.5,1.7,0.2,1.0,true];
			"FilmGrain" ppEffectCommit 1;

			// wait for player to be back in zone before resuming checks (for when someone dies outside of the zone)
			waitUntil {player inArea "GG_CombatZone" || ROUND_OVER};
		};
	};
	uisleep 0.01;
};
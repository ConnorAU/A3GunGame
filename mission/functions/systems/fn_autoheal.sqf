/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "..\defines.inc"

params [["_unit",player,[objNull]]];

uiSleep 8;

if (isNull _unit || {!alive _unit}) exitWith {};
while {damage _unit > 0} do {
	_unit setDamage (damage _unit - 0.05);
	uiSleep 0.5;
};

/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_openAllDoors

Description:
	Opens all doors and gates inside the combat zone

Parameters:
	None

Return:
	Nothing
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_system_fnc_openAllDoors

#include "..\defines.inc"

private _size = (GG_s_votedMapSize#0 max GG_s_votedMapSize#1)*2.5;
private _objects = nearestObjects[getMarkerPos "GG_CombatZone",["House_F","Wall_F"],_size];

{
	private _class = configFile >> "CfgVehicles" >> typeof _x ;
	private _doors = getNumber(_class >> "numberOfDoors");
	for "_i" from 1 to _doors do {
		private _source = format["Door_%1_sound_source",_i];
		if (isClass (_class >> "AnimationSources" >> _source)) then {
			_x animateSource [_source,1];
		};
	};
} foreach _objects;

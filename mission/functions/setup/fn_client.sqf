/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_setup_fnc_client

Description:
	Initializes client systems on first load, and resets the client on new round start

Parameters:
	None

Return:
	Nothing
---------------------------------------------------------------------------- */

#include "..\defines.inc"

"GG_c_layer_interlacing" cutRsc ["RscInterlacing","BLACK OUT",0];
"GG_c_layer_interlacing" cutFadeOut 999999;

if (isNil "GG_c_firstInitComplete") then {
	addMissionEventHandler["PreloadFinished",{
		GG_c_preloadFinished = true;
		removeMissionEventHandler ["PreloadFinished",_thisEventHandler];
	}];

	waitUntil {!isNil "GG_c_preloadFinished"};
	GG_c_preloadFinished = nil;
};

private _tick = diag_tickTime + 1;
startLoadingScreen [""];

if (isNil "GG_c_firstInitComplete") then {
	waituntil {
		if (diag_tickTime > _tick) then {
			_tick = diag_tickTime + 1;
			diag_log text format["CAU_GG_DEBUG || %1 %2: %3",__FILE__,__LINE__,[!isNull player,player isKindOf "CAManBase",!isMultiplayer,netid player != ""]];
		};
		!isNull player && {player isKindOf "CAManBase" && {!isMultiplayer || {netid player != ""}}}
	};

	[player] remoteExecCall ["GG_system_fnc_validateUnit",2];

	// Ensure units are moved to their own group (doing only one attempt failed on the odd occasion)
	for "_i" from 1 to 50 do {
		private _group = createGroup[playerSide,true];
		[player] joinSilent _group;
		waitUntil {
			if (diag_tickTime > _tick) then {
				_tick = diag_tickTime + 1;
				diag_log text format["CAU_GG_DEBUG || %1 %2: %3",__FILE__,__LINE__,[group player isEqualTo _group,group player,_group]];
			};
			group player isEqualTo _group
		};
		if (count units _group == 1) exitWith {};
	};

	player disableConversation true;
	player enableStamina false;
	player setCustomAimCoef 0;
	setTerrainGrid 25;

	enableEnvironment [false,true];
	enableSentences false;
	enableRadio false;
	showSubtitles false;
	enableSaving[false,false];
	inGameUISetEventHandler ["PrevAction", ""];
	inGameUISetEventHandler ["Action", ""];
	inGameUISetEventHandler ["NextAction", ""];

	{
		_x params ["_id","_chat","_voip"];
		_id enableChannel [!(call compile _chat),!(call compile _voip)];
	}foreach getArray(missionConfigFile >> "disableChannels");
	setCurrentChannel 0;

	player addEventHandler ["InventoryOpened",{call GG_eventhandler_fnc_inventoryOpened}];
	player addEventHandler ["HandleDamage",{call GG_eventhandler_fnc_handleDamage}];
	player addEventHandler ["Respawn",{call GG_eventhandler_fnc_respawn}];
	player addMPEventHandler ["MPKilled",{call GG_eventhandler_fnc_MPKilled}];
	player addMPEventHandler ["MPHit",{call GG_eventhandler_fnc_MPHit}];
	addMissionEventHandler["Map",{call GG_eventhandler_fnc_map}];
};

// https://steamcommunity.com/sharedfiles/filedetails/?id=1493485159
[
    ["UpdateDetails","Voting for new map"],
    ["UpdateState",""],
    ["UpdateLargeImageKey",tolower worldName],
    ["UpdateLargeImageText",getText(configFile >> "CfgWorlds" >> worldName >> "description")],
    ["UpdateSmallImageKey","arma3"],
	["UpdateSmallImageText","Arma 3"]/*,
	["UpdateStartTimestamp",[0,0]]*/
] call (missionNameSpace getVariable["DiscordRichPresence_fnc_update",{}]);

showChat true;
showScoretable 0;
setViewDistance 600;

GG_c_kills = 0;
GG_c_killStreak = 0;
GG_c_deaths = 0;
GG_c_score = 0;

player setVariable ["GG_c_kills",GG_c_kills,true];
player setVariable ["GG_c_deaths",GG_c_deaths,true];
player setVariable ["GG_c_score",GG_c_score,true];
player setVariable ["GG_c_name",name player,true];

waitUntil {
	if (diag_tickTime > _tick) then {
		_tick = diag_tickTime + 1;
		diag_log text format["CAU_GG_DEBUG || %1 %2: %3",__FILE__,__LINE__,[!(displayNull in [findDisplay 12,findDisplay 46]),[findDisplay 12,findDisplay 46]]];
	};
	!(displayNull in [findDisplay 12,findDisplay 46])
};
endLoadingScreen;

if (isNil "GG_c_firstInitComplete") then {
	(finddisplay 46) displayAddEventHandler ["KeyDown",{call GG_eventhandler_fnc_keyDown}];
	(finddisplay 46) displayAddEventHandler ["KeyUp",{call GG_eventhandler_fnc_keyUp}];

	[] call GG_ui_fnc_watermark;
	[] call GG_ui_fnc_welcome;

	GG_c_firstInitComplete = true;
};

if ROUND_OVER then {
	["<t shadow=2 >The round has ended. Next round will start in a moment...</t>",[-1,-1],[-1,-1],1e14,0.5] spawn BIS_fnc_dynamicText;
	waitUntil {!(ROUND_OVER)};
	uisleep 2;
	["",[-1,-1],[-1,-1],1,0] spawn BIS_fnc_dynamicText;
};

[] call GG_system_fnc_applyLoadout;

if !COMBAT_ZONE_EXISTS then {
	"GG_c_layer_interlacing" cutText ["","PLAIN",0];
	["client"] call GG_system_fnc_voteMap;
};

// https://steamcommunity.com/sharedfiles/filedetails/?id=1493485159
[
	["UpdateDetails",(missionNameSpace getVariable ["GG_s_votedMapName",""]) call GG_system_fnc_fixDiscordString]
] call (missionNameSpace getVariable["DiscordRichPresence_fnc_update",{}]);

waitUntil {!isNil "GG_s_weaponPool"};

// Weapon pool finalized, we can now check the condition and exit if needed
private _weaponPool = [] call GG_config_fnc_weapons;
private _condition = _weaponPool select 1;
if !(call _condition) exitWith {endMission "MissingMods";};

["init"] call GG_ui_fnc_weaponList;
[] call GG_system_fnc_applyWeapon;

[] remoteExecCall ["GG_system_fnc_resizeCombatZone",2];
[true] call GG_system_fnc_moveToSpawn;

[] spawn GG_system_fnc_stayInsideCombatZone;
["init"] call GG_ui_fnc_miniMap;
["init"] call GG_ui_fnc_leaderboardMini;

nil

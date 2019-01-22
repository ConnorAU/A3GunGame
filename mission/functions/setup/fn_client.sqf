/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

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

startLoadingScreen [""];

if (isNil "GG_c_firstInitComplete") then {
	waituntil {!isNull player && {player isKindOf "CAManBase" && {!isMultiplayer || {netid player != ""}}}};

	[player] joinSilent createGroup[playerSide,true];

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
] call (GVAR(MNS,"DiscordRichPresence_fnc_update",{}));

showChat true;
showScoretable 0;
setViewDistance 600;

GG_c_kills = 0;
GG_c_killStreak = 0;
GG_c_deaths = 0;
GG_c_score = 0;

SVAR_J(player,"GG_c_kills",GG_c_kills,true);
SVAR_J(player,"GG_c_deaths",GG_c_deaths,true);
SVAR_J(player,"GG_c_score",GG_c_score,true);
SVAR_J(player,"GG_c_name",name player,true);

waitUntil {!(displayNull in [findDisplay 12,findDisplay 46])};
endLoadingScreen;

if (isNil "GG_c_firstInitComplete") then {
	(finddisplay 46) displayAddEventHandler ["KeyDown",{call GG_eventhandler_fnc_keyDown}];
	(finddisplay 46) displayAddEventHandler ["KeyUp",{call GG_eventhandler_fnc_keyUp}];

	[] call GG_ui_fnc_watermark;
	["init"] call GG_ui_fnc_welcome;

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


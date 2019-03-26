/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ui_fnc_welcome

#include "..\macros.inc"
#include "..\defines.inc"

private _linkText = {
	params ["_text","_url"];
	private _colorRGBA = [COLOR_ACTIVE_RGBA] call BIS_fnc_colorConfigToRGBA;
	private _colorHex = _colorRGBA call BIS_fnc_colorRGBtoHTML;
	format["<a colorLink='%1' href='%2'>%3</t>",_colorHex,_url,_text]
};

private _text = [
	"<t size='1.4' align='center'>Gun Game by ConnorAU</t>",
	"",
	"<t size='1.2'>Controls</t>",
	"F1 or Custom Action 1: Earplugs",
	"P or Multiplayer Statistics: Leaderboard",
	"V: Jump (while running, primary weapon only)",
	"",
	"<t size='1.2'>Mod Support</t>",
	"This version of gun game supports the following map, uniform and weapon mods:",
	format["%1 (Equipment and Weapons)",["3CB","https://steamcommunity.com/workshop/filedetails/?id=909680404"] call _linkText],
	format["%1 (Terrains, Units and Weapons)",["CUP","https://steamcommunity.com/workshop/filedetails/?id=583575232"] call _linkText],
	format["%1",["IFA3","https://steamcommunity.com/workshop/filedetails/?id=660460283"] call _linkText],
	format["%1",["Isla Duala","https://steamcommunity.com/workshop/filedetails/?id=714149065"] call _linkText],
	format["%1",["Montella","https://steamcommunity.com/workshop/filedetails/?id=1562904329"] call _linkText],
	format["%1",["Operation: TREBUCHET","https://steamcommunity.com/workshop/filedetails/?id=769440155"] call _linkText],
	format["%1 (AFRF, GREF, SAF and USAF)",["RHS","https://steamcommunity.com/workshop/filedetails/?id=843770737"] call _linkText],
	format["You can find mission files for other maps on %1 and %2.",["steam","https://steamcommunity.com/sharedfiles/filedetails/?id=1641133934"] call _linkText,["github","https://github.com/ConnorAU/A3GunGame/releases"] call _linkText],
	"",
	"<t size='1.2'>Optional Mods</t>",
	"This mission has built in support for the following optional mods:",
	format["%1",["Discord Rich Presence","https://steamcommunity.com/sharedfiles/filedetails/?id=1493485159"] call _linkText],
	format["%1 (server-side only)",["Discord Embed Builder","https://github.com/ConnorAU/SQFDiscordEmbedBuilder"] call _linkText],
	""
];

// Open source mods are not embeded in the AIO mod. They are listed as dependencies instead.
_text append ([
	[
		"<t size='1.2'>Embeded Mods</t>",
		"This mission contains the following open source mods:"
	],
	[
		"<t size='1.2'>Required Mods</t>",
		"This mission requires the following mods to work properly:"
	]
] select isClass(configFile >> "CfgPatches" >> "CAU_GunGameMissions"));

_text append [
	format["%1",["Extended Chat","https://steamcommunity.com/sharedfiles/filedetails/?id=1667280668"] call _linkText],
	format["%1",["User Input Menus","https://steamcommunity.com/sharedfiles/filedetails/?id=1673595418"] call _linkText],
	"",
	format["If you have any questions about this mission, you can contact me on %1.",["discord","https://discord.gg/DMkxetD"] call _linkText]
];

[_text joinString "<br/>","Welcome",{},"Continue"] call CAU_UserInputMenus_fnc_guiMessage;
waitUntil {isNull(uiNamespace getVariable ["CAU_UserInputMenus_displayGuiMessage",displayNull])};

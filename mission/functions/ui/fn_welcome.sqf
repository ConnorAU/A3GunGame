/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ui_fnc_welcome

#include "\a3\3den\ui\macros.inc"
#include "..\defines.inc"

#define DIALOG_Y ((safeZoneY+(0.5*safeZoneH))-(0.5*DIALOG_H))
#define DIALOG_W 120
#define DIALOG_H _dialogH

disableSerialization;
SWITCH_SYS_PARAMS;

switch _mode do {
	case "init":{
		disableSerialization;
		USE_DISPLAY(findDisplay 46);
		isNil {
			private _linkText = {
				params ["_text","_url"];
				private _colorRGBA = [COLOR_ACTIVE_RGBA] call BIS_fnc_colorConfigToRGBA;
				private _colorHex = _colorRGBA call BIS_fnc_colorRGBtoHTML;
				format["<a colorLink='%1' href='%2'>%3</t>",_colorHex,_url,_text]
			};

			private _displayEmpty = _display createDisplay "RscDisplayEmpty";
			SVAR(_display,"GG_welcome_display",_displayEmpty);

			private _ctrlBackground = _displayEmpty ctrlCreate ["ctrlStaticBackground",-1];
			private _ctrlTitle = _displayEmpty ctrlCreate ["ctrlStaticTitle",-1];
			private _ctrlFooter = _displayEmpty ctrlCreate ["ctrlStaticFooter",-1];
			private _ctrlButton = _displayEmpty ctrlCreate ["ctrlButtonClose",-1];
			private _ctrlBody = _displayEmpty ctrlCreate ["ctrlStructuredText",-1];

			_ctrlBody ctrlSetPosition [CENTER_XA(DIALOG_W),0,PX_WA(DIALOG_W),safezoneH];
			_ctrlBody ctrlCommit 0;
			_ctrlBody ctrlSetStructuredText parseText ([
				"<t size='1.5' align='center'>Gun Game by ConnorAU</t>",
				"",
				"<t size='1.25'>Controls</t>",
				"F1 or Custom Action 1: Earplugs",
				"P or Multiplayer Statistics: Leaderboard",
				"",
				"<t size='1.25'>Mod Support</t>",
				"This version of gun game supports the following map, uniform and weapon mods:",
				format["%1 (Equipment and Weapons)",["3CB","https://steamcommunity.com/workshop/filedetails/?id=909680404"] call _linkText],
				format["%1 (Terrains, Units and Weapons)",["CUP","https://steamcommunity.com/workshop/filedetails/?id=583575232"] call _linkText],
				format["%1",["IFA3","https://steamcommunity.com/workshop/filedetails/?id=660460283"] call _linkText],
				format["%1",["Isla Duala","https://steamcommunity.com/workshop/filedetails/?id=714149065"] call _linkText],
				format["%1",["Montella","https://steamcommunity.com/workshop/filedetails/?id=1562904329"] call _linkText],
				format["%1",["Operation: TREBUCHET","https://steamcommunity.com/workshop/filedetails/?id=769440155"] call _linkText],
				format["%1 (AFRF, GREF, SAF and USAF)",["RHS","https://steamcommunity.com/workshop/filedetails/?id=843770737"] call _linkText],
				format["<t size='0.9'>You can find mission files for other maps on %1.</t>",["github","https://github.com/ConnorAU/A3GunGame/releases"] call _linkText],
				"",
				"<t size='1.25'>Optional Mods</t>",
				"This mission has built in support for the following optional mods:",
				format["%1",["Discord Rich Presence","https://steamcommunity.com/sharedfiles/filedetails/?id=1493485159"] call _linkText],
				format["%1 (server-side only)",["Discord Embed Builder","https://github.com/ConnorAU/SQFDiscordEmbedBuilder"] call _linkText],
				"",
				format["If you have any questions about this mission, you can contact me on %1.",["discord","https://discord.gg/DMkxetD"] call _linkText]
			] joinString "<br/>");

			private DIALOG_H = ctrlTextHeight _ctrlBody + PX_HA(SIZE_M) + PX_HA(8);

			_ctrlBackground ctrlSetPosition [
				CENTER_XA(DIALOG_W),
				DIALOG_Y,
				PX_WA(DIALOG_W),
				DIALOG_H
			];

			_ctrlTitle ctrlSetText "Welcome";
			_ctrlTitle ctrlSetPosition [
				CENTER_XA(DIALOG_W),
				DIALOG_Y,
				PX_WA(DIALOG_W),
				PX_HA(SIZE_M)
			];

			_ctrlFooter ctrlSetPosition [
				CENTER_XA(DIALOG_W),
				DIALOG_Y + DIALOG_H - PX_HA(7),
				PX_WA(DIALOG_W),
				PX_HA(7)
			];

			_ctrlButton ctrlAddEventHandler ["ButtonClick",{["destroy"] call THIS_FUNC}];
			_ctrlButton ctrlSetPosition [
				CENTER_XA(DIALOG_W)+ PX_WA(DIALOG_W) - PX_WA(31),
				DIALOG_Y + DIALOG_H - PX_HA(6),
				PX_WA(30),
				PX_HA(5)
			];

			_ctrlBody ctrlSetPosition [
				CENTER_XA(DIALOG_W),
				DIALOG_Y + PX_HA(SIZE_L),
				PX_WA(DIALOG_W),
				ctrlTextHeight _ctrlBody
			];

			{_x ctrlCommit 0} foreach [_ctrlBackground,_ctrlTitle,_ctrlFooter,_ctrlButton,_ctrlBody];
		};
		waitUntil {isNull (GVAR(_display,"GG_welcome_display",displayNull))};
		SVAR(_display,"GG_welcome_display",nil);
	};
	case "destroy":{
		isNil {
			disableSerialization;
			USE_DISPLAY(findDisplay 46);
			private _displayEmpty = GVAR(_display,"GG_welcome_display",displayNull);
			_displayEmpty closeDisplay 2;
		};
	};
};
/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "..\functions\macros.inc"
#include "..\functions\defines.inc"

#define DIALOG_X (safeZoneX + safezoneW) - (PX_WS(DIALOG_W) + PX_WS(3))
#define DIALOG_Y safeZoneY + PX_HS(32)
#define DIALOG_W 82
#define DIALOG_H 80

#define CELL_H PX_HA((DIALOG_H/2))

class GG_displayWeaponList {
    idd=-1;
    duration=1e14;
    fadein=0;
    fadeout=0;
    onLoad="['onLoad',_this] call GG_ui_fnc_weaponList";

    class controlsBackground {
        class background: GG_ctrlStaticBackground {
            colorBackground[]={0.2,0.2,0.2,0.3};
            x=DIALOG_X;
            y=DIALOG_Y;
            w=PX_WS(DIALOG_W);
            h=2*(CELL_H) + PX_HA(SIZE_M);
        };
        class title: GG_ctrlStaticTitle {
            idc=1;
            colorBackground[]={0,0,0,0.7};
            x=DIALOG_X;
            y=DIALOG_Y;
            w=PX_WS(DIALOG_W);
            h=PX_HS(SIZE_M);
        };
    };
};

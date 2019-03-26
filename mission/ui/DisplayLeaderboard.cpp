/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "..\functions\macros.inc"
#include "..\functions\defines.inc"

#define DIALOG_W 100
#define DIALOG_H 140

class GG_displayLeaderboard {
    idd=-1;
    duration=1e14;
    fadein=0;
    fadeout=0;
    onLoad="['onLoad',_this] call GG_ui_fnc_leaderboard";

    class controlsBackground {
        class background: GG_ctrlStaticBackground {
            x=CENTER_XA(DIALOG_W);
            y=CENTER_YA(DIALOG_H);
            w=PX_WA(DIALOG_W);
            h=PX_HA(DIALOG_H);
        };
        class title: GG_ctrlStaticTitle {
            idc=1;
            text="Leaderboard";
            x=CENTER_XA(DIALOG_W);
            y=CENTER_YA(DIALOG_H);
            w=PX_WA(DIALOG_W);
            h=PX_HS(SIZE_M);
        };
    };
    class controls {
        class list: GG_ctrlListNBox {
            idc=2;
            x=CENTER_XA(DIALOG_W);
            y=CENTER_YA(DIALOG_H) + PX_HS(SIZE_XL);
            w=PX_WA(DIALOG_W);
            h=PX_HA(DIALOG_H) - PX_HS(SIZE_M);
        };
    };
};


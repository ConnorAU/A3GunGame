/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "..\functions\macros.inc"
#include "..\functions\defines.inc"

#define DIALOG_X safeZoneX + PX_WS(SIZE_XL)
#define DIALOG_W 60
#define DIALOG_H 93

class GG_displayVoteMap {
    idd=-1;
    duration=1e14;
    fadein=0;
    fadeout=0;
    onLoad="['onLoad',_this] call GG_ui_fnc_voteMap";

    class controlsBackground {
        class background: GG_ctrlStaticBackground {
            x=DIALOG_X;
            y=CENTER_YA(DIALOG_H);
            w=PX_WS(DIALOG_W);
            h=PX_HA(DIALOG_H);
        };
        class title: GG_ctrlStaticTitle {
            idc=1;
            text="Map Voting";
            x=DIALOG_X;
            y=CENTER_YA(DIALOG_H);
            w=PX_WS(DIALOG_W);
            h=PX_HS(SIZE_M);
        };
    };
    class controls {
        class list: GG_ctrlListNBox {
            idc=2;
            x=DIALOG_X;
            y=CENTER_YA(DIALOG_H) + PX_HS(SIZE_XL);
            w=PX_WS(DIALOG_W);
            h=PX_HA(DIALOG_H) - PX_HS((SIZE_XL+1));
        };
    };
};


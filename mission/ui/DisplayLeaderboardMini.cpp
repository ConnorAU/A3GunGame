#include "..\functions\macros.inc"
#include "..\functions\defines.inc"

#define DIALOG_X safeZoneX + PX_WS(63) + PX_WS(2)
#define DIALOG_Y safeZoneY + PX_HS(3)
#define DIALOG_W 100
#define DIALOG_H 33

class GG_displayLeaderboardMini {
    idd=-1;
    duration=1e14;
    fadein=0;
    fadeout=0;
    onLoad="['onLoad',_this] call GG_ui_fnc_leaderboardMini";

    class controlsBackground {
        class background: GG_ctrlStaticBackground {
            colorBackground[]={0.2,0.2,0.2,0.3};
            x=DIALOG_X;
            y=DIALOG_Y + PX_HS(SIZE_M);
            w=PX_WS(DIALOG_W);
            h=PX_HA(DIALOG_H) - PX_HA(SIZE_M);
        };
        class title: GG_ctrlStaticTitle {
            colorBackground[]={0,0,0,0.7};
            text="Leaderboard";
            x=DIALOG_X;
            y=DIALOG_Y;
            w=PX_WS(DIALOG_W);
            h=PX_HS(SIZE_M);
        };
    };
    class controls {
        class list: GG_ctrlListNBox {
            idc=1;
            x=DIALOG_X;
            y=DIALOG_Y + PX_HS(SIZE_XL);
            w=PX_WS(DIALOG_W);
            h=PX_HA(DIALOG_H) - PX_HA((SIZE_XL+1));
        };
    };
};


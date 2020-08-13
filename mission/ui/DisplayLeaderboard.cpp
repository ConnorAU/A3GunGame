#include "..\functions\macros.inc"
#include "..\functions\defines.inc"

#define DIALOG_W (100 min ((safezoneW/GRID_W) - 10))
#define DIALOG_H (140 min ((safezoneH/GRID_H) - 10))

class GG_displayLeaderboard: GG_ctrlControlsGroupNoScrollBars {
    idc=-1;
    onLoad="['onLoad',_this] call GG_ui_fnc_leaderboard";
    x=CENTER_XA(DIALOG_W);
    y=CENTER_YA(DIALOG_H);
    w=PX_WA(DIALOG_W);
    h=PX_HA(DIALOG_H);

    class controls {
        class background: GG_ctrlStaticBackground {
            w=PX_WA(DIALOG_W);
            h=PX_HA(DIALOG_H);
        };
        class title: GG_ctrlStaticTitle {
            idc=1;
            text="Leaderboard";
            w=PX_WA(DIALOG_W);
            h=PX_HA(SIZE_M);
        };
        class list: GG_ctrlListNBox {
            idc=2;
            y=PX_HA(SIZE_M) + PX_HA(1);
            w=PX_WA(DIALOG_W);
            h=PX_HA(DIALOG_H) - PX_HA(SIZE_M);
        };
    };
};


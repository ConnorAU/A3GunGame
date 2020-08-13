#include "..\functions\macros.inc"
#include "..\functions\defines.inc"

#define DIALOG_X safeZoneX + PX_WS(SIZE_XL)
#define DIALOG_W 60
#define DIALOG_H 93

class GG_displayVoteMap: GG_ctrlControlsGroup {
    idc=-1;
    x=DIALOG_X;
    onLoad="['onLoad',_this] call GG_ui_fnc_voteMap";
    y=CENTER_YA(DIALOG_H);
    w=PX_WS(DIALOG_W);
    h=PX_HA(DIALOG_H);

    class controls {
        class background: GG_ctrlStaticBackground {
            w=PX_WS(DIALOG_W);
            h=PX_HA(DIALOG_H);
        };
        class title: GG_ctrlStaticTitle {
            idc=1;
            text="Map Voting";
            w=PX_WS(DIALOG_W);
            h=PX_HS(SIZE_M);
        };
        class list: GG_ctrlListNBox {
            idc=2;
            disableOverflow=1;
            y=PX_HS(SIZE_XL);
            w=PX_WS(DIALOG_W);
            h=PX_HA(DIALOG_H) - PX_HS((SIZE_XL+1));
        };
    };
};


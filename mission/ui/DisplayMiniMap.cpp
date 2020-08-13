#include "..\functions\macros.inc"
#include "..\functions\defines.inc"

#define DIALOG_W 60
#define DIALOG_H 60

class GG_displayMiniMap {
    idd=-1;
    duration=1e14;
    fadein=0;
    fadeout=0;
    onLoad="['onLoad',_this] call GG_ui_fnc_miniMap;";

    class controls {
        class title: GG_ctrlStaticTitle {
            idc=1;
            colorBackground[]={0,0,0,0.7};
            x=safeZoneX + PX_WS(3);
            y=safeZoneY + PX_HS(3);
            w=PX_WS(DIALOG_W);
            h=PX_HS(SIZE_M);
        };
        class map: GG_ctrlMapEmpty {
            idc=2;

            x=safeZoneX + PX_WS(3);
            y=safeZoneY + PX_HS(3) + PX_HS(SIZE_M);
            w=PX_WS(DIALOG_W);
            h=PX_HS(DIALOG_H);

            moveOnEdges=1;

            ptsPerSquareRoad=6;
            ptsPerSquareMainRoad=6;
            ptsPerSquareRoadSimple=1;
            ptsPerSquareMainRoadSimple=1;
            drawShaded=0.25;
            shadedSea=0.30000001;
            maxSatelliteAlpha=0.85000002;
	        colorBackground[]={0.2,0.2,0.2,0.3};
        };
    };
};

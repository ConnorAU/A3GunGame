/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#include "\a3\3den\ui\macros.inc"
#include "..\functions\defines.inc"

#define DIALOG_W 60
#define DIALOG_H 60

class GGDisplayMiniMap {
    idd=-1;
    duration=1e14;
    fadein=0;
    fadeout=0;
    onLoad="['onLoad',_this] call GG_ui_fnc_miniMap;";

    class controls {
        class map: ctrlMapEmpty {
            idc=1;

            x=safeZoneX + PX_WA(3);
            y=safeZoneY + PX_HA(3) + PX_HA(SIZE_M);
            w=PX_WA(DIALOG_W);
            h=PX_HA(DIALOG_H);

            moveOnEdges=1;

            ptsPerSquareRoad=6;
            ptsPerSquareMainRoad=6;
            ptsPerSquareRoadSimple=1;
            ptsPerSquareMainRoadSimple=1;
            drawShaded=0.25;
            shadedSea=0.30000001;
            maxSatelliteAlpha=0.85000002;
	        colorBackground[]={0,0,0,0.3};
        };
    };
};
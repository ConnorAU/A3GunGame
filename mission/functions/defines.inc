/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

// ~ Statics
#define MNS missionNameSpace
#define UINS uiNameSpace
#define PROFNS profileNameSpace

#define SWITCH_SYS_PARAMS params[["_mode","",[""]],["_params",[]]]

// ~ States
#define COMBAT_ZONE_EXISTS (markerBrush "GG_CombatZone" == "SolidBorder")
#define ROUND_OVER !(isNil "GG_s_roundWinner")

// ~ Operations
#define QUOTE(a) #a

#define GVAR(a,b,c) a getVariable [b,c]
#define GVAR_N(a,b) a getVariable b
#define SVAR(a,b,c) a setVariable [b,c]
#define SVAR_J(a,b,c,d) a setVariable [b,c,d]

#ifdef DISPLAY_NAME
    #define THIS_DISPLAY DISPLAY(DISPLAY_NAME)
#endif
#define DISPLAY(name) GVAR(UINS,QUOTE(name),displayNull)
#define USE_DISPLAY(display) private _display = display
#define USE_CTRL(ctrl,idc) private ctrl = _display displayCtrl idc
#define USE_CTRL_G(ctrl,parent,idc) private ctrl = parent controlsGroupCtrl idc

#ifdef THIS_FUNC
    #define FUNC_SUBVAR_RAW(suffix) THIS_FUNC##_##suffix
    #define DLOG(input) [QUOTE(THIS_FUNC),input] call GG_system_fnc_log
#endif

// ~ UI Positioning
#ifdef pixelScale
    #define PX_WA(n) n*GRID_W
    #define PX_HA(n) n*GRID_H
    #define CENTER_XA(n) (CENTER_X)-(0.5*(PX_WA(n)))
    #define CENTER_YA(n) (CENTER_Y)-(0.5*(PX_HA(n)))
#endif
// ~ States
#define COMBAT_ZONE_EXISTS (markerBrush "GG_CombatZone" == "SolidBorder")
#define ROUND_OVER !(isNil "GG_s_roundWinner")

// ~ Operations
#define QUOTE(a) #a

#define SWITCH_SYS_PARAMS params[["_mode","",[""]],["_params",[]]]

#ifdef DISPLAY_NAME
    #define THIS_DISPLAY DISPLAY(DISPLAY_NAME)
#endif
#define DISPLAY(name) uiNameSpace getVariable [QUOTE(name),displayNull]
#define USE_DISPLAY(display) private _display = display
#define USE_CTRL(ctrl,idc) private ctrl = _display displayCtrl idc
#define USE_CTRL_G(ctrl,parent,idc) private ctrl = parent controlsGroupCtrl idc

#ifdef THIS_FUNC
    #define FUNC_SUBVAR(suffix) THIS_FUNC##_##suffix
    #define DLOG(input) [QUOTE(THIS_FUNC),input] call GG_system_fnc_log
#endif

#ifdef COLOR_ACTIVE_RGBA
    #define FNC_LINKTEXT \
    {\
        params ["_text","_url"];\
        private _colorRGBA = [COLOR_ACTIVE_RGBA] apply {_x call BIS_fnc_parseNumber};\
        private _colorHex = _colorRGBA call BIS_fnc_colorRGBtoHTML;\
        format["<a colorLink='%1' href='%2'>%3</t>",_colorHex,_url,_text]\
    }
#endif

// ~ UI Positioning
#ifdef pixelScale
    // Mission UIs were built using small UI scale.
    // These values are used to properly scale UIs for different sizes.
    #define GRID_W_SCALE (0.00126263 * 8 * 0.50)
    #define GRID_H_SCALE (0.0016835 * 8 * 0.50)

    #define PX_WA(n) n*GRID_W
    #define PX_HA(n) n*GRID_H
    #define PX_WS(n) n*(GRID_W*(GRID_W_SCALE/GRID_W))
    #define PX_HS(n) n*(GRID_H*(GRID_H_SCALE/GRID_H))

    #define CENTER_XA(n) (CENTER_X)-(0.5*(PX_WA(n)))
    #define CENTER_YA(n) (CENTER_Y)-(0.5*(PX_HA(n)))
    #define CENTER_XS(n) (CENTER_X)-(0.5*(PX_WS(n)))
    #define CENTER_YS(n) (CENTER_Y)-(0.5*(PX_HS(n)))

    #define SIZE_XXL 7
#endif

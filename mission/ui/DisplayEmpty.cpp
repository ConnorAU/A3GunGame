#include "..\functions\macros.inc"
#include "..\functions\defines.inc"

class GG_displayEmpty {
    idd=-1;
    onLoad="uinamespace setvariable ['GG_displayEmpty',_this#0];";

    class controls {
        class vignette: RscVignette {
			colorText[]={0,0,0,0.2};
			idc=1202;
        };
    };
};

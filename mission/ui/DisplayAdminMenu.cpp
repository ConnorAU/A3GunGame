#include "..\functions\macros.inc"
#include "..\functions\defines.inc"

#define DIALOG_W 220
#define DIALOG_H 160

class GG_displayAdminMenu {
	idd=-1;
	onLoad="['onLoad',_this] call GG_ui_fnc_adminMenu;";

	class controlsBackground {
		class background: GG_ctrlStaticBackground {
			x=CENTER_XS(DIALOG_W);
			y=CENTER_YS(DIALOG_H);
			w=PX_WS(DIALOG_W);
			h=PX_HS(DIALOG_H);
		};
		class title: GG_ctrlStaticTitle {
			text="Admin Menu";
			x=CENTER_XS(DIALOG_W);
			y=CENTER_YS(DIALOG_H);
			w=PX_WS(DIALOG_W);
			h=PX_HS(SIZE_M);
		};
		class footer: GG_ctrlStaticFooter {
			x=CENTER_XS(DIALOG_W);
			y=CENTER_YS(DIALOG_H) + PX_HS(DIALOG_H) - PX_HS(SIZE_XXL);
			w=PX_WS(DIALOG_W);
			h=PX_HS(SIZE_XXL);
		};
	};
	class controls {
		class paramsList: GG_ctrlListBox {
			idc=1;
			x=CENTER_XS(DIALOG_W) + PX_WS(2);
			y=CENTER_YS(DIALOG_H) + PX_HS(SIZE_M) + PX_HS(2);
			w=PX_WS(DIALOG_W) - PX_WS(4);
			h=(PX_HS(DIALOG_H) - PX_HS(SIZE_M) - PX_HS(SIZE_XXL) - PX_HS(4))/2;
		};
		class mapPresetButtonSource: GG_ctrlButtonPicture {
			idc=10;
			colorBackgroundDisabled[]={0,0,0,1};
			x=CENTER_XS(DIALOG_W) + PX_WS(2);
			y=CENTER_YS(DIALOG_H) + PX_HS(SIZE_M) + PX_HS(4) + ((PX_HS(DIALOG_H) - PX_HS(SIZE_M) - PX_HS(SIZE_XXL) - PX_HS(4))/2);
			w=PX_WS(SIZE_M);
			h=PX_HS(SIZE_M);
		};
		class mapPresetButtonLoad: mapPresetButtonSource {
			idc=11;
			x=CENTER_XS(DIALOG_W) + PX_WS(2) + PX_WS(SIZE_M);
		};
		class mapPresetButtonSave: mapPresetButtonSource {
			idc=12;
			x=CENTER_XS(DIALOG_W) + PX_WS(2) + PX_WS((SIZE_M*2));
		};
		class mapPresetButtonDelete: mapPresetButtonSource {
			idc=13;
			x=CENTER_XS(DIALOG_W) + PX_WS(2) + PX_WS((SIZE_M*3));
		};
		class map: GG_ctrlMap {
			idc=2;
			x=CENTER_XS(DIALOG_W) + PX_WS(2);
			y=CENTER_YS(DIALOG_H) + PX_HS(SIZE_M) + PX_HS(4) + ((PX_HS(DIALOG_H) - PX_HS(SIZE_M) - PX_HS(SIZE_XXL) - PX_HS(4))/2) + PX_HS(SIZE_M);
			w=PX_WS((DIALOG_W/2.5)) - PX_WS(4);
			h=(PX_HS(DIALOG_H) - PX_HS(SIZE_M) - PX_HS(SIZE_XXL) - PX_HS(4))/2 - PX_HS(2) - PX_HS(SIZE_M);
		};
		class combo: GG_ctrlCombo {
			idc=3;
			x=CENTER_XS(DIALOG_W) + PX_WS((DIALOG_W/2.5));
			y=CENTER_YS(DIALOG_H) + PX_HS(SIZE_M) + PX_HS(4) + ((PX_HS(DIALOG_H) - PX_HS(SIZE_M) - PX_HS(SIZE_XXL) - PX_HS(4))/2);
			w=(PX_WS(DIALOG_W) - PX_WS((DIALOG_W/2.5)) - PX_WS(2))/2 - PX_WS(2) - PX_WS((SIZE_L/2));
			h=PX_HS(SIZE_M);
		};
		class weaponListL: GG_ctrlListBox {
			idc=4;
			x=CENTER_XS(DIALOG_W) + PX_WS((DIALOG_W/2.5));
			y=CENTER_YS(DIALOG_H) + PX_HS(SIZE_M) + PX_HS(4) + ((PX_HS(DIALOG_H) - PX_HS(SIZE_M) - PX_HS(SIZE_XXL) - PX_HS(4))/2) + PX_HS(SIZE_M);
			w=(PX_WS(DIALOG_W) - PX_WS((DIALOG_W/2.5)) - PX_WS(2))/2 - PX_WS(2) - PX_WS((SIZE_L/2));
			h=(PX_HS(DIALOG_H) - PX_HS(SIZE_M) - PX_HS(SIZE_XXL) - PX_HS(4))/2 - PX_HS(2) - PX_HS(SIZE_M);
		};
		class weaponPresetButtonSource: mapPresetButtonLoad {
			idc=14;
			x=CENTER_XS(DIALOG_W) + PX_WS((DIALOG_W/2.5)) + (PX_WS(DIALOG_W) - PX_WS((DIALOG_W/2.5)) - PX_WS(2))/2 + PX_WS(2) + PX_WS((SIZE_L/2));
		};
		class weaponPresetButtonLoad: weaponPresetButtonSource {
			idc=15;
			x=CENTER_XS(DIALOG_W) + PX_WS((DIALOG_W/2.5)) + (PX_WS(DIALOG_W) - PX_WS((DIALOG_W/2.5)) - PX_WS(2))/2 + PX_WS(2) + PX_WS((SIZE_L/2)) + PX_WS(SIZE_M);
		};
		class weaponPresetButtonSave: weaponPresetButtonSource {
			idc=16;
			x=CENTER_XS(DIALOG_W) + PX_WS((DIALOG_W/2.5)) + (PX_WS(DIALOG_W) - PX_WS((DIALOG_W/2.5)) - PX_WS(2))/2 + PX_WS(2) + PX_WS((SIZE_L/2)) + PX_WS((SIZE_M*2));
		};
		class weaponPresetButtonDelete: weaponPresetButtonSource {
			idc=17;
			x=CENTER_XS(DIALOG_W) + PX_WS((DIALOG_W/2.5)) + (PX_WS(DIALOG_W) - PX_WS((DIALOG_W/2.5)) - PX_WS(2))/2 + PX_WS(2) + PX_WS((SIZE_L/2)) + PX_WS((SIZE_M*3));
		};
		class weaponListR: weaponListL {
			idc=5;
			x=CENTER_XS(DIALOG_W) + PX_WS((DIALOG_W/2.5)) + (PX_WS(DIALOG_W) - PX_WS((DIALOG_W/2.5)) - PX_WS(2))/2 + PX_WS(2) + PX_WS((SIZE_L/2));
		};
		class weaponButtonAdd: GG_ctrlButtonPicture {
			idc=6;
			x=CENTER_XS(DIALOG_W) + PX_WS((DIALOG_W/2.5)) + ((PX_WS(DIALOG_W) - PX_WS((DIALOG_W/2.5)) - PX_WS(2))/2 - PX_WS((SIZE_L/2)));
			y=CENTER_YS(DIALOG_H) + PX_HS(SIZE_M) + PX_HS(4) + ((PX_HS(DIALOG_H) - PX_HS(SIZE_M) - PX_HS(SIZE_XXL) - PX_HS(4))/2) + PX_HS(SIZE_M) + 0.33*((PX_HS(DIALOG_H) - PX_HS(SIZE_M) - PX_HS(SIZE_XXL) - PX_HS(4))/2 - PX_HS(2) - PX_HS(SIZE_M));
			w=PX_WS(SIZE_L);
			h=PX_HS(SIZE_L);
		};
		class weaponButtonRemove: weaponButtonAdd {
			idc=7;
			y=CENTER_YS(DIALOG_H) + PX_HS(SIZE_M) + PX_HS(4) + ((PX_HS(DIALOG_H) - PX_HS(SIZE_M) - PX_HS(SIZE_XXL) - PX_HS(4))/2) + PX_HS(SIZE_M) + 0.66*((PX_HS(DIALOG_H) - PX_HS(SIZE_M) - PX_HS(SIZE_XXL) - PX_HS(4))/2 - PX_HS(2) - PX_HS(SIZE_M));
		};
		class cancelButton: GG_ctrlButtonCancel {
			idc=8;
			x=CENTER_XS(DIALOG_W) + PX_WS(DIALOG_W) - PX_WA((SIZE_M*6)) - PX_WA(1);
			y=CENTER_YS(DIALOG_H) + PX_HS(DIALOG_H) - PX_HS(SIZE_M) - PX_HS(1);
			w=PX_WA((SIZE_M*6));
			h=PX_HS(SIZE_M);
		};
		class resetRoundButton: cancelButton {
			idc=9;
			x=CENTER_XS(DIALOG_W) + PX_WS(DIALOG_W) - PX_WA(((SIZE_M*6)*2)) - PX_WA(2);
		};
	};
};

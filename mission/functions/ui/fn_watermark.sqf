/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_ui_fnc_watermark

Description:
	Creates a watermark overlay in the bottom right corner of the screen

Parameters:
	None

Return:
	Nothing
---------------------------------------------------------------------------- */

#define THIS_FUNC GG_ui_fnc_watermark

#include "..\macros.inc"
#include "..\defines.inc"

isNil {
	disableSerialization;
	USE_DISPLAY(findDisplay 46);
	private _ctrlGrp = _display ctrlCreate ["RscWIP",-1];

	USE_CTRL_G(_ctrlTitle,_ctrlGrp,1001);
	USE_CTRL_G(_ctrlSub,_ctrlGrp,1000);

	// Move watermark if arma branch is not stable (overlaps dev watermark)
	if ((productVersion select 4) != "Stable") then {
		private _ctrlGrpPos = ctrlPosition _ctrlGrp;
		_ctrlGrp ctrlSetPositionX ((_ctrlGrpPos#0)-(_ctrlGrpPos#2)-(PX_WS(1)));
		_ctrlGrp ctrlCommit 0;
	};

	_ctrlTitle ctrlSetText "Gun Game";
	_ctrlSub ctrlSetText "by ConnorAU";
};

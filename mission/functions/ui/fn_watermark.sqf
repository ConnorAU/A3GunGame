/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_ui_fnc_voteMap

#include "\a3\3den\ui\macros.inc"
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
		_ctrlGrpPos set [0,(_ctrlGrpPos#0)-(_ctrlGrpPos#2)-(PX_WA(1))];
		_ctrlGrp ctrlSetPosition _ctrlGrpPos;
		_ctrlGrp ctrlCommit 0;
	};

	_ctrlTitle ctrlSetText "Gun Game";
	_ctrlSub ctrlSetText "by ConnorAU";
};
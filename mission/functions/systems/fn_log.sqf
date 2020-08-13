/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_log

Description:
	Print a formatted log to the rpt

Parameters:
	0 : STRING - Type of log
	1 : STRING - Log log
	2 : ANY    - Log details
	3 : STRING - Log prefix (Default: Gun Game)

Return:
	Nothing
---------------------------------------------------------------------------- */

params [["_type","",[""]],["_log","",[""]],["_details",[]],["_prefix","Gun Game",[""]]];

diag_log text ([
    format["[%1%2]",_prefix,["",": "+_type] select (_type != "")],
    _log + (if (_details isEqualTo []) then {""} else {
    [": ",_details] joinString ""
})] joinString " ");

/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

params [["_type","",[""]],["_log","",[""]],["_details",[]],["_prefix","Gun Game",[""]]];

diag_log text ([
    format["[%1%2]",_prefix,["",": "+_type] select (_type != "")],
    _log + (if (_details isEqualTo []) then {""} else {
    [": ",_details] joinString ""
})] joinString " ");

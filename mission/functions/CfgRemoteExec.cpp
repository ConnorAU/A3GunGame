/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

class CfgRemoteExec {
	class Functions {
		mode = 1;
		jip = 1;

		class GG_system_fnc_roundOver {allowedTargets = 2;};
		class GG_system_fnc_resizeCombatZone {allowedTargets = 2;};
		
#ifdef DEV_BUILD
		class bis_fnc_debugconsoleexec {allowedTargets = 0;};
#endif
	};
	class Commands {
		mode = 1;
		jip = 0;
		
		class switchMove {allowedTargets = 0;};
	};
};
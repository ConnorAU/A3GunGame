/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

class Params {
    class WeaponPool {
        title = "Select which mod the weapon pool will be created from";
        texts[] = {
/*    0 */  "Auto-Detect (By map)",
/*    1 */  "Vanilla",
/*    2 */  "Vanilla (DLC)",
/*   10 */  "3CB BAF",
/*   40 */  "CUP",
/*   20 */  "IFA3",
/*   50 */  "OPTRE",
/*   30 */  "RHS (AFRF, USAF, SAF & GREF)"
        };
        values[] = {0,1,2,10,40,20,50,30};
        default = 0;
    };
    class WeaponType {
        title = "Select which weapon type the pool will be comprised of";
        texts[] = {"All","SMG/Shotguns","Rifles","Snipers","Machine Guns","Pistols"};
        values[] = {0,1,2,3,4,5};
        default = 0;
    };
    class Loadout {
        title = "Select which mod the player loadout will be created from";
        texts[] = {
/*    0 */  "Auto-Detect (By map)",
/*    1 */  "Vanilla",
/*    2 */  "Vanilla (DLC)",
/*   10 */  "3CB BAF (Desert)",
/*   11 */  "3CB BAF (Temperate)",
/*   12 */  "3CB BAF (Woodland)",
/*   40 */  "CUP (ACU)",
/*   41 */  "CUP (Desert)",
/*   42 */  "CUP (MTP)",
/*   43 */  "CUP (Winter)",
/*   44 */  "CUP (Woodland)",
/*   20 */  "IFA3",
/*   21 */  "IFA3 (Winter)",
/*   50 */  "OPTRE (Spartan)",
/*   51 */  "OPTRE (Urban)",
/*   30 */  "RHS (OCP)",
/*   31 */  "RHS (UCP)"
        };
        values[] = {0,1,2,10,11,12,40,41,42,43,44,20,21,50,51,30,31};
        default = 0;
    };
    class KillStreak {
        title = "Kill streak required to advance to next weapon";
        texts[] = {"Auto-Detect (By weapon pool)","1","2","3","4","5","6","7","8","9","10"};
        values[] = {0,1,2,3,4,5,6,7,8,9,10};
        default = 0;
    };
    class MaxRounds {
        title = "Maximum rounds played before the mission ends";
        texts[] = {"Infinite","1","2","3","4","5","6","7","8","9","10"};
        values[] = {0,1,2,3,4,5,6,7,8,9,10};
        default = 0;
    };
};
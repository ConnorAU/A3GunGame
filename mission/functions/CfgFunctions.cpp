/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

class CfgFunctions {
    class GG_ai {
        class ai {
            #ifdef IS_AIO_MOD
            file="\GunGame\functions\ai";
            #endif
            class applyWeapon {};
            class init {};
            class clean {};
            class create {};
            class moveToSpawn {};
            class monitor {};
        };
    };
    class GG_config {
        class configs {
            #ifdef IS_AIO_MOD
            file="\GunGame\functions\configs";
            #endif
            class loadouts {};
            class maps {};
            class weapons {};
        };
    };
    class GG_eventhandler {
        class eventhandlers {
            #ifdef IS_AIO_MOD
            file="\GunGame\functions\eventhandlers";
            #endif
            class inventoryOpened {};
            class playerConnected {};
            class handleDisconnect {};
            class MPKilled {};
            class MPHit {};
            class respawn {};
            class keyDown {};
            class keyUp {};
            class map {};
            class handleDamage {};
        };
    };
    class GG_setup {
        class setup {
            #ifdef IS_AIO_MOD
            file="\GunGame\functions\setup";
            #endif
            class mission {preInit=1;};
            class client {};
            class server {};
        };
    };
    class GG_system {
        class systems {
            #ifdef IS_AIO_MOD
            file="\GunGame\functions\systems";
            #endif
            class log {};
            class moveToSpawn {};
            class applyLoadout {};
            class applyWeapon {};
            class setWeaponPool {};
            class voteMap {};
            class stayInsideCombatZone {};
            class getLeaderboardStats {};
            class fixDiscordString {};
            class roundOver {};
            class setWeather {};
            class resizeCombatZone {};
            class jump {};
            class autoheal {};
            class openAllDoors {};
            class validateUnit {};
        };
    };
    class GG_ui {
        class ui {
            #ifdef IS_AIO_MOD
            file="\GunGame\functions\ui";
            #endif
            class voteMap {};
            class miniMap {};
            class watermark {};
            class leaderboard {};
            class leaderboardMini {};
            class hitmarker {};
            class weaponList {};
            class welcome {};
        };
    };
};
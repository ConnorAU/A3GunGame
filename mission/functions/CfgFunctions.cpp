/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

class CfgFunctions {
    class GG_config {
        tag="GG_config";
        class configs {
            class loadouts {};
            class maps {};
            class weapons {};
        };
    };
    class GG_eventhandler {
        tag="GG_eventhandler";
        class eventhandlers {
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
        tag="GG_setup";
        class setup {
            class mission {preInit=1;};
            class client {};
            class server {};
        };
    };
    class GG_system {
        tag="GG_system";
        class systems {
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
        };
    };
    class GG_ui {
        tag="GG_ui";
        class ui {
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
# Gun Game
30 man free-for-all weapon progression game mode created for Arma 3.
Subscribe to the all-in-one [steam workshop mod](https://steamcommunity.com/sharedfiles/filedetails/?id=1641133934) or download individual map files from the [releases](https://github.com/ConnorAU/A3GunGame/releases) page.
If you have any questions about this mission, you can contact me on discord: https://discord.gg/DMkxetD

# Mod support
This mission is built with support for the following map, uniform and weapon mods:
- [3CB](https://steamcommunity.com/workshop/filedetails/?id=909680404) (Equipment & Weapons)
- [CUP](https://steamcommunity.com/workshop/filedetails/?id=583575232) (Terrains, Units & Weapons)
- [IFA3](https://steamcommunity.com/workshop/filedetails/?id=660460283)
- [Isla Duala](https://steamcommunity.com/workshop/filedetails/?id=714149065)
- [Montella](https://steamcommunity.com/workshop/filedetails/?id=1562904329)
- [Operation: TREBUCHET](https://steamcommunity.com/workshop/filedetails/?id=769440155)
- [RHS](https://steamcommunity.com/workshop/filedetails/?id=843770737) (AFRF, GREF, SAF & USAF)

If you choose to host a version of the mission using any of the mods above, all players & the server are **required** to have the selected mods enabled.

## How to enable mods
Enable map mods by hosting the mission pbo for the modded map you wish to play.
Some maps use modded weapons and uniforms by default, you can change this with mission parameters in your [server.cfg](https://github.com/ConnorAU/A3GunGame#modify-mission-parameters-in-the-servercfg) or multiplayer lobby.

# Optional mod support
This mission is built with support for the following optional mods:
- [Discord Rich Presence](https://steamcommunity.com/sharedfiles/filedetails/?id=1493485159)
- [Discord Embed Builder](https://github.com/ConnorAU/SQFDiscordEmbedBuilder) (server-side only)

Players are **not required** to run these mods to play gun game. They are 100% optional and have no positive or negative impact on the gameplay experience.

## Discord Rich Presence setup
Server owners need to add the bikey from the workshop download to their server's `keys` folder.
Players simply load the mod, it will take care of the rest.

## Discord Embed Builder setup
This mod is to be loaded on the server only. It will print the scoreboard at the end of the round to a discord server of your choosing.

To install:
1. Follow [setup](https://github.com/ConnorAU/SQFDiscordEmbedBuilder#setup) instructions
2. Follow [connecting your message to the webhook](https://github.com/ConnorAU/SQFDiscordEmbedBuilder#connecting-your-message-to-the-webhook) instructions
3. Add a webhook named `GunGame` to your `CfgDiscordEmbedWebhooks`

![Example Webhook](https://i.imgur.com/KxZ5rnB.png)

# Host a server
Hosting this mission is no different to any other, though there are some things you should know just to make the experience more enjoyable.

## Server-side difficulty mod (Optional)
You will find a pbo file named `cau.gungamedifficulty.pbo` on the [releases](https://github.com/ConnorAU/A3GunGame/releases) page. This is for use server-side to include a custom difficulty calibrated for this game mode.

To install:
1. Place the pbo in `Arma 3 Server\@gungame\addons` and include `-serverMod=@gungame` in your server command line
2. Set the mission difficulty in the server.cfg to `difficulty="GunGame";`

## Modify mission parameters in the server.cfg
You can find specific values and what they do in [CfgParams.cpp](https://github.com/ConnorAU/A3GunGame/blob/master/mission/functions/CfgParams.cpp)

Example:
```cpp
class Missions
{
    class GunGameMalden
    {
        template="cau.gungame.Malden";
        difficulty="GunGame";
        class Params
        {
            WeaponPool = 1; // Vanilla
            Loadout = 2; // Vanilla (DLC)
            KillStreak = 5; // Five kills to progress to next weapon
            MaxRounds = 2; // Play two rounds before moving onto the next mission in the rotation
        };
    };
};
```

## Host a server from the server browser
The following instructions are for if you are **not** using the AIO mod.

1. Download `cau.gungamemissions.zip` from the [releases](https://github.com/ConnorAU/A3GunGame/releases) page
2. Extract the mission file(s) you want to use into the `mpmissions` folder found in your Arma 3 installation folder

# License
https://github.com/ConnorAU/A3GunGame/blob/master/LICENSE


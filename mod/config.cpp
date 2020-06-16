/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

class CfgPatches {
    class CAU_GunGameMissions {
        name="CAU_GunGameMissions";
        author="ConnorAU";
        url="https://github.com/ConnorAU/A3GunGame";

        requiredVersion=0.01;
        requiredAddons[]={"CAU_ExtendedChat","CAU_UserInputMenus"};
        units[]={};
        weapons[]={};
    };
};

#define MISSION_ENTRY(worldName,mod) class GunGame_##worldName {\
    author="ConnorAU";\
    briefingName="Gun Game";\
    difficulty="GunGame";\
    directory=cau\gungame\mpmissions\##mod##\cau.gungame.##worldName##;\
};
class CfgMissions {
    class MPMissions {
        // Vanilla
        MISSION_ENTRY(Altis,Vanilla)
        MISSION_ENTRY(Malden,Vanilla)
        MISSION_ENTRY(Stratis,Vanilla)
        MISSION_ENTRY(Tanoa,Vanilla)

        // CUP
        MISSION_ENTRY(chernarus,CUP)
        MISSION_ENTRY(cup_chernarus_a3,CUP)
        MISSION_ENTRY(chernarus_summer,CUP)
        MISSION_ENTRY(Chernarus_Winter,CUP)
        MISSION_ENTRY(porto,CUP)
        MISSION_ENTRY(sara,CUP)
        MISSION_ENTRY(takistan,CUP)
        MISSION_ENTRY(zargabad,CUP)

        // IFA3
        MISSION_ENTRY(I44_merderet_koth,IFA3)
        MISSION_ENTRY(I44_Merderet_V3,IFA3)
        MISSION_ENTRY(iron_excelsior_Tobruk,IFA3)
        MISSION_ENTRY(Staszow,IFA3)
        MISSION_ENTRY(StaszowWinter,IFA3)
        MISSION_ENTRY(SWU_Ardennes_1944_Winter,IFA3)
        MISSION_ENTRY(SWU_Egypt_El_Alamein,IFA3)

        // Independent
        MISSION_ENTRY(isladuala3,Independent)
        MISSION_ENTRY(MontellaV3,Independent)
        MISSION_ENTRY(chernarusredux,Independent)

        // RHS
        MISSION_ENTRY(rhspkl,RHS)

        // Unsung
        MISSION_ENTRY(DaKrong,Unsung)
        MISSION_ENTRY(phu_bai,Unsung)
        MISSION_ENTRY(psyfx_pht,Unsung)
        MISSION_ENTRY(RungSat,Unsung)
        MISSION_ENTRY(song_bin_tanh,Unsung)
        MISSION_ENTRY(uns_dong_ha,Unsung)
    };
};

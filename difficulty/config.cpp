class CfgPatches {
    class CAU_GunGameDifficulty {
        name="CAU_GunGameDifficulty";
        author="ConnorAU";
        url="https://steamcommunity.com/id/_connor";

        requiredVersion=0.01;
        requiredAddons[]={};
        units[]={};
        weapons[]={};
    };
};
class CfgDifficultyPresets {
    class GunGame {
        displayName="Gun Game";
        description="Gun Game difficulty preset";
        optionDescription="Gun Game difficulty preset";
        optionPicture="\A3\Ui_f\data\Logos\arma3_white_ca.paa";
        levelAI="AILevelLow";
        class Options {
            autoReport=0;
            cameraShake=1;
            commands=1;
            deathMessages=1;
            detectedMines=1;
            enemyTags=0;
            friendlyTags=0;
            groupIndicators=0;
            mapContent=0;
            multipleSaves=1;
            reducedDamage=0;
            scoreTable=0;
            staminaBar=1;
            stanceIndicator=2;
            tacticalPing=0;
            thirdPersonView=1;
            visionAid=0;
            vonID=1;
            waypoints=2;
            weaponCrosshair=1;
            weaponInfo=2;
        };
    };
};

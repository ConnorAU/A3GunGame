class CfgSounds {
	class NewWeapon {
		name = "NewWeapon";
		sound[] = {"@A3\Sounds_F\sfx\blip1", 0.5, 1};
		titles[] = {};
	};
	class RevertWeapon {
		name = "RevertWeapon";
		sound[] = {"@A3\Sounds_F\sfx\zoomout", 0.8, 1};
		titles[] = {};
	};
	class Victory {
		name = "Victory";
		#ifdef IS_AIO_MOD
		sound[] = {"@cau\gungame\victory.ogg", 0.5, 1};
		#else
		sound[] = {"victory.ogg", 0.5, 1};
		#endif
		titles[] = {};
	};
	class Defeat {
		name = "Defeat";
		sound[] = {"@A3\music_f_orange\music\eventtrack02_f_orange.ogg", 0.5, 1};
		titles[] = {};
	};
};

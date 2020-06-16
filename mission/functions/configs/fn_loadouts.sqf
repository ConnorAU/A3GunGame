/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define VANILLA 1
#define VANILLA_DLC 2
#define TCB_BAF_Desert 10
#define TCB_BAF_Temperate 11
#define TCB_BAF_Woodland 12
#define IFA3 20
#define IFA3_Winter 21
#define IFA3_Desert 22
#define RHS_OCP 30
#define RHS_UCP 31
#define RHS_ERDL 32
#define CUP_ACU 40
#define CUP_DESERT 41
#define CUP_MTP 42
#define CUP_WINTER 43
#define CUP_WOODLAND 44
#define OPTRE_SPARTAN 50
#define OPTRE_URBAN 51
#define UNSUNG_AUS 60
#define UNSUNG_NZ 61
#define UNSUNG_ROK 62
#define UNSUNG_US 63

private _paramValue = ["get","Loadout"] call GG_system_fnc_params;
private _loadout = if (_paramValue == 0) then {
	switch worldName do {

		// Vanilla
		case "Altis";
		case "Malden";
		case "Stratis":{VANILLA};

		// Vanilla (DLC)
		case "Tanoa":{VANILLA_DLC};

		// CUP
		case "sara";
		case "porto";
		case "chernarus";
		case "cup_chernarus_a3";
		case "chernarus_summer":{CUP_MTP};
		case "Chernarus_Winter":{CUP_WINTER};
		case "zargabad";
		case "takistan":{CUP_DESERT};

		// IFA3
		case "Staszow";
		case "I44_Merderet_V3";
		case "I44_merderet_koth":{IFA3};
		case "StaszowWinter";
		case "SWU_Ardennes_1944_Winter":{IFA3_Winter};
		case "iron_excelsior_Tobruk";
		case "SWU_Egypt_El_Alamein":{IFA3_Desert};

		// Independent maps
		//case "MontellaV3";
		//case "isladuala3";
        //case "chernarusredux":{VANILLA};

        // RHS
        case "rhspkl":{RHS_ERDL};

		// Unsung
		case "DaKrong";
		case "phu_bai";
		case "psyfx_pht";
		case "RungSat";
		case "song_bin_tanh";
		case "uns_dong_ha":{UNSUNG_US};

		default {VANILLA};
	};
} else {_paramValue};

(switch _loadout do {
	case VANILLA:{["U_B_CombatUniform_mcam_vest","V_PlateCarrier1_rgr","H_HelmetB_light_sand","G_Bandanna_aviator"]};
	case VANILLA_DLC:{["U_B_T_Soldier_SL_F","V_PlateCarrier1_tna_F","H_HelmetB_Light_tna_F","G_Bandanna_aviator"]};

	case TCB_BAF_Desert:{["UK3CB_BAF_U_CombatUniform_DDPM_ShortSleeve","UK3CB_BAF_V_Osprey_DDPM5","UK3CB_BAF_H_Mk6_DDPM_B","UK3CB_BAF_G_Tactical_Black",{
		isClass(configfile >> "CfgPatches" >> "UK3CB_BAF_Equipment")
	}]};
	case TCB_BAF_Temperate:{["UK3CB_BAF_U_CombatUniform_DPMT_ShortSleeve","UK3CB_BAF_V_Osprey_DPMT5","UK3CB_BAF_H_Mk6_DPMT_B","UK3CB_BAF_G_Tactical_Black",{
		isClass(configfile >> "CfgPatches" >> "UK3CB_BAF_Equipment")
	}]};
	case TCB_BAF_Woodland:{["UK3CB_BAF_U_CombatUniform_DPMW_ShortSleeve","UK3CB_BAF_V_Osprey_DPMW5","UK3CB_BAF_H_Mk6_DPMW_B","UK3CB_BAF_G_Tactical_Black",{
		isClass(configfile >> "CfgPatches" >> "UK3CB_BAF_Equipment")
	}]};

	case CUP_ACU:{["CUP_U_B_USArmy_Base","CUP_V_B_IOTV_tl","CUP_H_USArmy_HelmetMICH","CUP_G_Oakleys_Drk",{
		isClass(configfile >> "CfgPatches" >> "CUP_Creatures_People_Core")
	}]};
	case CUP_DESERT:{["CUP_U_B_CZ_DST_NoKneepads","CUP_V_B_BAF_DDPM_Osprey_Mk3_Rifleman","CUP_H_CZ_Helmet02","CUP_G_Oakleys_Drk",{
		isClass(configfile >> "CfgPatches" >> "CUP_Creatures_People_Core")
	}]};
	case CUP_MTP:{["CUP_U_B_BAF_MTP_UBACSLONG","CUP_V_B_BAF_MTP_Osprey_Mk4_Rifleman","CUP_H_BAF_MTP_Mk7","CUP_G_Oakleys_Drk",{
		isClass(configfile >> "CfgPatches" >> "CUP_Creatures_People_Core")
	}]};
	case CUP_WINTER:{["CUP_U_B_CDF_SNW_2","CUP_V_CDF_6B3_1_SNW","CUP_H_USArmy_HelmetMICH_earpro_ess","CUP_G_Oakleys_Drk",{
		isClass(configfile >> "CfgPatches" >> "CUP_Creatures_People_Core")
	}]};
	case CUP_WOODLAND:{["CUP_U_B_CZ_WDL_NoKneepads","CUP_V_CZ_vest04","CUP_H_CZ_Helmet04","CUP_G_Oakleys_Drk",{
		isClass(configfile >> "CfgPatches" >> "CUP_Creatures_People_Core")
	}]};

	case IFA3:{["U_LIB_US_Rangers_Uniform","V_LIB_US_Assault_Vest","H_LIB_US_Helmet","",{
		isClass (configFile >> "CfgPatches" >> "WW2_Assets_c_Characters_ZZZ_LastLoaded_c") &&
		isClass (configFile >> "CfgPatches" >> "WW2_Assets_c_Misc_ZZZ_LastLoaded_c") &&
		isClass (configFile >> "CfgPatches" >> "WW2_Assets_c_Vehicles_ZZZ_LastLoaded_c")
	}]};
	case IFA3_Winter:{["U_LIB_US_Private_w","V_LIB_US_Assault_Vest","H_LIB_US_Helmet_w","",{
		isClass (configFile >> "CfgPatches" >> "WW2_Assets_c_Characters_ZZZ_LastLoaded_c") &&
		isClass (configFile >> "CfgPatches" >> "WW2_Assets_c_Misc_ZZZ_LastLoaded_c") &&
		isClass (configFile >> "CfgPatches" >> "WW2_Assets_c_Vehicles_ZZZ_LastLoaded_c")
	}]};
	case IFA3_Desert:{["U_LIB_US_Rangers_Uniform","V_LIB_US_AB_Vest_Padded_Thompson","H_LIB_US_Helmet","",{
		isClass (configFile >> "CfgPatches" >> "WW2_Assets_c_Characters_ZZZ_LastLoaded_c") &&
		isClass (configFile >> "CfgPatches" >> "WW2_Assets_c_Misc_ZZZ_LastLoaded_c") &&
		isClass (configFile >> "CfgPatches" >> "WW2_Assets_c_Vehicles_ZZZ_LastLoaded_c")
	}]};

	case OPTRE_SPARTAN:{["OPTRE_MJOLNIR_Undersuit","OPTRE_MJOLNIR_MkVBArmor","OPTRE_MJOLNIR_MkVBHelmet","",{
		isClass(configfile >> "CfgPatches" >> "OPTRE_Core")
	}]};
	case OPTRE_URBAN:{["OPTRE_MJOLNIR_Undersuit","OPTRE_UNSC_M52D_Armor_Rifleman","OPTRE_UNSC_CH252_Helmet2_Vacuum_URB","",{
		isClass(configfile >> "CfgPatches" >> "OPTRE_Core")
	}]};

	case RHS_OCP:{["rhs_uniform_cu_ocp","rhsusf_iotv_ocp_Rifleman","rhsusf_ach_helmet_ocp","rhs_googles_black",{
		isClass(configfile >> "CfgPatches" >> "rhsusf_main")
	}]};
	case RHS_UCP:{["rhs_uniform_cu_ucp","rhsusf_iotv_ucp_Rifleman","rhsusf_ach_helmet_ucp","rhs_googles_black",{
		isClass(configfile >> "CfgPatches" >> "rhsusf_main")
	}]};
	case RHS_ERDL:{["rhsgref_uniform_ERDL","rhssaf_vest_md99_md2camo_rifleman","rhsgref_helmet_pasgt_erdl","rhs_googles_black",{
		isClass(configfile >> "CfgPatches" >> "rhsgref_main") &&
		isClass(configfile >> "CfgPatches" >> "rhssaf_main")
	}]};

    case UNSUNG_AUS:{["UNS_RAR_ARMY_BDU","UNS_M1956_M7","UNS_Boonie_4","",{
        isClass(configfile >> "CfgPatches" >> "uns_main")
    }]};
    case UNSUNG_NZ:{["UNS_NZ_ARMY_BDU","UNS_M1956_M7","UNS_Boonie_OD2","",{
        isClass(configfile >> "CfgPatches" >> "uns_main")
    }]};
    case UNSUNG_ROK:{["UNS_ARMY_ROKMC65Camo_ipatch","UNS_M1956_M2","UNS_M1_1RM","",{
        isClass(configfile >> "CfgPatches" >> "uns_main")
    }]};
    case UNSUNG_US:{["UNS_USMC_Flak_E","UNS_M1956_M14","UNS_M1_2","",{
        isClass(configfile >> "CfgPatches" >> "uns_main")
    }]};
}) params [["_uniform",""],["_vest",""],["_headgear",""],["_goggles",""],["_condition",{true}]];

if !(call _condition) exitWith {endMission "MissingMods";[]};

[[],[],[],[_uniform,[]],[_vest,[]],[],_headgear,_goggles,[],["ItemMap","","","ItemCompass","",""]];

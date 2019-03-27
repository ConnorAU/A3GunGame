/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

#define THIS_FUNC GG_config_fnc_weapons

#include "..\defines.inc"

#define VANILLA 1
#define VANILLA_DLC 2
#define TCB_BAF 10
#define IFA3 20
#define RHS 30
#define CUP 40
#define OPTRE 50

private _paramValue = ["get","WeaponPool"] call GG_system_fnc_params;
private _weaponPool = if (_paramValue == 0) then {
	switch worldName do {

		// Vanilla
		case "Altis";
		case "Malden";
		case "Stratis":{VANILLA};

		// Vanilla (DLC)
		case "Tanoa":{VANILLA_DLC};

		// CUP 
		case "zargabad";
		case "takistan";
		case "sara";
		case "porto";
		case "chernarus";
		case "chernarus_summer";
		case "Chernarus_Winter":{CUP};

		// IFA3
		case "iron_excelsior_Tobruk";
		case "SWU_Egypt_El_Alamein";
		case "StaszowWinter";
		case "Staszow";
		case "SWU_Ardennes_1944_Winter";
		case "I44_Merderet_V3";
		case "I44_merderet_koth":{IFA3};

		// Independent maps 
		//case "MontellaV3";
		//case "isladuala3";

		default {VANILLA};
	};
} else {_paramValue};

switch _weaponPool do {
	case VANILLA:{[
		2, // Kill streak required to advance weapon
		{true}, // Condition to use this pool (for modded weapon pools)
		[ // SMG / Shotgun
			"hgun_PDW2000_F",
			"SMG_01_F",
			"SMG_02_F",
			format["SMG_03%1%2_%3",selectRandom["","C"],selectRandom["","_TR"],selectRandom["black","camo","hex","khaki"]]
		],
		[ // Rifle 
			format["arifle_Katiba%1_F",selectRandom["","_C"]],
			format["arifle_Mk20%1_F",selectRandom["","_plain"]],
			format["arifle_MX%1%2_F",selectRandom["","C"],selectRandom["","_Black"]],
			format["arifle_TRG2%1_F",selectRandom[0,1]]
		],
		[ // Marksmen
			format["srifle_GM6%1_F",selectRandom["","_camo"]],
			format["srifle_LRR%1_F",selectRandom["","_camo"]],
			"srifle_EBR_F",
			"srifle_DMR_01_F"
		],
		[ // LMG 
			"LMG_Mk200_F",
			format["arifle_MX_SW%1_F",selectRandom["","_Black"]],
			"LMG_Zafir_F"
		],
		[ // Pistol
			"hgun_Pistol_heavy_01_F",
			"hgun_ACPC2_F",
			"hgun_P07_F",
			"hgun_Rook40_F",
			"hgun_Pistol_heavy_02_F"
		]
	]};
	case VANILLA_DLC:{[
		2,
		{true}, // Pretty sure you can use DLC weapons with a watermark so no need to kick for it 
		[
			"SMG_05_F", // Only DLC weapon in the SMG section
			"SMG_01_F",
			"SMG_02_F",
			format["SMG_03%1%2_%3",selectRandom["","C"],selectRandom["","_TR"],selectRandom["black","camo","hex","khaki"]]
		],
		[
			format["arifle_AK%1_F",selectRandom[12,"M","S"]],
			format["arifle_CTAR_%1_F",selectRandom["blk","ghex","hex"]],
			format["arifle_MX%1_khk_F",selectRandom["","C","M"]],
			format["arifle_SPAR_0%1_%2_F",selectRandom[1,3],selectRandom["blk","khk","snd"]],
			format["arifle_ARX_%1_F",selectRandom["blk","ghex","hex"]]
		],
		[
			"srifle_GM6_ghex_F",
			"srifle_LRR_tna_F",
			format["srifle_DMR_04%1_F",selectRandom["","_Tan"]],
			format["srifle_DMR_07_%1_F",selectRandom["blk","hex"]],
			format["srifle_DMR_05_%1_F",selectRandom["blk","hex","tan"]],
			format["srifle_DMR_02%1_F",selectRandom["","_camo","_sniper"]],
			format["srifle_DMR_03%1_F",selectRandom["","_multicam","_khaki","_tan","_woodland"]],
			format["srifle_DMR_06%1_F",selectRandom["_camo","_olive"]]
		],
		[
			"LMG_03_F",
			"arifle_MX_SW_khk_F",
			format["MMG_01_%1_F",selectRandom["hex","tan","black"]],
			format["MMG_02_%1_F",selectRandom["camo","sand"]]
		],
		[
			"hgun_P07_khk_F", // only two dlc pistols
			"hgun_Pistol_01_F", // only two dlc pistols
			"hgun_Rook40_F",
			"hgun_Pistol_heavy_02_F"
		]
	]};

	case TCB_BAF:{[
		2,
		{isClass(configFile >> "CfgPatches" >> "UK3CB_BAF_Weapons")},
		[
			"UK3CB_BAF_L128A1",
			format["UK3CB_BAF_L9%1A1",selectRandom[1,2]]
		],
		[
			format["UK3CB_BAF_L119A1%1",selectRandom["","_CQB","_FG"]],
			"UK3CB_BAF_L129A1",
			format["UK3CB_BAF_L%1",selectRandom["22","22A2","85A2","85A2_RIS_AFG","85A2_EMAG","85A2_RIS","85A2_RIS_Green","85A2_RIS_Tan","86A2","86A3","98A2"]]
		],
		[
			format["UK3CB_BAF_L11%1%2",selectRandom["5A3","8A1_Covert"],selectRandom["","_BL","_DE"]],
			"UK3CB_BAF_L135A1",
			format["UK3CB_BAF_L1A1%1",selectRandom["","_Wood"]]
		],
		[
			format["UK3CB_BAF_L110%1",selectRandom["_762","A1","A2","A2RIS","A3"]],
			"UK3CB_BAF_L7A2"
		],
		[
			format["UK3CB_BAF_L105A%1",selectRandom[1,2]],
			"UK3CB_BAF_L107A1",
			"UK3CB_BAF_L117A2",
			"UK3CB_BAF_L131A1",
			"UK3CB_BAF_L9A1"
		]
	]};

	case CUP:{[
		2,
		{isClass(configfile >> "CfgPatches" >> "CUP_Weapons_WeaponsCore")},
		[
			"CUP_sgun_AA12",
			"CUP_sgun_M1014",
			"CUP_sgun_Saiga12K",
			"CUP_smg_bizon",
			"CUP_smg_EVO",
			format["CUP_smg_MP5$1",selectRandom["A5","SD6"]]
		],
		[
			format["CUP_arifle_AK%1",selectRandom["47","101","101_railed","101_top_rail","102","102_railed","102_top_rail","103","103_railed","103_top_rail","104","104_railed","104_top_rail","105","105_railed","105_top_rail","107","107_railed","107_top_rail","108","108_railed","108_top_rail","109","109_railed","109_top_rail","74","74_top_rail","74M","74M_railed","74M_top_rail","74M_camo","47_top_rail","M","M_top_rail","MS","MS_top_rail","S_Gold","S","S74","S74_top_rail","S74U","S74U_top_rail","S_top_rail"]],
			format["CUP_arifle_CZ805_%1",selectRandom["A1","A2","B"]],
			format["CUP_arifle_FNFAL%1",selectRandom["","_railed","5061","5062","_OSW"]],
			format["CUP_arifle_G36%1",selectRandom["A","C","K","A_camo","A_wdl","C_camo","C_wdl","K_camo","K_wdl"]],
			format["CUP_arifle_HK416_%1",selectRandom["CQB_Black","CQB_Desert","CQB_Wood","Black","Desert","Wood"]],
			format["CUP_arifle_HK417_%1",selectRandom[12,20]],
			format["CUP_arifle_L8%1",selectRandom["5A2","5A2_G","5A2_NG","6A2"]],
			format["CUP_arifle_M16A%1",selectRandom["2","4_Base","4_Grip"]],
			"CUP_arifle_HK_M27",
			"CUP_arifle_SBR_black",
			format["CUP_arifle_M4A%1",selectRandom["1","1_black","1_desert_carryhandle","1_camo_carryhandle","1_desert","1_camo","3_black","3_desert","3_camo"]],
			format["CUP_arifle_MG36%1",selectRandom["","_camo","_wdl"]],
			"CUP_arifle_mk18_black",
			format["CUP_arifle_Mk%1",selectRandom["16_CQC","16_CQC_black","16_CQC_FG_black","16_CQC_FG","16_CQC_woodland","16_CQC_FG_woodland","16_STD","16_STD_FG_black","16_STD_FG","16_STD_FG_woodland","16_STD_black","16_STD_woodland","16_SV","16_SV_black","16_SV_woodland","17_CQC","17_CQC_Black","17_CQC_FG_black","17_CQC_FG","17_CQC_woodland","17_CQC_FG_woodland","20","20_black","17_STD","17_STD_FG","17_STD_FG_black","17_STD_FG_woodland","17_STD_woodland","17_STD_black"]],
			format["CUP_arifle_RPK74%1",selectRandom["","_45","_45_top_rail","M","M_top_rail","_top_rail"]],
			format["CUP_arifle_Sa58%1",selectRandom["RIS1","RIS1_des","RIS2","RIS2_camo","P","P_des","V","V_camo"]],
			format["CUP_arifle_SAIGA_MK03%1",selectRandom["","_top_rail"]],
			format["CUP_arifle_TYPE_56_2%1",selectRandom["","_top_rail"]],
			format["CUP_arifle_XM8_%1",selectRandom["Carbine","Railed","Compact","Compact_Rail","Carbine_FG","SAW","sharpshooter"]]
		],
		[
			"CUP_srifle_AS50",
			format["CUP_srifle_CZ550%1",selectRandom["","_rail"]],
			"CUP_srifle_CZ750",
			format["CUP_srifle_G22_%1",selectRandom["des","wdl"]],
			"CUP_srifle_ksvk",
			format["CUP_srifle_AWM_%1",selectRandom["des","wdl"]],
			format["CUP_srifle_L129A1%1",selectRandom["","_HG"]],
			format["CUP_srifle_LeeEnfield%1",selectRandom["","_rail"]],
			"CUP_srifle_M107_Base",
			"CUP_srifle_M110",
			format["CUP_srifle_M14%1",selectRandom["","_DMR"]],
			format["CUP_srifle_M24_%1",selectRandom["wdl","blk","des"]],
			"CUP_srifle_M40A3",
			"CUP_srifle_Mk12SPR",
			format["CUP_srifle_SVD%1",selectRandom["","_des"]],
			"CUP_srifle_VSSVintorez"
		],
		[
			format["CUP_lmg_minimi%1",selectRandom["","_railed","para"]],
			"CUP_lmg_L110A1",
			"CUP_lmg_L7A2",
			"CUP_lmg_M240",
			format["CUP_lmg_m249%1",selectRandom["_SQuantoon","_pip1","_pip3","_pip4","_E2","_pip2","_para"]],
			format["CUP_lmg_M60E4%1",selectRandom["","_norail"]],
			format["CUP_lmg_MG3%1",selectRandom["","_rail"]],
			format["CUP_lmg_Mk48%1",selectRandom["_des","_wdl"]],
			"CUP_lmg_PKM",
			"CUP_lmg_Pecheneg",
			"CUP_lmg_UK59"
		],
		[
			format["CUP_hgun_%1",selectRandom["Compact","Duty","Phantom"]],
			format["CUP_hgun_Glock17_%1",selectRandom["","blk","tan"]],
			"CUP_hgun_Colt1911",
			"CUP_hgun_M9",
			"CUP_hgun_Makarov",
			"CUP_hgun_MicroUzi",
			"CUP_hgun_PB6P9",
			"CUP_hgun_SA61",
			format["CUP_hgun_TaurusTracker455%1",selectRandom["","_gold"]]
		]
	]};

	case IFA3:{[
		2,
		{isClass(configFile >> "CfgPatches" >> "WW2_Assets_c_Weapons_ZZZ_LastLoaded_c")},
		[
			format["LIB_M1%1_Thompson",selectRandom["928","928A1","A1"]],
			format["LIB_MP%1",selectRandom[38,40]],
			"LIB_M3_GreaseGun",
			format["LIB_PPSh41_%1",selectRandom["d","m"]]
		],
		[
			"LIB_DELISLE",
			"LIB_FG42G",
			format["LIB_%1",selectRandom["G3340","G41","G43","K98","K98_Late"]],
			"LIB_M1_Carbine",
			"LIB_M1_Garand",
			"LIB_M1A1_Carbine",
			"LIB_M1_Garand",
			format["LIB_M%1",selectRandom[9130,38,44]],
			"LIB_MP44",
			"LIB_M1918A2_BAR",
			"LIB_SVT_40"
		],
		[
			//"LIB_PTRD",
			"LIB_K98ZF39",
			"LIB_M1903A4_Springfield",
			"LIB_M9130PU"
		],
		[
			"LIB_DP28",
			"LIB_DT",
			format["LIB_M1919A%1",selectRandom[4,6]],
			"LIB_MG42",
			format["LIB_MG34%1",selectRandom["","_PT"]]
		],
		[
			"LIB_M1896",
			"LIB_Colt_M1911",
			"LIB_M1895",
			"LIB_P08",
			"LIB_P38",
			"LIB_TT33",
			"LIB_WaltherPPK"
		]
	]};

	case OPTRE:{[
		2,
		{isClass(configfile >> "CfgPatches" >> "OPTRE_Core")},
		[
			format["OPTRE_M45%1",selectRandom["","A","E"]],
			"OPTRE_M90A",
			"OPTRE_M7"
		],
		[
			"OPTRE_BR55HB",
			"OPTRE_MA37",
			"OPTRE_MA5A",
			format["OPTRE_MA5%1",selectRandom["B","C"]],
			"OPTRE_MA5C",
			"OPTRE_MA5K"
		],
		[
			"OPTRE_M392_DMR",
			format["OPTRE_M393%1",selectRandom["_DMR","S_DMR"]],
			"OPTRE_SRS99C",
			"OPTRE_SRS99D"
		],
		[
			"OPTRE_M247",
			"OPTRE_M73"
		],
		[
			format["OPTRE_M6%1",selectRandom["C","G"]],
			"OPTRE_M7_Folded"
		]
	]};

	case RHS:{[
		2,
		{
			isClass(configFile >> "CfgPatches" >> "rhs_main") && 
			isClass(configFile >> "CfgPatches" >> "rhsgref_main") && 
			isClass(configFile >> "CfgPatches" >> "rhssaf_main") && 
			isClass(configFile >> "CfgPatches" >> "rhsusf_main")
		},
		[
			format["rhsusf_weap_MP7A2%1",selectRandom["","_aor1","_desert","_winter"]],
			format["rhs_weap_M590_%1RD",selectRandom[5,8]],
			"rhs_weap_savz61_folded",
			format["rhs_weap_pp2000%1",selectRandom["","_folded"]],
			format["rhs_weap_vss%1",selectRandom["","_grip"]],
			"rhs_weap_Izh18",
			format["rhs_weap_m3a1%1",selectRandom["","_specops"]],
			"rhs_weap_savz61"
		],
		[
			format["rhs_weap_hk416d%1",selectRandom["10","10_LMT","10_LMT_d","10_LMT_wd","145","145_d","145_d_2","145_wd","145_wd_2"]],
			format["rhs_weap_m16a4%1",selectRandom["","_carryhandle"]],
			format["rhs_weap_m27iar%1",selectRandom["","_grip"]],
			format["rhs_weap_m4%1",selectRandom["","_carryhandle","_carryhandle_mstock","_mstock"]],
			format["rhs_weap_m4a1%1",selectRandom["","_carryhandle","_carryhandle_mstock","_blockII","_blockII_bk","_blockII_KAC_bk","_blockII_d","_blockII_KAC_d","_blockII_KAC","_blockII_wd","_blockII_KAC_wd","_d","_d_mstock","_mstock","_wd","_wd_mstock"]],
			format["rhs_weap_sr25%1",selectRandom["","_d","_ec","_ec_d","_ec_wd","_wd"]],
			format["rhs_weap_mk18%1",selectRandom["","_bk","_KAC_bk","_d","_KAC_d","_KAC","_wd","_KAC_wd"]],
			format["rhs_weap_ak%1",selectRandom["103","103_1","103_2","103_zenitco01","103_zenitco01_b33","104","104_zenitco01","104_zenitco01_b33","105","105_zenitco01","105_zenitco01_b33","74","74_3","74_2","74m","74m_camo","74m_desert","74m_fullplum","74m_zenitco01","74m_zenitco01_b33","74mr","74n","74n_2","m","m_zenitco01_b33","mn","ms","s74","s74_2","s74n","s74n_2","s74u","s74un"]],
			format["rhs_weap_asval%1",selectRandom["","_grip"]],
			format["rhs_weap_m21%1",selectRandom["a","a_pr","s","s_pr"]],
			format["rhs_weap_vhs%1",selectRandom["d2","d2_ct15x","k2"]],
			format["rhs_weap_g36%1",selectRandom["c","kv"]]
		],
		[
			format["rhs_weap_M107%1",selectRandom["","_d","_w"]],
			"rhs_weap_m14ebrri",
			format["rhs_weap_XM2010%1",selectRandom["","_wd","_d","_sa"]],
			format["rhs_weap_m24sws%1",selectRandom["","_d","_wd"]],
			format["rhs_weap_m40a5%1",selectRandom["","_d","_wd"]],
			format["rhs_weap_svd%1",selectRandom["p","p_wd","s"]],
			"rhs_weap_t5000",
			"rhs_weap_kar98k",
			"rhs_weap_m1garand_sa43",
			format["rhs_weap_%1",selectRandom["m38","m38_rail","mosin_sbr"]],
			"rhs_weap_m82a1"
		],
		[
			format["rhs_weap_m240%1",selectRandom["B","G"]],
			format["rhs_weap_m249%1",selectRandom["","_pip_L","_pip_L_para","_pip_L_vfg","_pip_S","_pip_S_para","_pip_S_vfg","_pip"]],
			"rhs_weap_pkm",
			"rhs_weap_pkp",
			"rhs_weap_mg42",
			"rhs_weap_minimi_para_railed",
			"rhs_weap_m84"
		],
		[
			"rhsusf_weap_glock17g4",
			"rhsusf_weap_m1911a1",
			"rhsusf_weap_m9",
			"rhs_weap_6p53",
			"rhs_weap_pb_6p9",
			"rhs_weap_pya",
			"rhs_weap_makarov_pm",
			"rhs_weap_tt33",
			"rhs_weap_type94_new"
		]
	]};
};

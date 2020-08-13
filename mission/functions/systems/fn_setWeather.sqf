/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_setWeather

Description:
	Set date and time based on current terrain

Parameters:
	None

Return:
	Nothing
---------------------------------------------------------------------------- */

(switch worldName do {

	// Vanilla
	case "Altis";
	case "Malden";
	case "Stratis":{[6,5,17]};

	// Vanilla (DLC)
	case "Tanoa":{[2,6,19]};

	// CUP
	case "zargabad";
	case "takistan";
	case "sara";
	case "porto";
	case "chernarus";
	case "cup_chernarus_a3";
	case "chernarus_summer";
	case "Chernarus_Winter":{[6,5,19]};

	// IFA3
	case "I44_Merderet_V3";
	case "I44_merderet_koth":{[1,5,19]};
	case "SWU_Ardennes_1944_Winter":{[6,4,20]};
	case "iron_excelsior_Tobruk";
	case "SWU_Egypt_El_Alamein";
	case "StaszowWinter";
	case "Staszow":{[6,5,19]};

	// Independent maps
	case "MontellaV3":{[6,5,18]};
	case "isladuala3":{[6,6,18]};
	case "chernarusredux":{[6,5,19]};

    // RHS
    case "rhspkl":{[6,6,18]};

	// Unsung
	case "DaKrong":{[6,6,18]};
	case "phu_bai":{[6,5,18]};
	case "psyfx_pht":{[1,6,18]};
	case "RungSat":{[6,6,18]};
	case "song_bin_tanh":{[1,6,18]};
	case "uns_dong_ha":{[1,6,18]};

	default {[1,7,17]};
}) params ["_month","_min","_max"];

private _paramHour = ["get","TimeOfDay"] call GG_system_fnc_params;
setDate [
	2035,_month,1,
	if (_paramHour > 0) then {_paramHour} else {
		_min max (ceil random _max)
	},
	0
];

private _fog = [random 0.75,0,0.3,0.75]#(["get","WeatherFog"] call GG_system_fnc_params);
private _rain = [
	[random 1,random 1,random 1],
	[0,0,0],
	[0.25,0.6,0],
	[0.7,0.7,0],
	[1,1,1]
]#(["get","WeatherRain"] call GG_system_fnc_params);

0 setFog _fog;
0 setRain _rain#0;
0 setOvercast _rain#1;
0 setLightnings _rain#2;
forceWeatherChange;

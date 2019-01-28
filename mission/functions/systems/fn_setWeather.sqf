/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

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
	case "chernarus_summer";
	case "Chernarus_Winter":{[6,5,19]};

	// IFA3
	case "I44_Merderet_V3";
	case "I44_merderet_koth":{[1,5,19]};
	case "SWU_Ardennes_1944_Winter":{[6,4,20]};
	case "StaszowWinter";
	case "Staszow":{[6,5,19]};

	// Independent maps
	case "MontellaV3":{[6,5,18]};
	case "isladuala3":{[6,6,18]};

	default {[1,7,5]};
}) params ["_month","_min","_max"];

private _paramHour = "TimeOfDay" call BIS_fnc_getParamValue;
setDate [
	2035,_month,1,
	if (_paramHour > 0) then {_paramHour} else {
		_min max (ceil random _max)
	},
	0
];

private _fog = [random 0.75,0,0.3,0.75]#("Weather_Fog" call BIS_fnc_getParamValue);
private _rain = [
	[random 1,random 1,random 1],
	[0,0,0],
	[0.25,0.6,0],
	[0.7,0.7,0],
	[1,1,1]
]#("Weather_Rain" call BIS_fnc_getParamValue);

0 setFog _fog;
0 setRain _rain#0;
0 setOvercast _rain#1;
0 setLightnings _rain#2;
forceWeatherChange;
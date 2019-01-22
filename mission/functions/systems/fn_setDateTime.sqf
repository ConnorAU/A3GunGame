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

setDate [2035,_month,1,_min max (ceil random _max),0];

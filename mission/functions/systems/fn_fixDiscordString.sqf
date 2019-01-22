/*──────────────────────────────────────────────────────┐
│   Author: Connor                                      │
│   Steam:  https://steamcommunity.com/id/_connor       │
│   Github: https://github.com/ConnorAU                 │
│                                                       │
│   Please do not modify or remove this comment block   │
└──────────────────────────────────────────────────────*/

params [["_input","",[""]]];

private _array = toArray _input;
{
	switch true do {

		// Bad space
		case (_x in [160]):{_array set [_forEachindex,32]};

		//            è   é                                e
		case (_x in [232,233]):{_array set [_forEachindex,101]};
		
	};

} foreach _array;
toString _array
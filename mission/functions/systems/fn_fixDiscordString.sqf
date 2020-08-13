/* ----------------------------------------------------------------------------
Project:
	https://github.com/ConnorAU/A3GunGame

Author:
	ConnorAU - https://github.com/ConnorAU

Function:
	GG_system_fnc_fixDiscordString

Description:
	Replace characters that break discord rich presence with valid characters

Parameters:
	0 : STRING - Input string to fix

Return:
	STRING - Fixed string
---------------------------------------------------------------------------- */

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

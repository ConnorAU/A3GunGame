class GG_ctrlDefault
{
	access=0;
	idc=-1;
	style=0;
	default=0;
	show=1;
	fade=0;
	blinkingPeriod=0;
	deletable=0;
	x=0;
	y=0;
	w=0;
	h=0;
	tooltip="";
	tooltipMaxWidth=0.5;
	tooltipColorShade[]={0,0,0,1};
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={0,0,0,0};
	class ScrollBar
	{
		width=0;
		height=0;
		scrollSpeed=0.059999999;
		arrowEmpty="\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull="\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border="\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb="\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[]={1,1,1,1};
	};
};
class GG_ctrlDefaultText: GG_ctrlDefault
{
	sizeEx="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	font="RobotoCondensedLight";
	shadow=1;
};
class GG_ctrlDefaultButton: GG_ctrlDefaultText
{
	soundClick[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.090000004,
		1
	};
	soundEnter[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.090000004,
		1
	};
	soundEscape[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.090000004,
		1
	};
};
class GG_ctrlStatic: GG_ctrlDefaultText
{
	type=0;
	colorBackground[]={0,0,0,0};
	text="";
	lineSpacing=1;
	fixedWidth=0;
	colorText[]={1,1,1,1};
	colorShadow[]={0,0,0,1};
	moving=0;
	autoplay=0;
	loops=0;
	tileW=1;
	tileH=1;
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onVideoStopped="";
};
class GG_ctrlStaticPicture: GG_ctrlStatic
{
	style=48;
};
class GG_ctrlStaticPictureKeepAspect: GG_ctrlStaticPicture
{
	style="0x30 + 0x800";
};
class GG_ctrlStaticPictureTile: GG_ctrlStatic
{
	style=144;
};
class GG_ctrlStaticFrame: GG_ctrlStatic
{
	style=64;
};
class GG_ctrlStaticLine: GG_ctrlStatic
{
	style=176;
};
class GG_ctrlStaticMulti: GG_ctrlStatic
{
	style="0x10 + 0x200";
};
class GG_ctrlStaticBackground: GG_ctrlStatic
{
	colorBackground[]={0.2,0.2,0.2,1};
};
class GG_ctrlStaticOverlay: GG_ctrlStatic
{
	colorBackground[]={0,0,0,0.5};
};
class GG_ctrlStaticTitle: GG_ctrlStatic
{
	moving=1;
	colorBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[]={1,1,1,1};
};
class GG_ctrlStaticFooter: GG_ctrlStatic
{
	colorBackground[]={0,0,0,0.30000001};
};
class GG_ctrlStaticBackgroundDisable: GG_ctrlStatic
{
	x=-4;
	y=-2;
	w=8;
	h=4;
	colorBackground[]={1,1,1,0.5};
};
class GG_ctrlStaticBackgroundDisableTiles: GG_ctrlStaticPictureTile
{
	x=-4;
	y=-2;
	w=8;
	h=4;
	text="\a3\3DEN\Data\Displays\Display3DENEditAttributes\backgroundDisable_ca.paa";
	tileW="8 / (32 * pixelW)";
	tileH="4 / (32 * pixelH)";
	colorText[]={1,1,1,0.050000001};
};
class GG_ctrlButton: GG_ctrlDefaultButton
{
	type=1;
	style="0x02 + 0xC0";
	colorBackground[]={0,0,0,1};
	colorBackgroundDisabled[]={0,0,0,0.5};
	colorBackgroundActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorFocused[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	font="PuristaLight";
	text="";
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	borderSize=0;
	colorBorder[]={0,0,0,0};
	colorShadow[]={0,0,0,0};
	offsetX=0;
	offsetY=0;
	offsetPressedX="pixelW";
	offsetPressedY="pixelH";
	period=0;
	periodFocus=2;
	periodOver=0.5;
	class KeyHints
	{
		class A
		{
			key="0x00050000 + 0";
			hint="KEY_XBOX_A";
		};
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onButtonClick="";
	onButtonDown="";
	onButtonUp="";
};
class GG_ctrlButtonPicture: GG_ctrlButton
{
	style="0x02 + 0x30";
};
class GG_ctrlButtonPictureKeepAspect: GG_ctrlButton
{
	style="0x02 + 0x30 + 0x800";
};
class GG_ctrlButtonOK: GG_ctrlButton
{
	default=1;
	idc=1;
	text="$STR_DISP_OK";
};
class GG_ctrlButtonCancel: GG_ctrlButton
{
	idc=2;
	text="$STR_DISP_CANCEL";
};
class GG_ctrlButtonClose: GG_ctrlButtonCancel
{
	text="$STR_DISP_CLOSE";
};
class GG_ctrlButtonToolbar: GG_ctrlButtonPictureKeepAspect
{
	colorBackground[]={0,0,0,0};
	colorBackgroundDisabled[]={0,0,0,0};
};
class GG_ctrlButtonSearch: GG_ctrlButton
{
	style="0x02 + 0x30 + 0x800";
	text="\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
	textSearch="\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
	tooltip="$STR_3den_display3den_menubar_search_text";
};
class GG_ctrlButtonExpandAll: GG_ctrlButtonToolbar
{
	style="0x02 + 0x30 + 0x800";
	text="\a3\3DEN\Data\Displays\Display3DEN\tree_expand_ca.paa";
	tooltip="$STR_3DEN_ctrlButtonExpandAll_text";
};
class GG_ctrlButtonCollapseAll: GG_ctrlButtonToolbar
{
	style="0x02 + 0x30 + 0x800";
	text="\a3\3DEN\Data\Displays\Display3DEN\tree_collapse_ca.paa";
	tooltip="$STR_3DEN_ctrlButtonCollapseAll_text";
};
class GG_ctrlButtonFilter: GG_ctrlButton
{
	colorBackground[]={0,0,0,0};
	colorBackgroundDisabled[]={0,0,0,0};
	colorBackgroundActive[]={1,1,1,0.30000001};
	colorFocused[]={0,0,0,0};
};
class GG_ctrlEdit: GG_ctrlDefaultText
{
	type=2;
	colorBackground[]={0,0,0,0.5};
	text="";
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	colorSelection[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	canModify=1;
	autocomplete="";
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
};
class GG_ctrlEditMulti: GG_ctrlEdit
{
	style=16;
};
class GG_ctrlSliderV: GG_ctrlDefault
{
	type=3;
	style=0;
	color[]={0,0,0,1};
	colorDisabled[]={1,1,1,0.25};
	colorActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	sliderRange[]={0,1};
	sliderPosition=1;
	lineSize=0.1;
	pageSize=3;
	class Title
	{
		idc=-1;
		colorBase[]={1,1,1,1};
		colorActive[]=
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	class Value
	{
		idc=-1;
		format="%.f";
		type="SPTPlain";
		colorBase[]={1,1,1,1};
		colorActive[]=
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onSliderPosChanged="";
};
class GG_ctrlSliderH: GG_ctrlSliderV
{
	style=1024;
};
class GG_ctrlCombo: GG_ctrlDefaultText
{
	type=4;
	style="0x00 + 0x10 + 0x200";
	colorBackground[]={0.050000001,0.050000001,0.050000001,1};
	colorSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	colorSelect[]={0,0,0,1};
	colorTextRight[]={1,1,1,1};
	colorSelectRight[]={1,1,1,0.25};
	colorSelect2Right[]={1,1,1,1};
	colorPicture[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	colorPictureDisabled[]={1,1,1,0.25};
	colorPictureRight[]={1,1,1,1};
	colorPictureRightSelected[]={1,1,1,1};
	colorPictureRightDisabled[]={1,1,1,0.25};
	arrowEmpty="\a3\3DEN\Data\Controls\ctrlCombo\arrowEmpty_ca.paa";
	arrowFull="\a3\3DEN\Data\Controls\ctrlCombo\arrowFull_ca.paa";
	wholeHeight="12 * 	5 * (pixelH * pixelGrid * 	0.50)";
	maxHistoryDelay=1;
	soundExpand[]=
	{
		"\A3\ui_f\data\sound\RscCombo\soundExpand",
		0.1,
		1
	};
	soundCollapse[]=
	{
		"\A3\ui_f\data\sound\RscCombo\soundCollapse",
		0.1,
		1
	};
	soundSelect[]=
	{
		"\A3\ui_f\data\sound\RscCombo\soundSelect",
		0.1,
		1
	};
	class ComboScrollBar
	{
		width=0;
		height=0;
		scrollSpeed=0.0099999998;
		arrowEmpty="\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull="\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border="\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb="\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[]={1,1,1,1};
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onLBSelChanged="";
};
class GG_ctrlComboToolbar: GG_ctrlCombo
{
	colorBackground[]={0.050000001,0.050000001,0.050000001,1};
	colorSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	arrowEmpty="\a3\3DEN\Data\Controls\ctrlCombo\arrowEmptyToolbar_ca.paa";
	arrowFull="\a3\3DEN\Data\Controls\ctrlCombo\arrowEmptyToolbar_ca.paa";
	wholeHeight="12 * 	5 * (pixelH * pixelGrid * 	0.50)";
};
class GG_ctrlListbox: GG_ctrlDefaultText
{
	type=5;
	style="0x00 + 0x10";
	colorBackground[]={0,0,0,0.5};
	colorSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorSelectBackground2[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorShadow[]={0,0,0,0.5};
	colorDisabled[]={1,1,1,0.25};
	colorText[]={1,1,1,1};
	colorSelect[]={1,1,1,1};
	colorSelect2[]={1,1,1,1};
	colorTextRight[]={1,1,1,1};
	colorSelectRight[]={1,1,1,1};
	colorSelect2Right[]={1,1,1,1};
	colorPicture[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	colorPictureDisabled[]={1,1,1,0.25};
	colorPictureRight[]={1,1,1,1};
	colorPictureRightSelected[]={1,1,1,1};
	colorPictureRightDisabled[]={1,1,1,0.25};
	period=1;
	rowHeight="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	itemSpacing=0;
	maxHistoryDelay=1;
	canDrag=0;
	soundSelect[]=
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.090000004,
		1
	};
	class ListScrollBar: ScrollBar
	{
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onLBSelChanged="";
	onLBDblClick="";
	onLBDrag="";
	onLBDragging="";
	onLBDrop="";
};
class GG_ctrlToolbox: GG_ctrlDefaultText
{
	type=6;
	style=2;
	colorBackground[]={0,0,0,0.5};
	colorText[]={1,1,1,1};
	colorTextSelect[]={1,1,1,1};
	rows=1;
	columns=1;
	strings[]={};
	values[]={};
	color[]={1,0,1,1};
	colorSelect[]={0,0,0,0};
	colorTextDisable[]={0,0,0,0};
	colorDisable[]={0,0,0,0};
	colorSelectedBg[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onToolBoxSelChanged="";
};
class GG_ctrlToolboxPicture: GG_ctrlToolbox
{
	style="0x02 + 0x30";
};
class GG_ctrlToolboxPictureKeepAspect: GG_ctrlToolbox
{
	style="0x02 + 0x30 + 0x800";
};
class GG_ctrlCheckboxes: GG_ctrlDefaultText
{
	type=7;
	colorBackground[]={0,0,0,0.5};
	colorText[]={1,1,1,1};
	colorTextSelect[]={1,1,1,1};
	rows=1;
	columns=1;
	strings[]={};
	checked_strings[]={};
	color[]={1,0,1,1};
	colorSelect[]={0,0,0,0};
	colorTextDisable[]={0,0,0,0};
	colorDisable[]={0,0,0,0};
	colorSelectedBg[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onCheckBoxesSelChanged="";
};
class GG_ctrlCheckboxesCheckbox: GG_ctrlCheckboxes
{
	style=48;
	strings[]=
	{
		"\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa"
	};
	checked_strings[]=
	{
		"\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa"
	};
	colorBackground[]={0,0,0,0};
	colorSelectedBg[]={0,0,0,0};
};
class GG_ctrlProgress: GG_ctrlDefault
{
	type=8;
	texture="#(argb,8,8,3)color(1,1,1,1)";
	colorBar[]={1,1,1,1};
	colorFrame[]={0,0,0,1};
	onCanDestroy="";
	onDestroy="";
};
class GG_ctrlHTML: GG_ctrlDefaultText
{
	type=9;
	colorBackground[]={0,0,0,0};
	colorText[]={1,1,1,1};
	colorBold[]={1,1,1,0.5};
	colorLink[]={1,1,1,1};
	colorLinkActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorPicture[]={1,1,1,1};
	colorPictureBorder[]={0,0,0,0};
	colorPictureLink[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	prevPage="\a3\3DEN\Data\Controls\CtrlHTML\prevPage_ca.paa";
	nextPage="\a3\3DEN\Data\Controls\CtrlHTML\nextPage_ca.paa";
	filename="";
	cycleLinks=0;
	cycleAllLinks=0;
	class P
	{
		font="RobotoCondensedLight";
		fontBold="RobotoCondensedBold";
		sizeEx="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class H1: P
	{
		sizeEx="5.58 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class H2: P
	{
		sizeEx="4.86 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class H3: P
	{
	};
	class H4: P
	{
	};
	class H5: P
	{
	};
	class H6: P
	{
		font="RobotoCondensedLight";
		fontBold="RobotoCondensedLight";
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onHTMLLink="";
};
class GG_ctrlActiveText: GG_ctrlDefaultButton
{
	type=11;
	text="";
	color[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		0.75
	};
	colorActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorDisabled[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onButtonClick="";
	onButtonDown="";
	onButtonUp="";
};
class GG_ctrlActivePicture: GG_ctrlActiveText
{
	style=48;
	color[]={1,1,1,1};
};
class GG_ctrlActivePictureKeepAspect: GG_ctrlActiveText
{
	style="0x30 + 0x800";
};
class GG_ctrlTree: GG_ctrlDefaultText
{
	type=12;
	colorBorder[]={0,0,0,1};
	colorLines[]={0,0,0,0};
	colorBackground[]={0,0,0,0};
	colorSelect[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorMarked[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		0.5
	};
	colorMarkedSelected[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[]={1,1,1,1};
	colorSelectText[]={1,1,1,1};
	colorMarkedText[]={1,1,1,1};
	colorSearch[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorPicture[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	colorPictureDisabled[]={1,1,1,0.25};
	colorPictureRight[]={1,1,1,1};
	colorPictureRightSelected[]={1,1,1,1};
	colorPictureRightDisabled[]={1,1,1,0.25};
	multiselectEnabled=0;
	expandOnDoubleclick=1;
	hiddenTexture="\a3\3DEN\Data\Controls\ctrlTree\hiddenTexture_ca.paa";
	expandedTexture="\a3\3DEN\Data\Controls\ctrlTree\expandedTexture_ca.paa";
	maxHistoryDelay=1;
	disableKeyboardSearch=0;
	class ScrollBar: ScrollBar
	{
		scrollSpeed=0.050000001;
	};
	colorDisabled[]={0,0,0,0};
	colorArrow[]={0,0,0,0};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onTreeSelChanged="";
	onTreeLButtonDown="";
	onTreeDblClick="";
	onTreeExpanded="";
	onTreeCollapsed="";
	onTreeMouseExit="";
};
class GG_ctrlStructuredText: GG_ctrlDefaultText
{
	type=13;
	colorBackground[]={0,0,0,0};
	size="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	text="";
	class Attributes
	{
		align="left";
		color="#ffffff";
		colorLink="";
		size=1;
		font="RobotoCondensedLight";
	};
	onCanDestroy="";
	onDestroy="";
};
class GG_ctrlControlsGroup: GG_ctrlDefault
{
	type=15;
	style=16;
	x=0;
	y=0;
	w=1;
	h=1;
	class VScrollBar: ScrollBar
	{
		width="2 * (pixelW * pixelGrid * 	0.50)";
		height=0;
		autoScrollEnabled=0;
		autoScrollDelay=1;
		autoScrollRewind=1;
		autoScrollSpeed=1;
	};
	class HScrollBar: ScrollBar
	{
		width=0;
		height="2 * (pixelH * pixelGrid * 	0.50)";
	};
	onCanDestroy="";
	onDestroy="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
};
class GG_ctrlControlsGroupNoScrollbars: GG_ctrlControlsGroup
{
	class VScrollbar: VScrollBar
	{
		width=0;
	};
	class HScrollbar: HScrollBar
	{
		height=0;
	};
};
class GG_ctrlControlsGroupNoHScrollbars: GG_ctrlControlsGroup
{
	class HScrollbar: HScrollBar
	{
		height=0;
	};
};
class GG_ctrlControlsGroupNoVScrollbars: GG_ctrlControlsGroup
{
	class VScrollbar: VScrollBar
	{
		width=0;
	};
};
class GG_ctrlShortcutButton: GG_ctrlDefaultButton
{
	type=16;
	style=192;
	colorBackground[]={0,0,0,1};
	colorBackground2[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorBackgroundFocused[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorBackgroundActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	text="";
	size="4.86 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	shadow=0;
	color[]={1,1,1,1};
	color2[]={1,1,1,1};
	colorFocused[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	animTextureNormal="#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver="#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed="#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault="#(argb,8,8,3)color(1,1,1,1)";
	period=1;
	periodFocus=1;
	periodOver=0.5;
	shortcuts[]=
	{
		"0x00050000 + 0",
		28,
		57,
		156
	};
	textureNoShortcut="#(argb,8,8,3)color(1,1,1,1)";
	class Attributes
	{
		align="center";
		color="#ffffff";
		font="PuristaLight";
		shadow=0;
	};
	class HitZone
	{
		left=0;
		top=0;
		right=0;
		bottom=0;
	};
	class TextPos
	{
		left=0;
		top=0;
		right=0;
		bottom=0;
	};
	class ShortcutPos
	{
		left=0;
		top=0;
		w=0;
		h=0;
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onButtonClick="";
	onButtonDown="";
	onButtonUp="";
};
class GG_ctrlShortcutButtonOK: GG_ctrlShortcutButton
{
	default=1;
	idc=1;
	text="$STR_DISP_OK";
};
class GG_ctrlShortcutButtonCancel: GG_ctrlShortcutButton
{
	idc=2;
	text="$STR_DISP_CANCEL";
};
class GG_ctrlShortcutButtonSteam: GG_ctrlShortcutButton
{
	colorBackground[]={0.031372551,0.72156864,0.91764706,1};
	textureNoShortcut="\a3\3DEN\Data\Controls\CtrlShortcutButton\steam_ca.paa";
	class TextPos
	{
		left="1.5 * 	5 * (pixelW * pixelGrid * 	0.50)";
		top=0;
		right=0;
		bottom=0;
	};
	class ShortcutPos
	{
		left=0;
		top=0;
		w="5 * (pixelW * pixelGrid * 	0.50)";
		h="5 * (pixelH * pixelGrid * 	0.50)";
	};
};
class GG_ctrlXListbox: GG_ctrlDefaultText
{
	type=42;
	style="0x400 + 0x02 + 0x10";
	color[]={1,1,1,1};
	colorActive[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[]={1,1,1,1};
	colorSelect[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorDisabled[]={1,1,1,0.25};
	colorPicture[]={1,1,1,1};
	cycle=1;
	arrowEmpty="\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
	arrowFull="\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
	border="\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
	soundSelect[]=
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.090000004,
		1
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onLBSelChanged="";
	onLBDblClick="";
};
class GG_ctrlXSliderV: GG_ctrlDefault
{
	type=43;
	style=0;
	color[]={1,1,1,0.60000002};
	colorActive[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	sliderRange[]={0,1};
	sliderPosition=1;
	lineSize=0.1;
	arrowEmpty="\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
	arrowFull="\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
	border="\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
	thumb="\a3\3DEN\Data\Controls\CtrlXSlider\thumb_ca.paa";
	class Title
	{
		idc=-1;
		colorBase[]={1,1,1,1};
		colorActive[]=
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	class Value
	{
		idc=-1;
		format="%.f";
		type="SPTPlain";
		colorBase[]={1,1,1,1};
		colorActive[]=
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onSliderPosChanged="";
};
class GG_ctrlXSliderH: GG_ctrlXSliderV
{
	style=1024;
};
class GG_ctrlMenu: GG_ctrlDefaultText
{
	type=46;
	font="RobotoCondensedLight";
	colorBorder[]={0,0,0,0};
	colorBackground[]={0,0,0,1};
	colorText[]={1,1,1,1};
	colorSelect[]={0,0,0,1};
	colorSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorDisabled[]={1,1,1,0.25};
	colorPicture[]={1,1,1,1};
	colorPictureSelect[]={0,0,0,1};
	colorPictureDisabled[]={1,1,1,0.5};
	arrow="\a3\3DEN\Data\Controls\ctrlMenu\arrow_ca.paa";
	rowHeight=0;
	itemSpacingW=0.0099999998;
	itemSpacingH=0.0099999998;
	pictureCheckboxEnabled="\a3\3DEN\Data\Controls\CtrlMenu\pictureCheckboxEnabled_ca.paa";
	pictureCheckboxDisabled="#(argb,8,8,3)color(0,0,0,0)";
	pictureRadioEnabled="\a3\3DEN\Data\Controls\CtrlMenu\pictureRadioEnabled_ca.paa";
	pictureRadioDisabled="#(argb,8,8,3)color(0,0,0,0)";
};
class GG_ctrlMenuStrip: GG_ctrlMenu
{
	type=47;
	colorStripBackground[]={0,0,0,1};
	colorStripText[]={1,1,1,1};
	colorStripSelect[]={0,0,0,1};
	colorStripSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorStripDisabled[]={1,1,1,0.25};
};
class GG_ctrlObject
{
};
class GG_ctrlObjectContainer: GG_ctrlObject
{
};
class GG_ctrlObjectZoom: GG_ctrlObject
{
};
class GG_ctrlMap: GG_ctrlDefault
{
	type=101;
	style=48;
	x="safezoneXAbs";
	y="safezoneY";
	w="safezoneWAbs";
	h="safezoneH";
	sizeEx=0.050000001;
	font="RobotoCondensedLight";
	colorText[]={0,0,0,1};
	moveOnEdges=1;
	ptsPerSquareSea=5;
	ptsPerSquareTxt=20;
	ptsPerSquareCLn=10;
	ptsPerSquareExp=10;
	ptsPerSquareCost=10;
	ptsPerSquareFor=9;
	ptsPerSquareForEdge=9;
	ptsPerSquareObj=9;
	ptsPerSquareForLod1=4;
	ptsPerSquareForLod2=1;
	ptsPerSquareRoad=6;
	ptsPerSquareMainRoad=6;
	ptsPerSquareRoadSimple=1;
	ptsPerSquareMainRoadSimple=1;
	drawShaded=0.25;
	shadedSea=0.30000001;
	runwayFont="LCD14";
	scaleMin=9.9999997e-005;
	scaleMax=1;
	scaleDefault=0.16;
	maxSatelliteAlpha=0.85000002;
	alphaFadeStartScale=2;
	alphaFadeEndScale=2;
	text="#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[]={0.96899998,0.95700002,0.949,1};
	colorOutside[]={0,0,0,1};
	colorSea[]={0.46700001,0.63099998,0.85100001,0.5};
	colorForest[]={0.62400001,0.77999997,0.38800001,0.5};
	colorForestTextured[]={0.62400001,0.77999997,0.38800001,0.25};
	colorForestBorder[]={0,0,0,0};
	colorRocks[]={0,0,0,0.30000001};
	colorRocksBorder[]={0,0,0,0};
	colorLevels[]={0.28600001,0.177,0.093999997,0.5};
	colorMainCountlines[]={0.57200003,0.354,0.18799999,0.5};
	colorCountlines[]={0.57200003,0.354,0.18799999,0.25};
	colorMainCountlinesWater[]={0.491,0.57700002,0.70200002,0.60000002};
	colorCountlinesWater[]={0.491,0.57700002,0.70200002,0.30000001};
	colorPowerLines[]={0.1,0.1,0.1,1};
	colorRailWay[]={1,0,0,1};
	colorNames[]={0.1,0.1,0.1,0.89999998};
	colorInactive[]={1,1,1,0.5};
	colorTracks[]={0.83999997,0.75999999,0.64999998,0.15000001};
	colorTracksFill[]={0.83999997,0.75999999,0.64999998,1};
	colorRoads[]={0.69999999,0.69999999,0.69999999,1};
	colorRoadsFill[]={1,1,1,1};
	colorMainRoads[]={0.89999998,0.5,0.30000001,1};
	colorMainRoadsFill[]={1,0.60000002,0.40000001,1};
	colorTrails[]={0.83999997,0.75999999,0.64999998,0.15000001};
	colorTrailsFill[]={0.83999997,0.75999999,0.64999998,0.64999998};
	colorGrid[]={0.1,0.1,0.1,0.60000002};
	colorGridMap[]={0.1,0.1,0.1,0.60000002};
	widthRailWay=4;
	fontLabel="RobotoCondensedLight";
	sizeExLabel=0.050000001;
	fontGrid="TahomaB";
	sizeExGrid=0.02;
	fontUnits="TahomaB";
	sizeExUnits=0.050000001;
	fontNames="RobotoCondensed";
	sizeExNames=0.050000001;
	fontInfo="RobotoCondensedLight";
	sizeExInfo=0.050000001;
	fontLevel="TahomaB";
	sizeExLevel=0.02;
	showCountourInterval=1;
	idcMarkerColor=-1;
	idcMarkerIcon=-1;
	textureComboBoxColor="#(argb,8,8,3)color(1,1,1,1)";
	showMarkers="true";
	class LineMarker
	{
		lineWidthThin=0.0080000004;
		lineWidthThick=0.014;
		lineDistanceMin=2.9999999e-005;
		lineLengthMin=5;
	};
	class Legend
	{
		x=0.5;
		y=0.5;
		w=0.40000001;
		h=0.1;
		color[]={0,0,0,1};
		colorBackground[]={1,1,1,0.5};
		font="RobotoCondensedLight";
		sizeEX="3.96 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class Task
	{
		icon="\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		color[]={1,1,1,1};
		iconCreated="\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		colorCreated[]={1,1,0,1};
		iconCanceled="\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		colorCanceled[]={0.69999999,0.69999999,0.69999999,1};
		iconDone="\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		colorDone[]={0.69999999,1,0.30000001,1};
		iconFailed="\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		colorFailed[]={1,0.30000001,0.2,1};
		size=27;
		importance=1;
		coefMin=1;
		coefMax=1;
	};
	class ActiveMarker
	{
		color[]={0,0,0,1};
		size=2;
	};
	class Waypoint
	{
		coefMax=1;
		coefMin=1;
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		importance=1;
		size=24;
	};
	class WaypointCompleted: Waypoint
	{
		icon="\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
	};
	class CustomMark: Waypoint
	{
		icon="\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
	};
	class Command: Waypoint
	{
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size=18;
	};
	class Bush: Waypoint
	{
		coefMax=4;
		coefMin=0.25;
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance=0.0070000002;
		size=7;
	};
	class SmallTree: Bush
	{
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance=0.36000001;
		size=12;
	};
	class Tree: SmallTree
	{
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance=0.72000003;
	};
	class Rock: SmallTree
	{
		color[]={0.1,0.1,0.1,0.80000001};
		icon="\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		importance=0.30000001;
	};
	class BusStop: Bush
	{
		color[]={0.44999999,0.63999999,0.33000001,0.40000001};
		icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
	};
	class FuelStation: Waypoint
	{
		coefMax=1;
		coefMin=0.85000002;
		color[]={1,1,1,1};
		icon="\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
	};
	class Hospital: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
	};
	class Church: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\church_CA.paa";
	};
	class Lighthouse: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
	};
	class Power: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\power_CA.paa";
	};
	class PowerSolar: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
	};
	class PowerWave: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
	};
	class PowerWind: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
	};
	class Quay: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
	};
	class Transmitter: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
	};
	class Watertower: FuelStation
	{
		icon="\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
	};
	class Cross: Waypoint
	{
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
	};
	class Chapel: Cross
	{
		icon="\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
	};
	class Shipwreck: Cross
	{
		icon="\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
	};
	class Bunker: Waypoint
	{
		coefMax=4;
		coefMin=0.25;
		color[]={0,0,0,1};
		icon="\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		importance=1.05;
		size=14;
	};
	class Fortress: Bunker
	{
		icon="\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		importance=1.6;
		size=16;
	};
	class Fountain: Bunker
	{
		icon="\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		importance=0.60000002;
		size=11;
	};
	class Ruin: Waypoint
	{
		coefMax=4;
		coefMin=1;
		icon="\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		importance=0.95999998;
		size=16;
	};
	class Stack: Waypoint
	{
		coefMax=2;
		coefMin=0.40000001;
		icon="\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		importance=1.6;
		size=16;
	};
	class Tourism: Waypoint
	{
		coefMax=4;
		coefMin=0.69999999;
		icon="\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		importance=2.8;
		size=16;
	};
	class ViewTower: Waypoint
	{
		coefMax=4;
		coefMin=0.5;
		icon="\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		importance=2;
		size=16;
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onDraw="";
};
class GG_ctrlMapEmpty: GG_ctrlMap
{
	ptsPerSquareSea=1000;
	ptsPerSquareTxt=1000;
	ptsPerSquareCLn=1000;
	ptsPerSquareExp=1000;
	ptsPerSquareCost=1000;
	ptsPerSquareFor=1000;
	ptsPerSquareForEdge=1000;
	ptsPerSquareRoad=1000;
	ptsPerSquareObj=1000;
	alphaFadeStartScale=0;
	alphaFadeEndScale=0;
	colorBackground[]={1,1,1,1};
	colorOutside[]={1,1,1,1};
	colorSea[]={0,0,0,0};
	colorForest[]={0,0,0,0};
	colorForestBorder[]={0,0,0,0};
	colorRocks[]={0,0,0,0};
	colorRocksBorder[]={0,0,0,0};
	colorLevels[]={0,0,0,0};
	colorMainCountlines[]={0,0,0,0};
	colorCountlines[]={0,0,0,0};
	colorMainCountlinesWater[]={0,0,0,0};
	colorCountlinesWater[]={0,0,0,0};
	colorPowerLines[]={0,0,0,0};
	colorRailWay[]={0,0,0,0};
	colorNames[]={0,0,0,0};
	colorInactive[]={0,0,0,0};
	colorGrid[]={0,0,0,0};
	colorGridMap[]={0,0,0,0};
	class Task: Task
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		iconCreated="#(argb,8,8,3)color(0,0,0,0)";
		iconCanceled="#(argb,8,8,3)color(0,0,0,0)";
		iconDone="#(argb,8,8,3)color(0,0,0,0)";
		iconFailed="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		colorCreated[]={0,0,0,0};
		colorCanceled[]={0,0,0,0};
		colorDone[]={0,0,0,0};
		colorFailed[]={0,0,0,0};
		size=0;
	};
	class Waypoint: Waypoint
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class WaypointCompleted: WaypointCompleted
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class CustomMark: CustomMark
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Command: Command
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Bush: Bush
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Rock: Rock
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class SmallTree: SmallTree
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Tree: Tree
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class busstop: BusStop
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class fuelstation: FuelStation
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class hospital: Hospital
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class church: Church
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class lighthouse: Lighthouse
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class power: Power
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class powersolar: PowerSolar
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class powerwave: PowerWave
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class powerwind: PowerWind
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class quay: Quay
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class shipwreck: Shipwreck
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class transmitter: Transmitter
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class watertower: Watertower
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Bunker: Bunker
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Cross: Cross
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Fortress: Fortress
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Fountain: Fountain
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Chapel: Chapel
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Ruin: Ruin
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Stack: Stack
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class Tourism: Tourism
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
	class ViewTower: ViewTower
	{
		icon="#(argb,8,8,3)color(0,0,0,0)";
		color[]={0,0,0,0};
		size=0;
	};
};
class GG_ctrlMapMain: GG_ctrlMap
{
};
class GG_ctrlListNBox: GG_ctrlDefaultText
{
	type=102;
	style="0x00 + 0x10";
	colorSelectBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorSelectBackground2[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	colorSelect[]={1,1,1,1};
	colorSelect2[]={1,1,1,1};
	colorShadow[]={0,0,0,0.5};
	colorPicture[]={1,1,1,1};
	colorPictureSelected[]={1,1,1,1};
	colorPictureDisabled[]={1,1,1,0.25};
	columns[]={0};
	drawSideArrows=0;
	idcLeft=-1;
	idcRight=-1;
	period=1;
	disableOverflow=0;
	rowHeight="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	maxHistoryDelay=1;
	soundSelect[]=
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.090000004,
		1
	};
	class ListScrollBar: ScrollBar
	{
	};
	onCanDestroy="";
	onDestroy="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onLBSelChanged="";
	onLBDblClick="";
};
class GG_ctrlCheckbox: GG_ctrlDefault
{
	type=77;
	checked=0;
	color[]={1,1,1,0.69999999};
	colorFocused[]={1,1,1,1};
	colorHover[]={1,1,1,1};
	colorPressed[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	colorBackground[]={0,0,0,0};
	colorBackgroundFocused[]={0,0,0,0};
	colorBackgroundHover[]={0,0,0,0};
	colorBackgroundPressed[]={0,0,0,0};
	colorBackgroundDisabled[]={0,0,0,0};
	textureChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	textureFocusedChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureFocusedUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	textureHoverChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureHoverUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	texturePressedChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	texturePressedUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	textureDisabledChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureDisabledUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	soundClick[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.090000004,
		1
	};
	soundEnter[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.090000004,
		1
	};
	soundEscape[]=
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.090000004,
		1
	};
	onCanDestroy="";
	onDestroy="";
	onMouseEnter="";
	onMouseExit="";
	onSetFocus="";
	onKillFocus="";
	onKeyDown="";
	onKeyUp="";
	onMouseButtonDown="";
	onMouseButtonUp="";
	onMouseButtonClick="";
	onMouseButtonDblClick="";
	onMouseZChanged="";
	onMouseMoving="";
	onMouseHolding="";
	onCheckedChanged="";
};
class GG_ctrlCheckboxToolbar: GG_ctrlCheckbox
{
	color[]={1,1,1,1};
	colorBackgroundHover[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
	colorBackgroundPressed[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
		1
	};
};
class GG_ctrlCheckboxBaseline: GG_ctrlCheckbox
{
	textureChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	textureUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
	textureFocusedChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	textureFocusedUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
	textureHoverChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	textureHoverUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
	texturePressedChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	texturePressedUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
	textureDisabledChecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
	textureDisabledUnchecked="\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa";
};
class GG_ctrlControlsGroupHighlight: GG_ctrlControlsGroupNoScrollbars
{
	class Controls
	{
		class TL: GG_ctrlStaticPicture
		{
			idc=313130;
			text="\a3\3DEN\Data\ControlsGroups\Highlight\highlight_TL_ca.paa";
			colorText[]={0,1,1,1};
		};
		class TM: GG_ctrlStaticPicture
		{
			idc=313131;
			text="\a3\3DEN\Data\ControlsGroups\Highlight\highlight_TM_ca.paa";
			colorText[]={0,1,1,1};
		};
		class TR: GG_ctrlStaticPicture
		{
			idc=313132;
			text="\a3\3DEN\Data\ControlsGroups\Highlight\highlight_TR_ca.paa";
			colorText[]={0,1,1,1};
		};
		class ML: GG_ctrlStaticPicture
		{
			idc=313133;
			text="\a3\3DEN\Data\ControlsGroups\Highlight\highlight_ML_ca.paa";
			colorText[]={0,1,1,1};
		};
		class MR: GG_ctrlStaticPicture
		{
			idc=313134;
			text="\a3\3DEN\Data\ControlsGroups\Highlight\highlight_MR_ca.paa";
			colorText[]={0,1,1,1};
		};
		class BL: GG_ctrlStaticPicture
		{
			idc=313135;
			text="\a3\3DEN\Data\ControlsGroups\Highlight\highlight_BL_ca.paa";
			colorText[]={0,1,1,1};
		};
		class BM: GG_ctrlStaticPicture
		{
			idc=313136;
			text="\a3\3DEN\Data\ControlsGroups\Highlight\highlight_BM_ca.paa";
			colorText[]={0,1,1,1};
		};
		class BR: GG_ctrlStaticPicture
		{
			idc=313137;
			text="\a3\3DEN\Data\ControlsGroups\Highlight\highlight_BR_ca.paa";
			colorText[]={0,1,1,1};
		};
	};
};
class GG_ctrlControlsGroupTutorial: GG_ctrlControlsGroupNoScrollbars
{
	w="(	80 + 1) * (pixelW * pixelGrid * 	0.50)";
	h=0;
	class Controls
	{
		class Shadow: GG_ctrlStatic
		{
			idc=323231;
			x="3 * pixelW";
			y="3 * pixelH";
			w="80 * (pixelW * pixelGrid * 	0.50)";
			h="40 * (pixelH * pixelGrid * 	0.50)";
			colorBackground[]={0,0,0,0.75};
		};
		class Background: GG_ctrlStatic
		{
			idc=323232;
			w="80 * (pixelW * pixelGrid * 	0.50)";
			h="40 * (pixelH * pixelGrid * 	0.50)";
			colorBackground[]={1,0.89999998,0.40000001,1};
		};
		class Text: GG_ctrlStructuredText
		{
			idc=323233;
			x="3 * (pixelW * pixelGrid * 	0.50)";
			y="(	3 + 1) * (pixelH * pixelGrid * 	0.50)";
			w="(	80 - 2 * 	3) * (pixelW * pixelGrid * 	0.50)";
			h="20 * (pixelH * pixelGrid * 	0.50)";
			shadow=0;
			class Attributes: Attributes
			{
				color="#000000";
				colorLink="#0000ff";
			};
		};
		class Page: GG_ctrlStatic
		{
			idc=323234;
			style=2;
			y="(40 - 	6 - 1) * (pixelH * pixelGrid * 	0.50)";
			w="80 * (pixelW * pixelGrid * 	0.50)";
			h="6 * (pixelH * pixelGrid * 	0.50)";
			colorText[]={0,0,0,0.2};
			shadow=0;
		};
		class ButtonClose: GG_ctrlActivePicture
		{
			idc=323235;
			x="(	80 - 	3 - 1) * (pixelW * pixelGrid * 	0.50)";
			y="(pixelH * pixelGrid * 	0.50)";
			w="3 * (pixelW * pixelGrid * 	0.50)";
			h="3 * (pixelH * pixelGrid * 	0.50)";
			color[]={0,0,0,1};
			text="\a3\3DEN\Data\ControlsGroups\Tutorial\close_ca.paa";
		};
		class ButtonBack: GG_ctrlActivePicture
		{
			idc=323236;
			x="1 * (pixelW * pixelGrid * 	0.50)";
			y="(40 - 	6 - 1) * (pixelH * pixelGrid * 	0.50)";
			w="6 * (pixelW * pixelGrid * 	0.50)";
			h="6 * (pixelH * pixelGrid * 	0.50)";
			color[]={0,0,0,0.1};
			text="\a3\3DEN\Data\ControlsGroups\Tutorial\back_ca.paa";
		};
		class ButtonNext: ButtonBack
		{
			idc=323237;
			x="(	80 - 	6 - 1) * (pixelW * pixelGrid * 	0.50)";
			y="(40 - 	6 - 1) * (pixelH * pixelGrid * 	0.50)";
			w="6 * (pixelW * pixelGrid * 	0.50)";
			h="6 * (pixelH * pixelGrid * 	0.50)";
			color[]={0,0,0,1};
			text="\a3\3DEN\Data\ControlsGroups\Tutorial\next_ca.paa";
		};
		class ButtonExit: ButtonBack
		{
			idc=323238;
			x="(	80 - 	6 - 1) * (pixelW * pixelGrid * 	0.50)";
			y="(40 - 	6 - 1) * (pixelH * pixelGrid * 	0.50)";
			w="6 * (pixelW * pixelGrid * 	0.50)";
			h="6 * (pixelH * pixelGrid * 	0.50)";
			color[]={0,0,0,1};
			text="\a3\3DEN\Data\ControlsGroups\Tutorial\exit_ca.paa";
		};
	};
};
class ctrlDefault
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
class ctrlMap: ctrlDefault
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
class ctrlMapEmpty: ctrlMap
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
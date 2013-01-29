
#import "DemoScatterChart.h"

#import "IPCGlobal.h"
#import "IPCTitle.h"
#import "IPCLegend.h"
#import "IPCCategoryAxis.h"
#import "IPCValueAxis.h"
#import "IPCRenderLineXY.h"
#import "IPCScatterChart.h"
#import "DTCStroke.h"
#import "DTCIXYDataset.h"
#import "DTCXYSeries.h"
#import "DTCXYSeriesCollection.h"

@interface DemoScatterChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle;

+ (NSMutableArray *) getSubTitles;

+ (void) getLegendWithLegend: (IPCLegend *) aLegend;

+ (void) getDomainAxisWithAxis: (IPCValueAxis *) anAxis;

+ (void) getValueAxisWithAxis: (IPCValueAxis *) anAxis;

+ (void) getRenderWithRender: (IPCRenderLineXY *) aRender;

+ (id <DTCIXYDataset>) getDataset;

@end

@implementation DemoScatterChart

+ (void) processDemoWithContext: (CGContextRef) aContext
{
	CGRect imageArea = CGRectMake(0.0f, 0.0f, 300.0f, 200.0f);
	[DemoScatterChart processDemoWithContext: aContext area: imageArea];
}

+ (void) processDemoWithContext: (CGContextRef) aContext area: (CGRect) anImageArea
{
	IPCScatterChart *pChart = [IPCScatterChart new];
	
	[pChart setOrientation: kIPCOrientationVertical];
	
	[DemoScatterChart getTitleWithTitle: [pChart getTitle]];
	
	NSMutableArray *pSubTitles = [DemoScatterChart getSubTitles];
	[pChart setSubTitles: pSubTitles];
	[pSubTitles release];
	
	[DemoScatterChart getLegendWithLegend: [pChart getLegend]];
	
	[DemoScatterChart getDomainAxisWithAxis: [pChart getDomainAxis]];
	
	[DemoScatterChart getValueAxisWithAxis: [pChart getRangeAxis]];
	
	[DemoScatterChart getRenderWithRender: (IPCRenderLineXY *)[pChart getRender]];
	
	id <DTCIXYDataset> pDataset = [DemoScatterChart getDataset];
	[pChart setDataset: pDataset];
	[(NSObject *) pDataset release];
	
	[pChart drawChartWithContext: aContext area: anImageArea];
	
	[pChart release];
}

@end

@implementation DemoScatterChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle
{
	[aTitle setTitle: (@"Age vs. Weight comparison")];
	[aTitle setTextColor: ([UIColor darkGrayColor])];
	[aTitle setTextFont: ([UIFont fontWithName: @"Arial-BoldItalicMT" size: 12])];
	[aTitle setPlacement: kIPCPlacementTop];
	
	[aTitle setDisplayBorder: FALSE];
	[aTitle setBorderColor: ([UIColor lightGrayColor])];
	[aTitle setBorderSize: 3];
	[aTitle setBackgroundColor: ([UIColor whiteColor])];
}

+ (NSMutableArray *) getSubTitles
{
	NSMutableArray *pSubTitles = [NSMutableArray new];
	
	IPCTitle *pSubTitle1 = [IPCTitle new];
	[pSubTitle1 setTitle: (@"Scatter Sub-Title")];
	[pSubTitle1 setTextColor: ([UIColor darkGrayColor])];
	[pSubTitle1 setTextFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	[pSubTitle1 setPlacement: kIPCPlacementTop];
	
	[pSubTitle1 setDisplayBorder: FALSE];
	[pSubTitle1 setBorderColor: ([UIColor lightGrayColor])];
	[pSubTitle1 setBorderSize: 3];
	[pSubTitle1 setBackgroundColor: ([UIColor whiteColor])];
	
	[pSubTitles addObject: pSubTitle1];
	[pSubTitle1 release];
	
	return pSubTitles;
}

+ (void) getLegendWithLegend: (IPCLegend *) aLegend
{
	[aLegend setTextColor: ([UIColor darkGrayColor])];
	[aLegend setTextFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	[aLegend setPlacement: kIPCPlacementBottom];
	
	[aLegend setDisplayBorder: FALSE];
	[aLegend setBorderColor: ([UIColor lightGrayColor])];
	[aLegend setBorderSize: (3)];
	[aLegend setBackgroundColor: ([UIColor whiteColor])];
}

+ (void) getDomainAxisWithAxis: (IPCValueAxis *) anAxis
{
	[anAxis setTitle: @"Age"];
	[anAxis setTitleColor: ([UIColor darkGrayColor])];
	[anAxis setTitleFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setShowAxisLine: TRUE];
	[anAxis setAxisLineColor: ([UIColor darkGrayColor])];
	[anAxis setShowMajorGridLines: TRUE];;
	[anAxis setMajorGridLineColor: ([UIColor lightGrayColor])];
	[anAxis setShowTickLabels: TRUE];
	[anAxis setShowMajorTickMark: FALSE];
	[anAxis setTickLabelsColor: ([UIColor blackColor])];
	[anAxis setTickLabelsFont: ([UIFont fontWithName: @"ArialMT" size: 8])];

	[anAxis setAutoRange: FALSE];
	[anAxis setUpper: 15.0];
	[anAxis setLower: 0.0];
	
	[anAxis setMajorUnit: 5];
}

+ (void) getValueAxisWithAxis: (IPCValueAxis *) anAxis
{
	[anAxis setTitle: @"Weight"];
	[anAxis setTitleColor: ([UIColor darkGrayColor])];
	[anAxis setTitleFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setShowAxisLine: TRUE];
	[anAxis setAxisLineColor: ([UIColor darkGrayColor])];
	[anAxis setShowMajorGridLines: TRUE];;
	[anAxis setMajorGridLineColor: ([UIColor lightGrayColor])];
	[anAxis setShowTickLabels: TRUE];
	[anAxis setShowMajorTickMark: FALSE];
	[anAxis setTickLabelsColor: ([UIColor blackColor])];
	[anAxis setTickLabelsFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setAxisPlacement: kIPCBOTTOM_OR_LEFT];
	
	[anAxis setAutoRange: FALSE];
	[anAxis setUpper: 15.0];
	[anAxis setLower: 0.0];
	
	[anAxis setMajorUnit: 5];
}

+ (void) getRenderWithRender: (IPCRenderLineXY *) aRender
{
	[aRender setShowDataValues: TRUE];
	[aRender setDataValuesColor: ([UIColor redColor])];
	[aRender setDataValuesFont: ([UIFont fontWithName: @"ArialMT" size: 10])];
	
	[aRender setShowLine: TRUE];
	DTCStroke *pStroke = [[DTCStroke alloc] initWithWidth: 3 endCap: DTC_STROKE_CAP_SQUARE lineJoin: DTC_STROKE_JOIN_BEVEL];
	[aRender setLineStroke: pStroke];
	[pStroke release];
	
	[aRender setShowShapes: TRUE];
	[aRender setShapeFilled: TRUE];
	
//	NumberFormat myFormat = NumberFormat.getInstance();
//	myFormat.setMinimumIntegerDigits(1);
//	render.setDataFormat(myFormat);
	NSNumberFormatter *pFormat = [NSNumberFormatter new];
	[aRender setDataFormat: (pFormat)];
	[pFormat release];
}

+ (id <DTCIXYDataset>) getDataset
{
	DTCXYSeries *series1 = [[DTCXYSeries alloc] initWithKey: (id <DTCIComparable>) @"Age"];
	[series1 addWithXDouble: 8 yDouble: 12];
	[series1 addWithXDouble: 4 yDouble: 5.5];
	[series1 addWithXDouble: 11 yDouble: 14];
	[series1 addWithXDouble: 4 yDouble: 4.5];
	[series1 addWithXDouble: 3 yDouble: 3.5];
	[series1 addWithXDouble: 6.5 yDouble: 7];
	
	DTCXYSeriesCollection *pDataset = [DTCXYSeriesCollection new];
	[pDataset addSeries: (series1)];
	[series1 release];
	
	return pDataset;
}
@end

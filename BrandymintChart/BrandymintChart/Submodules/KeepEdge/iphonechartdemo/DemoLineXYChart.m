
#import "DemoLineXYChart.h"

#import "IPCGlobal.h"
#import "IPCTitle.h"
#import "IPCLegend.h"
#import "IPCCategoryAxis.h"
#import "IPCValueAxis.h"
#import "IPCRenderLineXY.h"
#import "IPCLineXYChart.h"
#import "DTCStroke.h"
#import "DTCIXYDataset.h"
#import "DTCXYSeries.h"
#import "DTCXYSeriesCollection.h"

@interface DemoLineXYChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle;

+ (NSMutableArray *) getSubTitles;

+ (void) getLegendWithLegend: (IPCLegend *) aLegend;

+ (void) getDomainAxisWithAxis: (IPCValueAxis *) anAxis;

+ (void) getValueAxisWithAxis: (IPCValueAxis *) anAxis;

+ (void) getRenderWithRender: (IPCRenderLineXY *) aRender;

+ (id <DTCIXYDataset>) getDataset;

@end

@implementation DemoLineXYChart

+ (void) processDemoWithContext: (CGContextRef) aContext
{
	CGRect imageArea = CGRectMake(0.0f, 0.0f, 300.0f, 200.0f);
	[DemoLineXYChart processDemoWithContext: aContext area: imageArea];
}

+ (void) processDemoWithContext: (CGContextRef) aContext area: (CGRect) anImageArea
{
	IPCLineXYChart *pChart = [IPCLineXYChart new];
	
	[pChart setOrientation: kIPCOrientationVertical];
	
	[DemoLineXYChart getTitleWithTitle: [pChart getTitle]];
	
	NSMutableArray *pSubTitles = [DemoLineXYChart getSubTitles];
	[pChart setSubTitles: pSubTitles];
	[pSubTitles release];
	
	[DemoLineXYChart getLegendWithLegend: [pChart getLegend]];
	
	[DemoLineXYChart getDomainAxisWithAxis: [pChart getDomainAxis]];
	
	[DemoLineXYChart getValueAxisWithAxis: [pChart getRangeAxis]];
	
	[DemoLineXYChart getRenderWithRender: (IPCRenderLineXY *)[pChart getRender]];
	
	id <DTCIXYDataset> pDataset = [DemoLineXYChart getDataset];
	[pChart setDataset: pDataset];
	[(NSObject *) pDataset release];
	
	[pChart drawChartWithContext: aContext area: anImageArea];
	
	[pChart release];
}

@end

@implementation DemoLineXYChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle
{
	[aTitle setTitle: (@"iPhone LineXY Chart Title")];
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
	[pSubTitle1 setTitle: (@"LineXY Sub-Title")];
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
	[anAxis setTitle: @"Category"];
	[anAxis setTitleColor: ([UIColor darkGrayColor])];
	[anAxis setTitleFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setShowAxisLine: TRUE];
	[anAxis setShowMajorGridLines: FALSE];
	[anAxis setShowTickLabels: TRUE];
	[anAxis setShowMajorTickMark: FALSE];
	[anAxis setTickLabelsColor: ([UIColor blackColor])];
	[anAxis setTickLabelsFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setMajorUnit: 2];
	
	[anAxis setAxisPlacement: kIPCBOTTOM_OR_LEFT];
}

+ (void) getValueAxisWithAxis: (IPCValueAxis *) anAxis
{
	[anAxis setTitle: @"Value"];
	[anAxis setTitleColor: ([UIColor darkGrayColor])];
	[anAxis setTitleFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setShowAxisLine: TRUE];
	[anAxis setShowMajorGridLines: FALSE];
	[anAxis setShowTickLabels: TRUE];
	[anAxis setShowMajorTickMark: TRUE];
	[anAxis setTickLabelsColor: ([UIColor blackColor])];
	[anAxis setTickLabelsFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setAutoRange: FALSE];
	[anAxis setUpper: 10.0];
	[anAxis setLower: 0.0];
	
	[anAxis setMajorUnit: 2];
	
	[anAxis setAxisPlacement: kIPCBOTTOM_OR_LEFT];
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
}

+ (id <DTCIXYDataset>) getDataset
{
	DTCXYSeries *series1 = [[DTCXYSeries alloc] initWithKey: (id <DTCIComparable>) @"First"];
	[series1 addWithXDouble: 1.0 yDouble: 1.0];
	[series1 addWithXDouble: 2.0 yDouble: 4.0];
	[series1 addWithXDouble: 3.0 yDouble: 3.0];
	[series1 addWithXDouble: 4.0 yDouble: 5.0];
	[series1 addWithXDouble: 5.0 yDouble: 5.0];
	[series1 addWithXDouble: 6.0 yDouble: 7.0];
	[series1 addWithXDouble: 7.0 yDouble: 7.0];
	[series1 addWithXDouble: 8.0 yDouble: 8.0];
	
	DTCXYSeries *series2 = [[DTCXYSeries alloc] initWithKey: (id <DTCIComparable>) @"Second"];
	[series2 addWithXDouble: 1.0 yDouble: 5.0];
	[series2 addWithXDouble: 2.0 yDouble: 7.0];
	[series2 addWithXDouble: 3.0 yDouble: 6.0];
	[series2 addWithXDouble: 4.0 yDouble: 8.0];
	[series2 addWithXDouble: 5.0 yDouble: 4.0];
	[series2 addWithXDouble: 6.0 yDouble: 4.0];
	[series2 addWithXDouble: 7.0 yDouble: 2.0];
	[series2 addWithXDouble: 8.0 yDouble: 1.0];
	
	DTCXYSeries *series3 = [[DTCXYSeries alloc] initWithKey: (id <DTCIComparable>) @"Third"];
	[series3 addWithXDouble: 3.0 yDouble: 4.0];
	[series3 addWithXDouble: 4.0 yDouble: 3.0];
	[series3 addWithXDouble: 5.0 yDouble: 2.0];
	[series3 addWithXDouble: 6.0 yDouble: 3.0];
	[series3 addWithXDouble: 7.0 yDouble: 6.0];
	[series3 addWithXDouble: 8.0 yDouble: 3.0];
	[series3 addWithXDouble: 9.0 yDouble: 4.0];
	[series3 addWithXDouble: 10.0 yDouble: 3.0];
	
	DTCXYSeriesCollection *pDataset = [DTCXYSeriesCollection new];
	[pDataset addSeries: (series1)];
	[pDataset addSeries: (series2)];
	[pDataset addSeries: (series3)];	
	[series1 release];
	[series2 release];
	[series3 release];
	
	return pDataset;
}

@end


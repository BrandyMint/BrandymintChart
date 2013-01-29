
#import "DemoLineChart.h"

#import "IPCGlobal.h"
#import "IPCTitle.h"
#import "IPCLegend.h"
#import "IPCCategoryAxis.h"
#import "IPCValueAxis.h"
#import "IPCRenderLine.h"
#import "IPCLineChart.h"
#import "DTCStroke.h"
#import "DTCICategoryDataset.h"
#import "DTCDefaultCategoryDataset.h"

@interface DemoLineChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle;

+ (NSMutableArray *) getSubTitles;

+ (void) getLegendWithLegend: (IPCLegend *) aLegend;

+ (void) getCategoryAxisWithAxis: (IPCCategoryAxis *) anAxis;

+ (void) getValueAxisWithAxis: (IPCValueAxis *) anAxis;

+ (void) getRenderWithRender: (IPCRenderLine *) aRender;

+ (id <DTCICategoryDataset>) getDataset;

@end

@implementation DemoLineChart

+ (void) processDemoWithContext: (CGContextRef) aContext
{
	CGRect imageArea = CGRectMake(0.0f, 0.0f, 300.0f, 200.0f);
	[DemoLineChart processDemoWithContext: aContext area: imageArea];
}

+ (void) processDemoWithContext: (CGContextRef) aContext area: (CGRect) anImageArea
{
	IPCLineChart *pChart = [IPCLineChart new];
	
	[pChart setOrientation: kIPCOrientationVertical];
	
	[DemoLineChart getTitleWithTitle: [pChart getTitle]];
	
	NSMutableArray *pSubTitles = [DemoLineChart getSubTitles];
	[pChart setSubTitles: pSubTitles];
	[pSubTitles release];
	
	
	[DemoLineChart getLegendWithLegend: [pChart getLegend]];

	[DemoLineChart getCategoryAxisWithAxis: [pChart getDomainAxis]];
	
	[DemoLineChart getValueAxisWithAxis: [pChart getRangeAxis]];
	
	[DemoLineChart getRenderWithRender: (IPCRenderLine *)[pChart getRender]];
	
	id <DTCICategoryDataset> pDataset = [DemoLineChart getDataset];
	[pChart setDataset: pDataset];
	[(NSObject *) pDataset release];
	
	[pChart drawChartWithContext: aContext area: anImageArea];
	
	[pChart release];
}

@end

@implementation DemoLineChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle
{
	[aTitle setTitle: (@"iPhoen Line Chart Title")];
	[aTitle setDisplay: TRUE];
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
	[pSubTitle1 setTitle: (@"iPhoen Line Chart Sub-Title")];
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
	[aLegend setDisplay: FALSE];
	[aLegend setTextColor: ([UIColor darkGrayColor])];
	[aLegend setTextFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	[aLegend setPlacement: kIPCPlacementBottom];
	
	[aLegend setDisplayBorder: FALSE];
	[aLegend setBorderColor: ([UIColor lightGrayColor])];
	[aLegend setBorderSize: (3)];
	[aLegend setBackgroundColor: ([UIColor whiteColor])];
}

+ (void) getCategoryAxisWithAxis: (IPCCategoryAxis *) anAxis
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
	
	[anAxis setTickLabelOrientationDegrees: 0];
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

+ (void) getRenderWithRender: (IPCRenderLine *) aRender
{
	[aRender setShowDataValues: FALSE];
	[aRender setDataValuesColor: ([UIColor redColor])];
	[aRender setDataValuesFont: ([UIFont fontWithName: @"ArialMT" size: 10])];
	
	[aRender setShowLine: TRUE];
	DTCStroke *pStroke = [[DTCStroke alloc] initWithWidth: 3 endCap: DTC_STROKE_CAP_SQUARE lineJoin: DTC_STROKE_JOIN_BEVEL];
	[aRender setLineStroke: pStroke];
	[pStroke release];
	
	[aRender setShowShapes: TRUE];
	[aRender setShapeFilled: TRUE];	
}

+ (id <DTCICategoryDataset>) getDataset
{
	// row keys...
	NSString *series1 = @"S1";
	NSString *series2 = @"S2";
	NSString *series3 = @"S3";
	// column keys...
	NSString *category1 = @"Monday";
	NSString *category2 = @"Tuesday";
	NSString *category3 = @"Wedesday";
	NSString *category4 = @"Thursday";
	NSString *category5 = @"Friday";
	// create the dataset...
	DTCDefaultCategoryDataset *pDataset = [DTCDefaultCategoryDataset new];
	[pDataset addValueWithDouble: 7.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category1];
	[pDataset addValueWithDouble: 4.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category2];
	[pDataset addValueWithDouble: 6.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category3];
	[pDataset addValueWithDouble: 5.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category4];
	[pDataset addValueWithDouble: 1.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category5];
	[pDataset addValueWithDouble: 5.0 rowKey: (id <DTCIComparable>) series2 columnKey: (id <DTCIComparable>) category1];
	[pDataset addValueWithDouble: 3.0 rowKey: (id <DTCIComparable>) series2 columnKey: (id <DTCIComparable>) category2];
	[pDataset addValueWithDouble: 6.0 rowKey: (id <DTCIComparable>) series2 columnKey: (id <DTCIComparable>) category3];
	[pDataset addValueWithDouble: 7.0 rowKey: (id <DTCIComparable>) series2 columnKey: (id <DTCIComparable>) category4];
	[pDataset addValueWithDouble: 4.0 rowKey: (id <DTCIComparable>) series2 columnKey: (id <DTCIComparable>) category5];
	[pDataset addValueWithDouble: 5.0 rowKey: (id <DTCIComparable>) series3 columnKey: (id <DTCIComparable>) category1];
	[pDataset addValueWithDouble: 3.0 rowKey: (id <DTCIComparable>) series3 columnKey: (id <DTCIComparable>) category2];
	[pDataset addValueWithDouble: 7.0 rowKey: (id <DTCIComparable>) series3 columnKey: (id <DTCIComparable>) category3];
	[pDataset addValueWithDouble: 8.0 rowKey: (id <DTCIComparable>) series3 columnKey: (id <DTCIComparable>) category4];
	[pDataset addValueWithDouble: 6.0 rowKey: (id <DTCIComparable>) series3 columnKey: (id <DTCIComparable>) category5];
	
	return pDataset;
}

@end

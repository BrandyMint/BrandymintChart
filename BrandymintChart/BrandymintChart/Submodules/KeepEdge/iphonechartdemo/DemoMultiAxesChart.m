
#import "DemoMultiAxesChart.h"

#import "IPCGlobal.h"
#import "IPCTitle.h"
#import "IPCLegend.h"
#import "IPCCategoryAxis.h"
#import "IPCValueAxis.h"
#import "IPCRenderBar.h"
#import "IPCCategoryRender.h"
#import "IPCRenderLine.h"
#import "IPCBarChart.h"
#import "DTCICategoryDataset.h"
#import "DTCDefaultCategoryDataset.h"

@interface DemoMultiAxesChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle;

+ (NSMutableArray *) getSubTitles;

+ (void) getLegendWithLegend: (IPCLegend *) aLegend;

+ (void) getCategoryAxisWithAxis: (IPCCategoryAxis *) anAxis;

+ (void) getValueAxisWithAxis: (IPCValueAxis *) anAxis;

+ (IPCValueAxis *) getValueAxis2;

+ (IPCCategoryRender *) getSubRenders;

+ (id <DTCICategoryDataset>) getDataset;

+ (id <DTCICategoryDataset>) getDataset2;

@end

@implementation DemoMultiAxesChart

+ (void) processDemoWithContext: (CGContextRef) aContext
{
	CGRect imageArea = CGRectMake(0.0f, 0.0f, 300.0f, 200.0f);
	[DemoMultiAxesChart processDemoWithContext: aContext area: imageArea];
}

+ (void) processDemoWithContext: (CGContextRef) aContext area: (CGRect) anImageArea
{
	IPCBarChart *pChart = [IPCBarChart new];
	
	[DemoMultiAxesChart getTitleWithTitle: [pChart getTitle]];
	
	NSMutableArray *pSubTitles = [DemoMultiAxesChart getSubTitles];
	[pChart setSubTitles: pSubTitles];
	[pSubTitles release];
	
	[DemoMultiAxesChart getLegendWithLegend: [pChart getLegend]];
	
	[DemoMultiAxesChart getCategoryAxisWithAxis: [pChart getDomainAxis]];
	
	[DemoMultiAxesChart getValueAxisWithAxis: [pChart getRangeAxis]];
	
	IPCValueAxis *pAxis2 = [DemoMultiAxesChart getValueAxis2];
	[pChart addSubValueAxis: pAxis2];
	[pAxis2 release];
	
	id <DTCICategoryDataset> pDataset = [DemoMultiAxesChart getDataset];
	[pChart setDataset: pDataset];
	[(NSObject *) pDataset release];
	
	id <DTCICategoryDataset> pDataset2 = [DemoMultiAxesChart getDataset2];
	[pChart addSubDataset: pDataset2];
	[(NSObject *) pDataset2 release];
	
	IPCCategoryRender *pRender = [DemoMultiAxesChart getSubRenders];
	[pChart addSubRender: pRender];
	[pRender release];
	
	[pChart drawChartWithContext: aContext area: anImageArea];
	
	[pChart release];
}

@end

@implementation DemoMultiAxesChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle
{
	[aTitle setTitle: (@"iPhone Column & Line Chart Demo")];
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
	[pSubTitle1 setTitle: (@"mulit-axis sub-title")];
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
	
	[anAxis setAxisPlacement: kIPCTOP_OR_LEFT];
}

+ (IPCValueAxis *) getValueAxis2
{
	IPCValueAxis *anAxis = [IPCValueAxis new];
	[anAxis setTitle: @"Value2"];
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
	
	[anAxis setAxisPlacement: kIPCBOTTOM_OR_RIGHT];

	return anAxis;
}

+ (IPCCategoryRender *) getSubRenders
{
	return [IPCRenderLine new];
}

+ (id <DTCICategoryDataset>) getDataset
{
	// row keys...
	NSString *series1 = @"S1";
	NSString *series2 = @"S2";
	NSString *series3 = @"S3";
	
	// column keys...
	NSString *category1 = @"Category 1";
	NSString *category2 = @"Category 2";
	NSString *category3 = @"Category 3";
	NSString *category4 = @"Category 4";
	NSString *category5 = @"Category 5";
	
	DTCDefaultCategoryDataset *pDataset = [DTCDefaultCategoryDataset new];
	[pDataset addValueWithDouble: 1.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category1];
	[pDataset addValueWithDouble: 4.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category2];
	[pDataset addValueWithDouble: 3.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category3];
	[pDataset addValueWithDouble: 5.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category4];
	[pDataset addValueWithDouble: 5.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category5];
	[pDataset addValueWithDouble: 5.0 rowKey: (id <DTCIComparable>) series2 columnKey: (id <DTCIComparable>) category1];
	[pDataset addValueWithDouble: 7.0 rowKey: (id <DTCIComparable>) series2 columnKey: (id <DTCIComparable>) category2];
	[pDataset addValueWithDouble: 6.0 rowKey: (id <DTCIComparable>) series2 columnKey: (id <DTCIComparable>) category3];
	[pDataset addValueWithDouble: 8.0 rowKey: (id <DTCIComparable>) series2 columnKey: (id <DTCIComparable>) category4];
	[pDataset addValueWithDouble: 4.0 rowKey: (id <DTCIComparable>) series2 columnKey: (id <DTCIComparable>) category5];
	[pDataset addValueWithDouble: 4.0 rowKey: (id <DTCIComparable>) series3 columnKey: (id <DTCIComparable>) category1];
	[pDataset addValueWithDouble: 3.0 rowKey: (id <DTCIComparable>) series3 columnKey: (id <DTCIComparable>) category2];
	[pDataset addValueWithDouble: 2.0 rowKey: (id <DTCIComparable>) series3 columnKey: (id <DTCIComparable>) category3];
	[pDataset addValueWithDouble: 3.0 rowKey: (id <DTCIComparable>) series3 columnKey: (id <DTCIComparable>) category4];
	[pDataset addValueWithDouble: 6.0 rowKey: (id <DTCIComparable>) series3 columnKey: (id <DTCIComparable>) category5];
	
	return pDataset;
}

+ (id <DTCICategoryDataset>) getDataset2
{
	// row keys...
	NSString *series1 = @"Classes";
	
	// column keys...
	NSString *category1 = @"Category 1";
	NSString *category2 = @"Category 2";
	NSString *category3 = @"Category 3";
	NSString *category4 = @"Category 4";
	NSString *category5 = @"Category 5";
	
	DTCDefaultCategoryDataset *pDataset = [DTCDefaultCategoryDataset new];
	[pDataset addValueWithDouble: 5.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category1];
	[pDataset addValueWithDouble: 7.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category2];
	[pDataset addValueWithDouble: 4.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category3];
	[pDataset addValueWithDouble: 10.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category4];
	[pDataset addValueWithDouble: 6.0 rowKey: (id <DTCIComparable>) series1 columnKey: (id <DTCIComparable>) category5];
	
	return pDataset;
}

@end

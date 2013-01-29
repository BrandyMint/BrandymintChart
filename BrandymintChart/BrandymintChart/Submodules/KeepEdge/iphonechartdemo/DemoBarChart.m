
#import "DemoBarChart.h"

#import "IPCGlobal.h"
#import "IPCTitle.h"
#import "IPCLegend.h"
#import "IPCCategoryAxis.h"
#import "IPCValueAxis.h"
#import "IPCRenderBar.h"
#import "IPCBarChart.h"
#import "DTCICategoryDataset.h"
#import "DTCDefaultCategoryDataset.h"

@interface DemoBarChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle;

+ (NSMutableArray *) getSubTitles;

+ (void) getLegendWithLegend: (IPCLegend *) aLegend;

+ (void) getCategoryAxisWithAxis: (IPCCategoryAxis *) anAxis;

+ (void) getValueAxisWithAxis: (IPCValueAxis *) anAxis;

+ (void) getRenderWithRender: (IPCRenderBar *) aRender;

+ (id <DTCICategoryDataset>) getDataset;

@end

@implementation DemoBarChart

+ (void) processDemoWithContext: (CGContextRef) aContext
{
	CGRect imageArea = CGRectMake(0.0f, 0.0f, 300.0f, 200.0f);
	[DemoBarChart processDemoWithContext: aContext area: imageArea];
}

+ (void) processDemoWithContext: (CGContextRef) aContext area: (CGRect) anImageArea
{
	IPCBarChart *pChart = [IPCBarChart new];
	
	[pChart setOrientation: kIPCOrientationVertical];
	
	[DemoBarChart getTitleWithTitle: [pChart getTitle]];
	
	NSMutableArray *pSubTitles = [DemoBarChart getSubTitles];
	[pChart setSubTitles: pSubTitles];
	[pSubTitles release];
	
	[DemoBarChart getLegendWithLegend: [pChart getLegend]];
	
	[DemoBarChart getCategoryAxisWithAxis: [pChart getDomainAxis]];
	
	[DemoBarChart getValueAxisWithAxis: [pChart getRangeAxis]];
	
	[DemoBarChart getRenderWithRender: (IPCRenderBar *)[pChart getRender]];
	
	id <DTCICategoryDataset> pDataset = [DemoBarChart getDataset];
	[pChart setDataset: pDataset];
	[(NSObject *) pDataset release];
	
	[pChart drawChartWithContext: aContext area: anImageArea];
	
	[pChart release];
}

@end

@implementation DemoBarChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle
{
	[aTitle setTitle: (@"iPhone Bar Chart Title")];
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
	[pSubTitle1 setTitle: (@"Bar Chart Sub-title")];
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
}

+ (void) getRenderWithRender: (IPCRenderBar *) aRender
{
	[aRender setShowDataValues: TRUE];
	[aRender setDataValuesColor: ([UIColor whiteColor])];
	[aRender setDataValuesFont: ([UIFont fontWithName: @"ArialMT" size: 10])];
	
	NSNumberFormatter *pFormat = [NSNumberFormatter new];
//	format.setMaximumFractionDigits(1);
//	format.setMinimumFractionDigits(1);
	[aRender setDataFormat: (pFormat)];
	[pFormat release];
	
	[aRender setBeginMargin: (0.1)];
	[aRender setEndMargin: (0.1)];
	[aRender setCategoryMargin: (0.2)];
	[aRender setItemMargin: (0)];
	
	[aRender setShowShadow: FALSE];
	[aRender setShowBarItemOutline: FALSE];
}

+ (id <DTCICategoryDataset>) getDataset
{
	// row keys...
	NSString *series1 = @"S1";
	NSString *series2 = @"S2";
	NSString *series3 = @"S3";
	
	// column keys...
	NSString *category1 = @"C1";
	NSString *category2 = @"C2";
	NSString *category3 = @"C3";
	NSString *category4 = @"C4";
	NSString *category5 = @"C5";
	
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

@end


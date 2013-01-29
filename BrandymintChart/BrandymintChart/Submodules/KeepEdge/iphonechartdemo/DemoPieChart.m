
#import "DemoPieChart.h"

#import "IPCGlobal.h"
#import "IPCTitle.h"
#import "IPCLegend.h"
#import "IPCRenderPie.h"
#import "IPCPieChart.h"
#import "DTCIPieDataset.h"
#import "DTCDefaultPieDataset.h"

@interface DemoPieChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle;

+ (NSMutableArray *) getSubTitles;

+ (void) getLegendWithLegend: (IPCLegend *) aLegend;

+ (void) getRenderWithRender: (IPCRenderPie *) aRender;

+ (id <DTCIPieDataset>) getDataset;

@end

@implementation DemoPieChart

+ (void) processDemoWithContext: (CGContextRef) aContext
{
	CGRect imageArea = CGRectMake(0.0f, 0.0f, 300.0f, 200.0f);
	[DemoPieChart processDemoWithContext: aContext area: imageArea];
}

+ (void) processDemoWithContext: (CGContextRef) aContext area: (CGRect) anImageArea
{
	IPCPieChart *pChart = [[IPCPieChart alloc] initWith3D: FALSE];
	
	[DemoPieChart getTitleWithTitle: [pChart getTitle]];
	
	NSMutableArray *pSubTitles = [DemoPieChart getSubTitles];
	[pChart setSubTitles: pSubTitles];
	[pSubTitles release];
	
	[DemoPieChart getLegendWithLegend: [pChart getLegend]];
	
	[DemoPieChart getRenderWithRender: [pChart getRender]];
	
	id <DTCIPieDataset> pDataset = [DemoPieChart getDataset];
	[pChart drawChartWithContext: aContext area: anImageArea dataset: pDataset];
	[(NSObject *) pDataset release];
	
	[pChart release];
}

@end

@implementation DemoPieChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle
{
	[aTitle setDisplay: TRUE];
	[aTitle setTitle: (@"Search Engine Market Share")];
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
	[pSubTitle1 setTitle: (@"Glogal Market in July 01, 2010")];
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
	[aLegend setDisplay: TRUE];
	[aLegend setTextColor: ([UIColor darkGrayColor])];
	[aLegend setTextFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	[aLegend setPlacement: kIPCPlacementBottom];
	
	[aLegend setDisplayBorder: FALSE];
	[aLegend setBorderColor: ([UIColor lightGrayColor])];
	[aLegend setBorderSize: (3)];
	[aLegend setBackgroundColor: ([UIColor whiteColor])];
}

+ (void) getRenderWithRender: (IPCRenderPie *) aRender
{
	[aRender setShowShadow: TRUE];
	[aRender setShowSectionsOutline: TRUE];
	
	[aRender setShowDataValues: TRUE];
	[aRender setDataLinkColor: ([UIColor grayColor])];
	[aRender setDataValuesColor: ([UIColor blackColor])];
	[aRender setDataValuesFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[aRender setItemLabelsFormat: (@"{0} - {2}")];
	[aRender setLegendItemLabelsFormat: (@"{0}")];
	
	NSNumberFormatter *pPercentFormat = [NSNumberFormatter new];
	[pPercentFormat setNumberStyle: kCFNumberFormatterPercentStyle];
	[aRender setPercentageFormat: (pPercentFormat)];
	[pPercentFormat release];
}

+ (id <DTCIPieDataset>) getDataset
{
	// create the dataset...
	DTCDefaultPieDataset *pDataset = [DTCDefaultPieDataset new];
	[pDataset setValueWithKey: (id <DTCIComparable>) @"Google" doubleValue: 84.96];
	[pDataset setValueWithKey: (id <DTCIComparable>) @"Yahoo" doubleValue: 6.24];
	[pDataset setValueWithKey: (id <DTCIComparable>) @"Bing/Live" doubleValue: 3.39];
	[pDataset setValueWithKey: (id <DTCIComparable>) @"Baidu" doubleValue: 3.06];
	[pDataset setValueWithKey: (id <DTCIComparable>) @"Others" doubleValue: 2.35];
	return pDataset;
}

@end


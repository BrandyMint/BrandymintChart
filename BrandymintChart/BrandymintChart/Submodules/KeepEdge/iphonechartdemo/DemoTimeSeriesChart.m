
#import "DemoTimeSeriesChart.h"

#import "IPCGlobal.h"
#import "IPCTitle.h"
#import "IPCLegend.h"
#import "IPCTimeAxis.h"
#import "IPCValueAxis.h"
#import "IPCRenderTimeSeries.h"
#import "IPCTimeSeriesChart.h"
#import "DTCStroke.h"
#import "DTCYear.h"
#import "DTCMonth.h"
#import "DTCDay.h"
#import "DTCTimeSeries.h"
#import "DTCTimeSeriesCollection.h"

@interface DemoTimeSeriesChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle;

+ (NSMutableArray *) getSubTitles;

+ (void) getLegendWithLegend: (IPCLegend *) aLegend;

+ (void) getDomainAxisWithAxis: (IPCTimeAxis *) anAxis;

+ (void) getValueAxisWithAxis: (IPCValueAxis *) anAxis;

+ (void) getRenderWithRender: (IPCRenderTimeSeries *) aRender;

+ (DTCTimeSeriesCollection *) getDataset;

@end

@implementation DemoTimeSeriesChart

+ (void) processDemoWithContext: (CGContextRef) aContext
{
	CGRect imageArea = CGRectMake(0.0f, 0.0f, 300.0f, 200.0f);
	[DemoTimeSeriesChart processDemoWithContext: aContext area: imageArea];
}

+ (void) processDemoWithContext: (CGContextRef) aContext area: (CGRect) anImageArea
{
	IPCTimeSeriesChart *pChart = [IPCTimeSeriesChart new];
	
	[DemoTimeSeriesChart getTitleWithTitle: [pChart getTitle]];
	
	NSMutableArray *pSubTitles = [DemoTimeSeriesChart getSubTitles];
	[pChart setSubTitles: pSubTitles];
	[pSubTitles release];
	
	[DemoTimeSeriesChart getLegendWithLegend: [pChart getLegend]];
	
	[DemoTimeSeriesChart getDomainAxisWithAxis: [pChart getTimeDomainAxis]];
	
	[DemoTimeSeriesChart getValueAxisWithAxis: [pChart getRangeAxis]];
	
	[DemoTimeSeriesChart getRenderWithRender: (IPCRenderTimeSeries *)[pChart getRender]];
	
	DTCTimeSeriesCollection *pDataset = [DemoTimeSeriesChart getDataset];
	[pChart drawChartWithContext: aContext area: anImageArea dataset: pDataset];
	[pDataset release];
	
	[pChart release];
}

@end

@implementation DemoTimeSeriesChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle
{
	[aTitle setTitle: (@"Time Series Title")];
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
	[pSubTitle1 setTitle: (@"Time Series Sub-Title")];
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

+ (void) getDomainAxisWithAxis: (IPCTimeAxis *) anAxis
{
	[anAxis setTitle: @"Time"];
	[anAxis setTitleColor: ([UIColor darkGrayColor])];
	[anAxis setTitleFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setShowAxisLine: TRUE];
	[anAxis setShowMajorGridLines: FALSE];
	[anAxis setShowTickLabels: TRUE];
	[anAxis setShowMajorTickMark: FALSE];
	[anAxis setTickLabelsColor: ([UIColor blackColor])];
	[anAxis setTickLabelsFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setTimeFormat: @"yyyy"];
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
	[anAxis setUpper: 100.0];
	[anAxis setLower: -100.0];
	
	[anAxis setMajorUnit: 50];
	
	[anAxis setAxisPlacement: kIPCBOTTOM_OR_LEFT];
}

+ (void) getRenderWithRender: (IPCRenderTimeSeries *) aRender
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

+ (DTCTimeSeriesCollection *) getDataset
{
	DTCTimeSeries *t1 = [[DTCTimeSeries alloc] initWithName: (id <DTCIComparable>) @"Annual"
													 domain: @"Year"
													  range: @"Value"];
	@try {
		DTCYear *pYear = [[DTCYear alloc] initWithYearValue: 1990];
		[t1 addWithPeriod: pYear doubleValue: 50.1];
		[pYear release];		
		pYear = [[DTCYear alloc] initWithYearValue: 1991];
		[t1 addWithPeriod: pYear doubleValue: 12.3];
		[pYear release];
		pYear = [[DTCYear alloc] initWithYearValue: 1992];
		[t1 addWithPeriod: pYear doubleValue: 23.9];
		[pYear release];
		pYear = [[DTCYear alloc] initWithYearValue: 1993];
		[t1 addWithPeriod: pYear doubleValue: 83.4];
		[pYear release];
		pYear = [[DTCYear alloc] initWithYearValue: 1994];
		[t1 addWithPeriod: pYear doubleValue: -34.7];
		[pYear release];
		pYear = [[DTCYear alloc] initWithYearValue: 1995];
		[t1 addWithPeriod: pYear doubleValue: 76.5];
		[pYear release];
		pYear = [[DTCYear alloc] initWithYearValue: 1996];
		[t1 addWithPeriod: pYear doubleValue: 10.0];
		[pYear release];
		pYear = [[DTCYear alloc] initWithYearValue: 1997];
		[t1 addWithPeriod: pYear doubleValue: -14.7];
		[pYear release];
		pYear = [[DTCYear alloc] initWithYearValue: 1998];
		[t1 addWithPeriod: pYear doubleValue: 43.9];
		[pYear release];
		pYear = [[DTCYear alloc] initWithYearValue: 1999];
		[t1 addWithPeriod: pYear doubleValue: 49.6];
		[pYear release];
		pYear = [[DTCYear alloc] initWithYearValue: 2000];
		[t1 addWithPeriod: pYear doubleValue: 37.2];
		[pYear release];
		pYear = [[DTCYear alloc] initWithYearValue: 2001];
		[t1 addWithPeriod: pYear doubleValue: 17.1];
		[pYear release];
	}
	@catch (NSException *e) {
		[NSException raise: [e name] format: @"..."];
	}
	
	DTCTimeSeriesCollection *pDataset = [[DTCTimeSeriesCollection alloc] initWithSeries: t1];
	[t1 release];
	return pDataset;
}

@end

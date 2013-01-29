
#import "DemoHighLowChart.h"

#import "IPCGlobal.h"
#import "IPCTitle.h"
#import "IPCLegend.h"
#import "IPCTimeAxis.h"
#import "IPCValueAxis.h"
#import "IPCRenderHighLow.h"
#import "IPCHighLowChart.h"
#import "DTCStroke.h"
#import "DTCYear.h"
#import "DTCMonth.h"
#import "DTCDay.h"
#import "DTCIOHLCDataset.h"
#import "DTCOHLCSeries.h"
#import "DTCOHLCSeriesCollection.h"

@interface DemoHighLowChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle;

+ (NSMutableArray *) getSubTitles;

+ (void) getLegendWithLegend: (IPCLegend *) aLegend;

+ (void) getDateAxisWithAxis: (IPCTimeAxis *) anAxis;

+ (void) getValueAxisWithAxis: (IPCValueAxis *) anAxis;

+ (void) getRenderWithRender: (IPCRenderHighLow *) aRender;

+ (id <DTCIOHLCDataset>) getDataset;

@end

@implementation DemoHighLowChart

+ (void) processDemoWithContext: (CGContextRef) aContext
{
	CGRect imageArea = CGRectMake(0.0f, 0.0f, 300.0f, 200.0f);
	[DemoHighLowChart processDemoWithContext: aContext area: imageArea];
}

+ (void) processDemoWithContext: (CGContextRef) aContext area: (CGRect) anImageArea
{
	IPCHighLowChart *pChart = [IPCHighLowChart new];
	
	[DemoHighLowChart getTitleWithTitle: [pChart getTitle]];
	
	NSMutableArray *pSubTitles = [DemoHighLowChart getSubTitles];
	[pChart setSubTitles: pSubTitles];
	[pSubTitles release];
	
	[DemoHighLowChart getLegendWithLegend: [pChart getLegend]];

	[DemoHighLowChart getDateAxisWithAxis: [pChart getTimeAxis]];

	[DemoHighLowChart getValueAxisWithAxis: [pChart getRangeAxis]];
	
	[DemoHighLowChart getRenderWithRender: (IPCRenderHighLow *)[pChart getRender]];

	id <DTCIOHLCDataset> pDataset = [DemoHighLowChart getDataset];
	[pChart drawChartWithContext: aContext area: anImageArea dataset: pDataset];
	[(NSObject *) pDataset release];
	
	[pChart release];
}

@end

@implementation DemoHighLowChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle
{
	[aTitle setTitle: (@"Hight Low Stock Chart Demo")];
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
	[pSubTitle1 setTitle: (@"iPhoneChart Price Jun 01-05, 2010")];
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

+ (void) getDateAxisWithAxis: (IPCTimeAxis *) anAxis
{
	[anAxis setTitle: @"Date"];
	[anAxis setTitleColor: ([UIColor darkGrayColor])];
	[anAxis setTitleFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setShowAxisLine: TRUE];
	[anAxis setShowMajorGridLines: FALSE];
	[anAxis setShowTickLabels: TRUE];
	[anAxis setShowMajorTickMark: FALSE];
	[anAxis setTickLabelsColor: ([UIColor blackColor])];
	[anAxis setTickLabelsFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setTimeFormat: @"dd/MM/yy"];
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
	[anAxis setUpper: 60.0];
	[anAxis setLower: 0.0];
	
	[anAxis setMajorUnit: 5];
	
	[anAxis setAxisPlacement: kIPCBOTTOM_OR_LEFT];
}

+ (void) getRenderWithRender: (IPCRenderHighLow *) aRender
{/*
	[aRender setLineColor: ([UIColor darkGrayColor])];
	DTCStroke *pStroke = [[DTCStroke alloc] initWithWidth: 2 endCap: DTC_STROKE_CAP_SQUARE lineJoin: DTC_STROKE_JOIN_BEVEL];
	[aRender setLineStroke: pStroke];
	[pStroke release];
	
	[aRender setDrawOpenTicks: TRUE];
	[aRender setDrawCloseTicks: TRUE];
	[aRender setOpenTickColor: ([UIColor darkGrayColor])];
	[aRender setCloseTickColor: ([UIColor darkGrayColor])];
	[aRender setTickLength: (5.0)];*/
}

+ (id <DTCIOHLCDataset>) getDataset
{
	double high[47];
	double low[47];
	double open[47];
	double close[47];
	double volume[47];
	
	high[0]  = 47.0;
	low[0]   = 33.0;
	open[0]  = 35.0;
	close[0] = 33.0;
	volume[0] = 100.0;
	
	high[1]  = 47.0;
	low[1]   = 32.0;
	open[1]  = 41.0;
	close[1] = 37.0;
	volume[1] = 150.0;
	
	high[2]  = 49.0;
	low[2]   = 43.0;
	open[2]  = 46.0;
	close[2] = 48.0;
	volume[2] = 70.0;
	
	high[3]  = 51.0;
	low[3]   = 39.0;
	open[3]  = 40.0;
	close[3] = 47.0;
	volume[3] = 200.0;
	
	high[4]  = 60.0;
	low[4]   = 40.0;
	open[4]  = 46.0;
	close[4] = 53.0;
	volume[4] = 120.0;
	
	high[5]  = 62.0;
	low[5]   = 55.0;
	open[5]  = 57.0;
	close[5] = 61.0;
	volume[5] = 110.0;
	
	high[6]  = 65.0;
	low[6]   = 56.0;
	open[6]  = 62.0;
	close[6] = 59.0;
	volume[6] = 70.0;
	
	high[7]  = 55.0;
	low[7]   = 43.0;
	open[7]  = 45.0;
	close[7] = 47.0;
	volume[7] = 20.0;
	
	high[8]  = 54.0;
	low[8]   = 33.0;
	open[8]  = 40.0;
	close[8] = 51.0;
	volume[8] = 30.0;
	
	high[9]  = 47.0;
	low[9]   = 33.0;
	open[9]  = 35.0;
	close[9] = 33.0;
	volume[9] = 100.0;
	
	high[10]  = 54.0;
	low[10]   = 38.0;
	open[10]  = 43.0;
	close[10] = 52.0;
	volume[10] = 50.0;
	
	high[11]  = 48.0;
	low[11]   = 41.0;
	open[11]  = 44.0;
	close[11] = 41.0;
	volume[11] = 80.0;
	
	high[12]  = 60.0;
	low[12]   = 30.0;
	open[12]  = 34.0;
	close[12] = 44.0;
	volume[12] = 90.0;
	
	high[13]  = 58.0;
	low[13]   = 44.0;
	open[13]  = 54.0;
	close[13] = 56.0;
	volume[13] = 20.0;
	
	high[14]  = 54.0;
	low[14]   = 32.0;
	open[14]  = 42.0;
	close[14] = 53.0;
	volume[14] = 70.0;
	
	high[15]  = 53.0;
	low[15]   = 39.0;
	open[15]  = 50.0;
	close[15] = 49.0;
	volume[15] = 60.0;
	
	high[16]  = 47.0;
	low[16]   = 33.0;
	open[16]  = 41.0;
	close[16] = 40.0;
	volume[16] = 30.0;
	
	high[17]  = 55.0;
	low[17]   = 37.0;
	open[17]  = 43.0;
	close[17] = 45.0;
	volume[17] = 90.0;
	
	high[18]  = 54.0;
	low[18]   = 42.0;
	open[18]  = 50.0;
	close[18] = 42.0;
	volume[18] = 150.0;
	
	high[19]  = 48.0;
	low[19]   = 37.0;
	open[19]  = 37.0;
	close[19] = 47.0;
	volume[19] = 120.0;
	
	high[20]  = 58.0;
	low[20]   = 33.0;
	open[20]  = 39.0;
	close[20] = 41.0;
	volume[20] = 80.0;

	DTCOHLCSeries *s1 = [[DTCOHLCSeries alloc] initWithKey: (id <DTCIComparable>) @"Series 1"];
	
	DTCDay *pDay = [[DTCDay alloc] initWithDayValue: 18 monthValue: 1 yearValue: 2001];
	int idx = 0;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 19 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 20 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 21 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 22 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 23 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 24 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 25 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 26 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 27 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 28 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 29 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 30 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 31 monthValue: 1 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 1 monthValue: 2 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 2 monthValue: 2 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 3 monthValue: 2 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 4 monthValue: 2 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 5 monthValue: 2 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 6 monthValue: 2 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	pDay = [[DTCDay alloc] initWithDayValue: 7 monthValue: 2 yearValue: 2001];
	idx++;
	[s1 addWithPeriod: pDay open: open[idx] high: high[idx] low: low[idx] close: close[idx]];
	[pDay release];
	
	DTCOHLCSeriesCollection *pDataset = [DTCOHLCSeriesCollection new];
	[pDataset addSeriesWithOHLCSeries: s1];
	[s1 release];
	
	return pDataset;
}

@end

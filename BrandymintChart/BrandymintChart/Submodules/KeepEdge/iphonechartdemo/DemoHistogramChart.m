
#import "DemoHistogramChart.h"

#import "IPCGlobal.h"
#import "IPCTitle.h"
#import "IPCLegend.h"
#import "IPCCategoryAxis.h"
#import "IPCValueAxis.h"
#import "IPCRenderHistogram.h"
#import "IPCHistogramChart.h"
#import "DTCHistogramDataset.h"

@interface DemoHistogramChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle;

+ (NSMutableArray *) getSubTitles;

+ (void) getLegendWithLegend: (IPCLegend *) aLegend;

+ (void) getDomainAxisWithAxis: (IPCValueAxis *) anAxis;

+ (void) getValueAxisWithAxis: (IPCValueAxis *) anAxis;

+ (void) getRenderWithRender: (IPCRenderHistogram *) aRender;

+ (DTCHistogramDataset *) getDataset;

+ (NSMutableArray *) gaussianDataWithSize: (int) aSize shift: (double) aShift;

@end

@implementation DemoHistogramChart

//static Random random = new Random();

+ (void) processDemoWithContext: (CGContextRef) aContext
{
	CGRect imageArea = CGRectMake(0.0f, 0.0f, 300.0f, 200.0f);
	[DemoHistogramChart processDemoWithContext: aContext area: imageArea];
}

+ (void) processDemoWithContext: (CGContextRef) aContext area: (CGRect) anImageArea
{
	IPCHistogramChart *pChart = [IPCHistogramChart new];
	
	[pChart setOrientation: kIPCOrientationVertical];
	
	[DemoHistogramChart getTitleWithTitle: [pChart getTitle]];
	
	NSMutableArray *pSubTitles = [DemoHistogramChart getSubTitles];
	[pChart setSubTitles: pSubTitles];
	[pSubTitles release];
	
	[DemoHistogramChart getLegendWithLegend: [pChart getLegend]];
	
	[DemoHistogramChart getDomainAxisWithAxis: [pChart getDomainAxis]];
	
	[DemoHistogramChart getValueAxisWithAxis: [pChart getRangeAxis]];
	
	[DemoHistogramChart getRenderWithRender: (IPCRenderHistogram *)[pChart getRender]];
	
	DTCHistogramDataset *pDataset = [DemoHistogramChart getDataset];
	[pChart drawChartWithContext: aContext area: anImageArea dataset: pDataset];
	[pDataset release];
	
	[pChart release];
}

@end

@implementation DemoHistogramChart (Private)

+ (void) getTitleWithTitle: (IPCTitle *) aTitle
{
	[aTitle setTitle: (@"Histogram Chart Title")];
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
	[pSubTitle1 setTitle: (@"Histogram Chart Sub-Title")];
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
	[anAxis setTitle: @"Bins"];
	[anAxis setTitleColor: ([UIColor darkGrayColor])];
	[anAxis setTitleFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setShowAxisLine: TRUE];
	[anAxis setShowMajorGridLines: FALSE];
	[anAxis setShowTickLabels: TRUE];
	[anAxis setShowMajorTickMark: FALSE];
	[anAxis setTickLabelsColor: ([UIColor blackColor])];
	[anAxis setTickLabelsFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setAutoRange: FALSE];
	[anAxis setUpper: 10.0];
	[anAxis setLower: 0.0];
	
	[anAxis setMajorUnit: 2];
	
	[anAxis setAxisPlacement: kIPCBOTTOM_OR_LEFT];
}

+ (void) getValueAxisWithAxis: (IPCValueAxis *) anAxis
{
	[anAxis setTitle: @"Frequency"];
	
	[anAxis setTitleColor: ([UIColor darkGrayColor])];
	[anAxis setTitleFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setShowAxisLine: TRUE];
	[anAxis setShowMajorGridLines: FALSE];
	[anAxis setShowTickLabels: TRUE];
	[anAxis setShowMajorTickMark: TRUE];
	[anAxis setTickLabelsColor: ([UIColor blackColor])];
	[anAxis setTickLabelsFont: ([UIFont fontWithName: @"ArialMT" size: 8])];
	
	[anAxis setAutoRange: FALSE];
	[anAxis setUpper: 30.0];
	[anAxis setLower: 0.0];
	
	[anAxis setMajorUnit: 2];
	
	[anAxis setAxisPlacement: kIPCBOTTOM_OR_LEFT];
}

+ (void) getRenderWithRender: (IPCRenderHistogram *) aRender
{
	[aRender setItemMargin: (0.4)];
}

+ (DTCHistogramDataset *) getDataset
{	
	// create the dataset...
	DTCHistogramDataset *pDataset = [DTCHistogramDataset new];
	
	NSMutableArray *pData1 = [DemoHistogramChart gaussianDataWithSize: 10 shift: 2.0];
	NSMutableArray *pData2 = [DemoHistogramChart gaussianDataWithSize: 10 shift: 0.0];
	
	[pDataset addSeriesWithKey: (id <DTCIComparable>) @"S1" values: pData1 bins: 3];
	[pDataset addSeriesWithKey: (id <DTCIComparable>) @"S2" values: pData2 bins: 2];
	
	[pData1 removeAllObjects];
	[pData2 removeAllObjects];
	[pData1 release];
	[pData2 release];
	
	return pDataset;
}

+ (NSMutableArray *) gaussianDataWithSize: (int) aSize shift: (double) aShift
{
	NSMutableArray *pResult = [NSMutableArray new];
	for (int idx = 0; idx < aSize; idx++)
	{
		double val = (int)(idx / 2)  + aShift;// / (double) random();
		//d[i] = random.nextGaussian() + shift;
		
		NSNumber *pVal = [[NSNumber alloc] initWithDouble: val];
		[pResult addObject: pVal];
		[pVal release];
	}
	return pResult;
}

@end

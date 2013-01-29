
#import <Foundation/Foundation.h>

#import "IPCAbstractXYChart.h"
#import "IPCTimeAxis.h"
#import "IPCValueAxis.h"
#import "DTCSegmentedTimeline.h"
#import "DTCIOHLCDataset.h"

@interface IPCHighLowChart : IPCAbstractXYChart {
@private
	IPCTimeAxis *timeAxis;
//	IPCValueAxis *rangeAxis;
	DTCSegmentedTimeline *timeline;
}

- (IPCTimeAxis *) getTimeAxis;
- (void) setTimeAxis: (IPCTimeAxis *) aTimeAxis;

//- (IPCValueAxis *) getRangeAxis;
//- (void) setRangeAxis: (IPCValueAxis *) aRangeAxis;

- (DTCSegmentedTimeline *) getTimeline;
- (void) setTimeline: (DTCSegmentedTimeline *) aTimeline;

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea dataset: (id <DTCIOHLCDataset>) aDataset;

//	inner methods
- (void) updateChartProperties;
- (void) applyRenderSettingsWithRender: (NSObject *) aRender;

@end

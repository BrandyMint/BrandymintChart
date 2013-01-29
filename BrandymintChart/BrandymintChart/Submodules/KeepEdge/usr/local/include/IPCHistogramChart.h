
#import <Foundation/Foundation.h>

#import "IPCAbstractXYChart.h"
#import "IPCValueAxis.h"
#import "DTCHistogramDataset.h"

@interface IPCHistogramChart : IPCAbstractXYChart {
//@private
//	IPCValueAxis *domainAxis;
//	IPCValueAxis *rangeAxis;
}

//- (IPCValueAxis *) getDomainAxis;
//- (void) setDomainAxis: (IPCValueAxis *) aDomainAxis;

//- (IPCValueAxis *) getRangeAxis;
//- (void) setRangeAxis: (IPCValueAxis *) aRangeAxis;

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea dataset: (DTCHistogramDataset *) aDataset;

//	inner methods
- (void) updateChartProperties;
- (void) applyRenderSettingsWithPlot: (NSObject *) aPlot;

@end

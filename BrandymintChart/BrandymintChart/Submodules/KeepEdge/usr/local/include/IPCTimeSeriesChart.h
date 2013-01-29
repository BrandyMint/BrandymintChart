
#import <Foundation/Foundation.h>

#import "IPCAbstractXYChart.h"
#import "IPCTimeAxis.h"
#import "DTCTimeSeriesCollection.h"

@interface IPCTimeSeriesChart : IPCAbstractXYChart {
@private
	IPCTimeAxis *timeDomainAxis;
}

- (IPCTimeAxis *) getTimeDomainAxis;
- (void) setTimeDomainAxis: (IPCTimeAxis *) aTimeDomainAxis;

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea dataset: (DTCTimeSeriesCollection *) aDataset;

//	inner methods
- (void) updateChartProperties;

@end

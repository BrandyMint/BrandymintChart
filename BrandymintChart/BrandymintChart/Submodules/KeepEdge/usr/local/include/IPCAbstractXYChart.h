
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IPCAbstractChart.h"
#import "IPCValueAxis.h"
#import "IPCTimeAxis.h"
#import "IPCXYRender.h"
#import "DTCIXYDataset.h"

@interface IPCAbstractXYChart : IPCAbstractChart {
@private
	IPCValueAxis *domainAxis;
	
	IPCValueAxis *rangeAxis;
	NSMutableArray *subRangeAxes;	//	IPCValueAxis array
	
	id <DTCIXYDataset> dataset;
	NSMutableArray *subDatasets;
	
	IPCXYRender *render;
	NSMutableArray *subRenders;
}

- (IPCValueAxis *) getDomainAxis;
- (void) setDomainAxis: (IPCValueAxis *) aDomainAxis;

- (IPCValueAxis *) getRangeAxis;
- (void) setRangeAxis: (IPCValueAxis *) aRangeAxis;

- (NSMutableArray *) getSubRangeAxes;
- (void) setSubRangeAxes: (NSMutableArray *) aSubRangeAxes;

- (id <DTCIXYDataset>) getDataset;
- (void) setDataset: (id <DTCIXYDataset>) aDataset;

- (NSMutableArray *) getSubDatasets;
- (void) setSubDatasets: (NSMutableArray *) aSubDatasets;

- (IPCXYRender *) getRender;
- (void) setRender: (IPCXYRender *) aRender;

- (NSMutableArray *) getSubRenders;
- (void) setSubRenders: (NSMutableArray *) aSubRenders;

//	inner methods
- (void) updateChartProperties;
- (void) applyDomainAxisSettingsWithValueAxis: (IPCValueAxis *) aValueAxis
										 plot: (NSObject *) aPlot
							   innerRangeAxis: (NSObject *) innerRangeAxis;
- (void) applyValueAxisSettingsWithValueAxis: (IPCValueAxis *) aValueAxis
										plot: (NSObject *) aPlot
							  innerRangeAxis: (NSObject *) innerRangeAxis;
- (void) applyValueAxisSettingsWithValueAxis: (IPCValueAxis *) aValueAxis
										plot: (NSObject *) aPlot
							  innerRangeAxis: (NSObject *) innerRangeAxis
									seriesId: (int) aSeriesId;
- (NSObject *) getValueAxisWithValueAxis: (IPCValueAxis *) aValueAxis
									plot: (NSObject *) aPlot
								seriesId: (int) aSeriesId;
- (void) applyTimeSeriesAxisSettingsWithTimeAxis: (IPCTimeAxis *) aTimeAxis
											plot: (NSObject *) aPlot
								   innerDateAxis: (NSObject *) innerDateAxis;
- (void) applyRenderSettingsWithRender: (NSObject *) aRender plot: (NSObject *) aPlot;

@end

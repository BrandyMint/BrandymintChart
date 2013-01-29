
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IPCAbstractChart.h"
#import "IPCCategoryAxis.h"
#import "IPCValueAxis.h"
#import "IPCCategoryRender.h"
#import "DTCICategoryDataset.h"

@interface IPCAbstractCategoryChart : IPCAbstractChart {
@private
	IPCCategoryAxis *domainAxis;
	
	IPCValueAxis *rangeAxis;
	NSMutableArray *subRangeAxes;	//	IPCValueAxis array
	
	id <DTCICategoryDataset> dataset;
	NSMutableArray *subDatasets;
	
	IPCCategoryRender *render;
	NSMutableArray *subRenders;
}

- (IPCCategoryAxis *) getDomainAxis;
- (void) setDomainAxis: (IPCCategoryAxis *) aDomainAxis;

- (IPCValueAxis *) getRangeAxis;
- (void) setRangeAxis: (IPCValueAxis *) aRangeAxis;

- (NSMutableArray *) getSubRangeAxes;
- (void) setSubRangeAxes: (NSMutableArray *) aSubRangeAxes;
- (void) addSubValueAxis: (IPCValueAxis *) aValueAxis;

- (id <DTCICategoryDataset>) getDataset;
- (void) setDataset: (id <DTCICategoryDataset>) aDataset;

- (NSMutableArray *) getSubDatasets;
- (void) setSubDatasets: (NSMutableArray *) aSubDatasets;
- (void) addSubDataset: (id <DTCICategoryDataset>) aDataset;

- (IPCCategoryRender *) getRender;
- (void) setRender: (IPCCategoryRender *) aRender;

- (NSMutableArray *) getSubRenders;
- (void) setSubRenders: (NSMutableArray *) aSubRenders;
- (void) addSubRender: (IPCCategoryRender *) aRender;

//	inner methods
- (void) updateChartProperties;
- (void) applyRenderSettingsWithRender: (id) aRenderer plot: (id) aPlot;

@end

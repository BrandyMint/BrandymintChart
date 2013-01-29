
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "IPCAbstractChart.h"
#import "IPCRenderPie.h"
#import "DTCIPieDataset.h"

@interface IPCPieChart : IPCAbstractChart {
@private
	BOOL is3d;
	IPCRenderPie *render;
}

- (id) initWith3D: (BOOL) is3D;

- (IPCRenderPie *) getRender;
- (void) setRender: (IPCRenderPie *) aRender;

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea dataset: (id <DTCIPieDataset>) aDataset;

//	inner methods
- (void) updateChartProperties;
- (void) applyRenderSettingsWithPlot: (NSObject *) aPlot;

@end


#import <Foundation/Foundation.h>

#import "IPCLineXYChart.h"

@interface IPCScatterChart : IPCLineXYChart {
}

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea;

//	inner methods
- (void) applyRenderSettingsWithRender: (NSObject *) aRender plot: (NSObject *) aPlot;

@end

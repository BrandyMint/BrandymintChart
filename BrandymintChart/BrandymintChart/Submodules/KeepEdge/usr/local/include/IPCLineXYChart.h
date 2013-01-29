
#import <Foundation/Foundation.h>

#import "IPCAbstractXYChart.h"

@interface IPCLineXYChart : IPCAbstractXYChart {
}

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea;

//	inner methods
- (void) applyRenderSettingsWithRender: (NSObject *) aRender plot: (NSObject *) aPlot;

@end

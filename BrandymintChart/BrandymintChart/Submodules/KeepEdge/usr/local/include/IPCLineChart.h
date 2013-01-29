
#import <Foundation/Foundation.h>

#import "IPCAbstractCategoryChart.h"

@interface IPCLineChart : IPCAbstractCategoryChart {
}

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea;

//	inner methods
- (void) applyRenderSettingsWithRender: (id) aRenderer plot: (id) aPlot;

@end

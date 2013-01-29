
#import <Foundation/Foundation.h>

#import "IPCAbstractBarChart.h"

@interface IPCBarStackedPercentageChart : IPCAbstractBarChart {
}

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea;

@end

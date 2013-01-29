
#import <Foundation/Foundation.h>

#import "IPCAbstractBarChart.h"

@interface IPCBarStackedChart : IPCAbstractBarChart {
}

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea;

@end

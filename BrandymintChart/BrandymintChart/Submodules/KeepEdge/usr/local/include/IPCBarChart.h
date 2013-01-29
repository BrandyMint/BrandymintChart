
#import <Foundation/Foundation.h>

#import "IPCAbstractBarChart.h"

@interface IPCBarChart : IPCAbstractBarChart {
}

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea;

@end

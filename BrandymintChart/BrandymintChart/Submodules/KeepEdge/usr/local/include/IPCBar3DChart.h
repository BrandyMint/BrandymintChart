
#import <Foundation/Foundation.h>

#import "IPCAbstractBarChart.h"

@interface IPCBar3DChart : IPCAbstractBarChart {
}

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea;

@end

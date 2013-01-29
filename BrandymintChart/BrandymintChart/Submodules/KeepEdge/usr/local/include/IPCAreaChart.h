
#import <Foundation/Foundation.h>

#import "IPCAbstractCategoryChart.h"

@interface IPCAreaChart : IPCAbstractCategoryChart {
}

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea;

@end


#import <Foundation/Foundation.h>

#import "IPCAbstractCategoryChart.h"

@interface IPCAreaStackedChart : IPCAbstractCategoryChart {
}

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea;

@end

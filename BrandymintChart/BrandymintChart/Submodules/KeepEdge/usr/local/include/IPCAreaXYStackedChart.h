
#import <Foundation/Foundation.h>

#import "IPCAbstractXYChart.h"
#import "DTCITableXYDataset.h"

@interface IPCAreaXYStackedChart : IPCAbstractXYChart {
}

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea dataset: (id <DTCITableXYDataset>) aDataset;

@end

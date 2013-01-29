
#import <Foundation/Foundation.h>

#import "IPCAbstractXYChart.h"
#import "DTCIXYDataset.h"
 
@interface IPCAreaXYChart : IPCAbstractXYChart {
}

- (void) drawChartWithContext: (CGContextRef) aContext area: (CGRect) anArea dataset: (id <DTCIXYDataset>) aDataset;

@end

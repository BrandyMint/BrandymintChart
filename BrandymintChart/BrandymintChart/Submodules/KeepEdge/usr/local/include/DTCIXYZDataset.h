
#import <Foundation/Foundation.h>

#import "DTCIXYDataset.h"

@protocol DTCIXYZDataset <DTCIXYDataset>

- (NSNumber *) getZWithSeries: (int) aSeries item: (int) anItem;

- (double) getZValueWithSeries: (int) aSeries item: (int) anItem;

@end



#import <Foundation/Foundation.h>

#import "DTCIXYDataset.h"

@protocol DTCIOHLCDataset <DTCIXYDataset>

- (NSNumber *) getHighWithSeries: (int) aSeries item: (int) anItem;

- (double) getHighValueWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getLowWithSeries: (int) aSeries item: (int) anItem;

- (double) getLowValueWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getOpenWithSeries: (int) aSeries item: (int) anItem;

- (double) getOpenValueWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getCloseWithSeries: (int) aSeries item: (int) anItem;

- (double) getCloseValueWithSeries: (int) aSeries item: (int) anItem;

- (NSNumber *) getVolumeWithSeries: (int) aSeries item: (int) anItem;

- (double) getVolumeValueWithSeries: (int) aSeries item: (int) anItem;

@end



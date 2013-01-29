
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCIDataset.h"

@protocol DTCISeriesDataset <DTCIDataset>

- (int) getSeriesCount;

- (id <DTCIComparable>) getSeriesKeyWithSeries: (int) aSeries;

- (int) indexOf: (id <DTCIComparable>) aSeriesKey;

@end

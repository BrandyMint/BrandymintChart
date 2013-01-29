
#import <Foundation/Foundation.h>

#import "DTCICategoryDataset.h"

@protocol DTCIIntervalCategoryDataset <DTCICategoryDataset>

- (NSNumber *) getStartValueWithSeries: (int) aSeries category: (int) aCategory;

- (NSNumber *) getStartValueWithSeriesKey: (id <DTCIComparable>) aSeries categoryKey: (id <DTCIComparable>) aCategory;

- (NSNumber *) getEndValueWithSeries: (int) aSeries category: (int) aCategory;

- (NSNumber *) getEndValueWithSeriesKey: (id <DTCIComparable>) aSeries categoryKey: (id <DTCIComparable>) aCategory;

@end


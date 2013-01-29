
#import <Foundation/Foundation.h>

#import "DTCIXYDataset.h"

@protocol DTCIIntervalXYDataset <DTCIXYDataset>

/*
 *	Returns the starting X value for the specified series and item.
 */
- (NSNumber *) getStartXWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the start x-value (as a double primitive) for an item within a series.
 */
- (double) getStartXValueWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the ending X value for the specified series and item.
 */
- (NSNumber *) getEndXWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the end x-value (as a double primitive) for an item within a series.
 */
- (double) getEndXValueWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the starting Y value for the specified series and item.
 */
- (NSNumber *) getStartYWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the start y-value (as a double primitive) for an item within a series.
 */
- (double) getStartYValueWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the ending Y value for the specified series and item.
 */
- (NSNumber *) getEndYWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the end y-value (as a double primitive) for an item within a series.
 */
- (double) getEndYValueWithSeries: (int) aSeries item: (int) anItem;

@end


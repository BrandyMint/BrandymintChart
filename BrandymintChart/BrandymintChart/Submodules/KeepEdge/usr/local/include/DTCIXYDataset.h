
#import <Foundation/Foundation.h>

#import "DTCISeriesDataset.h"

@class DTCDomainOrder;

@protocol DTCIXYDataset <DTCISeriesDataset>

/*
 *	Returns the order of the domain (or X) values returned by the dataset.
 */
- (DTCDomainOrder *) getDomainOrder;

/*
 *	Returns the number of items in a series.
 *	It is recommended that classes that implement this method should throw an IllegalArgumentException if the
 *	series argument is outside the specified range.
 */
- (int) getItemCountWithSeries: (int) aSeries;

/*
 *	Returns the x-value for an item within a series. The x-values may or may not be returned in ascending order,
 *	that is up to the class implementing the interface.
 */
- (NSNumber *) getXWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the x-value for an item within a series.
 */
- (double) getXValueWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the y-value for an item within a series.
 */
- (NSNumber *) getYWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the y-value (as a double primitive) for an item within a series.
 */
- (double) getYValueWithSeries: (int) aSeries item: (int) anItem;

@end


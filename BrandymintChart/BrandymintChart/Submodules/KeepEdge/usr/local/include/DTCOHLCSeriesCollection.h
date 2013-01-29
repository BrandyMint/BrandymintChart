
#import <Foundation/Foundation.h>

#import "DTCIOHLCDataset.h"
#import "DTCAbstractXYDataset.h"
#import "DTCTimePeriodAnchor.h"
#import "DTCRegularTimePeriod.h"
#import "DTCOHLCSeries.h"

@interface DTCOHLCSeriesCollection : DTCAbstractXYDataset <DTCIOHLCDataset> {
@private
	NSMutableArray *data;
	DTCTimePeriodAnchor *xPosition;
}

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (DTCTimePeriodAnchor *) getXPosition;
- (void) setXPosition: (DTCTimePeriodAnchor *) anAnchor;

- (void) addSeriesWithOHLCSeries: (DTCOHLCSeries *) aSeries;

- (int) getSeriesCount;

- (DTCOHLCSeries *) getSeriesWithSeries: (int) aSeries;

- (id <DTCIComparable>) getSeriesKeyWithSeries: (int) aSeries;

/*
 *	Returns the number of items in the specified series.
 */
//	Implementation of protocol DTCIXYDataset
- (int) getItemCountWithSeries: (int) aSeries;

/*
 *	Returns the x-value for a time period.
 */
- (double) getXWithPeriod: (DTCRegularTimePeriod *) aPeriod;

/*
 *	Returns the x-value for an item within a series.
 */
//	Implementation of protocol DTCIXYDataset
- (double) getXValueWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the x-value for an item within a series.
 */
//	Implementation of protocol DTCIXYDataset
- (NSNumber *) getXWithSeries: (int) aSeries item: (int) anItem;

/*
 *	Returns the y-value for an item within a series.
 */
//	Implementation of protocol DTCIXYDataset
- (NSNumber *) getYWithSeries: (int) aSeries item: (int) anItem;

@end

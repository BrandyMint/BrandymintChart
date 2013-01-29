
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCComparableObjectSeries.h"
#import "DTCRegularTimePeriod.h"

@interface DTCOHLCSeries : DTCComparableObjectSeries {
}

- (id) initWithKey: (id <DTCIComparable>) aKey;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (DTCRegularTimePeriod *) getPeriodWithIndex: (int) anIndex;

- (DTCComparableObjectItem *) getDataItemWithIndex: (int) anIndex;

/*
 *	Adds a data item to the series.
 */
- (void) addWithPeriod: (DTCRegularTimePeriod *) aPeriod
				  open: (double) anOpen
				  high: (double) aHigh
				   low: (double) aLow
				 close: (double) aClose;

@end

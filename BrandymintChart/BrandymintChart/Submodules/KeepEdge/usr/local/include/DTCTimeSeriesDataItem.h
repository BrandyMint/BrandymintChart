
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCRegularTimePeriod.h"

@interface DTCTimeSeriesDataItem : NSObject <DTCIComparable, NSCopying> {
@private
	//	The time period
	DTCRegularTimePeriod *period;
	//	The value associated with the time period
	NSNumber *value;
}

- (id) initWithPeriod: (DTCRegularTimePeriod *) aPeriod doubleValue: (double) aValue;

- (id) initWithPeriod: (DTCRegularTimePeriod *) aPeriod value: (NSNumber *) aValue;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (DTCRegularTimePeriod *) getPeriod;

- (NSNumber *) getValue;
- (void) setValue: (NSNumber *) aValue;

@end

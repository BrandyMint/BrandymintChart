
#import <Foundation/Foundation.h>

#import "DTCRange.h"

@interface DTCDateRange : DTCRange {
@private
	//	The lower bound for the range
	long long lowerDate;
	//	The upper bound for the range
	long long upperDate;
}

- (id) initWithLowerDate: (NSDate *) aLower upperDate: (NSDate *) aUpper;

- (id) initWithLowerMilliSec: (double) aLower upperMilliSec: (double) aUpper;

/*
 *	Constructs a new range that is based on another Range. The other range does not have to be a DateRange. If it is not, the upper
 *	and lower bounds are evaluated as milliseconds since midnight GMT, 1-Jan-1970.
 */
- (id) initWithRange: (DTCRange *) aRange;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (NSDate *) getLowerDate;

- (long long) getLowerMillis;

- (NSDate *) getUpperDate;

- (long long) getUpperMillis;

@end


#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCITimePeriod.h"

@interface DTCSimpleTimePeriod : NSObject <DTCITimePeriod, DTCIComparable, NSCopying> {
@private
	//	The start date/time
	long long start;
	//	The end date/time
	long long end;
}

- (id) initWithStart: (long long) aStart end: (long long) anEnd;

- (id) initWithStartDate: (NSDate *) aStart endDate: (NSDate *) anEnd;

//----------------------------------------------------------------------
//	Get and Set methods
//----------------------------------------------------------------------
- (NSDate *) getStart;

- (long long) getStartMillis;

- (NSDate *) getEnd;

- (long long) getEndMillis;

@end

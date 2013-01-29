
#import <Foundation/Foundation.h>

/*
 *	A period of time measured to millisecond precision using two instances of java.util.Date.
 */
@protocol DTCITimePeriod

/*
 *	Returns the start date/time.  This will always be on or before the end date.
 */
- (NSDate *) getStart;

/*
 *	Returns the end date/time.  This will always be on or after the start date.
 */
- (NSDate *) getEnd;

@end


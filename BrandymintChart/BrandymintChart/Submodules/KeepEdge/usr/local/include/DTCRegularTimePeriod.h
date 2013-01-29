
#import <Foundation/Foundation.h>

#import "DTCIComparable.h"
#import "DTCITimePeriod.h"

@interface DTCRegularTimePeriod : NSObject <DTCITimePeriod, DTCIComparable, NSCopying> {
}

/*
 *	Creates a time period that includes the specified millisecond, assuming the given time zone.
 */
+ (DTCRegularTimePeriod *) createInstanceWithClass: (Class) aClass millisecond: (NSDate *) aMillisecond timeZone: (NSTimeZone *) aZone;

/*
 *	Returns the time period preceding this one, or null if some lower limit has been reached.
 */
- (DTCRegularTimePeriod *) previous;

/*
 *	Returns the time period following this one, or null if some limit has been reached.
 */
- (DTCRegularTimePeriod *) next;

/**
 * Returns a serial index number for the time unit.
 *
 * @return The serial index number.
 */
- (long long) getSerialIndex;

/*
 *	Recalculates the start date/time and end date/time for this time period relative to the supplied calendar (which
 *	incorporates a time zone).
 */
- (void) peg: (NSCalendar *) aCalendar;

/*
 *	Returns the date/time that marks the start of the time period. This method returns a new Date instance every time
 *	it is called.
 */
- (NSDate *) getStart;

/*
 *	Returns the date/time that marks the end of the time period. This method returns a new Date instance every time it is called.
 */
- (NSDate *) getEnd;

/*
 *	Returns the first millisecond of the time period. This will be determined relative to the time zone specified in the
 *	constructor, or in the calendar instance passed in the most recent call to the peg(Calendar) method.
 */
- (long long) getFirstMillisecond;

/*
 *	Returns the first millisecond of the time period, evaluated within a specific time zone.
 */
- (long long) getFirstMillisecondWithTimeZone: (NSTimeZone *) aZone;

/*
 *	Returns the first millisecond of the time period, evaluated using the supplied calendar (which incorporates a timezone).
 */
- (long long) getFirstMillisecondWithCalendar: (NSCalendar *) aCalendar;

/*
 *	Returns the last millisecond of the time period. This will be determined relative to the time zone specified in the
 *	constructor, or in the calendar instance passed in the most recent call to the peg(Calendar) method.
 */
- (long long) getLastMillisecond;

/*
 *	Returns the last millisecond of the time period, evaluated within a specific time zone.
 */
- (long long) getLastMillisecondWithTimeZone: (NSTimeZone *) aZone;

/*
 *	Returns the last millisecond of the time period, evaluated using the supplied calendar (which incorporates a timezone).
 */
- (long long) getLastMillisecondWithCalendar: (NSCalendar *) aCalendar;

/*
 *	Returns the millisecond closest to the middle of the time period.
 */
- (long long) getMiddleMillisecond;

/*
 *	Returns the millisecond closest to the middle of the time period, evaluated within a specific time zone.
 */
- (long long) getMiddleMillisecondWithTimeZone: (NSTimeZone *) aZone;

/*
 *	Returns the millisecond closest to the middle of the time period, evaluated using the supplied calendar (which
 *	incorporates a timezone).
 */
- (long long) getMiddleMillisecondWithCalendar: (NSCalendar *) aCalendar;

- (NSDateComponents *) createDateComponentsWithYear: (NSInteger) aYear month: (NSInteger) aMonth day: (NSInteger) aDay
											   hour: (NSInteger) aHour minute: (NSInteger) aMinute second: (NSInteger) aSecond;

/*
 *	Returns a string representation of the time period.
 */
- (NSString *) toString;

- (Class) getClass;

@end
